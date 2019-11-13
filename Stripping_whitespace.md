# Stripping excess whitespace

Some of our transformed metadata contains excess whitespace, so that lines break unncessarily. 
This can be fixed using stripping_whitespace.xsl either on the command line or with oXygen xml editor.

## To use with oXygen xml editor;

Copy all metadata records to be transformed into one folder

1. Create a project in oXygen > Project > New Project

![new_project](https://user-images.githubusercontent.com/3010391/68760217-3f9dcd00-0609-11ea-873d-933e5b439340.png)

2. In the project window right click on the project name and select 'Add Folder'. Add the folder you want to work on. you could add the folder that contains all the metadata files or you could copy them to another 'processing' folder so that you keep the old versions for comparison.

3. In the project window select all the metadata files you want to process. Right click on these files and navigate to 'configure transformation scenario'
![configre_transformation_scenario](https://user-images.githubusercontent.com/3010391/68760214-3f053680-0609-11ea-8d98-5a76047f0373.png)

4. Follow the dialogue to create a new transformation scenario

### XSLT options

![new_scenario_xslt](https://user-images.githubusercontent.com/3010391/68760208-3dd40980-0609-11ea-83fe-d574ad37b5a2.png)

 - Select 'xml transformation with xslt'
 -  name the transofrmation scenario
 - the xml url should be ${currentFileURL}
 - find the xsl file using the folder icon - the xsl url should then point ot the correct file
 - for Transformer select Saxon-EE

### Output options

![new_scenario_output](https://user-images.githubusercontent.com/3010391/68761493-13d01680-060c-11ea-8b0d-36d5ecca3631.png)

 - select 'save as' and the filename should be ${cfne}
 
 This will overwrite the original file.

5. Finally apply the associated transformation.

![apply_associated](https://user-images.githubusercontent.com/3010391/68760199-3c0a4600-0609-11ea-92d4-12bd407b3c70.png)
