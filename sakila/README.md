# Data Analysis for the Sakila Data

This is a simple Data Analysis for the data in the Sakila Database using MySQL. It consists of some simple queries to check it out followed by some complex queries to do some more analysis.

## Getting the Sakila DB

The Sakila database is a sample database provided by the MYSQL.

Visit [this page](https://dev.mysql.com/doc/index-other.html) and find the "sakila database" under the *Example Databases* header:

Click on the ["Zip" link](http://downloads.mysql.com/docs/sakila-db.zip) to download. This contains a zipped directory of all the files required to load the sample database.

On your computer, open the zip file, and **cd into the sakila-db directory that gets unzipped**. You should see three files:

At this point, you’re ready to load the sample database into MySQL.


## Installing the Sakila DB using the command line

First, run this command from your terminal from the *sakila-db* directory you unzipped above (Terminal, Git Bash, etc.):


    mysql -u root -p


Once you’re in the sakila-db directory and have `mysql` running, run the following two commands:

    SOURCE sakila-schema.sql;
    SOURCE sakila-data.sql;

`SOURCE` executes all the statements in a given SQL file, as SQL commands. `sakila-schema.sql` contains a number of `CREATE TABLE` statements to create the tables within our sample DB. `sakila-data.sql` contains the actual data that gets loaded into these tables.

## Analyzing the Sakila data

Open MySQL Workbench, refresh your list of databases under the *SCHEMAS* header, and you should see the **sakila** DB:

You can open the sakila_queries.sql script in this folder to see what type of analysis is done and execute the queries.

