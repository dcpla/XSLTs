# XSLTs

XSL transformations used to edit metadata in preparation for ingest into a digital repository. 

The metadata is edited to conform to the guidelines for depositing objects in the Digital Repository of Ireland, and according to cataloguing decisions at Dublin City Library and Archive, Ireland. 

The workflow had two stages:

1. Extract Dublin Core metadata from existing xml metadata records. 
2. Edit metadata to ensure validation against the Digital Repository of Ireland's schema (in order to enable batch ingest). 

There are five documents provided:

1. DCLASourceRecord_Example20359.xml
This is a sample record in FOXML, showing all of the datastreams present in the source records. Source records were processed in bulk. 

2. DublinCoreFromFOXMLExtract.xsl
Only the Dublin Core content from the source record was required for this project. This stylesheet extracts the Dublin Core content from the source record. 

3. DCLADublinCoretoDRI_Example.xsl
A transformation written to copy (using xsl:for-each) some of the Dublin Core content from the source record, and add and edit other content. In this example, a template and regular expression is used to edit any record in which the content of dc:creator is dash, outputting 'Unknown' in its place. 

Date information is added to each record in dcterms:created. 

Transformations are written following an analysis of the available metadata for a given collection of objects. 

4. Output_DRIQDC_20359.xml
A qualified Dublin Core record, valid for ingestion into DRI is output. 

5. DCLA_TemporalSpatialEdits.xsl
This transformation edits the content of a dc:date element formatted as DD/MM/YYYY and outputs it to a dcterms:created element formatted as YYYY-MM-DD. 

It analyses the content of dc:coverage and dc:type elements and outputs their content to dcterms:temporal, dcterms:spatial, dc:type or dc:format elements based on their content.  

