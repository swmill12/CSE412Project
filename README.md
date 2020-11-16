# CSE412Project
Things to do:
Fill Database

## Instructions for creating tables with Makefile
Download the zip file. Follow instructions for assignment 1 to get SQL running. Once sql is running go into the unzipped file and run make setup_postgres
This will create the tables and fill in the tables. Take a look at the createTables file when inputting data. All the data should be in the order that they are added to the table in that file, seperated by commas (no space seperating, but space is fine if we want it in the word). You can run queries to check if the data is uploading correctly by running psql -d $USER and then filling out a query

## Instructions for running the website
Need 5 files: app.js, config.js, home.html, results.html, and details.html. Start by setting up database, don't need to use makefile just need to set up database at port 8010 (or edit app and config to have port 8010). Database is entirley created in config.js so that is why we don't need makefile. To run,run app.js and go to localhost:3000 and that takes you to the home page.
