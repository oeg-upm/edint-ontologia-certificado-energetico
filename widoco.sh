#!/usr/bin/env bash
set -euo pipefail

# Run from repo main folder

# Parse arguments
REWRITE_ALL=false
for arg in "$@"; do
    if [ "$arg" == "--rewriteAll" ]; then
        REWRITE_ALL=true
    fi
done

## Overwrite exclude list, one file per line
## -> widoco-manual-edit.txt

MANUAL_EDIT_LIST=./widoco-manual-edit.txt

GENERATION_FOLDER=./tmp-doc
FINAL_FOLDER=./documentation

mkdir -p $GENERATION_FOLDER

docker run -i --rm \
  -v "$(pwd)"/widoco.conf:/usr/local/widoco/widoco.conf:Z \
  -v "$(pwd)"/ontology:/usr/local/widoco/in:Z \
  -v "$(pwd)"/$GENERATION_FOLDER:/usr/local/widoco/out:Z \
  ghcr.io/dgarijo/widoco:v1.4.25 \
  -confFile widoco.conf \
  -ontFile in/ontology.ttl \
  -outFolder out \
  -lang en-es \
  -rewriteAll

# Create final folder
mkdir -p $FINAL_FOLDER

if [ "$REWRITE_ALL" = true ]; then
    # Copy all files, preserving structure
    find $GENERATION_FOLDER -type f | while read f; do
        rel_path="${f#$GENERATION_FOLDER/}"
        dest_file="$FINAL_FOLDER/$rel_path"
        mkdir -p "$(dirname "$dest_file")"
        cp "$f" "$dest_file"
        echo "COPY: $f -> $dest_file"
    done
else
  # Copy files not in exclude list, preserving structure
  find $GENERATION_FOLDER -type f | while read f; do
      if ! grep -qF "$(basename "$f")" $MANUAL_EDIT_LIST; then
          # Get relative path from GENERATION_FOLDER
          rel_path="${f#$GENERATION_FOLDER/}"
          dest_file="$FINAL_FOLDER/$rel_path"
          
          # Create parent directories in destination
          mkdir -p "$(dirname "$dest_file")"
          
          # Copy the file
          cp "$f" "$dest_file"
          echo "COPY: $f -> $dest_file"
      else
          echo "SKIP: $f"
      fi
  done
fi

rm -r $GENERATION_FOLDER
