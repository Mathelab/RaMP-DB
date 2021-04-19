[![Build Status](https://travis-ci.org/Mathelab/RaMP-DB.svg?branch=master)](https://travis-ci.org/Mathelab/RaMP-DB)
[![Build status](https://ci.appveyor.com/api/projects/status/cg0md9vd8njancij?svg=true)](https://ci.appveyor.com/project/Mathelab/ramp-db)



# This repo is no longer maintained.  Please go to https://github.com/ncats/RaMP-DB/ to use RaMP.

# New!  RaMP app is accessible via a server (no installation needed!).
Please [click here](https://ramp-db.bmi.osumc.edu/).  And let us know if additional functionalities would be useful (see contact info below).

# RaMP - Relational Database of Metabolomic Pathways

The purpose of RaMP is to provide a publicly available database that integrates metabolite and gene biological pathways from multiple sources. Currently, we have integrated information from HMDB, KEGG, Reactome, and WikiPathways. The relational structure of RaMP enables complex and batch queries.  To facilitate its usage, we have created this R shiny web application that includes a user-friendly R Shiny web application.  Please note that this project is in continuous development and we certainly appreciate your feedback (through [our](https://github.com/Mathelab/RaMP-DB) GitHub site). More details can be found in <a href="http://www.mdpi.com/2218-1989/8/1/16" target="_blank">our manuscript</a>.

Also note that we are working on a server version of RaMP so that users do not have to install anything on their local machines.  Stay tuned!

## Basic Features:
The app performs some complex queries (e.g. retrieve all metabolites and/or genes that belong to a user input pathway or list of pathways).  It also performs pathway enrichment analysis given a list of metabolites and/or genes. Run the app to get further details.

Last date of dump file update: 03/02/2018

## Citation
If you use RaMP, please cite the following work:

Zhang, B., et al., RaMP: A Comprehensive Relational Database of Metabolomics Pathways for Pathway Enrichment Analysis of Genes and Metabolites. Metabolites, 2018. 8(1).

PMID: 29470400; PMCID: PMC5876005; DOI: 10.3390/metabo8010016

To access, [click here](https://www.mdpi.com/2218-1989/8/1/16)

## Installation Instructions
In order to use the web application, you will need the following:
* The R code under this repo
* The mysql dump file that contains the RaMP database (in the folder inst/extdata/)

If you would like to know how to build RaMP database from scratch, please check another GitHub site at [RaMP-BackEnd](https://github.com/Mathelab/RaMP-BackEnd)

### MySQL set-up
**Warning:** RaMP will not readily work with the new MySQL version (8.X.X), but is fully functional with MySQL version 5.7. We will be working toward updating RaMP to work with the newest MySQL version.

RaMP requires that MySQL and the RaMP database be set up on the machine that you will be running the app from.
To download MySQL, you can go to the [MySQL Downloads page](https://www.mysql.com/downloads/)

When installing, you will be prompted to create a password for the user "root", or it will create one automatically for you.  **Importantly, remember your MySQL password!**  You will need to get into mysql and to pass it as an argument to the RaMP R shiny web application.

If you want to reset your password , you can go to [MySQL References 5.7 - How to reset root password ] (https://dev.mysql.com/doc/refman/5.7/en/resetting-permissions.html)

Please note that you will need administrator privileges for this step..

### Creating the database locally
Once your MySQL environment is in place, creating the RaMP database locally is trivial.
First, launch MySQL and create the database:
```
> mysql -u root -p
mysql> create database ramp;
mysql> exit;
```

Here, we are naming the database RaMP but you can use any name you'd like.  It is worth noting though that the R package assumes that the name of the database is 'ramp' by default.  So if you change the name, remember to pass that name as arguments in the R package functions.

Second, populate the named database with the mysql dump file (which you can get from  inst/extdata/ramp.sql):
```
> mysql -u root -p ramp < ramp.sql
```

You're done!

Your "ramp" database should contain the following 8 tables:
1. analyte
2. analyehasontology
3. analytehaspathway
4. analytesynonym
5. catalyzed
6. ontology
7. pathway
8. source

If you want to explore this in MySQL, you can try:
```
mysql -u root -p
use ramp;
show tables;
select * from analytesynonym where synonym = "glucose";
```

### Install and load the RaMP package 
You can install this package directly from GitHub using the install_github() function available through the devtools package. In the R Console, type the following:
```R
install.packages(“devtools”)
library(devtools)
install_github("mathelab/RAMP-DB")
# Load the package
library(RaMP)
```

Before running the RaMP app or RaMP functions, the database connection information should be configured. The file that contains this information is within the package installation and the directory can be found by typing the following:
```
system.file("shinyApp", package="RaMP", mustWork=TRUE)
```
Go to that directory and find the "db.properties.template" file, copy it to a new file db.properties.  Edit db.properties file based on your current environment as follows:

```
host=<hostname of mysql server>
dbname=<db name on mysql>
username=<username to connect to mysql>
conpass=<password for username to connect to mysql>
```
*After editing, be sure to rename this file "db.properties".*


Now, you're set to use the web application locally!  Just type:
```R
RaMP::runRaMPapp(conpass="mysql_password")
```

If the username is different then root, then specify the username in the "username" parameter.  Similarly, if the name of the database is different than "ramp", then specify the "dbname" parameter.

### Important Notes

If you reinstall the latest version of the RaMP package, be sure to also install the latest version of the mysql RaMP dump file.  

Also, when gene or metabolite ids are input for queries, IDs should be prepended with their database of origin, e.g. kegg:C02712, hmdb:HMDB04824, or CAS:2566-39-4. The list of IDs that are currently included in RaMP are: CAS, chebi, chemspider, enzymeNomenclature, ensembl, entrez, hmdb, keg, LIPIDMAPS, pubchem, uniprot.

## Authors
* **Bofei Zhang** - [Bofei5675](https://github.com/Bofei5675)
* **Ewy Mathé** - [Mathelab](https://github.com/MatheLab)
* **Andrew Patt** - andrew.patt@osumc.edu
* **Shunchao Wang** - shunchao.wang@osumc.edu
* **Rohith Vanam** - rohith.vanam@osumc.edu

