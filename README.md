# Ontología de Certificados de Eficiencia Energética de Edificios

Esta ontología permite representar el dominio de los certificados de eficiencia energética de edificios, centrada en el certificado como unidad documental, su calificación energética, etiqueta, técnico competente, recomendaciones de mejora, procedimiento de cálculo y recomendaciones de uso para el usuario.

Está siendo desarrollada en el contexto del Espacio de Datos para las Infraestructuras Urbanas Inteligentes ([EDINT](https://edint.es/)).

# Propósito y alcance de la ontología (Purpose and scope of the ontology)

El propósito de esta ontología es modelar los certificados de eficiencia energética de edificios según el Real Decreto 390/2021 para habilitar la interoperabilidad de datos de CEE en el contexto de los datos enlazados (Linked Data). El alcance se limita a la representación del certificado como unidad documental, incluyendo la calificación energética, la etiqueta, el técnico competente, las recomendaciones de mejora, el procedimiento de cálculo y las recomendaciones de uso para el usuario. Quedan fuera del alcance la modelización del edificio como entidad independiente (se delega a ontologías externas como BOT, schema.org, etc.), así como los procesos administrativos de registro y las titularidades.

# Prefijo y espacio de nombres (Prefix and namespace)

El prefijo de esta ontología es `edintcee`. Se publica en el espacio de nombres: http://vocab.linkeddata.es/datosabiertos/def/sectorpublico/cee/

# Modelo conceptual (Ontology conceptualization)

![Diagrama del modelo conceptual](diagrams/edint-ontologia-certificado-energetico.drawio.png)

# Estructura del repositorio (Repository structure)

| Carpeta | Descripción |
|--------|--------------|
| **diagrams/**     | Almacena diagramas y otros recursos que representan el modelo conceptual de la ontología (por ejemplo, jerarquías de clases, relaciones).                                     |
| **documentation/**         | Almacena la documentación HTML u orientada a humanos de la ontología y artefactos relacionados.                                                                               |
| **examples/**     | Incluye ejemplos que demuestran cómo instanciar o aplicar la ontología en escenarios de datos reales.                                                                         |
| **kos/**          | Almacena vocabularios controlados o implementación de KOS, generalmente implementaciones SKOS en RDF.                                                                         |
| **ontology/**     | Contiene los archivos de implementación reales de la ontología en formatos como `.owl`, `.rdf`, `.ttl` o `.jsonld`.                                                           |
| **requirements/** | Contiene todos los documentos utilizados para definir los requisitos de la ontología: ejemplos de datos, preguntas de competencia, requisitos funcionales, casos de uso, etc. |
| **shapes/**       | Contiene los SHACL shapes utilizadas para definir y validar las restricciones de la ontología.                                                                                |


# Mantenimiento y evolución (Maintenance and evolution)

Para manejar las incidencias o mejoras sugeridas con respecto a la ontología, recomendamos seguir las guías proporcionadas en ([Issues Management](./ISSUES.md)) para generar una incidencia.

# Financiación (Funding)

Esta ontología ha sido desarrollada en el contexto del Espacio de Datos para las Infraestructuras Urbanas Inteligentes ([EDINT](https://edint.es)).

![Logos](./resources/EDINT_UE_V-Color.png)
