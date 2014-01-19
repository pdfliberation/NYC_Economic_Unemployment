NYC Unemployment Data from Economic Snapshots
=========================

Program language: R

Export file: R data sets and csv file

Recommendation IDE: R Studio (free), http://www.rstudio.com/

Advangtage: produce unemployment data in specific year automatically

unemployment2012 and unemployment2013 in Github are example csv outputs.

Data source: http://www.nycedc.com/resources/economic-research-analysis/economic-snapshots

Other tables in the pdf files can be extracted by changing getData function.

Before running the programs, you need to 

1. Create a root folder (e.g. the folder name is finance)
2. Create subfolder(s), named as the year of unemployment (e.g. 2013)
3. Download pdf files from http://www.nycedc.com/resources/economic-research-analysis/economic-snapshots
4. Put files in corresponding subfolder(s). Before putting the files, you must open the pdf files to look the time when the unemployment data were collected. Names in step 2 is corresponding to year when the data were collected, not the year when data is published. Usually data published in January and February should be put in the previous year folder.
5. Convert pdf to HTML. Go to http://www.pdfonline.com/convert-pdf-to-html/ and upload the pdf files downloaded in previous step. The website will give you zip file. Unzip the files and put all the htm files in corresponding subfolders. Unzipped files should be put in the subfolders created in step 2 directly, not the subfolders of subfolders created in step 2. Folders 2013 and 2012 in Github contain parts of created html and pdf and you can download directly. PS: You can use whatever tools to convert pdf to html but you should ensure that each table in the file will be in the different <table> tag in the converted html.
6. Put the file finance_umemployment.R in root folder (i.e. finance)
7. Open the file in RStudio
8. Set root folder as working directory in RStudio. Menu: Session -> Set Working Directory -> To Source File Location
9. Install three packages: reshape2, XML, stringr. Menu: Tools -> Install Packages
10. Run the program. The program gives code to run data in 2013 and 2012. You can correct the last 6 lines to meet your requirement.
11. Outputs are data frame in R and csv file(s) in root folder. Sample csv is unemployment2012.csv and unemployment2013.csv in Github. The format of data is long form.
