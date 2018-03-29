
# Sakila Database Queries for Data Analysis

This file contains MySQL queries that query and analyze data from the Sakila Database


```python
%load_ext sql
```


```python
try:
    import pymysql
    pymysql.install_as_MySQLdb()
except ImportError:
    pass
```


```python
%sql mysql://root:@localhost/sakila
```




    'Connected: root@sakila'



### Use the sakila database


```python
%sql USE sakila;
```

    0 rows affected.





    []



### 1a. Display the first and last names of all actors from the table actor.


```python
%sql SELECT first_name, last_name FROM actor LIMIT 10;
```

    10 rows affected.





<table>
    <tr>
        <th>first_name</th>
        <th>last_name</th>
    </tr>
    <tr>
        <td>PENELOPE</td>
        <td>GUINESS</td>
    </tr>
    <tr>
        <td>NICK</td>
        <td>WAHLBERG</td>
    </tr>
    <tr>
        <td>ED</td>
        <td>CHASE</td>
    </tr>
    <tr>
        <td>JENNIFER</td>
        <td>DAVIS</td>
    </tr>
    <tr>
        <td>JOHNNY</td>
        <td>LOLLOBRIGIDA</td>
    </tr>
    <tr>
        <td>BETTE</td>
        <td>NICHOLSON</td>
    </tr>
    <tr>
        <td>GRACE</td>
        <td>MOSTEL</td>
    </tr>
    <tr>
        <td>MATTHEW</td>
        <td>JOHANSSON</td>
    </tr>
    <tr>
        <td>JOE</td>
        <td>SWANK</td>
    </tr>
    <tr>
        <td>CHRISTIAN</td>
        <td>GABLE</td>
    </tr>
</table>



### 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.




```python
%sql SELECT UPPER(CONCAT(first_name, " ", last_name)) AS 'Actor Name' from actor LIMIT 10;
```

    10 rows affected.





<table>
    <tr>
        <th>Actor Name</th>
    </tr>
    <tr>
        <td>PENELOPE GUINESS</td>
    </tr>
    <tr>
        <td>NICK WAHLBERG</td>
    </tr>
    <tr>
        <td>ED CHASE</td>
    </tr>
    <tr>
        <td>JENNIFER DAVIS</td>
    </tr>
    <tr>
        <td>JOHNNY LOLLOBRIGIDA</td>
    </tr>
    <tr>
        <td>BETTE NICHOLSON</td>
    </tr>
    <tr>
        <td>GRACE MOSTEL</td>
    </tr>
    <tr>
        <td>MATTHEW JOHANSSON</td>
    </tr>
    <tr>
        <td>JOE SWANK</td>
    </tr>
    <tr>
        <td>CHRISTIAN GABLE</td>
    </tr>
</table>



### 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?


```python
%sql SELECT actor_id, first_name, last_name FROM actor WHERE UPPER(first_name) = 'JOE';
```

    1 rows affected.





<table>
    <tr>
        <th>actor_id</th>
        <th>first_name</th>
        <th>last_name</th>
    </tr>
    <tr>
        <td>9</td>
        <td>JOE</td>
        <td>SWANK</td>
    </tr>
</table>



### 2b. Find all actors whose last name contain the letters GEN:


```python
%sql SELECT * FROM actor WHERE last_name LIKE '%GEN%';
```

    4 rows affected.





<table>
    <tr>
        <th>actor_id</th>
        <th>first_name</th>
        <th>last_name</th>
        <th>last_update</th>
    </tr>
    <tr>
        <td>14</td>
        <td>VIVIEN</td>
        <td>BERGEN</td>
        <td>2006-02-15 04:34:33</td>
    </tr>
    <tr>
        <td>41</td>
        <td>JODIE</td>
        <td>DEGENERES</td>
        <td>2006-02-15 04:34:33</td>
    </tr>
    <tr>
        <td>107</td>
        <td>GINA</td>
        <td>DEGENERES</td>
        <td>2006-02-15 04:34:33</td>
    </tr>
    <tr>
        <td>166</td>
        <td>NICK</td>
        <td>DEGENERES</td>
        <td>2006-02-15 04:34:33</td>
    </tr>
</table>



### 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:


```python
%sql SELECT last_name, first_name FROM actor WHERE last_name like '%LI%' ORDER BY last_name, first_name;
```

    10 rows affected.





<table>
    <tr>
        <th>last_name</th>
        <th>first_name</th>
    </tr>
    <tr>
        <td>CHAPLIN</td>
        <td>GREG</td>
    </tr>
    <tr>
        <td>JOLIE</td>
        <td>WOODY</td>
    </tr>
    <tr>
        <td>OLIVIER</td>
        <td>AUDREY</td>
    </tr>
    <tr>
        <td>OLIVIER</td>
        <td>CUBA</td>
    </tr>
    <tr>
        <td>WILLIAMS</td>
        <td>GROUCHO</td>
    </tr>
    <tr>
        <td>WILLIAMS</td>
        <td>MORGAN</td>
    </tr>
    <tr>
        <td>WILLIAMS</td>
        <td>SEAN</td>
    </tr>
    <tr>
        <td>WILLIS</td>
        <td>BEN</td>
    </tr>
    <tr>
        <td>WILLIS</td>
        <td>GENE</td>
    </tr>
    <tr>
        <td>WILLIS</td>
        <td>HUMPHREY</td>
    </tr>
</table>



### 2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:


```python
%sql SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');
```

    3 rows affected.





<table>
    <tr>
        <th>country_id</th>
        <th>country</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Afghanistan</td>
    </tr>
    <tr>
        <td>12</td>
        <td>Bangladesh</td>
    </tr>
    <tr>
        <td>23</td>
        <td>China</td>
    </tr>
</table>



### 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.


```python
%sql ALTER TABLE actor ADD COLUMN middle_name VARCHAR (45) AFTER first_name;
```

    0 rows affected.





    []



### 3b. You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs


```python
%sql ALTER TABLE actor CHANGE middle_name middle_name BLOB;
```

    200 rows affected.





    []



### 3c. Now delete the middle_name column.


```python
%sql ALTER TABLE actor DROP COLUMN middle_name;
```

    0 rows affected.





    []



### 4a. List the last names of actors, as well as how many actors have that last name.


```python
%sql SELECT last_name, count(last_name) AS last_name_count FROM actor GROUP BY last_name;
```

    121 rows affected.





<table>
    <tr>
        <th>last_name</th>
        <th>last_name_count</th>
    </tr>
    <tr>
        <td>AKROYD</td>
        <td>3</td>
    </tr>
    <tr>
        <td>ALLEN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>ASTAIRE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BACALL</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BAILEY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>BALE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BALL</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BARRYMORE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BASINGER</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BENING</td>
        <td>2</td>
    </tr>
    <tr>
        <td>BERGEN</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BERGMAN</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BERRY</td>
        <td>3</td>
    </tr>
    <tr>
        <td>BIRCH</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BLOOM</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BOLGER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>BRIDGES</td>
        <td>1</td>
    </tr>
    <tr>
        <td>BRODY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>BULLOCK</td>
        <td>1</td>
    </tr>
    <tr>
        <td>CAGE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>CARREY</td>
        <td>1</td>
    </tr>
    <tr>
        <td>CHAPLIN</td>
        <td>1</td>
    </tr>
    <tr>
        <td>CHASE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>CLOSE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>COSTNER</td>
        <td>1</td>
    </tr>
    <tr>
        <td>CRAWFORD</td>
        <td>2</td>
    </tr>
    <tr>
        <td>CRONYN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>CROWE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>CRUISE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>CRUZ</td>
        <td>1</td>
    </tr>
    <tr>
        <td>DAMON</td>
        <td>1</td>
    </tr>
    <tr>
        <td>DAVIS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>DAY-LEWIS</td>
        <td>1</td>
    </tr>
    <tr>
        <td>DEAN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DEE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DEGENERES</td>
        <td>3</td>
    </tr>
    <tr>
        <td>DENCH</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DEPP</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DERN</td>
        <td>1</td>
    </tr>
    <tr>
        <td>DREYFUSS</td>
        <td>1</td>
    </tr>
    <tr>
        <td>DUKAKIS</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DUNST</td>
        <td>1</td>
    </tr>
    <tr>
        <td>FAWCETT</td>
        <td>2</td>
    </tr>
    <tr>
        <td>GABLE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>GARLAND</td>
        <td>3</td>
    </tr>
    <tr>
        <td>GIBSON</td>
        <td>1</td>
    </tr>
    <tr>
        <td>GOLDBERG</td>
        <td>1</td>
    </tr>
    <tr>
        <td>GOODING</td>
        <td>2</td>
    </tr>
    <tr>
        <td>GRANT</td>
        <td>1</td>
    </tr>
    <tr>
        <td>GUINESS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>HACKMAN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>HARRIS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>HAWKE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>HESTON</td>
        <td>1</td>
    </tr>
    <tr>
        <td>HOFFMAN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>HOPE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>HOPKINS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>HOPPER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>HUDSON</td>
        <td>1</td>
    </tr>
    <tr>
        <td>HUNT</td>
        <td>1</td>
    </tr>
    <tr>
        <td>HURT</td>
        <td>1</td>
    </tr>
    <tr>
        <td>JACKMAN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>JOHANSSON</td>
        <td>3</td>
    </tr>
    <tr>
        <td>JOLIE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>JOVOVICH</td>
        <td>1</td>
    </tr>
    <tr>
        <td>KEITEL</td>
        <td>3</td>
    </tr>
    <tr>
        <td>KILMER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>LEIGH</td>
        <td>1</td>
    </tr>
    <tr>
        <td>LOLLOBRIGIDA</td>
        <td>1</td>
    </tr>
    <tr>
        <td>MALDEN</td>
        <td>1</td>
    </tr>
    <tr>
        <td>MANSFIELD</td>
        <td>1</td>
    </tr>
    <tr>
        <td>MARX</td>
        <td>1</td>
    </tr>
    <tr>
        <td>MCCONAUGHEY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>MCDORMAND</td>
        <td>1</td>
    </tr>
    <tr>
        <td>MCKELLEN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>MCQUEEN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>MIRANDA</td>
        <td>1</td>
    </tr>
    <tr>
        <td>MONROE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>MOSTEL</td>
        <td>2</td>
    </tr>
    <tr>
        <td>NEESON</td>
        <td>2</td>
    </tr>
    <tr>
        <td>NICHOLSON</td>
        <td>1</td>
    </tr>
    <tr>
        <td>NOLTE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>OLIVIER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>PALTROW</td>
        <td>2</td>
    </tr>
    <tr>
        <td>PECK</td>
        <td>3</td>
    </tr>
    <tr>
        <td>PENN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>PESCI</td>
        <td>1</td>
    </tr>
    <tr>
        <td>PFEIFFER</td>
        <td>1</td>
    </tr>
    <tr>
        <td>PHOENIX</td>
        <td>1</td>
    </tr>
    <tr>
        <td>PINKETT</td>
        <td>1</td>
    </tr>
    <tr>
        <td>PITT</td>
        <td>1</td>
    </tr>
    <tr>
        <td>POSEY</td>
        <td>1</td>
    </tr>
    <tr>
        <td>PRESLEY</td>
        <td>1</td>
    </tr>
    <tr>
        <td>REYNOLDS</td>
        <td>1</td>
    </tr>
    <tr>
        <td>RYDER</td>
        <td>1</td>
    </tr>
    <tr>
        <td>SILVERSTONE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>SINATRA</td>
        <td>1</td>
    </tr>
    <tr>
        <td>SOBIESKI</td>
        <td>1</td>
    </tr>
    <tr>
        <td>STALLONE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>STREEP</td>
        <td>2</td>
    </tr>
    <tr>
        <td>SUVARI</td>
        <td>1</td>
    </tr>
    <tr>
        <td>SWANK</td>
        <td>1</td>
    </tr>
    <tr>
        <td>TANDY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>TAUTOU</td>
        <td>1</td>
    </tr>
    <tr>
        <td>TEMPLE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>TOMEI</td>
        <td>1</td>
    </tr>
    <tr>
        <td>TORN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>TRACY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>VOIGHT</td>
        <td>1</td>
    </tr>
    <tr>
        <td>WAHLBERG</td>
        <td>2</td>
    </tr>
    <tr>
        <td>WALKEN</td>
        <td>1</td>
    </tr>
    <tr>
        <td>WAYNE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>WEST</td>
        <td>2</td>
    </tr>
    <tr>
        <td>WILLIAMS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>WILLIS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>WILSON</td>
        <td>1</td>
    </tr>
    <tr>
        <td>WINSLET</td>
        <td>2</td>
    </tr>
    <tr>
        <td>WITHERSPOON</td>
        <td>1</td>
    </tr>
    <tr>
        <td>WOOD</td>
        <td>2</td>
    </tr>
    <tr>
        <td>WRAY</td>
        <td>1</td>
    </tr>
    <tr>
        <td>ZELLWEGER</td>
        <td>3</td>
    </tr>
</table>



### 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors


```python
%%sql 
SELECT a.last_name, a.last_name_count 
FROM (
    SELECT last_name, count(last_name) AS last_name_count 
    FROM actor 
    GROUP BY last_name) a 
WHERE a.last_name_count = 2;
```

    35 rows affected.





<table>
    <tr>
        <th>last_name</th>
        <th>last_name_count</th>
    </tr>
    <tr>
        <td>WINSLET</td>
        <td>2</td>
    </tr>
    <tr>
        <td>BOLGER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>GOODING</td>
        <td>2</td>
    </tr>
    <tr>
        <td>NEESON</td>
        <td>2</td>
    </tr>
    <tr>
        <td>FAWCETT</td>
        <td>2</td>
    </tr>
    <tr>
        <td>MCKELLEN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DEPP</td>
        <td>2</td>
    </tr>
    <tr>
        <td>CHASE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>WOOD</td>
        <td>2</td>
    </tr>
    <tr>
        <td>BRODY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DEE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>JACKMAN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>CAGE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>PALTROW</td>
        <td>2</td>
    </tr>
    <tr>
        <td>MOSTEL</td>
        <td>2</td>
    </tr>
    <tr>
        <td>BENING</td>
        <td>2</td>
    </tr>
    <tr>
        <td>BAILEY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DENCH</td>
        <td>2</td>
    </tr>
    <tr>
        <td>SILVERSTONE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>CRONYN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>PENN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>WEST</td>
        <td>2</td>
    </tr>
    <tr>
        <td>MCQUEEN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>TRACY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>TANDY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DEAN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>HACKMAN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>OLIVIER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>MONROE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>WAHLBERG</td>
        <td>2</td>
    </tr>
    <tr>
        <td>DUKAKIS</td>
        <td>2</td>
    </tr>
    <tr>
        <td>MCCONAUGHEY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>STREEP</td>
        <td>2</td>
    </tr>
    <tr>
        <td>CRAWFORD</td>
        <td>2</td>
    </tr>
    <tr>
        <td>HOPPER</td>
        <td>2</td>
    </tr>
</table>



### 4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.


```python
%%sql
SELECT * from actor WHERE last_name = 'WILLIAMS' AND first_name = 'GROUCHO';
```

    1 rows affected.





<table>
    <tr>
        <th>actor_id</th>
        <th>first_name</th>
        <th>last_name</th>
        <th>last_update</th>
    </tr>
    <tr>
        <td>172</td>
        <td>GROUCHO</td>
        <td>WILLIAMS</td>
        <td>2018-03-28 11:19:13</td>
    </tr>
</table>




```python
%%sql
UPDATE actor SET first_name = 'HARPO' WHERE last_name = 'WILLIAMS' AND first_name = 'GROUCHO';
```

    1 rows affected.





    []



### 4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO. Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER! (Hint: update the record using a unique identifier.)


```python
%%sql
UPDATE actor 
SET first_name = (
	CASE first_name
		WHEN 'HARPO' THEN 'GROUCHO'
        ELSE 'MUCHO GROUCHO'
	END
	)
WHERE last_name = 'WILLIAMS' AND first_name = 'HARPO';
```

    1 rows affected.





    []



### 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?Hint: https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html


```python
%%sql
SHOW CREATE TABLE address;
```

    1 rows affected.





<table>
    <tr>
        <th>Table</th>
        <th>Create Table</th>
    </tr>
    <tr>
        <td>address</td>
        <td>CREATE TABLE `address` (<br>  `address_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,<br>  `address` varchar(50) NOT NULL,<br>  `address2` varchar(50) DEFAULT NULL,<br>  `district` varchar(20) NOT NULL,<br>  `city_id` smallint(5) unsigned NOT NULL,<br>  `postal_code` varchar(10) DEFAULT NULL,<br>  `phone` varchar(20) NOT NULL,<br>  `location` geometry NOT NULL,<br>  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,<br>  PRIMARY KEY (`address_id`),<br>  KEY `idx_fk_city_id` (`city_id`),<br>  SPATIAL KEY `idx_location` (`location`),<br>  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE<br>) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8</td>
    </tr>
</table>



### 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:




```python
%%sql
SELECT s.first_name, s.last_name, a.address FROM staff s
INNER JOIN address a 
ON a.address_id = s.address_id
```

    2 rows affected.





<table>
    <tr>
        <th>first_name</th>
        <th>last_name</th>
        <th>address</th>
    </tr>
    <tr>
        <td>Mike</td>
        <td>Hillyer</td>
        <td>23 Workhaven Lane</td>
    </tr>
    <tr>
        <td>Jon</td>
        <td>Stephens</td>
        <td>1411 Lillydale Drive</td>
    </tr>
</table>



### 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.


```python
%%sql
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_cmount FROM payment p
INNER JOIN staff s
ON p.staff_id = s.staff_id
WHERE p.payment_date LIKE '2005-08%'
GROUP BY p.staff_id
;
```

    2 rows affected.


    /Users/rupali/anaconda3/lib/python3.6/site-packages/pymysql/cursors.py:165: Warning: (1292, "Incorrect datetime value: '2005-08%' for column 'payment_date' at row 1")
      result = self._query(query)





<table>
    <tr>
        <th>staff_id</th>
        <th>first_name</th>
        <th>last_name</th>
        <th>total_cmount</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Mike</td>
        <td>Hillyer</td>
        <td>11853.65</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Jon</td>
        <td>Stephens</td>
        <td>12218.48</td>
    </tr>
</table>



### 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.


```python
%%sql
SELECT f.film_id, f.title, COUNT(fa.actor_id) AS count_of_actors 
FROM film f 
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY fa.film_id
;
```

    997 rows affected.





<table>
    <tr>
        <th>film_id</th>
        <th>title</th>
        <th>count_of_actors</th>
    </tr>
    <tr>
        <td>1</td>
        <td>ACADEMY DINOSAUR</td>
        <td>10</td>
    </tr>
    <tr>
        <td>2</td>
        <td>ACE GOLDFINGER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>3</td>
        <td>ADAPTATION HOLES</td>
        <td>5</td>
    </tr>
    <tr>
        <td>4</td>
        <td>AFFAIR PREJUDICE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>5</td>
        <td>AFRICAN EGG</td>
        <td>5</td>
    </tr>
    <tr>
        <td>6</td>
        <td>AGENT TRUMAN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>7</td>
        <td>AIRPLANE SIERRA</td>
        <td>5</td>
    </tr>
    <tr>
        <td>8</td>
        <td>AIRPORT POLLOCK</td>
        <td>4</td>
    </tr>
    <tr>
        <td>9</td>
        <td>ALABAMA DEVIL</td>
        <td>9</td>
    </tr>
    <tr>
        <td>10</td>
        <td>ALADDIN CALENDAR</td>
        <td>8</td>
    </tr>
    <tr>
        <td>11</td>
        <td>ALAMO VIDEOTAPE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>12</td>
        <td>ALASKA PHANTOM</td>
        <td>7</td>
    </tr>
    <tr>
        <td>13</td>
        <td>ALI FOREVER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>14</td>
        <td>ALICE FANTASIA</td>
        <td>4</td>
    </tr>
    <tr>
        <td>15</td>
        <td>ALIEN CENTER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>16</td>
        <td>ALLEY EVOLUTION</td>
        <td>5</td>
    </tr>
    <tr>
        <td>17</td>
        <td>ALONE TRIP</td>
        <td>8</td>
    </tr>
    <tr>
        <td>18</td>
        <td>ALTER VICTORY</td>
        <td>4</td>
    </tr>
    <tr>
        <td>19</td>
        <td>AMADEUS HOLY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>20</td>
        <td>AMELIE HELLFIGHTERS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>21</td>
        <td>AMERICAN CIRCUS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>22</td>
        <td>AMISTAD MIDSUMMER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>23</td>
        <td>ANACONDA CONFESSIONS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>24</td>
        <td>ANALYZE HOOSIERS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>25</td>
        <td>ANGELS LIFE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>26</td>
        <td>ANNIE IDENTITY</td>
        <td>3</td>
    </tr>
    <tr>
        <td>27</td>
        <td>ANONYMOUS HUMAN</td>
        <td>9</td>
    </tr>
    <tr>
        <td>28</td>
        <td>ANTHEM LUKE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>29</td>
        <td>ANTITRUST TOMATOES</td>
        <td>7</td>
    </tr>
    <tr>
        <td>30</td>
        <td>ANYTHING SAVANNAH</td>
        <td>3</td>
    </tr>
    <tr>
        <td>31</td>
        <td>APACHE DIVINE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>32</td>
        <td>APOCALYPSE FLAMINGOS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>33</td>
        <td>APOLLO TEEN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>34</td>
        <td>ARABIA DOGMA</td>
        <td>12</td>
    </tr>
    <tr>
        <td>35</td>
        <td>ARACHNOPHOBIA ROLLERCOASTER</td>
        <td>8</td>
    </tr>
    <tr>
        <td>36</td>
        <td>ARGONAUTS TOWN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>37</td>
        <td>ARIZONA BANG</td>
        <td>4</td>
    </tr>
    <tr>
        <td>38</td>
        <td>ARK RIDGEMONT</td>
        <td>3</td>
    </tr>
    <tr>
        <td>39</td>
        <td>ARMAGEDDON LOST</td>
        <td>7</td>
    </tr>
    <tr>
        <td>40</td>
        <td>ARMY FLINTSTONES</td>
        <td>7</td>
    </tr>
    <tr>
        <td>41</td>
        <td>ARSENIC INDEPENDENCE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>42</td>
        <td>ARTIST COLDBLOODED</td>
        <td>7</td>
    </tr>
    <tr>
        <td>43</td>
        <td>ATLANTIS CAUSE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>44</td>
        <td>ATTACKS HATE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>45</td>
        <td>ATTRACTION NEWTON</td>
        <td>4</td>
    </tr>
    <tr>
        <td>46</td>
        <td>AUTUMN CROW</td>
        <td>3</td>
    </tr>
    <tr>
        <td>47</td>
        <td>BABY HALL</td>
        <td>8</td>
    </tr>
    <tr>
        <td>48</td>
        <td>BACKLASH UNDEFEATED</td>
        <td>7</td>
    </tr>
    <tr>
        <td>49</td>
        <td>BADMAN DAWN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>50</td>
        <td>BAKED CLEOPATRA</td>
        <td>1</td>
    </tr>
    <tr>
        <td>51</td>
        <td>BALLOON HOMEWARD</td>
        <td>6</td>
    </tr>
    <tr>
        <td>52</td>
        <td>BALLROOM MOCKINGBIRD</td>
        <td>7</td>
    </tr>
    <tr>
        <td>53</td>
        <td>BANG KWAI</td>
        <td>7</td>
    </tr>
    <tr>
        <td>54</td>
        <td>BANGER PINOCCHIO</td>
        <td>6</td>
    </tr>
    <tr>
        <td>55</td>
        <td>BARBARELLA STREETCAR</td>
        <td>5</td>
    </tr>
    <tr>
        <td>56</td>
        <td>BAREFOOT MANCHURIAN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>57</td>
        <td>BASIC EASY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>58</td>
        <td>BEACH HEARTBREAKERS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>59</td>
        <td>BEAR GRACELAND</td>
        <td>3</td>
    </tr>
    <tr>
        <td>60</td>
        <td>BEAST HUNCHBACK</td>
        <td>5</td>
    </tr>
    <tr>
        <td>61</td>
        <td>BEAUTY GREASE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>62</td>
        <td>BED HIGHBALL</td>
        <td>5</td>
    </tr>
    <tr>
        <td>63</td>
        <td>BEDAZZLED MARRIED</td>
        <td>7</td>
    </tr>
    <tr>
        <td>64</td>
        <td>BEETHOVEN EXORCIST</td>
        <td>6</td>
    </tr>
    <tr>
        <td>65</td>
        <td>BEHAVIOR RUNAWAY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>66</td>
        <td>BENEATH RUSH</td>
        <td>7</td>
    </tr>
    <tr>
        <td>67</td>
        <td>BERETS AGENT</td>
        <td>10</td>
    </tr>
    <tr>
        <td>68</td>
        <td>BETRAYED REAR</td>
        <td>4</td>
    </tr>
    <tr>
        <td>69</td>
        <td>BEVERLY OUTLAW</td>
        <td>4</td>
    </tr>
    <tr>
        <td>70</td>
        <td>BIKINI BORROWERS</td>
        <td>2</td>
    </tr>
    <tr>
        <td>71</td>
        <td>BILKO ANONYMOUS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>72</td>
        <td>BILL OTHERS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>73</td>
        <td>BINGO TALENTED</td>
        <td>5</td>
    </tr>
    <tr>
        <td>74</td>
        <td>BIRCH ANTITRUST</td>
        <td>6</td>
    </tr>
    <tr>
        <td>75</td>
        <td>BIRD INDEPENDENCE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>76</td>
        <td>BIRDCAGE CASPER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>77</td>
        <td>BIRDS PERDITION</td>
        <td>4</td>
    </tr>
    <tr>
        <td>78</td>
        <td>BLACKOUT PRIVATE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>79</td>
        <td>BLADE POLISH</td>
        <td>5</td>
    </tr>
    <tr>
        <td>80</td>
        <td>BLANKET BEVERLY</td>
        <td>4</td>
    </tr>
    <tr>
        <td>81</td>
        <td>BLINDNESS GUN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>82</td>
        <td>BLOOD ARGONAUTS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>83</td>
        <td>BLUES INSTINCT</td>
        <td>4</td>
    </tr>
    <tr>
        <td>84</td>
        <td>BOILED DARES</td>
        <td>8</td>
    </tr>
    <tr>
        <td>85</td>
        <td>BONNIE HOLOCAUST</td>
        <td>9</td>
    </tr>
    <tr>
        <td>86</td>
        <td>BOOGIE AMELIE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>87</td>
        <td>BOONDOCK BALLROOM</td>
        <td>13</td>
    </tr>
    <tr>
        <td>88</td>
        <td>BORN SPINAL</td>
        <td>9</td>
    </tr>
    <tr>
        <td>89</td>
        <td>BORROWERS BEDAZZLED</td>
        <td>7</td>
    </tr>
    <tr>
        <td>90</td>
        <td>BOULEVARD MOB</td>
        <td>8</td>
    </tr>
    <tr>
        <td>91</td>
        <td>BOUND CHEAPER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>92</td>
        <td>BOWFINGER GABLES</td>
        <td>5</td>
    </tr>
    <tr>
        <td>93</td>
        <td>BRANNIGAN SUNRISE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>94</td>
        <td>BRAVEHEART HUMAN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>95</td>
        <td>BREAKFAST GOLDFINGER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>96</td>
        <td>BREAKING HOME</td>
        <td>6</td>
    </tr>
    <tr>
        <td>97</td>
        <td>BRIDE INTRIGUE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>98</td>
        <td>BRIGHT ENCOUNTERS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>99</td>
        <td>BRINGING HYSTERICAL</td>
        <td>2</td>
    </tr>
    <tr>
        <td>100</td>
        <td>BROOKLYN DESERT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>101</td>
        <td>BROTHERHOOD BLANKET</td>
        <td>5</td>
    </tr>
    <tr>
        <td>102</td>
        <td>BUBBLE GROSSE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>103</td>
        <td>BUCKET BROTHERHOOD</td>
        <td>6</td>
    </tr>
    <tr>
        <td>104</td>
        <td>BUGSY SONG</td>
        <td>2</td>
    </tr>
    <tr>
        <td>105</td>
        <td>BULL SHAWSHANK</td>
        <td>8</td>
    </tr>
    <tr>
        <td>106</td>
        <td>BULWORTH COMMANDMENTS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>107</td>
        <td>BUNCH MINDS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>108</td>
        <td>BUTCH PANTHER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>109</td>
        <td>BUTTERFLY CHOCOLAT</td>
        <td>7</td>
    </tr>
    <tr>
        <td>110</td>
        <td>CABIN FLASH</td>
        <td>4</td>
    </tr>
    <tr>
        <td>111</td>
        <td>CADDYSHACK JEDI</td>
        <td>7</td>
    </tr>
    <tr>
        <td>112</td>
        <td>CALENDAR GUNFIGHT</td>
        <td>8</td>
    </tr>
    <tr>
        <td>113</td>
        <td>CALIFORNIA BIRDS</td>
        <td>2</td>
    </tr>
    <tr>
        <td>114</td>
        <td>CAMELOT VACATION</td>
        <td>2</td>
    </tr>
    <tr>
        <td>115</td>
        <td>CAMPUS REMEMBER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>116</td>
        <td>CANDIDATE PERDITION</td>
        <td>4</td>
    </tr>
    <tr>
        <td>117</td>
        <td>CANDLES GRAPES</td>
        <td>7</td>
    </tr>
    <tr>
        <td>118</td>
        <td>CANYON STOCK</td>
        <td>6</td>
    </tr>
    <tr>
        <td>119</td>
        <td>CAPER MOTIONS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>120</td>
        <td>CARIBBEAN LIBERTY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>121</td>
        <td>CAROL TEXAS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>122</td>
        <td>CARRIE BUNCH</td>
        <td>7</td>
    </tr>
    <tr>
        <td>123</td>
        <td>CASABLANCA SUPER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>124</td>
        <td>CASPER DRAGONFLY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>125</td>
        <td>CASSIDY WYOMING</td>
        <td>7</td>
    </tr>
    <tr>
        <td>126</td>
        <td>CASUALTIES ENCINO</td>
        <td>5</td>
    </tr>
    <tr>
        <td>127</td>
        <td>CAT CONEHEADS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>128</td>
        <td>CATCH AMISTAD</td>
        <td>5</td>
    </tr>
    <tr>
        <td>129</td>
        <td>CAUSE DATE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>130</td>
        <td>CELEBRITY HORN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>131</td>
        <td>CENTER DINOSAUR</td>
        <td>4</td>
    </tr>
    <tr>
        <td>132</td>
        <td>CHAINSAW UPTOWN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>133</td>
        <td>CHAMBER ITALIAN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>134</td>
        <td>CHAMPION FLATLINERS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>135</td>
        <td>CHANCE RESURRECTION</td>
        <td>6</td>
    </tr>
    <tr>
        <td>136</td>
        <td>CHAPLIN LICENSE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>137</td>
        <td>CHARADE DUFFEL</td>
        <td>3</td>
    </tr>
    <tr>
        <td>138</td>
        <td>CHARIOTS CONSPIRACY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>139</td>
        <td>CHASING FIGHT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>140</td>
        <td>CHEAPER CLYDE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>141</td>
        <td>CHICAGO NORTH</td>
        <td>8</td>
    </tr>
    <tr>
        <td>142</td>
        <td>CHICKEN HELLFIGHTERS</td>
        <td>2</td>
    </tr>
    <tr>
        <td>143</td>
        <td>CHILL LUCK</td>
        <td>5</td>
    </tr>
    <tr>
        <td>144</td>
        <td>CHINATOWN GLADIATOR</td>
        <td>10</td>
    </tr>
    <tr>
        <td>145</td>
        <td>CHISUM BEHAVIOR</td>
        <td>4</td>
    </tr>
    <tr>
        <td>146</td>
        <td>CHITTY LOCK</td>
        <td>13</td>
    </tr>
    <tr>
        <td>147</td>
        <td>CHOCOLAT HARRY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>148</td>
        <td>CHOCOLATE DUCK</td>
        <td>7</td>
    </tr>
    <tr>
        <td>149</td>
        <td>CHRISTMAS MOONSHINE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>150</td>
        <td>CIDER DESIRE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>151</td>
        <td>CINCINATTI WHISPERER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>152</td>
        <td>CIRCUS YOUTH</td>
        <td>2</td>
    </tr>
    <tr>
        <td>153</td>
        <td>CITIZEN SHREK</td>
        <td>8</td>
    </tr>
    <tr>
        <td>154</td>
        <td>CLASH FREDDY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>155</td>
        <td>CLEOPATRA DEVIL</td>
        <td>7</td>
    </tr>
    <tr>
        <td>156</td>
        <td>CLERKS ANGELS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>157</td>
        <td>CLOCKWORK PARADISE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>158</td>
        <td>CLONES PINOCCHIO</td>
        <td>5</td>
    </tr>
    <tr>
        <td>159</td>
        <td>CLOSER BANG</td>
        <td>6</td>
    </tr>
    <tr>
        <td>160</td>
        <td>CLUB GRAFFITI</td>
        <td>4</td>
    </tr>
    <tr>
        <td>161</td>
        <td>CLUE GRAIL</td>
        <td>6</td>
    </tr>
    <tr>
        <td>162</td>
        <td>CLUELESS BUCKET</td>
        <td>8</td>
    </tr>
    <tr>
        <td>163</td>
        <td>CLYDE THEORY</td>
        <td>4</td>
    </tr>
    <tr>
        <td>164</td>
        <td>COAST RAINBOW</td>
        <td>10</td>
    </tr>
    <tr>
        <td>165</td>
        <td>COLDBLOODED DARLING</td>
        <td>4</td>
    </tr>
    <tr>
        <td>166</td>
        <td>COLOR PHILADELPHIA</td>
        <td>7</td>
    </tr>
    <tr>
        <td>167</td>
        <td>COMA HEAD</td>
        <td>3</td>
    </tr>
    <tr>
        <td>168</td>
        <td>COMANCHEROS ENEMY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>169</td>
        <td>COMFORTS RUSH</td>
        <td>5</td>
    </tr>
    <tr>
        <td>170</td>
        <td>COMMAND DARLING</td>
        <td>8</td>
    </tr>
    <tr>
        <td>171</td>
        <td>COMMANDMENTS EXPRESS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>172</td>
        <td>CONEHEADS SMOOCHY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>173</td>
        <td>CONFESSIONS MAGUIRE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>174</td>
        <td>CONFIDENTIAL INTERVIEW</td>
        <td>2</td>
    </tr>
    <tr>
        <td>175</td>
        <td>CONFUSED CANDLES</td>
        <td>6</td>
    </tr>
    <tr>
        <td>176</td>
        <td>CONGENIALITY QUEST</td>
        <td>3</td>
    </tr>
    <tr>
        <td>177</td>
        <td>CONNECTICUT TRAMP</td>
        <td>7</td>
    </tr>
    <tr>
        <td>178</td>
        <td>CONNECTION MICROCOSMOS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>179</td>
        <td>CONQUERER NUTS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>180</td>
        <td>CONSPIRACY SPIRIT</td>
        <td>4</td>
    </tr>
    <tr>
        <td>181</td>
        <td>CONTACT ANONYMOUS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>182</td>
        <td>CONTROL ANTHEM</td>
        <td>3</td>
    </tr>
    <tr>
        <td>183</td>
        <td>CONVERSATION DOWNHILL</td>
        <td>3</td>
    </tr>
    <tr>
        <td>184</td>
        <td>CORE SUIT</td>
        <td>4</td>
    </tr>
    <tr>
        <td>185</td>
        <td>COWBOY DOOM</td>
        <td>5</td>
    </tr>
    <tr>
        <td>186</td>
        <td>CRAFT OUTFIELD</td>
        <td>6</td>
    </tr>
    <tr>
        <td>187</td>
        <td>CRANES RESERVOIR</td>
        <td>6</td>
    </tr>
    <tr>
        <td>188</td>
        <td>CRAZY HOME</td>
        <td>13</td>
    </tr>
    <tr>
        <td>189</td>
        <td>CREATURES SHAKESPEARE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>190</td>
        <td>CREEPERS KANE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>191</td>
        <td>CROOKED FROGMEN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>192</td>
        <td>CROSSING DIVORCE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>193</td>
        <td>CROSSROADS CASUALTIES</td>
        <td>8</td>
    </tr>
    <tr>
        <td>194</td>
        <td>CROW GREASE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>195</td>
        <td>CROWDS TELEMARK</td>
        <td>4</td>
    </tr>
    <tr>
        <td>196</td>
        <td>CRUELTY UNFORGIVEN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>197</td>
        <td>CRUSADE HONEY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>198</td>
        <td>CRYSTAL BREAKING</td>
        <td>5</td>
    </tr>
    <tr>
        <td>199</td>
        <td>CUPBOARD SINNERS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>200</td>
        <td>CURTAIN VIDEOTAPE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>201</td>
        <td>CYCLONE FAMILY</td>
        <td>3</td>
    </tr>
    <tr>
        <td>202</td>
        <td>DADDY PITTSBURGH</td>
        <td>5</td>
    </tr>
    <tr>
        <td>203</td>
        <td>DAISY MENAGERIE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>204</td>
        <td>DALMATIONS SWEDEN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>205</td>
        <td>DANCES NONE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>206</td>
        <td>DANCING FEVER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>207</td>
        <td>DANGEROUS UPTOWN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>208</td>
        <td>DARES PLUTO</td>
        <td>10</td>
    </tr>
    <tr>
        <td>209</td>
        <td>DARKNESS WAR</td>
        <td>2</td>
    </tr>
    <tr>
        <td>210</td>
        <td>DARKO DORADO</td>
        <td>4</td>
    </tr>
    <tr>
        <td>211</td>
        <td>DARLING BREAKING</td>
        <td>2</td>
    </tr>
    <tr>
        <td>212</td>
        <td>DARN FORRESTER</td>
        <td>9</td>
    </tr>
    <tr>
        <td>213</td>
        <td>DATE SPEED</td>
        <td>4</td>
    </tr>
    <tr>
        <td>214</td>
        <td>DAUGHTER MADIGAN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>215</td>
        <td>DAWN POND</td>
        <td>6</td>
    </tr>
    <tr>
        <td>216</td>
        <td>DAY UNFAITHFUL</td>
        <td>5</td>
    </tr>
    <tr>
        <td>217</td>
        <td>DAZED PUNK</td>
        <td>6</td>
    </tr>
    <tr>
        <td>218</td>
        <td>DECEIVER BETRAYED</td>
        <td>4</td>
    </tr>
    <tr>
        <td>219</td>
        <td>DEEP CRUSADE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>220</td>
        <td>DEER VIRGINIAN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>221</td>
        <td>DELIVERANCE MULHOLLAND</td>
        <td>3</td>
    </tr>
    <tr>
        <td>222</td>
        <td>DESERT POSEIDON</td>
        <td>5</td>
    </tr>
    <tr>
        <td>223</td>
        <td>DESIRE ALIEN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>224</td>
        <td>DESPERATE TRAINSPOTTING</td>
        <td>4</td>
    </tr>
    <tr>
        <td>225</td>
        <td>DESTINATION JERK</td>
        <td>3</td>
    </tr>
    <tr>
        <td>226</td>
        <td>DESTINY SATURDAY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>227</td>
        <td>DETAILS PACKER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>228</td>
        <td>DETECTIVE VISION</td>
        <td>3</td>
    </tr>
    <tr>
        <td>229</td>
        <td>DEVIL DESIRE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>230</td>
        <td>DIARY PANIC</td>
        <td>4</td>
    </tr>
    <tr>
        <td>231</td>
        <td>DINOSAUR SECRETARY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>232</td>
        <td>DIRTY ACE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>233</td>
        <td>DISCIPLE MOTHER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>234</td>
        <td>DISTURBING SCARFACE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>235</td>
        <td>DIVIDE MONSTER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>236</td>
        <td>DIVINE RESURRECTION</td>
        <td>5</td>
    </tr>
    <tr>
        <td>237</td>
        <td>DIVORCE SHINING</td>
        <td>6</td>
    </tr>
    <tr>
        <td>238</td>
        <td>DOCTOR GRAIL</td>
        <td>6</td>
    </tr>
    <tr>
        <td>239</td>
        <td>DOGMA FAMILY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>240</td>
        <td>DOLLS RAGE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>241</td>
        <td>DONNIE ALLEY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>242</td>
        <td>DOOM DANCING</td>
        <td>8</td>
    </tr>
    <tr>
        <td>243</td>
        <td>DOORS PRESIDENT</td>
        <td>9</td>
    </tr>
    <tr>
        <td>244</td>
        <td>DORADO NOTTING</td>
        <td>4</td>
    </tr>
    <tr>
        <td>245</td>
        <td>DOUBLE WRATH</td>
        <td>8</td>
    </tr>
    <tr>
        <td>246</td>
        <td>DOUBTFIRE LABYRINTH</td>
        <td>5</td>
    </tr>
    <tr>
        <td>247</td>
        <td>DOWNHILL ENOUGH</td>
        <td>4</td>
    </tr>
    <tr>
        <td>248</td>
        <td>DOZEN LION</td>
        <td>6</td>
    </tr>
    <tr>
        <td>249</td>
        <td>DRACULA CRYSTAL</td>
        <td>13</td>
    </tr>
    <tr>
        <td>250</td>
        <td>DRAGON SQUAD</td>
        <td>8</td>
    </tr>
    <tr>
        <td>251</td>
        <td>DRAGONFLY STRANGERS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>252</td>
        <td>DREAM PICKUP</td>
        <td>4</td>
    </tr>
    <tr>
        <td>253</td>
        <td>DRIFTER COMMANDMENTS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>254</td>
        <td>DRIVER ANNIE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>255</td>
        <td>DRIVING POLISH</td>
        <td>7</td>
    </tr>
    <tr>
        <td>256</td>
        <td>DROP WATERFRONT</td>
        <td>8</td>
    </tr>
    <tr>
        <td>258</td>
        <td>DRUMS DYNAMITE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>259</td>
        <td>DUCK RACER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>260</td>
        <td>DUDE BLINDNESS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>261</td>
        <td>DUFFEL APOCALYPSE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>262</td>
        <td>DUMBO LUST</td>
        <td>9</td>
    </tr>
    <tr>
        <td>263</td>
        <td>DURHAM PANKY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>264</td>
        <td>DWARFS ALTER</td>
        <td>1</td>
    </tr>
    <tr>
        <td>265</td>
        <td>DYING MAKER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>266</td>
        <td>DYNAMITE TARZAN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>267</td>
        <td>EAGLES PANKY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>268</td>
        <td>EARLY HOME</td>
        <td>6</td>
    </tr>
    <tr>
        <td>269</td>
        <td>EARRING INSTINCT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>270</td>
        <td>EARTH VISION</td>
        <td>3</td>
    </tr>
    <tr>
        <td>271</td>
        <td>EASY GLADIATOR</td>
        <td>3</td>
    </tr>
    <tr>
        <td>272</td>
        <td>EDGE KISSING</td>
        <td>3</td>
    </tr>
    <tr>
        <td>273</td>
        <td>EFFECT GLADIATOR</td>
        <td>7</td>
    </tr>
    <tr>
        <td>274</td>
        <td>EGG IGBY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>275</td>
        <td>EGYPT TENENBAUMS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>276</td>
        <td>ELEMENT FREDDY</td>
        <td>4</td>
    </tr>
    <tr>
        <td>277</td>
        <td>ELEPHANT TROJAN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>278</td>
        <td>ELF MURDER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>279</td>
        <td>ELIZABETH SHANE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>280</td>
        <td>EMPIRE MALKOVICH</td>
        <td>9</td>
    </tr>
    <tr>
        <td>281</td>
        <td>ENCINO ELF</td>
        <td>6</td>
    </tr>
    <tr>
        <td>282</td>
        <td>ENCOUNTERS CURTAIN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>283</td>
        <td>ENDING CROWDS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>284</td>
        <td>ENEMY ODDS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>285</td>
        <td>ENGLISH BULWORTH</td>
        <td>5</td>
    </tr>
    <tr>
        <td>286</td>
        <td>ENOUGH RAGING</td>
        <td>9</td>
    </tr>
    <tr>
        <td>287</td>
        <td>ENTRAPMENT SATISFACTION</td>
        <td>4</td>
    </tr>
    <tr>
        <td>288</td>
        <td>ESCAPE METROPOLIS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>289</td>
        <td>EVE RESURRECTION</td>
        <td>6</td>
    </tr>
    <tr>
        <td>290</td>
        <td>EVERYONE CRAFT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>291</td>
        <td>EVOLUTION ALTER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>292</td>
        <td>EXCITEMENT EVE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>293</td>
        <td>EXORCIST STING</td>
        <td>5</td>
    </tr>
    <tr>
        <td>294</td>
        <td>EXPECATIONS NATURAL</td>
        <td>3</td>
    </tr>
    <tr>
        <td>295</td>
        <td>EXPENDABLE STALLION</td>
        <td>4</td>
    </tr>
    <tr>
        <td>296</td>
        <td>EXPRESS LONELY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>297</td>
        <td>EXTRAORDINARY CONQUERER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>298</td>
        <td>EYES DRIVING</td>
        <td>5</td>
    </tr>
    <tr>
        <td>299</td>
        <td>FACTORY DRAGON</td>
        <td>6</td>
    </tr>
    <tr>
        <td>300</td>
        <td>FALCON VOLUME</td>
        <td>4</td>
    </tr>
    <tr>
        <td>301</td>
        <td>FAMILY SWEET</td>
        <td>9</td>
    </tr>
    <tr>
        <td>302</td>
        <td>FANTASIA PARK</td>
        <td>3</td>
    </tr>
    <tr>
        <td>303</td>
        <td>FANTASY TROOPERS</td>
        <td>9</td>
    </tr>
    <tr>
        <td>304</td>
        <td>FARGO GANDHI</td>
        <td>5</td>
    </tr>
    <tr>
        <td>305</td>
        <td>FATAL HAUNTED</td>
        <td>6</td>
    </tr>
    <tr>
        <td>306</td>
        <td>FEATHERS METAL</td>
        <td>9</td>
    </tr>
    <tr>
        <td>307</td>
        <td>FELLOWSHIP AUTUMN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>308</td>
        <td>FERRIS MOTHER</td>
        <td>1</td>
    </tr>
    <tr>
        <td>309</td>
        <td>FEUD FROGMEN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>310</td>
        <td>FEVER EMPIRE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>311</td>
        <td>FICTION CHRISTMAS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>312</td>
        <td>FIDDLER LOST</td>
        <td>11</td>
    </tr>
    <tr>
        <td>313</td>
        <td>FIDELITY DEVIL</td>
        <td>4</td>
    </tr>
    <tr>
        <td>314</td>
        <td>FIGHT JAWBREAKER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>315</td>
        <td>FINDING ANACONDA</td>
        <td>5</td>
    </tr>
    <tr>
        <td>316</td>
        <td>FIRE WOLVES</td>
        <td>5</td>
    </tr>
    <tr>
        <td>317</td>
        <td>FIREBALL PHILADELPHIA</td>
        <td>5</td>
    </tr>
    <tr>
        <td>318</td>
        <td>FIREHOUSE VIETNAM</td>
        <td>5</td>
    </tr>
    <tr>
        <td>319</td>
        <td>FISH OPUS</td>
        <td>2</td>
    </tr>
    <tr>
        <td>320</td>
        <td>FLAMINGOS CONNECTICUT</td>
        <td>9</td>
    </tr>
    <tr>
        <td>321</td>
        <td>FLASH WARS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>322</td>
        <td>FLATLINERS KILLER</td>
        <td>9</td>
    </tr>
    <tr>
        <td>324</td>
        <td>FLINTSTONES HAPPINESS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>325</td>
        <td>FLOATS GARDEN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>326</td>
        <td>FLYING HOOK</td>
        <td>8</td>
    </tr>
    <tr>
        <td>327</td>
        <td>FOOL MOCKINGBIRD</td>
        <td>2</td>
    </tr>
    <tr>
        <td>328</td>
        <td>FOREVER CANDIDATE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>329</td>
        <td>FORREST SONS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>330</td>
        <td>FORRESTER COMANCHEROS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>331</td>
        <td>FORWARD TEMPLE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>332</td>
        <td>FRANKENSTEIN STRANGER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>333</td>
        <td>FREAKY POCUS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>334</td>
        <td>FREDDY STORM</td>
        <td>3</td>
    </tr>
    <tr>
        <td>335</td>
        <td>FREEDOM CLEOPATRA</td>
        <td>5</td>
    </tr>
    <tr>
        <td>336</td>
        <td>FRENCH HOLIDAY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>337</td>
        <td>FRIDA SLIPPER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>338</td>
        <td>FRISCO FORREST</td>
        <td>9</td>
    </tr>
    <tr>
        <td>339</td>
        <td>FROGMEN BREAKING</td>
        <td>6</td>
    </tr>
    <tr>
        <td>340</td>
        <td>FRONTIER CABIN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>341</td>
        <td>FROST HEAD</td>
        <td>7</td>
    </tr>
    <tr>
        <td>342</td>
        <td>FUGITIVE MAGUIRE</td>
        <td>11</td>
    </tr>
    <tr>
        <td>343</td>
        <td>FULL FLATLINERS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>344</td>
        <td>FURY MURDER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>345</td>
        <td>GABLES METROPOLIS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>346</td>
        <td>GALAXY SWEETHEARTS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>347</td>
        <td>GAMES BOWFINGER</td>
        <td>8</td>
    </tr>
    <tr>
        <td>348</td>
        <td>GANDHI KWAI</td>
        <td>8</td>
    </tr>
    <tr>
        <td>349</td>
        <td>GANGS PRIDE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>350</td>
        <td>GARDEN ISLAND</td>
        <td>3</td>
    </tr>
    <tr>
        <td>351</td>
        <td>GASLIGHT CRUSADE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>352</td>
        <td>GATHERING CALENDAR</td>
        <td>3</td>
    </tr>
    <tr>
        <td>353</td>
        <td>GENTLEMEN STAGE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>354</td>
        <td>GHOST GROUNDHOG</td>
        <td>5</td>
    </tr>
    <tr>
        <td>355</td>
        <td>GHOSTBUSTERS ELF</td>
        <td>1</td>
    </tr>
    <tr>
        <td>356</td>
        <td>GIANT TROOPERS</td>
        <td>1</td>
    </tr>
    <tr>
        <td>357</td>
        <td>GILBERT PELICAN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>358</td>
        <td>GILMORE BOILED</td>
        <td>6</td>
    </tr>
    <tr>
        <td>359</td>
        <td>GLADIATOR WESTWARD</td>
        <td>6</td>
    </tr>
    <tr>
        <td>360</td>
        <td>GLASS DYING</td>
        <td>4</td>
    </tr>
    <tr>
        <td>361</td>
        <td>GLEAMING JAWBREAKER</td>
        <td>8</td>
    </tr>
    <tr>
        <td>362</td>
        <td>GLORY TRACY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>363</td>
        <td>GO PURPLE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>364</td>
        <td>GODFATHER DIARY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>365</td>
        <td>GOLD RIVER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>366</td>
        <td>GOLDFINGER SENSIBILITY</td>
        <td>4</td>
    </tr>
    <tr>
        <td>367</td>
        <td>GOLDMINE TYCOON</td>
        <td>7</td>
    </tr>
    <tr>
        <td>368</td>
        <td>GONE TROUBLE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>369</td>
        <td>GOODFELLAS SALUTE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>370</td>
        <td>GORGEOUS BINGO</td>
        <td>7</td>
    </tr>
    <tr>
        <td>371</td>
        <td>GOSFORD DONNIE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>372</td>
        <td>GRACELAND DYNAMITE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>373</td>
        <td>GRADUATE LORD</td>
        <td>2</td>
    </tr>
    <tr>
        <td>374</td>
        <td>GRAFFITI LOVE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>375</td>
        <td>GRAIL FRANKENSTEIN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>376</td>
        <td>GRAPES FURY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>377</td>
        <td>GREASE YOUTH</td>
        <td>3</td>
    </tr>
    <tr>
        <td>378</td>
        <td>GREATEST NORTH</td>
        <td>6</td>
    </tr>
    <tr>
        <td>379</td>
        <td>GREEDY ROOTS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>380</td>
        <td>GREEK EVERYONE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>381</td>
        <td>GRINCH MASSAGE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>382</td>
        <td>GRIT CLOCKWORK</td>
        <td>3</td>
    </tr>
    <tr>
        <td>383</td>
        <td>GROOVE FICTION</td>
        <td>7</td>
    </tr>
    <tr>
        <td>384</td>
        <td>GROSSE WONDERFUL</td>
        <td>4</td>
    </tr>
    <tr>
        <td>385</td>
        <td>GROUNDHOG UNCUT</td>
        <td>7</td>
    </tr>
    <tr>
        <td>386</td>
        <td>GUMP DATE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>387</td>
        <td>GUN BONNIE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>388</td>
        <td>GUNFIGHT MOON</td>
        <td>4</td>
    </tr>
    <tr>
        <td>389</td>
        <td>GUNFIGHTER MUSSOLINI</td>
        <td>4</td>
    </tr>
    <tr>
        <td>390</td>
        <td>GUYS FALCON</td>
        <td>5</td>
    </tr>
    <tr>
        <td>391</td>
        <td>HALF OUTFIELD</td>
        <td>6</td>
    </tr>
    <tr>
        <td>392</td>
        <td>HALL CASSIDY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>393</td>
        <td>HALLOWEEN NUTS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>394</td>
        <td>HAMLET WISDOM</td>
        <td>5</td>
    </tr>
    <tr>
        <td>395</td>
        <td>HANDICAP BOONDOCK</td>
        <td>7</td>
    </tr>
    <tr>
        <td>396</td>
        <td>HANGING DEEP</td>
        <td>7</td>
    </tr>
    <tr>
        <td>397</td>
        <td>HANKY OCTOBER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>398</td>
        <td>HANOVER GALAXY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>399</td>
        <td>HAPPINESS UNITED</td>
        <td>5</td>
    </tr>
    <tr>
        <td>400</td>
        <td>HARDLY ROBBERS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>401</td>
        <td>HAROLD FRENCH</td>
        <td>7</td>
    </tr>
    <tr>
        <td>402</td>
        <td>HARPER DYING</td>
        <td>4</td>
    </tr>
    <tr>
        <td>403</td>
        <td>HARRY IDAHO</td>
        <td>6</td>
    </tr>
    <tr>
        <td>404</td>
        <td>HATE HANDICAP</td>
        <td>3</td>
    </tr>
    <tr>
        <td>405</td>
        <td>HAUNTED ANTITRUST</td>
        <td>5</td>
    </tr>
    <tr>
        <td>406</td>
        <td>HAUNTING PIANIST</td>
        <td>5</td>
    </tr>
    <tr>
        <td>407</td>
        <td>HAWK CHILL</td>
        <td>7</td>
    </tr>
    <tr>
        <td>408</td>
        <td>HEAD STRANGER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>409</td>
        <td>HEARTBREAKERS BRIGHT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>410</td>
        <td>HEAVEN FREEDOM</td>
        <td>10</td>
    </tr>
    <tr>
        <td>411</td>
        <td>HEAVENLY GUN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>412</td>
        <td>HEAVYWEIGHTS BEAST</td>
        <td>5</td>
    </tr>
    <tr>
        <td>413</td>
        <td>HEDWIG ALTER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>414</td>
        <td>HELLFIGHTERS SIERRA</td>
        <td>12</td>
    </tr>
    <tr>
        <td>415</td>
        <td>HIGH ENCINO</td>
        <td>7</td>
    </tr>
    <tr>
        <td>416</td>
        <td>HIGHBALL POTTER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>417</td>
        <td>HILLS NEIGHBORS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>418</td>
        <td>HOBBIT ALIEN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>419</td>
        <td>HOCUS FRIDA</td>
        <td>3</td>
    </tr>
    <tr>
        <td>420</td>
        <td>HOLES BRANNIGAN</td>
        <td>11</td>
    </tr>
    <tr>
        <td>421</td>
        <td>HOLIDAY GAMES</td>
        <td>6</td>
    </tr>
    <tr>
        <td>422</td>
        <td>HOLLOW JEOPARDY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>423</td>
        <td>HOLLYWOOD ANONYMOUS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>424</td>
        <td>HOLOCAUST HIGHBALL</td>
        <td>5</td>
    </tr>
    <tr>
        <td>425</td>
        <td>HOLY TADPOLE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>426</td>
        <td>HOME PITY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>427</td>
        <td>HOMEWARD CIDER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>428</td>
        <td>HOMICIDE PEACH</td>
        <td>8</td>
    </tr>
    <tr>
        <td>429</td>
        <td>HONEY TIES</td>
        <td>5</td>
    </tr>
    <tr>
        <td>430</td>
        <td>HOOK CHARIOTS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>431</td>
        <td>HOOSIERS BIRDCAGE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>432</td>
        <td>HOPE TOOTSIE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>433</td>
        <td>HORN WORKING</td>
        <td>8</td>
    </tr>
    <tr>
        <td>434</td>
        <td>HORROR REIGN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>435</td>
        <td>HOTEL HAPPINESS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>436</td>
        <td>HOURS RAGE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>437</td>
        <td>HOUSE DYNAMITE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>438</td>
        <td>HUMAN GRAFFITI</td>
        <td>4</td>
    </tr>
    <tr>
        <td>439</td>
        <td>HUNCHBACK IMPOSSIBLE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>440</td>
        <td>HUNGER ROOF</td>
        <td>1</td>
    </tr>
    <tr>
        <td>441</td>
        <td>HUNTER ALTER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>442</td>
        <td>HUNTING MUSKETEERS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>443</td>
        <td>HURRICANE AFFAIR</td>
        <td>3</td>
    </tr>
    <tr>
        <td>444</td>
        <td>HUSTLER PARTY</td>
        <td>4</td>
    </tr>
    <tr>
        <td>445</td>
        <td>HYDE DOCTOR</td>
        <td>6</td>
    </tr>
    <tr>
        <td>446</td>
        <td>HYSTERICAL GRAIL</td>
        <td>9</td>
    </tr>
    <tr>
        <td>447</td>
        <td>ICE CROSSING</td>
        <td>6</td>
    </tr>
    <tr>
        <td>448</td>
        <td>IDAHO LOVE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>449</td>
        <td>IDENTITY LOVER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>450</td>
        <td>IDOLS SNATCHERS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>451</td>
        <td>IGBY MAKER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>452</td>
        <td>ILLUSION AMELIE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>453</td>
        <td>IMAGE PRINCESS</td>
        <td>11</td>
    </tr>
    <tr>
        <td>454</td>
        <td>IMPACT ALADDIN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>455</td>
        <td>IMPOSSIBLE PREJUDICE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>456</td>
        <td>INCH JET</td>
        <td>5</td>
    </tr>
    <tr>
        <td>457</td>
        <td>INDEPENDENCE HOTEL</td>
        <td>9</td>
    </tr>
    <tr>
        <td>458</td>
        <td>INDIAN LOVE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>459</td>
        <td>INFORMER DOUBLE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>460</td>
        <td>INNOCENT USUAL</td>
        <td>3</td>
    </tr>
    <tr>
        <td>461</td>
        <td>INSECTS STONE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>462</td>
        <td>INSIDER ARIZONA</td>
        <td>9</td>
    </tr>
    <tr>
        <td>463</td>
        <td>INSTINCT AIRPORT</td>
        <td>11</td>
    </tr>
    <tr>
        <td>464</td>
        <td>INTENTIONS EMPIRE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>465</td>
        <td>INTERVIEW LIAISONS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>466</td>
        <td>INTOLERABLE INTENTIONS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>467</td>
        <td>INTRIGUE WORST</td>
        <td>7</td>
    </tr>
    <tr>
        <td>468</td>
        <td>INVASION CYCLONE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>469</td>
        <td>IRON MOON</td>
        <td>8</td>
    </tr>
    <tr>
        <td>470</td>
        <td>ISHTAR ROCKETEER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>471</td>
        <td>ISLAND EXORCIST</td>
        <td>3</td>
    </tr>
    <tr>
        <td>472</td>
        <td>ITALIAN AFRICAN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>473</td>
        <td>JACKET FRISCO</td>
        <td>10</td>
    </tr>
    <tr>
        <td>474</td>
        <td>JADE BUNCH</td>
        <td>8</td>
    </tr>
    <tr>
        <td>475</td>
        <td>JAPANESE RUN</td>
        <td>9</td>
    </tr>
    <tr>
        <td>476</td>
        <td>JASON TRAP</td>
        <td>5</td>
    </tr>
    <tr>
        <td>477</td>
        <td>JAWBREAKER BROOKLYN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>478</td>
        <td>JAWS HARRY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>479</td>
        <td>JEDI BENEATH</td>
        <td>4</td>
    </tr>
    <tr>
        <td>480</td>
        <td>JEEPERS WEDDING</td>
        <td>6</td>
    </tr>
    <tr>
        <td>481</td>
        <td>JEKYLL FROGMEN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>482</td>
        <td>JEOPARDY ENCINO</td>
        <td>5</td>
    </tr>
    <tr>
        <td>483</td>
        <td>JERICHO MULAN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>484</td>
        <td>JERK PAYCHECK</td>
        <td>8</td>
    </tr>
    <tr>
        <td>485</td>
        <td>JERSEY SASSY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>486</td>
        <td>JET NEIGHBORS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>487</td>
        <td>JINGLE SAGEBRUSH</td>
        <td>2</td>
    </tr>
    <tr>
        <td>488</td>
        <td>JOON NORTHWEST</td>
        <td>2</td>
    </tr>
    <tr>
        <td>489</td>
        <td>JUGGLER HARDLY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>490</td>
        <td>JUMANJI BLADE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>491</td>
        <td>JUMPING WRATH</td>
        <td>8</td>
    </tr>
    <tr>
        <td>492</td>
        <td>JUNGLE CLOSER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>493</td>
        <td>KANE EXORCIST</td>
        <td>5</td>
    </tr>
    <tr>
        <td>494</td>
        <td>KARATE MOON</td>
        <td>8</td>
    </tr>
    <tr>
        <td>495</td>
        <td>KENTUCKIAN GIANT</td>
        <td>4</td>
    </tr>
    <tr>
        <td>496</td>
        <td>KICK SAVANNAH</td>
        <td>6</td>
    </tr>
    <tr>
        <td>497</td>
        <td>KILL BROTHERHOOD</td>
        <td>5</td>
    </tr>
    <tr>
        <td>498</td>
        <td>KILLER INNOCENT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>499</td>
        <td>KING EVOLUTION</td>
        <td>6</td>
    </tr>
    <tr>
        <td>500</td>
        <td>KISS GLORY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>501</td>
        <td>KISSING DOLLS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>502</td>
        <td>KNOCK WARLOCK</td>
        <td>6</td>
    </tr>
    <tr>
        <td>503</td>
        <td>KRAMER CHOCOLATE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>504</td>
        <td>KWAI HOMEWARD</td>
        <td>5</td>
    </tr>
    <tr>
        <td>505</td>
        <td>LABYRINTH LEAGUE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>506</td>
        <td>LADY STAGE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>507</td>
        <td>LADYBUGS ARMAGEDDON</td>
        <td>4</td>
    </tr>
    <tr>
        <td>508</td>
        <td>LAMBS CINCINATTI</td>
        <td>15</td>
    </tr>
    <tr>
        <td>509</td>
        <td>LANGUAGE COWBOY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>510</td>
        <td>LAWLESS VISION</td>
        <td>4</td>
    </tr>
    <tr>
        <td>511</td>
        <td>LAWRENCE LOVE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>512</td>
        <td>LEAGUE HELLFIGHTERS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>513</td>
        <td>LEATHERNECKS DWARFS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>514</td>
        <td>LEBOWSKI SOLDIERS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>515</td>
        <td>LEGALLY SECRETARY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>516</td>
        <td>LEGEND JEDI</td>
        <td>4</td>
    </tr>
    <tr>
        <td>517</td>
        <td>LESSON CLEOPATRA</td>
        <td>12</td>
    </tr>
    <tr>
        <td>518</td>
        <td>LIAISONS SWEET</td>
        <td>6</td>
    </tr>
    <tr>
        <td>519</td>
        <td>LIBERTY MAGNIFICENT</td>
        <td>7</td>
    </tr>
    <tr>
        <td>520</td>
        <td>LICENSE WEEKEND</td>
        <td>8</td>
    </tr>
    <tr>
        <td>521</td>
        <td>LIES TREATMENT</td>
        <td>7</td>
    </tr>
    <tr>
        <td>522</td>
        <td>LIFE TWISTED</td>
        <td>8</td>
    </tr>
    <tr>
        <td>523</td>
        <td>LIGHTS DEER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>524</td>
        <td>LION UNCUT</td>
        <td>3</td>
    </tr>
    <tr>
        <td>525</td>
        <td>LOATHING LEGALLY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>526</td>
        <td>LOCK REAR</td>
        <td>2</td>
    </tr>
    <tr>
        <td>527</td>
        <td>LOLA AGENT</td>
        <td>6</td>
    </tr>
    <tr>
        <td>528</td>
        <td>LOLITA WORLD</td>
        <td>1</td>
    </tr>
    <tr>
        <td>529</td>
        <td>LONELY ELEPHANT</td>
        <td>12</td>
    </tr>
    <tr>
        <td>530</td>
        <td>LORD ARIZONA</td>
        <td>6</td>
    </tr>
    <tr>
        <td>531</td>
        <td>LOSE INCH</td>
        <td>4</td>
    </tr>
    <tr>
        <td>532</td>
        <td>LOSER HUSTLER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>533</td>
        <td>LOST BIRD</td>
        <td>3</td>
    </tr>
    <tr>
        <td>534</td>
        <td>LOUISIANA HARRY</td>
        <td>3</td>
    </tr>
    <tr>
        <td>535</td>
        <td>LOVE SUICIDES</td>
        <td>4</td>
    </tr>
    <tr>
        <td>536</td>
        <td>LOVELY JINGLE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>537</td>
        <td>LOVER TRUMAN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>538</td>
        <td>LOVERBOY ATTACKS</td>
        <td>9</td>
    </tr>
    <tr>
        <td>539</td>
        <td>LUCK OPUS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>540</td>
        <td>LUCKY FLYING</td>
        <td>10</td>
    </tr>
    <tr>
        <td>541</td>
        <td>LUKE MUMMY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>542</td>
        <td>LUST LOCK</td>
        <td>7</td>
    </tr>
    <tr>
        <td>543</td>
        <td>MADIGAN DORADO</td>
        <td>6</td>
    </tr>
    <tr>
        <td>544</td>
        <td>MADISON TRAP</td>
        <td>5</td>
    </tr>
    <tr>
        <td>545</td>
        <td>MADNESS ATTACKS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>546</td>
        <td>MADRE GABLES</td>
        <td>4</td>
    </tr>
    <tr>
        <td>547</td>
        <td>MAGIC MALLRATS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>548</td>
        <td>MAGNIFICENT CHITTY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>549</td>
        <td>MAGNOLIA FORRESTER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>550</td>
        <td>MAGUIRE APACHE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>551</td>
        <td>MAIDEN HOME</td>
        <td>8</td>
    </tr>
    <tr>
        <td>552</td>
        <td>MAJESTIC FLOATS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>553</td>
        <td>MAKER GABLES</td>
        <td>11</td>
    </tr>
    <tr>
        <td>554</td>
        <td>MALKOVICH PET</td>
        <td>7</td>
    </tr>
    <tr>
        <td>555</td>
        <td>MALLRATS UNITED</td>
        <td>5</td>
    </tr>
    <tr>
        <td>556</td>
        <td>MALTESE HOPE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>557</td>
        <td>MANCHURIAN CURTAIN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>558</td>
        <td>MANNEQUIN WORST</td>
        <td>5</td>
    </tr>
    <tr>
        <td>559</td>
        <td>MARRIED GO</td>
        <td>3</td>
    </tr>
    <tr>
        <td>560</td>
        <td>MARS ROMAN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>561</td>
        <td>MASK PEACH</td>
        <td>11</td>
    </tr>
    <tr>
        <td>562</td>
        <td>MASKED BUBBLE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>563</td>
        <td>MASSACRE USUAL</td>
        <td>3</td>
    </tr>
    <tr>
        <td>564</td>
        <td>MASSAGE IMAGE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>565</td>
        <td>MATRIX SNOWMAN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>566</td>
        <td>MAUDE MOD</td>
        <td>6</td>
    </tr>
    <tr>
        <td>567</td>
        <td>MEET CHOCOLATE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>568</td>
        <td>MEMENTO ZOOLANDER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>569</td>
        <td>MENAGERIE RUSHMORE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>570</td>
        <td>MERMAID INSECTS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>571</td>
        <td>METAL ARMAGEDDON</td>
        <td>8</td>
    </tr>
    <tr>
        <td>572</td>
        <td>METROPOLIS COMA</td>
        <td>6</td>
    </tr>
    <tr>
        <td>573</td>
        <td>MICROCOSMOS PARADISE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>574</td>
        <td>MIDNIGHT WESTWARD</td>
        <td>9</td>
    </tr>
    <tr>
        <td>575</td>
        <td>MIDSUMMER GROUNDHOG</td>
        <td>2</td>
    </tr>
    <tr>
        <td>576</td>
        <td>MIGHTY LUCK</td>
        <td>8</td>
    </tr>
    <tr>
        <td>577</td>
        <td>MILE MULAN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>578</td>
        <td>MILLION ACE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>579</td>
        <td>MINDS TRUMAN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>580</td>
        <td>MINE TITANS</td>
        <td>2</td>
    </tr>
    <tr>
        <td>581</td>
        <td>MINORITY KISS</td>
        <td>1</td>
    </tr>
    <tr>
        <td>582</td>
        <td>MIRACLE VIRTUAL</td>
        <td>1</td>
    </tr>
    <tr>
        <td>583</td>
        <td>MISSION ZOOLANDER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>584</td>
        <td>MIXED DOORS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>585</td>
        <td>MOB DUFFEL</td>
        <td>6</td>
    </tr>
    <tr>
        <td>586</td>
        <td>MOCKINGBIRD HOLLYWOOD</td>
        <td>3</td>
    </tr>
    <tr>
        <td>587</td>
        <td>MOD SECRETARY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>588</td>
        <td>MODEL FISH</td>
        <td>8</td>
    </tr>
    <tr>
        <td>589</td>
        <td>MODERN DORADO</td>
        <td>5</td>
    </tr>
    <tr>
        <td>590</td>
        <td>MONEY HAROLD</td>
        <td>7</td>
    </tr>
    <tr>
        <td>591</td>
        <td>MONSOON CAUSE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>592</td>
        <td>MONSTER SPARTACUS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>593</td>
        <td>MONTEREY LABYRINTH</td>
        <td>6</td>
    </tr>
    <tr>
        <td>594</td>
        <td>MONTEZUMA COMMAND</td>
        <td>2</td>
    </tr>
    <tr>
        <td>595</td>
        <td>MOON BUNCH</td>
        <td>1</td>
    </tr>
    <tr>
        <td>596</td>
        <td>MOONSHINE CABIN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>597</td>
        <td>MOONWALKER FOOL</td>
        <td>7</td>
    </tr>
    <tr>
        <td>598</td>
        <td>MOSQUITO ARMAGEDDON</td>
        <td>4</td>
    </tr>
    <tr>
        <td>599</td>
        <td>MOTHER OLEANDER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>600</td>
        <td>MOTIONS DETAILS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>601</td>
        <td>MOULIN WAKE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>602</td>
        <td>MOURNING PURPLE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>603</td>
        <td>MOVIE SHAKESPEARE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>604</td>
        <td>MULAN MOON</td>
        <td>5</td>
    </tr>
    <tr>
        <td>605</td>
        <td>MULHOLLAND BEAST</td>
        <td>6</td>
    </tr>
    <tr>
        <td>606</td>
        <td>MUMMY CREATURES</td>
        <td>13</td>
    </tr>
    <tr>
        <td>607</td>
        <td>MUPPET MILE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>608</td>
        <td>MURDER ANTITRUST</td>
        <td>8</td>
    </tr>
    <tr>
        <td>609</td>
        <td>MUSCLE BRIGHT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>610</td>
        <td>MUSIC BOONDOCK</td>
        <td>3</td>
    </tr>
    <tr>
        <td>611</td>
        <td>MUSKETEERS WAIT</td>
        <td>1</td>
    </tr>
    <tr>
        <td>612</td>
        <td>MUSSOLINI SPOILERS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>613</td>
        <td>MYSTIC TRUMAN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>614</td>
        <td>NAME DETECTIVE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>615</td>
        <td>NASH CHOCOLAT</td>
        <td>7</td>
    </tr>
    <tr>
        <td>616</td>
        <td>NATIONAL STORY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>617</td>
        <td>NATURAL STOCK</td>
        <td>4</td>
    </tr>
    <tr>
        <td>618</td>
        <td>NECKLACE OUTBREAK</td>
        <td>8</td>
    </tr>
    <tr>
        <td>619</td>
        <td>NEIGHBORS CHARADE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>620</td>
        <td>NEMO CAMPUS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>621</td>
        <td>NETWORK PEAK</td>
        <td>3</td>
    </tr>
    <tr>
        <td>622</td>
        <td>NEWSIES STORY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>623</td>
        <td>NEWTON LABYRINTH</td>
        <td>4</td>
    </tr>
    <tr>
        <td>624</td>
        <td>NIGHTMARE CHILL</td>
        <td>2</td>
    </tr>
    <tr>
        <td>625</td>
        <td>NONE SPIKING</td>
        <td>6</td>
    </tr>
    <tr>
        <td>626</td>
        <td>NOON PAPI</td>
        <td>6</td>
    </tr>
    <tr>
        <td>627</td>
        <td>NORTH TEQUILA</td>
        <td>5</td>
    </tr>
    <tr>
        <td>628</td>
        <td>NORTHWEST POLISH</td>
        <td>8</td>
    </tr>
    <tr>
        <td>629</td>
        <td>NOTORIOUS REUNION</td>
        <td>2</td>
    </tr>
    <tr>
        <td>630</td>
        <td>NOTTING SPEAKEASY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>631</td>
        <td>NOVOCAINE FLIGHT</td>
        <td>6</td>
    </tr>
    <tr>
        <td>632</td>
        <td>NUTS TIES</td>
        <td>2</td>
    </tr>
    <tr>
        <td>633</td>
        <td>OCTOBER SUBMARINE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>634</td>
        <td>ODDS BOOGIE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>635</td>
        <td>OKLAHOMA JUMANJI</td>
        <td>9</td>
    </tr>
    <tr>
        <td>636</td>
        <td>OLEANDER CLUE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>637</td>
        <td>OPEN AFRICAN</td>
        <td>9</td>
    </tr>
    <tr>
        <td>638</td>
        <td>OPERATION OPERATION</td>
        <td>3</td>
    </tr>
    <tr>
        <td>639</td>
        <td>OPPOSITE NECKLACE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>640</td>
        <td>OPUS ICE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>641</td>
        <td>ORANGE GRAPES</td>
        <td>5</td>
    </tr>
    <tr>
        <td>642</td>
        <td>ORDER BETRAYED</td>
        <td>7</td>
    </tr>
    <tr>
        <td>643</td>
        <td>ORIENT CLOSER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>644</td>
        <td>OSCAR GOLD</td>
        <td>6</td>
    </tr>
    <tr>
        <td>645</td>
        <td>OTHERS SOUP</td>
        <td>4</td>
    </tr>
    <tr>
        <td>646</td>
        <td>OUTBREAK DIVINE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>647</td>
        <td>OUTFIELD MASSACRE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>648</td>
        <td>OUTLAW HANKY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>649</td>
        <td>OZ LIAISONS</td>
        <td>11</td>
    </tr>
    <tr>
        <td>650</td>
        <td>PACIFIC AMISTAD</td>
        <td>8</td>
    </tr>
    <tr>
        <td>651</td>
        <td>PACKER MADIGAN</td>
        <td>1</td>
    </tr>
    <tr>
        <td>652</td>
        <td>PAJAMA JAWBREAKER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>653</td>
        <td>PANIC CLUB</td>
        <td>3</td>
    </tr>
    <tr>
        <td>654</td>
        <td>PANKY SUBMARINE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>655</td>
        <td>PANTHER REDS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>656</td>
        <td>PAPI NECKLACE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>657</td>
        <td>PARADISE SABRINA</td>
        <td>4</td>
    </tr>
    <tr>
        <td>658</td>
        <td>PARIS WEEKEND</td>
        <td>6</td>
    </tr>
    <tr>
        <td>659</td>
        <td>PARK CITIZEN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>660</td>
        <td>PARTY KNOCK</td>
        <td>2</td>
    </tr>
    <tr>
        <td>661</td>
        <td>PAST SUICIDES</td>
        <td>6</td>
    </tr>
    <tr>
        <td>662</td>
        <td>PATHS CONTROL</td>
        <td>5</td>
    </tr>
    <tr>
        <td>663</td>
        <td>PATIENT SISTER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>664</td>
        <td>PATRIOT ROMAN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>665</td>
        <td>PATTON INTERVIEW</td>
        <td>9</td>
    </tr>
    <tr>
        <td>666</td>
        <td>PAYCHECK WAIT</td>
        <td>3</td>
    </tr>
    <tr>
        <td>667</td>
        <td>PEACH INNOCENT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>668</td>
        <td>PEAK FOREVER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>669</td>
        <td>PEARL DESTINY</td>
        <td>4</td>
    </tr>
    <tr>
        <td>670</td>
        <td>PELICAN COMFORTS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>671</td>
        <td>PERDITION FARGO</td>
        <td>5</td>
    </tr>
    <tr>
        <td>672</td>
        <td>PERFECT GROOVE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>673</td>
        <td>PERSONAL LADYBUGS</td>
        <td>9</td>
    </tr>
    <tr>
        <td>674</td>
        <td>PET HAUNTING</td>
        <td>7</td>
    </tr>
    <tr>
        <td>675</td>
        <td>PHANTOM GLORY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>676</td>
        <td>PHILADELPHIA WIFE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>677</td>
        <td>PIANIST OUTFIELD</td>
        <td>5</td>
    </tr>
    <tr>
        <td>678</td>
        <td>PICKUP DRIVING</td>
        <td>5</td>
    </tr>
    <tr>
        <td>679</td>
        <td>PILOT HOOSIERS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>680</td>
        <td>PINOCCHIO SIMON</td>
        <td>11</td>
    </tr>
    <tr>
        <td>681</td>
        <td>PIRATES ROXANNE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>682</td>
        <td>PITTSBURGH HUNCHBACK</td>
        <td>5</td>
    </tr>
    <tr>
        <td>683</td>
        <td>PITY BOUND</td>
        <td>5</td>
    </tr>
    <tr>
        <td>684</td>
        <td>PIZZA JUMANJI</td>
        <td>5</td>
    </tr>
    <tr>
        <td>685</td>
        <td>PLATOON INSTINCT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>686</td>
        <td>PLUTO OLEANDER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>687</td>
        <td>POCUS PULP</td>
        <td>5</td>
    </tr>
    <tr>
        <td>688</td>
        <td>POLISH BROOKLYN</td>
        <td>10</td>
    </tr>
    <tr>
        <td>689</td>
        <td>POLLOCK DELIVERANCE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>690</td>
        <td>POND SEATTLE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>691</td>
        <td>POSEIDON FOREVER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>692</td>
        <td>POTLUCK MIXED</td>
        <td>6</td>
    </tr>
    <tr>
        <td>693</td>
        <td>POTTER CONNECTICUT</td>
        <td>7</td>
    </tr>
    <tr>
        <td>694</td>
        <td>PREJUDICE OLEANDER</td>
        <td>10</td>
    </tr>
    <tr>
        <td>695</td>
        <td>PRESIDENT BANG</td>
        <td>5</td>
    </tr>
    <tr>
        <td>696</td>
        <td>PRIDE ALAMO</td>
        <td>4</td>
    </tr>
    <tr>
        <td>697</td>
        <td>PRIMARY GLASS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>698</td>
        <td>PRINCESS GIANT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>699</td>
        <td>PRIVATE DROP</td>
        <td>5</td>
    </tr>
    <tr>
        <td>700</td>
        <td>PRIX UNDEFEATED</td>
        <td>7</td>
    </tr>
    <tr>
        <td>701</td>
        <td>PSYCHO SHRUNK</td>
        <td>1</td>
    </tr>
    <tr>
        <td>702</td>
        <td>PULP BEVERLY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>703</td>
        <td>PUNK DIVORCE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>704</td>
        <td>PURE RUNNER</td>
        <td>2</td>
    </tr>
    <tr>
        <td>705</td>
        <td>PURPLE MOVIE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>706</td>
        <td>QUEEN LUKE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>707</td>
        <td>QUEST MUSSOLINI</td>
        <td>5</td>
    </tr>
    <tr>
        <td>708</td>
        <td>QUILLS BULL</td>
        <td>4</td>
    </tr>
    <tr>
        <td>709</td>
        <td>RACER EGG</td>
        <td>6</td>
    </tr>
    <tr>
        <td>710</td>
        <td>RAGE GAMES</td>
        <td>7</td>
    </tr>
    <tr>
        <td>711</td>
        <td>RAGING AIRPLANE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>712</td>
        <td>RAIDERS ANTITRUST</td>
        <td>6</td>
    </tr>
    <tr>
        <td>713</td>
        <td>RAINBOW SHOCK</td>
        <td>6</td>
    </tr>
    <tr>
        <td>714</td>
        <td>RANDOM GO</td>
        <td>13</td>
    </tr>
    <tr>
        <td>715</td>
        <td>RANGE MOONWALKER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>716</td>
        <td>REAP UNFAITHFUL</td>
        <td>4</td>
    </tr>
    <tr>
        <td>717</td>
        <td>REAR TRADING</td>
        <td>8</td>
    </tr>
    <tr>
        <td>718</td>
        <td>REBEL AIRPORT</td>
        <td>6</td>
    </tr>
    <tr>
        <td>719</td>
        <td>RECORDS ZORRO</td>
        <td>8</td>
    </tr>
    <tr>
        <td>720</td>
        <td>REDEMPTION COMFORTS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>721</td>
        <td>REDS POCUS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>722</td>
        <td>REEF SALUTE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>723</td>
        <td>REIGN GENTLEMEN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>724</td>
        <td>REMEMBER DIARY</td>
        <td>4</td>
    </tr>
    <tr>
        <td>725</td>
        <td>REQUIEM TYCOON</td>
        <td>8</td>
    </tr>
    <tr>
        <td>726</td>
        <td>RESERVOIR ADAPTATION</td>
        <td>8</td>
    </tr>
    <tr>
        <td>727</td>
        <td>RESURRECTION SILVERADO</td>
        <td>5</td>
    </tr>
    <tr>
        <td>728</td>
        <td>REUNION WITCHES</td>
        <td>7</td>
    </tr>
    <tr>
        <td>729</td>
        <td>RIDER CADDYSHACK</td>
        <td>9</td>
    </tr>
    <tr>
        <td>730</td>
        <td>RIDGEMONT SUBMARINE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>731</td>
        <td>RIGHT CRANES</td>
        <td>7</td>
    </tr>
    <tr>
        <td>732</td>
        <td>RINGS HEARTBREAKERS</td>
        <td>11</td>
    </tr>
    <tr>
        <td>733</td>
        <td>RIVER OUTLAW</td>
        <td>4</td>
    </tr>
    <tr>
        <td>734</td>
        <td>ROAD ROXANNE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>735</td>
        <td>ROBBERS JOON</td>
        <td>5</td>
    </tr>
    <tr>
        <td>736</td>
        <td>ROBBERY BRIGHT</td>
        <td>2</td>
    </tr>
    <tr>
        <td>737</td>
        <td>ROCK INSTINCT</td>
        <td>8</td>
    </tr>
    <tr>
        <td>738</td>
        <td>ROCKETEER MOTHER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>739</td>
        <td>ROCKY WAR</td>
        <td>3</td>
    </tr>
    <tr>
        <td>740</td>
        <td>ROLLERCOASTER BRINGING</td>
        <td>3</td>
    </tr>
    <tr>
        <td>741</td>
        <td>ROMAN PUNK</td>
        <td>2</td>
    </tr>
    <tr>
        <td>742</td>
        <td>ROOF CHAMPION</td>
        <td>5</td>
    </tr>
    <tr>
        <td>743</td>
        <td>ROOM ROMAN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>744</td>
        <td>ROOTS REMEMBER</td>
        <td>10</td>
    </tr>
    <tr>
        <td>745</td>
        <td>ROSES TREASURE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>746</td>
        <td>ROUGE SQUAD</td>
        <td>4</td>
    </tr>
    <tr>
        <td>747</td>
        <td>ROXANNE REBEL</td>
        <td>5</td>
    </tr>
    <tr>
        <td>748</td>
        <td>RUGRATS SHAKESPEARE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>749</td>
        <td>RULES HUMAN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>750</td>
        <td>RUN PACIFIC</td>
        <td>6</td>
    </tr>
    <tr>
        <td>751</td>
        <td>RUNAWAY TENENBAUMS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>752</td>
        <td>RUNNER MADIGAN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>753</td>
        <td>RUSH GOODFELLAS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>754</td>
        <td>RUSHMORE MERMAID</td>
        <td>7</td>
    </tr>
    <tr>
        <td>755</td>
        <td>SABRINA MIDNIGHT</td>
        <td>4</td>
    </tr>
    <tr>
        <td>756</td>
        <td>SADDLE ANTITRUST</td>
        <td>3</td>
    </tr>
    <tr>
        <td>757</td>
        <td>SAGEBRUSH CLUELESS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>758</td>
        <td>SAINTS BRIDE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>759</td>
        <td>SALUTE APOLLO</td>
        <td>4</td>
    </tr>
    <tr>
        <td>760</td>
        <td>SAMURAI LION</td>
        <td>2</td>
    </tr>
    <tr>
        <td>761</td>
        <td>SANTA PARIS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>762</td>
        <td>SASSY PACKER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>763</td>
        <td>SATISFACTION CONFIDENTIAL</td>
        <td>5</td>
    </tr>
    <tr>
        <td>764</td>
        <td>SATURDAY LAMBS</td>
        <td>9</td>
    </tr>
    <tr>
        <td>765</td>
        <td>SATURN NAME</td>
        <td>2</td>
    </tr>
    <tr>
        <td>766</td>
        <td>SAVANNAH TOWN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>767</td>
        <td>SCALAWAG DUCK</td>
        <td>5</td>
    </tr>
    <tr>
        <td>768</td>
        <td>SCARFACE BANG</td>
        <td>7</td>
    </tr>
    <tr>
        <td>769</td>
        <td>SCHOOL JACKET</td>
        <td>8</td>
    </tr>
    <tr>
        <td>770</td>
        <td>SCISSORHANDS SLUMS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>771</td>
        <td>SCORPION APOLLO</td>
        <td>8</td>
    </tr>
    <tr>
        <td>772</td>
        <td>SEA VIRGIN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>773</td>
        <td>SEABISCUIT PUNK</td>
        <td>3</td>
    </tr>
    <tr>
        <td>774</td>
        <td>SEARCHERS WAIT</td>
        <td>4</td>
    </tr>
    <tr>
        <td>775</td>
        <td>SEATTLE EXPECATIONS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>776</td>
        <td>SECRET GROUNDHOG</td>
        <td>3</td>
    </tr>
    <tr>
        <td>777</td>
        <td>SECRETARY ROUGE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>778</td>
        <td>SECRETS PARADISE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>779</td>
        <td>SENSE GREEK</td>
        <td>7</td>
    </tr>
    <tr>
        <td>780</td>
        <td>SENSIBILITY REAR</td>
        <td>6</td>
    </tr>
    <tr>
        <td>781</td>
        <td>SEVEN SWARM</td>
        <td>7</td>
    </tr>
    <tr>
        <td>782</td>
        <td>SHAKESPEARE SADDLE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>783</td>
        <td>SHANE DARKNESS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>784</td>
        <td>SHANGHAI TYCOON</td>
        <td>8</td>
    </tr>
    <tr>
        <td>785</td>
        <td>SHAWSHANK BUBBLE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>786</td>
        <td>SHEPHERD MIDSUMMER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>787</td>
        <td>SHINING ROSES</td>
        <td>5</td>
    </tr>
    <tr>
        <td>788</td>
        <td>SHIP WONDERLAND</td>
        <td>8</td>
    </tr>
    <tr>
        <td>789</td>
        <td>SHOCK CABIN</td>
        <td>1</td>
    </tr>
    <tr>
        <td>790</td>
        <td>SHOOTIST SUPERFLY</td>
        <td>3</td>
    </tr>
    <tr>
        <td>791</td>
        <td>SHOW LORD</td>
        <td>2</td>
    </tr>
    <tr>
        <td>792</td>
        <td>SHREK LICENSE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>793</td>
        <td>SHRUNK DIVINE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>794</td>
        <td>SIDE ARK</td>
        <td>6</td>
    </tr>
    <tr>
        <td>795</td>
        <td>SIEGE MADRE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>796</td>
        <td>SIERRA DIVIDE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>797</td>
        <td>SILENCE KANE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>798</td>
        <td>SILVERADO GOLDFINGER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>799</td>
        <td>SIMON NORTH</td>
        <td>3</td>
    </tr>
    <tr>
        <td>800</td>
        <td>SINNERS ATLANTIS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>801</td>
        <td>SISTER FREDDY</td>
        <td>3</td>
    </tr>
    <tr>
        <td>802</td>
        <td>SKY MIRACLE</td>
        <td>12</td>
    </tr>
    <tr>
        <td>804</td>
        <td>SLEEPING SUSPECTS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>805</td>
        <td>SLEEPLESS MONSOON</td>
        <td>4</td>
    </tr>
    <tr>
        <td>806</td>
        <td>SLEEPY JAPANESE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>807</td>
        <td>SLEUTH ORIENT</td>
        <td>7</td>
    </tr>
    <tr>
        <td>808</td>
        <td>SLING LUKE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>809</td>
        <td>SLIPPER FIDELITY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>810</td>
        <td>SLUMS DUCK</td>
        <td>3</td>
    </tr>
    <tr>
        <td>811</td>
        <td>SMILE EARRING</td>
        <td>8</td>
    </tr>
    <tr>
        <td>812</td>
        <td>SMOKING BARBARELLA</td>
        <td>6</td>
    </tr>
    <tr>
        <td>813</td>
        <td>SMOOCHY CONTROL</td>
        <td>2</td>
    </tr>
    <tr>
        <td>814</td>
        <td>SNATCH SLIPPER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>815</td>
        <td>SNATCHERS MONTEZUMA</td>
        <td>9</td>
    </tr>
    <tr>
        <td>816</td>
        <td>SNOWMAN ROLLERCOASTER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>817</td>
        <td>SOLDIERS EVOLUTION</td>
        <td>9</td>
    </tr>
    <tr>
        <td>818</td>
        <td>SOMETHING DUCK</td>
        <td>3</td>
    </tr>
    <tr>
        <td>819</td>
        <td>SONG HEDWIG</td>
        <td>5</td>
    </tr>
    <tr>
        <td>820</td>
        <td>SONS INTERVIEW</td>
        <td>6</td>
    </tr>
    <tr>
        <td>821</td>
        <td>SORORITY QUEEN</td>
        <td>4</td>
    </tr>
    <tr>
        <td>822</td>
        <td>SOUP WISDOM</td>
        <td>2</td>
    </tr>
    <tr>
        <td>823</td>
        <td>SOUTH WAIT</td>
        <td>2</td>
    </tr>
    <tr>
        <td>824</td>
        <td>SPARTACUS CHEAPER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>825</td>
        <td>SPEAKEASY DATE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>826</td>
        <td>SPEED SUIT</td>
        <td>6</td>
    </tr>
    <tr>
        <td>827</td>
        <td>SPICE SORORITY</td>
        <td>11</td>
    </tr>
    <tr>
        <td>828</td>
        <td>SPIKING ELEMENT</td>
        <td>6</td>
    </tr>
    <tr>
        <td>829</td>
        <td>SPINAL ROCKY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>830</td>
        <td>SPIRIT FLINTSTONES</td>
        <td>11</td>
    </tr>
    <tr>
        <td>831</td>
        <td>SPIRITED CASUALTIES</td>
        <td>5</td>
    </tr>
    <tr>
        <td>832</td>
        <td>SPLASH GUMP</td>
        <td>10</td>
    </tr>
    <tr>
        <td>833</td>
        <td>SPLENDOR PATTON</td>
        <td>10</td>
    </tr>
    <tr>
        <td>834</td>
        <td>SPOILERS HELLFIGHTERS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>835</td>
        <td>SPY MILE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>836</td>
        <td>SQUAD FISH</td>
        <td>5</td>
    </tr>
    <tr>
        <td>837</td>
        <td>STAGE WORLD</td>
        <td>2</td>
    </tr>
    <tr>
        <td>838</td>
        <td>STAGECOACH ARMAGEDDON</td>
        <td>6</td>
    </tr>
    <tr>
        <td>839</td>
        <td>STALLION SUNDANCE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>840</td>
        <td>STAMPEDE DISTURBING</td>
        <td>6</td>
    </tr>
    <tr>
        <td>841</td>
        <td>STAR OPERATION</td>
        <td>5</td>
    </tr>
    <tr>
        <td>842</td>
        <td>STATE WASTELAND</td>
        <td>7</td>
    </tr>
    <tr>
        <td>843</td>
        <td>STEEL SANTA</td>
        <td>3</td>
    </tr>
    <tr>
        <td>844</td>
        <td>STEERS ARMAGEDDON</td>
        <td>4</td>
    </tr>
    <tr>
        <td>845</td>
        <td>STEPMOM DREAM</td>
        <td>4</td>
    </tr>
    <tr>
        <td>846</td>
        <td>STING PERSONAL</td>
        <td>7</td>
    </tr>
    <tr>
        <td>847</td>
        <td>STOCK GLASS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>848</td>
        <td>STONE FIRE</td>
        <td>1</td>
    </tr>
    <tr>
        <td>849</td>
        <td>STORM HAPPINESS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>850</td>
        <td>STORY SIDE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>851</td>
        <td>STRAIGHT HOURS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>852</td>
        <td>STRANGELOVE DESIRE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>853</td>
        <td>STRANGER STRANGERS</td>
        <td>9</td>
    </tr>
    <tr>
        <td>854</td>
        <td>STRANGERS GRAFFITI</td>
        <td>5</td>
    </tr>
    <tr>
        <td>855</td>
        <td>STREAK RIDGEMONT</td>
        <td>3</td>
    </tr>
    <tr>
        <td>856</td>
        <td>STREETCAR INTENTIONS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>857</td>
        <td>STRICTLY SCARFACE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>858</td>
        <td>SUBMARINE BED</td>
        <td>11</td>
    </tr>
    <tr>
        <td>859</td>
        <td>SUGAR WONKA</td>
        <td>5</td>
    </tr>
    <tr>
        <td>860</td>
        <td>SUICIDES SILENCE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>861</td>
        <td>SUIT WALLS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>862</td>
        <td>SUMMER SCARFACE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>863</td>
        <td>SUN CONFESSIONS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>864</td>
        <td>SUNDANCE INVASION</td>
        <td>7</td>
    </tr>
    <tr>
        <td>865</td>
        <td>SUNRISE LEAGUE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>866</td>
        <td>SUNSET RACER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>867</td>
        <td>SUPER WYOMING</td>
        <td>3</td>
    </tr>
    <tr>
        <td>868</td>
        <td>SUPERFLY TRIP</td>
        <td>7</td>
    </tr>
    <tr>
        <td>869</td>
        <td>SUSPECTS QUILLS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>870</td>
        <td>SWARM GOLD</td>
        <td>6</td>
    </tr>
    <tr>
        <td>871</td>
        <td>SWEDEN SHINING</td>
        <td>5</td>
    </tr>
    <tr>
        <td>872</td>
        <td>SWEET BROTHERHOOD</td>
        <td>6</td>
    </tr>
    <tr>
        <td>873</td>
        <td>SWEETHEARTS SUSPECTS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>874</td>
        <td>TADPOLE PARK</td>
        <td>8</td>
    </tr>
    <tr>
        <td>875</td>
        <td>TALENTED HOMICIDE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>876</td>
        <td>TARZAN VIDEOTAPE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>877</td>
        <td>TAXI KICK</td>
        <td>6</td>
    </tr>
    <tr>
        <td>878</td>
        <td>TEEN APOLLO</td>
        <td>5</td>
    </tr>
    <tr>
        <td>879</td>
        <td>TELEGRAPH VOYAGE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>880</td>
        <td>TELEMARK HEARTBREAKERS</td>
        <td>11</td>
    </tr>
    <tr>
        <td>881</td>
        <td>TEMPLE ATTRACTION</td>
        <td>5</td>
    </tr>
    <tr>
        <td>882</td>
        <td>TENENBAUMS COMMAND</td>
        <td>5</td>
    </tr>
    <tr>
        <td>883</td>
        <td>TEQUILA PAST</td>
        <td>3</td>
    </tr>
    <tr>
        <td>884</td>
        <td>TERMINATOR CLUB</td>
        <td>2</td>
    </tr>
    <tr>
        <td>885</td>
        <td>TEXAS WATCH</td>
        <td>6</td>
    </tr>
    <tr>
        <td>886</td>
        <td>THEORY MERMAID</td>
        <td>6</td>
    </tr>
    <tr>
        <td>887</td>
        <td>THIEF PELICAN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>888</td>
        <td>THIN SAGEBRUSH</td>
        <td>2</td>
    </tr>
    <tr>
        <td>889</td>
        <td>TIES HUNGER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>890</td>
        <td>TIGHTS DAWN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>891</td>
        <td>TIMBERLAND SKY</td>
        <td>4</td>
    </tr>
    <tr>
        <td>892</td>
        <td>TITANIC BOONDOCK</td>
        <td>12</td>
    </tr>
    <tr>
        <td>893</td>
        <td>TITANS JERK</td>
        <td>7</td>
    </tr>
    <tr>
        <td>894</td>
        <td>TOMATOES HELLFIGHTERS</td>
        <td>9</td>
    </tr>
    <tr>
        <td>895</td>
        <td>TOMORROW HUSTLER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>896</td>
        <td>TOOTSIE PILOT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>897</td>
        <td>TORQUE BOUND</td>
        <td>5</td>
    </tr>
    <tr>
        <td>898</td>
        <td>TOURIST PELICAN</td>
        <td>3</td>
    </tr>
    <tr>
        <td>899</td>
        <td>TOWERS HURRICANE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>900</td>
        <td>TOWN ARK</td>
        <td>4</td>
    </tr>
    <tr>
        <td>901</td>
        <td>TRACY CIDER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>902</td>
        <td>TRADING PINOCCHIO</td>
        <td>3</td>
    </tr>
    <tr>
        <td>903</td>
        <td>TRAFFIC HOBBIT</td>
        <td>4</td>
    </tr>
    <tr>
        <td>904</td>
        <td>TRAIN BUNCH</td>
        <td>4</td>
    </tr>
    <tr>
        <td>905</td>
        <td>TRAINSPOTTING STRANGERS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>906</td>
        <td>TRAMP OTHERS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>907</td>
        <td>TRANSLATION SUMMER</td>
        <td>3</td>
    </tr>
    <tr>
        <td>908</td>
        <td>TRAP GUYS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>909</td>
        <td>TREASURE COMMAND</td>
        <td>7</td>
    </tr>
    <tr>
        <td>910</td>
        <td>TREATMENT JEKYLL</td>
        <td>5</td>
    </tr>
    <tr>
        <td>911</td>
        <td>TRIP NEWTON</td>
        <td>4</td>
    </tr>
    <tr>
        <td>912</td>
        <td>TROJAN TOMORROW</td>
        <td>8</td>
    </tr>
    <tr>
        <td>913</td>
        <td>TROOPERS METAL</td>
        <td>5</td>
    </tr>
    <tr>
        <td>914</td>
        <td>TROUBLE DATE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>915</td>
        <td>TRUMAN CRAZY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>916</td>
        <td>TURN STAR</td>
        <td>3</td>
    </tr>
    <tr>
        <td>917</td>
        <td>TUXEDO MILE</td>
        <td>3</td>
    </tr>
    <tr>
        <td>918</td>
        <td>TWISTED PIRATES</td>
        <td>3</td>
    </tr>
    <tr>
        <td>919</td>
        <td>TYCOON GATHERING</td>
        <td>6</td>
    </tr>
    <tr>
        <td>920</td>
        <td>UNBREAKABLE KARATE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>921</td>
        <td>UNCUT SUICIDES</td>
        <td>7</td>
    </tr>
    <tr>
        <td>922</td>
        <td>UNDEFEATED DALMATIONS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>923</td>
        <td>UNFAITHFUL KILL</td>
        <td>8</td>
    </tr>
    <tr>
        <td>924</td>
        <td>UNFORGIVEN ZOOLANDER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>925</td>
        <td>UNITED PILOT</td>
        <td>6</td>
    </tr>
    <tr>
        <td>926</td>
        <td>UNTOUCHABLES SUNRISE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>927</td>
        <td>UPRISING UPTOWN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>928</td>
        <td>UPTOWN YOUNG</td>
        <td>7</td>
    </tr>
    <tr>
        <td>929</td>
        <td>USUAL UNTOUCHABLES</td>
        <td>5</td>
    </tr>
    <tr>
        <td>930</td>
        <td>VACATION BOONDOCK</td>
        <td>6</td>
    </tr>
    <tr>
        <td>931</td>
        <td>VALENTINE VANISHING</td>
        <td>2</td>
    </tr>
    <tr>
        <td>932</td>
        <td>VALLEY PACKER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>933</td>
        <td>VAMPIRE WHALE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>934</td>
        <td>VANILLA DAY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>935</td>
        <td>VANISHED GARDEN</td>
        <td>2</td>
    </tr>
    <tr>
        <td>936</td>
        <td>VANISHING ROCKY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>937</td>
        <td>VARSITY TRIP</td>
        <td>3</td>
    </tr>
    <tr>
        <td>938</td>
        <td>VELVET TERMINATOR</td>
        <td>9</td>
    </tr>
    <tr>
        <td>939</td>
        <td>VERTIGO NORTHWEST</td>
        <td>4</td>
    </tr>
    <tr>
        <td>940</td>
        <td>VICTORY ACADEMY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>941</td>
        <td>VIDEOTAPE ARSENIC</td>
        <td>5</td>
    </tr>
    <tr>
        <td>942</td>
        <td>VIETNAM SMOOCHY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>943</td>
        <td>VILLAIN DESPERATE</td>
        <td>2</td>
    </tr>
    <tr>
        <td>944</td>
        <td>VIRGIN DAISY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>945</td>
        <td>VIRGINIAN PLUTO</td>
        <td>8</td>
    </tr>
    <tr>
        <td>946</td>
        <td>VIRTUAL SPOILERS</td>
        <td>3</td>
    </tr>
    <tr>
        <td>947</td>
        <td>VISION TORQUE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>948</td>
        <td>VOICE PEACH</td>
        <td>3</td>
    </tr>
    <tr>
        <td>949</td>
        <td>VOLCANO TEXAS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>950</td>
        <td>VOLUME HOUSE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>951</td>
        <td>VOYAGE LEGALLY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>952</td>
        <td>WAGON JAWS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>953</td>
        <td>WAIT CIDER</td>
        <td>9</td>
    </tr>
    <tr>
        <td>954</td>
        <td>WAKE JAWS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>955</td>
        <td>WALLS ARTIST</td>
        <td>5</td>
    </tr>
    <tr>
        <td>956</td>
        <td>WANDA CHAMBER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>957</td>
        <td>WAR NOTTING</td>
        <td>9</td>
    </tr>
    <tr>
        <td>958</td>
        <td>WARDROBE PHANTOM</td>
        <td>8</td>
    </tr>
    <tr>
        <td>959</td>
        <td>WARLOCK WEREWOLF</td>
        <td>6</td>
    </tr>
    <tr>
        <td>960</td>
        <td>WARS PLUTO</td>
        <td>4</td>
    </tr>
    <tr>
        <td>961</td>
        <td>WASH HEAVENLY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>962</td>
        <td>WASTELAND DIVINE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>963</td>
        <td>WATCH TRACY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>964</td>
        <td>WATERFRONT DELIVERANCE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>965</td>
        <td>WATERSHIP FRONTIER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>966</td>
        <td>WEDDING APOLLO</td>
        <td>10</td>
    </tr>
    <tr>
        <td>967</td>
        <td>WEEKEND PERSONAL</td>
        <td>10</td>
    </tr>
    <tr>
        <td>968</td>
        <td>WEREWOLF LOLA</td>
        <td>7</td>
    </tr>
    <tr>
        <td>969</td>
        <td>WEST LION</td>
        <td>9</td>
    </tr>
    <tr>
        <td>970</td>
        <td>WESTWARD SEABISCUIT</td>
        <td>6</td>
    </tr>
    <tr>
        <td>971</td>
        <td>WHALE BIKINI</td>
        <td>5</td>
    </tr>
    <tr>
        <td>972</td>
        <td>WHISPERER GIANT</td>
        <td>3</td>
    </tr>
    <tr>
        <td>973</td>
        <td>WIFE TURN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>974</td>
        <td>WILD APOLLO</td>
        <td>4</td>
    </tr>
    <tr>
        <td>975</td>
        <td>WILLOW TRACY</td>
        <td>2</td>
    </tr>
    <tr>
        <td>976</td>
        <td>WIND PHANTOM</td>
        <td>3</td>
    </tr>
    <tr>
        <td>977</td>
        <td>WINDOW SIDE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>978</td>
        <td>WISDOM WORKER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>979</td>
        <td>WITCHES PANIC</td>
        <td>4</td>
    </tr>
    <tr>
        <td>980</td>
        <td>WIZARD COLDBLOODED</td>
        <td>9</td>
    </tr>
    <tr>
        <td>981</td>
        <td>WOLVES DESIRE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>982</td>
        <td>WOMEN DORADO</td>
        <td>5</td>
    </tr>
    <tr>
        <td>983</td>
        <td>WON DARES</td>
        <td>5</td>
    </tr>
    <tr>
        <td>984</td>
        <td>WONDERFUL DROP</td>
        <td>4</td>
    </tr>
    <tr>
        <td>985</td>
        <td>WONDERLAND CHRISTMAS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>986</td>
        <td>WONKA SEA</td>
        <td>2</td>
    </tr>
    <tr>
        <td>987</td>
        <td>WORDS HUNTER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>988</td>
        <td>WORKER TARZAN</td>
        <td>9</td>
    </tr>
    <tr>
        <td>989</td>
        <td>WORKING MICROCOSMOS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>990</td>
        <td>WORLD LEATHERNECKS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>991</td>
        <td>WORST BANGER</td>
        <td>4</td>
    </tr>
    <tr>
        <td>992</td>
        <td>WRATH MILE</td>
        <td>4</td>
    </tr>
    <tr>
        <td>993</td>
        <td>WRONG BEHAVIOR</td>
        <td>9</td>
    </tr>
    <tr>
        <td>994</td>
        <td>WYOMING STORM</td>
        <td>6</td>
    </tr>
    <tr>
        <td>995</td>
        <td>YENTL IDAHO</td>
        <td>1</td>
    </tr>
    <tr>
        <td>996</td>
        <td>YOUNG LANGUAGE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>997</td>
        <td>YOUTH KICK</td>
        <td>5</td>
    </tr>
    <tr>
        <td>998</td>
        <td>ZHIVAGO CORE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>999</td>
        <td>ZOOLANDER FICTION</td>
        <td>5</td>
    </tr>
    <tr>
        <td>1000</td>
        <td>ZORRO ARK</td>
        <td>3</td>
    </tr>
</table>



### 6d. How many copies of the film Hunchback Impossible exist in the inventory system?


```python
%%sql
SELECT COUNT(*) FROM inventory
WHERE film_id IN (
	SELECT film_id from film WHERE title = 'Hunchback Impossible'
    )
;
```

    1 rows affected.





<table>
    <tr>
        <th>COUNT(*)</th>
    </tr>
    <tr>
        <td>6</td>
    </tr>
</table>



###  6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:


```python
%%sql
SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount) as total_amount_paid
FROM customer c
INNER JOIN payment p
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name
;
```

    599 rows affected.





<table>
    <tr>
        <th>customer_id</th>
        <th>last_name</th>
        <th>first_name</th>
        <th>total_amount_paid</th>
    </tr>
    <tr>
        <td>505</td>
        <td>ABNEY</td>
        <td>RAFAEL</td>
        <td>97.79</td>
    </tr>
    <tr>
        <td>504</td>
        <td>ADAM</td>
        <td>NATHANIEL</td>
        <td>133.72</td>
    </tr>
    <tr>
        <td>36</td>
        <td>ADAMS</td>
        <td>KATHLEEN</td>
        <td>92.73</td>
    </tr>
    <tr>
        <td>96</td>
        <td>ALEXANDER</td>
        <td>DIANA</td>
        <td>105.73</td>
    </tr>
    <tr>
        <td>470</td>
        <td>ALLARD</td>
        <td>GORDON</td>
        <td>160.68</td>
    </tr>
    <tr>
        <td>27</td>
        <td>ALLEN</td>
        <td>SHIRLEY</td>
        <td>126.69</td>
    </tr>
    <tr>
        <td>220</td>
        <td>ALVAREZ</td>
        <td>CHARLENE</td>
        <td>114.73</td>
    </tr>
    <tr>
        <td>11</td>
        <td>ANDERSON</td>
        <td>LISA</td>
        <td>106.76</td>
    </tr>
    <tr>
        <td>326</td>
        <td>ANDREW</td>
        <td>JOSE</td>
        <td>96.75</td>
    </tr>
    <tr>
        <td>183</td>
        <td>ANDREWS</td>
        <td>IDA</td>
        <td>76.77</td>
    </tr>
    <tr>
        <td>449</td>
        <td>AQUINO</td>
        <td>OSCAR</td>
        <td>99.80</td>
    </tr>
    <tr>
        <td>368</td>
        <td>ARCE</td>
        <td>HARRY</td>
        <td>157.65</td>
    </tr>
    <tr>
        <td>560</td>
        <td>ARCHULETA</td>
        <td>JORDAN</td>
        <td>132.70</td>
    </tr>
    <tr>
        <td>188</td>
        <td>ARMSTRONG</td>
        <td>MELANIE</td>
        <td>92.75</td>
    </tr>
    <tr>
        <td>170</td>
        <td>ARNOLD</td>
        <td>BEATRICE</td>
        <td>119.74</td>
    </tr>
    <tr>
        <td>591</td>
        <td>ARSENAULT</td>
        <td>KENT</td>
        <td>134.73</td>
    </tr>
    <tr>
        <td>345</td>
        <td>ARTIS</td>
        <td>CARL</td>
        <td>106.77</td>
    </tr>
    <tr>
        <td>530</td>
        <td>ASHCRAFT</td>
        <td>DARRYL</td>
        <td>76.77</td>
    </tr>
    <tr>
        <td>540</td>
        <td>ASHER</td>
        <td>TYRONE</td>
        <td>112.76</td>
    </tr>
    <tr>
        <td>196</td>
        <td>AUSTIN</td>
        <td>ALMA</td>
        <td>151.65</td>
    </tr>
    <tr>
        <td>60</td>
        <td>BAILEY</td>
        <td>MILDRED</td>
        <td>98.75</td>
    </tr>
    <tr>
        <td>37</td>
        <td>BAKER</td>
        <td>PAMELA</td>
        <td>95.77</td>
    </tr>
    <tr>
        <td>383</td>
        <td>BALES</td>
        <td>MARTIN</td>
        <td>103.73</td>
    </tr>
    <tr>
        <td>559</td>
        <td>BANDA</td>
        <td>EVERETT</td>
        <td>110.72</td>
    </tr>
    <tr>
        <td>215</td>
        <td>BANKS</td>
        <td>JESSIE</td>
        <td>91.74</td>
    </tr>
    <tr>
        <td>551</td>
        <td>BARBEE</td>
        <td>CLAYTON</td>
        <td>96.74</td>
    </tr>
    <tr>
        <td>503</td>
        <td>BARCLAY</td>
        <td>ANGEL</td>
        <td>115.68</td>
    </tr>
    <tr>
        <td>362</td>
        <td>BARFIELD</td>
        <td>NICHOLAS</td>
        <td>145.68</td>
    </tr>
    <tr>
        <td>382</td>
        <td>BARKLEY</td>
        <td>VICTOR</td>
        <td>91.76</td>
    </tr>
    <tr>
        <td>79</td>
        <td>BARNES</td>
        <td>RACHEL</td>
        <td>84.78</td>
    </tr>
    <tr>
        <td>275</td>
        <td>BARNETT</td>
        <td>CAROLE</td>
        <td>108.70</td>
    </tr>
    <tr>
        <td>280</td>
        <td>BARRETT</td>
        <td>TRACEY</td>
        <td>118.73</td>
    </tr>
    <tr>
        <td>295</td>
        <td>BATES</td>
        <td>DAISY</td>
        <td>162.62</td>
    </tr>
    <tr>
        <td>317</td>
        <td>BAUGH</td>
        <td>EDWARD</td>
        <td>114.72</td>
    </tr>
    <tr>
        <td>301</td>
        <td>BAUGHMAN</td>
        <td>ROBERT</td>
        <td>92.79</td>
    </tr>
    <tr>
        <td>58</td>
        <td>BELL</td>
        <td>JEAN</td>
        <td>115.73</td>
    </tr>
    <tr>
        <td>511</td>
        <td>BENNER</td>
        <td>CHESTER</td>
        <td>99.76</td>
    </tr>
    <tr>
        <td>77</td>
        <td>BENNETT</td>
        <td>JANE</td>
        <td>100.72</td>
    </tr>
    <tr>
        <td>168</td>
        <td>BERRY</td>
        <td>REGINA</td>
        <td>135.66</td>
    </tr>
    <tr>
        <td>495</td>
        <td>BESS</td>
        <td>CHARLIE</td>
        <td>120.74</td>
    </tr>
    <tr>
        <td>448</td>
        <td>BETANCOURT</td>
        <td>MIGUEL</td>
        <td>135.71</td>
    </tr>
    <tr>
        <td>344</td>
        <td>BILLINGSLEY</td>
        <td>HENRY</td>
        <td>73.82</td>
    </tr>
    <tr>
        <td>217</td>
        <td>BISHOP</td>
        <td>AGNES</td>
        <td>98.77</td>
    </tr>
    <tr>
        <td>149</td>
        <td>BLACK</td>
        <td>VALERIE</td>
        <td>121.74</td>
    </tr>
    <tr>
        <td>461</td>
        <td>BLAKELY</td>
        <td>DEREK</td>
        <td>97.72</td>
    </tr>
    <tr>
        <td>539</td>
        <td>BOLIN</td>
        <td>MATHEW</td>
        <td>90.78</td>
    </tr>
    <tr>
        <td>433</td>
        <td>BONE</td>
        <td>DON</td>
        <td>133.75</td>
    </tr>
    <tr>
        <td>460</td>
        <td>BOSTIC</td>
        <td>LEON</td>
        <td>109.75</td>
    </tr>
    <tr>
        <td>381</td>
        <td>BOUDREAU</td>
        <td>BOBBY</td>
        <td>106.65</td>
    </tr>
    <tr>
        <td>476</td>
        <td>BOURQUE</td>
        <td>DERRICK</td>
        <td>95.78</td>
    </tr>
    <tr>
        <td>447</td>
        <td>BOWENS</td>
        <td>CLIFFORD</td>
        <td>113.71</td>
    </tr>
    <tr>
        <td>248</td>
        <td>BOWMAN</td>
        <td>CAROLINE</td>
        <td>50.85</td>
    </tr>
    <tr>
        <td>573</td>
        <td>BOX</td>
        <td>BYRON</td>
        <td>120.71</td>
    </tr>
    <tr>
        <td>134</td>
        <td>BOYD</td>
        <td>EMMA</td>
        <td>94.77</td>
    </tr>
    <tr>
        <td>181</td>
        <td>BRADLEY</td>
        <td>ANA</td>
        <td>174.66</td>
    </tr>
    <tr>
        <td>538</td>
        <td>BREAUX</td>
        <td>TED</td>
        <td>117.71</td>
    </tr>
    <tr>
        <td>251</td>
        <td>BREWER</td>
        <td>VICKIE</td>
        <td>120.69</td>
    </tr>
    <tr>
        <td>380</td>
        <td>BRINSON</td>
        <td>RUSSELL</td>
        <td>136.64</td>
    </tr>
    <tr>
        <td>73</td>
        <td>BROOKS</td>
        <td>BEVERLY</td>
        <td>97.76</td>
    </tr>
    <tr>
        <td>394</td>
        <td>BROTHERS</td>
        <td>CHRIS</td>
        <td>84.78</td>
    </tr>
    <tr>
        <td>5</td>
        <td>BROWN</td>
        <td>ELIZABETH</td>
        <td>144.62</td>
    </tr>
    <tr>
        <td>550</td>
        <td>BROWNLEE</td>
        <td>GUY</td>
        <td>159.68</td>
    </tr>
    <tr>
        <td>95</td>
        <td>BRYANT</td>
        <td>PAULA</td>
        <td>77.82</td>
    </tr>
    <tr>
        <td>537</td>
        <td>BUFORD</td>
        <td>CLINTON</td>
        <td>103.75</td>
    </tr>
    <tr>
        <td>469</td>
        <td>BULL</td>
        <td>WESLEY</td>
        <td>177.60</td>
    </tr>
    <tr>
        <td>325</td>
        <td>BUNN</td>
        <td>TIMOTHY</td>
        <td>91.78</td>
    </tr>
    <tr>
        <td>432</td>
        <td>BURK</td>
        <td>EDWIN</td>
        <td>116.77</td>
    </tr>
    <tr>
        <td>243</td>
        <td>BURKE</td>
        <td>LYDIA</td>
        <td>82.76</td>
    </tr>
    <tr>
        <td>572</td>
        <td>BURLESON</td>
        <td>SIDNEY</td>
        <td>108.75</td>
    </tr>
    <tr>
        <td>142</td>
        <td>BURNS</td>
        <td>APRIL</td>
        <td>94.74</td>
    </tr>
    <tr>
        <td>227</td>
        <td>BURTON</td>
        <td>COLLEEN</td>
        <td>87.76</td>
    </tr>
    <tr>
        <td>442</td>
        <td>BUSTAMANTE</td>
        <td>LEROY</td>
        <td>118.68</td>
    </tr>
    <tr>
        <td>91</td>
        <td>BUTLER</td>
        <td>LOIS</td>
        <td>113.65</td>
    </tr>
    <tr>
        <td>412</td>
        <td>BUTTERFIELD</td>
        <td>ALLEN</td>
        <td>85.79</td>
    </tr>
    <tr>
        <td>261</td>
        <td>BYRD</td>
        <td>DEANNA</td>
        <td>107.74</td>
    </tr>
    <tr>
        <td>310</td>
        <td>CABRAL</td>
        <td>DANIEL</td>
        <td>97.80</td>
    </tr>
    <tr>
        <td>272</td>
        <td>CALDWELL</td>
        <td>KAY</td>
        <td>98.80</td>
    </tr>
    <tr>
        <td>46</td>
        <td>CAMPBELL</td>
        <td>CATHERINE</td>
        <td>142.66</td>
    </tr>
    <tr>
        <td>419</td>
        <td>CARBONE</td>
        <td>CHAD</td>
        <td>89.75</td>
    </tr>
    <tr>
        <td>253</td>
        <td>CARLSON</td>
        <td>TERRY</td>
        <td>127.71</td>
    </tr>
    <tr>
        <td>189</td>
        <td>CARPENTER</td>
        <td>LORETTA</td>
        <td>93.78</td>
    </tr>
    <tr>
        <td>205</td>
        <td>CARR</td>
        <td>EILEEN</td>
        <td>80.82</td>
    </tr>
    <tr>
        <td>401</td>
        <td>CARRANZA</td>
        <td>TONY</td>
        <td>74.78</td>
    </tr>
    <tr>
        <td>176</td>
        <td>CARROLL</td>
        <td>JUNE</td>
        <td>173.63</td>
    </tr>
    <tr>
        <td>40</td>
        <td>CARTER</td>
        <td>AMANDA</td>
        <td>110.73</td>
    </tr>
    <tr>
        <td>468</td>
        <td>CARY</td>
        <td>TIM</td>
        <td>175.61</td>
    </tr>
    <tr>
        <td>423</td>
        <td>CASILLAS</td>
        <td>ALFRED</td>
        <td>120.74</td>
    </tr>
    <tr>
        <td>207</td>
        <td>CASTILLO</td>
        <td>GERTRUDE</td>
        <td>137.66</td>
    </tr>
    <tr>
        <td>282</td>
        <td>CASTRO</td>
        <td>JENNY</td>
        <td>103.73</td>
    </tr>
    <tr>
        <td>393</td>
        <td>CAUSEY</td>
        <td>PHILIP</td>
        <td>121.69</td>
    </tr>
    <tr>
        <td>290</td>
        <td>CHAMBERS</td>
        <td>KRISTINA</td>
        <td>109.72</td>
    </tr>
    <tr>
        <td>483</td>
        <td>CHAPA</td>
        <td>VERNON</td>
        <td>88.82</td>
    </tr>
    <tr>
        <td>209</td>
        <td>CHAPMAN</td>
        <td>TONYA</td>
        <td>161.68</td>
    </tr>
    <tr>
        <td>194</td>
        <td>CHAVEZ</td>
        <td>KRISTEN</td>
        <td>87.82</td>
    </tr>
    <tr>
        <td>441</td>
        <td>CHEATHAM</td>
        <td>MARIO</td>
        <td>112.72</td>
    </tr>
    <tr>
        <td>475</td>
        <td>CHESTNUT</td>
        <td>PEDRO</td>
        <td>103.76</td>
    </tr>
    <tr>
        <td>571</td>
        <td>CHISHOLM</td>
        <td>JOHNNIE</td>
        <td>121.76</td>
    </tr>
    <tr>
        <td>494</td>
        <td>CHOATE</td>
        <td>RAMON</td>
        <td>140.69</td>
    </tr>
    <tr>
        <td>549</td>
        <td>CHRISTENSON</td>
        <td>NELSON</td>
        <td>77.80</td>
    </tr>
    <tr>
        <td>536</td>
        <td>CHURCHILL</td>
        <td>FERNANDO</td>
        <td>117.75</td>
    </tr>
    <tr>
        <td>599</td>
        <td>CINTRON</td>
        <td>AUSTIN</td>
        <td>83.81</td>
    </tr>
    <tr>
        <td>21</td>
        <td>CLARK</td>
        <td>MICHELLE</td>
        <td>155.65</td>
    </tr>
    <tr>
        <td>525</td>
        <td>CLARY</td>
        <td>ADRIAN</td>
        <td>74.81</td>
    </tr>
    <tr>
        <td>440</td>
        <td>COLBY</td>
        <td>BERNARD</td>
        <td>88.78</td>
    </tr>
    <tr>
        <td>108</td>
        <td>COLE</td>
        <td>TRACY</td>
        <td>132.70</td>
    </tr>
    <tr>
        <td>82</td>
        <td>COLEMAN</td>
        <td>KATHRYN</td>
        <td>130.74</td>
    </tr>
    <tr>
        <td>459</td>
        <td>COLLAZO</td>
        <td>TOMMY</td>
        <td>186.62</td>
    </tr>
    <tr>
        <td>50</td>
        <td>COLLINS</td>
        <td>DIANE</td>
        <td>169.65</td>
    </tr>
    <tr>
        <td>56</td>
        <td>COOK</td>
        <td>GLORIA</td>
        <td>135.70</td>
    </tr>
    <tr>
        <td>62</td>
        <td>COOPER</td>
        <td>JOAN</td>
        <td>84.77</td>
    </tr>
    <tr>
        <td>548</td>
        <td>CORNISH</td>
        <td>ALLAN</td>
        <td>79.81</td>
    </tr>
    <tr>
        <td>502</td>
        <td>CORNWELL</td>
        <td>BRETT</td>
        <td>138.66</td>
    </tr>
    <tr>
        <td>379</td>
        <td>COUGHLIN</td>
        <td>CARLOS</td>
        <td>106.77</td>
    </tr>
    <tr>
        <td>64</td>
        <td>COX</td>
        <td>JUDITH</td>
        <td>100.67</td>
    </tr>
    <tr>
        <td>324</td>
        <td>COY</td>
        <td>GARY</td>
        <td>103.75</td>
    </tr>
    <tr>
        <td>288</td>
        <td>CRAIG</td>
        <td>BOBBIE</td>
        <td>80.76</td>
    </tr>
    <tr>
        <td>132</td>
        <td>CRAWFORD</td>
        <td>ESTHER</td>
        <td>95.72</td>
    </tr>
    <tr>
        <td>482</td>
        <td>CRAWLEY</td>
        <td>MAURICE</td>
        <td>138.71</td>
    </tr>
    <tr>
        <td>570</td>
        <td>CROMWELL</td>
        <td>IVAN</td>
        <td>99.74</td>
    </tr>
    <tr>
        <td>352</td>
        <td>CROUSE</td>
        <td>ALBERT</td>
        <td>99.77</td>
    </tr>
    <tr>
        <td>118</td>
        <td>CRUZ</td>
        <td>KIM</td>
        <td>82.79</td>
    </tr>
    <tr>
        <td>446</td>
        <td>CULP</td>
        <td>THEODORE</td>
        <td>116.69</td>
    </tr>
    <tr>
        <td>378</td>
        <td>CULPEPPER</td>
        <td>EUGENE</td>
        <td>71.81</td>
    </tr>
    <tr>
        <td>180</td>
        <td>CUNNINGHAM</td>
        <td>STACY</td>
        <td>98.77</td>
    </tr>
    <tr>
        <td>316</td>
        <td>CURLEY</td>
        <td>STEVEN</td>
        <td>132.71</td>
    </tr>
    <tr>
        <td>411</td>
        <td>CURRIER</td>
        <td>NORMAN</td>
        <td>80.74</td>
    </tr>
    <tr>
        <td>270</td>
        <td>CURTIS</td>
        <td>LEAH</td>
        <td>104.75</td>
    </tr>
    <tr>
        <td>150</td>
        <td>DANIELS</td>
        <td>DANIELLE</td>
        <td>105.75</td>
    </tr>
    <tr>
        <td>262</td>
        <td>DAVIDSON</td>
        <td>PATSY</td>
        <td>119.72</td>
    </tr>
    <tr>
        <td>6</td>
        <td>DAVIS</td>
        <td>JENNIFER</td>
        <td>93.72</td>
    </tr>
    <tr>
        <td>245</td>
        <td>DAY</td>
        <td>COURTNEY</td>
        <td>132.68</td>
    </tr>
    <tr>
        <td>236</td>
        <td>DEAN</td>
        <td>MARCIA</td>
        <td>175.58</td>
    </tr>
    <tr>
        <td>467</td>
        <td>DELOACH</td>
        <td>ALVIN</td>
        <td>139.71</td>
    </tr>
    <tr>
        <td>519</td>
        <td>DELUCA</td>
        <td>RON</td>
        <td>103.77</td>
    </tr>
    <tr>
        <td>598</td>
        <td>DELVALLE</td>
        <td>WADE</td>
        <td>83.78</td>
    </tr>
    <tr>
        <td>481</td>
        <td>DEVORE</td>
        <td>HERMAN</td>
        <td>115.71</td>
    </tr>
    <tr>
        <td>99</td>
        <td>DIAZ</td>
        <td>EMILY</td>
        <td>91.76</td>
    </tr>
    <tr>
        <td>139</td>
        <td>DIXON</td>
        <td>AMBER</td>
        <td>113.73</td>
    </tr>
    <tr>
        <td>257</td>
        <td>DOUGLAS</td>
        <td>MARSHA</td>
        <td>151.63</td>
    </tr>
    <tr>
        <td>392</td>
        <td>DOUGLASS</td>
        <td>SEAN</td>
        <td>91.77</td>
    </tr>
    <tr>
        <td>458</td>
        <td>DOWD</td>
        <td>LLOYD</td>
        <td>66.81</td>
    </tr>
    <tr>
        <td>597</td>
        <td>DUGGAN</td>
        <td>FREDDIE</td>
        <td>99.75</td>
    </tr>
    <tr>
        <td>177</td>
        <td>DUNCAN</td>
        <td>SAMANTHA</td>
        <td>71.77</td>
    </tr>
    <tr>
        <td>160</td>
        <td>DUNN</td>
        <td>ERIN</td>
        <td>106.73</td>
    </tr>
    <tr>
        <td>418</td>
        <td>EAST</td>
        <td>JEFF</td>
        <td>107.70</td>
    </tr>
    <tr>
        <td>510</td>
        <td>EASTER</td>
        <td>BEN</td>
        <td>122.74</td>
    </tr>
    <tr>
        <td>466</td>
        <td>EBERT</td>
        <td>LEO</td>
        <td>104.77</td>
    </tr>
    <tr>
        <td>49</td>
        <td>EDWARDS</td>
        <td>JOYCE</td>
        <td>130.72</td>
    </tr>
    <tr>
        <td>558</td>
        <td>EGGLESTON</td>
        <td>JIMMIE</td>
        <td>135.72</td>
    </tr>
    <tr>
        <td>422</td>
        <td>ELLINGTON</td>
        <td>MELVIN</td>
        <td>97.74</td>
    </tr>
    <tr>
        <td>193</td>
        <td>ELLIOTT</td>
        <td>KATIE</td>
        <td>109.75</td>
    </tr>
    <tr>
        <td>114</td>
        <td>ELLIS</td>
        <td>GRACE</td>
        <td>139.67</td>
    </tr>
    <tr>
        <td>535</td>
        <td>ELROD</td>
        <td>JAVIER</td>
        <td>135.68</td>
    </tr>
    <tr>
        <td>524</td>
        <td>ELY</td>
        <td>JARED</td>
        <td>87.81</td>
    </tr>
    <tr>
        <td>547</td>
        <td>EMMONS</td>
        <td>KURT</td>
        <td>99.77</td>
    </tr>
    <tr>
        <td>417</td>
        <td>ESTEP</td>
        <td>TRAVIS</td>
        <td>110.75</td>
    </tr>
    <tr>
        <td>48</td>
        <td>EVANS</td>
        <td>ANN</td>
        <td>76.83</td>
    </tr>
    <tr>
        <td>300</td>
        <td>FARNSWORTH</td>
        <td>JOHN</td>
        <td>137.69</td>
    </tr>
    <tr>
        <td>439</td>
        <td>FENNELL</td>
        <td>ALEXANDER</td>
        <td>151.64</td>
    </tr>
    <tr>
        <td>156</td>
        <td>FERGUSON</td>
        <td>BERTHA</td>
        <td>101.75</td>
    </tr>
    <tr>
        <td>223</td>
        <td>FERNANDEZ</td>
        <td>MELINDA</td>
        <td>80.83</td>
    </tr>
    <tr>
        <td>201</td>
        <td>FIELDS</td>
        <td>VICKI</td>
        <td>108.75</td>
    </tr>
    <tr>
        <td>113</td>
        <td>FISHER</td>
        <td>CINDY</td>
        <td>113.71</td>
    </tr>
    <tr>
        <td>258</td>
        <td>FLEMING</td>
        <td>MYRTLE</td>
        <td>110.76</td>
    </tr>
    <tr>
        <td>293</td>
        <td>FLETCHER</td>
        <td>MAE</td>
        <td>158.69</td>
    </tr>
    <tr>
        <td>89</td>
        <td>FLORES</td>
        <td>JULIA</td>
        <td>134.68</td>
    </tr>
    <tr>
        <td>102</td>
        <td>FORD</td>
        <td>CRYSTAL</td>
        <td>137.67</td>
    </tr>
    <tr>
        <td>445</td>
        <td>FORMAN</td>
        <td>MICHEAL</td>
        <td>102.74</td>
    </tr>
    <tr>
        <td>596</td>
        <td>FORSYTHE</td>
        <td>ENRIQUE</td>
        <td>96.72</td>
    </tr>
    <tr>
        <td>509</td>
        <td>FORTIER</td>
        <td>RAUL</td>
        <td>100.80</td>
    </tr>
    <tr>
        <td>377</td>
        <td>FORTNER</td>
        <td>HOWARD</td>
        <td>93.74</td>
    </tr>
    <tr>
        <td>93</td>
        <td>FOSTER</td>
        <td>PHYLLIS</td>
        <td>91.77</td>
    </tr>
    <tr>
        <td>351</td>
        <td>FOUST</td>
        <td>JACK</td>
        <td>89.76</td>
    </tr>
    <tr>
        <td>250</td>
        <td>FOWLER</td>
        <td>JO</td>
        <td>73.80</td>
    </tr>
    <tr>
        <td>186</td>
        <td>FOX</td>
        <td>HOLLY</td>
        <td>114.69</td>
    </tr>
    <tr>
        <td>350</td>
        <td>FRALEY</td>
        <td>JUAN</td>
        <td>73.77</td>
    </tr>
    <tr>
        <td>431</td>
        <td>FRANCISCO</td>
        <td>JOEL</td>
        <td>95.77</td>
    </tr>
    <tr>
        <td>199</td>
        <td>FRANKLIN</td>
        <td>BETH</td>
        <td>103.75</td>
    </tr>
    <tr>
        <td>242</td>
        <td>FRAZIER</td>
        <td>GLENDA</td>
        <td>140.68</td>
    </tr>
    <tr>
        <td>123</td>
        <td>FREEMAN</td>
        <td>SHANNON</td>
        <td>100.76</td>
    </tr>
    <tr>
        <td>234</td>
        <td>FULLER</td>
        <td>CLAUDIA</td>
        <td>111.74</td>
    </tr>
    <tr>
        <td>356</td>
        <td>FULTZ</td>
        <td>GERALD</td>
        <td>121.70</td>
    </tr>
    <tr>
        <td>557</td>
        <td>GAFFNEY</td>
        <td>FELIX</td>
        <td>73.76</td>
    </tr>
    <tr>
        <td>376</td>
        <td>GAITHER</td>
        <td>RANDY</td>
        <td>110.72</td>
    </tr>
    <tr>
        <td>391</td>
        <td>GAMEZ</td>
        <td>CLARENCE</td>
        <td>104.70</td>
    </tr>
    <tr>
        <td>465</td>
        <td>GANDY</td>
        <td>FLOYD</td>
        <td>69.83</td>
    </tr>
    <tr>
        <td>299</td>
        <td>GANNON</td>
        <td>JAMES</td>
        <td>131.70</td>
    </tr>
    <tr>
        <td>18</td>
        <td>GARCIA</td>
        <td>CAROL</td>
        <td>91.78</td>
    </tr>
    <tr>
        <td>569</td>
        <td>GARDINER</td>
        <td>DAVE</td>
        <td>134.68</td>
    </tr>
    <tr>
        <td>164</td>
        <td>GARDNER</td>
        <td>JOANN</td>
        <td>66.84</td>
    </tr>
    <tr>
        <td>238</td>
        <td>GARRETT</td>
        <td>NELLIE</td>
        <td>94.79</td>
    </tr>
    <tr>
        <td>224</td>
        <td>GARZA</td>
        <td>PEARL</td>
        <td>76.78</td>
    </tr>
    <tr>
        <td>457</td>
        <td>GAVIN</td>
        <td>BILL</td>
        <td>114.72</td>
    </tr>
    <tr>
        <td>501</td>
        <td>GEARY</td>
        <td>RUBEN</td>
        <td>89.79</td>
    </tr>
    <tr>
        <td>230</td>
        <td>GEORGE</td>
        <td>JOY</td>
        <td>124.67</td>
    </tr>
    <tr>
        <td>116</td>
        <td>GIBSON</td>
        <td>VICTORIA</td>
        <td>111.73</td>
    </tr>
    <tr>
        <td>237</td>
        <td>GILBERT</td>
        <td>TANYA</td>
        <td>144.67</td>
    </tr>
    <tr>
        <td>474</td>
        <td>GILLETTE</td>
        <td>DUSTIN</td>
        <td>100.74</td>
    </tr>
    <tr>
        <td>349</td>
        <td>GILLILAND</td>
        <td>JOE</td>
        <td>138.71</td>
    </tr>
    <tr>
        <td>338</td>
        <td>GILMAN</td>
        <td>DENNIS</td>
        <td>114.72</td>
    </tr>
    <tr>
        <td>121</td>
        <td>GOMEZ</td>
        <td>JOSEPHINE</td>
        <td>109.74</td>
    </tr>
    <tr>
        <td>94</td>
        <td>GONZALES</td>
        <td>NORMA</td>
        <td>79.79</td>
    </tr>
    <tr>
        <td>38</td>
        <td>GONZALEZ</td>
        <td>MARTHA</td>
        <td>127.66</td>
    </tr>
    <tr>
        <td>367</td>
        <td>GOOCH</td>
        <td>ADAM</td>
        <td>101.78</td>
    </tr>
    <tr>
        <td>315</td>
        <td>GOODEN</td>
        <td>KENNETH</td>
        <td>84.83</td>
    </tr>
    <tr>
        <td>143</td>
        <td>GORDON</td>
        <td>LESLIE</td>
        <td>89.78</td>
    </tr>
    <tr>
        <td>343</td>
        <td>GRAF</td>
        <td>DOUGLAS</td>
        <td>114.75</td>
    </tr>
    <tr>
        <td>104</td>
        <td>GRAHAM</td>
        <td>RITA</td>
        <td>92.76</td>
    </tr>
    <tr>
        <td>154</td>
        <td>GRANT</td>
        <td>MICHELE</td>
        <td>130.70</td>
    </tr>
    <tr>
        <td>276</td>
        <td>GRAVES</td>
        <td>BRANDY</td>
        <td>122.72</td>
    </tr>
    <tr>
        <td>69</td>
        <td>GRAY</td>
        <td>JUDY</td>
        <td>96.75</td>
    </tr>
    <tr>
        <td>309</td>
        <td>GRECO</td>
        <td>CHRISTOPHER</td>
        <td>147.69</td>
    </tr>
    <tr>
        <td>35</td>
        <td>GREEN</td>
        <td>VIRGINIA</td>
        <td>129.68</td>
    </tr>
    <tr>
        <td>191</td>
        <td>GREENE</td>
        <td>JEANETTE</td>
        <td>74.80</td>
    </tr>
    <tr>
        <td>284</td>
        <td>GREGORY</td>
        <td>SONIA</td>
        <td>126.72</td>
    </tr>
    <tr>
        <td>454</td>
        <td>GRESHAM</td>
        <td>ALEX</td>
        <td>151.67</td>
    </tr>
    <tr>
        <td>580</td>
        <td>GREY</td>
        <td>ROSS</td>
        <td>99.73</td>
    </tr>
    <tr>
        <td>98</td>
        <td>GRIFFIN</td>
        <td>LILLIAN</td>
        <td>106.75</td>
    </tr>
    <tr>
        <td>308</td>
        <td>GRIGSBY</td>
        <td>THOMAS</td>
        <td>105.75</td>
    </tr>
    <tr>
        <td>355</td>
        <td>GRISSOM</td>
        <td>TERRY</td>
        <td>72.80</td>
    </tr>
    <tr>
        <td>556</td>
        <td>GRUBER</td>
        <td>ARMANDO</td>
        <td>83.79</td>
    </tr>
    <tr>
        <td>523</td>
        <td>GUAJARDO</td>
        <td>HARVEY</td>
        <td>93.78</td>
    </tr>
    <tr>
        <td>529</td>
        <td>GUILLEN</td>
        <td>ERIK</td>
        <td>118.71</td>
    </tr>
    <tr>
        <td>595</td>
        <td>GUNDERSON</td>
        <td>TERRENCE</td>
        <td>117.70</td>
    </tr>
    <tr>
        <td>202</td>
        <td>GUTIERREZ</td>
        <td>CARLA</td>
        <td>103.74</td>
    </tr>
    <tr>
        <td>296</td>
        <td>HALE</td>
        <td>RAMONA</td>
        <td>129.70</td>
    </tr>
    <tr>
        <td>26</td>
        <td>HALL</td>
        <td>JESSICA</td>
        <td>152.66</td>
    </tr>
    <tr>
        <td>103</td>
        <td>HAMILTON</td>
        <td>GLADYS</td>
        <td>146.69</td>
    </tr>
    <tr>
        <td>590</td>
        <td>HANNON</td>
        <td>SETH</td>
        <td>112.75</td>
    </tr>
    <tr>
        <td>222</td>
        <td>HANSEN</td>
        <td>DELORES</td>
        <td>91.79</td>
    </tr>
    <tr>
        <td>244</td>
        <td>HANSON</td>
        <td>VIOLA</td>
        <td>129.68</td>
    </tr>
    <tr>
        <td>518</td>
        <td>HARDER</td>
        <td>GABRIEL</td>
        <td>111.74</td>
    </tr>
    <tr>
        <td>400</td>
        <td>HARDISON</td>
        <td>BRYAN</td>
        <td>124.72</td>
    </tr>
    <tr>
        <td>493</td>
        <td>HARKINS</td>
        <td>BRENT</td>
        <td>112.77</td>
    </tr>
    <tr>
        <td>185</td>
        <td>HARPER</td>
        <td>ROBERTA</td>
        <td>84.77</td>
    </tr>
    <tr>
        <td>15</td>
        <td>HARRIS</td>
        <td>HELEN</td>
        <td>134.68</td>
    </tr>
    <tr>
        <td>115</td>
        <td>HARRISON</td>
        <td>WENDY</td>
        <td>91.70</td>
    </tr>
    <tr>
        <td>179</td>
        <td>HART</td>
        <td>DANA</td>
        <td>133.71</td>
    </tr>
    <tr>
        <td>225</td>
        <td>HARVEY</td>
        <td>ARLENE</td>
        <td>120.74</td>
    </tr>
    <tr>
        <td>480</td>
        <td>HAUSER</td>
        <td>COREY</td>
        <td>101.78</td>
    </tr>
    <tr>
        <td>522</td>
        <td>HAVENS</td>
        <td>ARNOLD</td>
        <td>167.67</td>
    </tr>
    <tr>
        <td>159</td>
        <td>HAWKINS</td>
        <td>JILL</td>
        <td>68.79</td>
    </tr>
    <tr>
        <td>421</td>
        <td>HAWKS</td>
        <td>LEE</td>
        <td>119.73</td>
    </tr>
    <tr>
        <td>100</td>
        <td>HAYES</td>
        <td>ROBIN</td>
        <td>102.76</td>
    </tr>
    <tr>
        <td>390</td>
        <td>HEATON</td>
        <td>SHAWN</td>
        <td>152.67</td>
    </tr>
    <tr>
        <td>81</td>
        <td>HENDERSON</td>
        <td>ANDREA</td>
        <td>93.78</td>
    </tr>
    <tr>
        <td>568</td>
        <td>HENNING</td>
        <td>ALBERTO</td>
        <td>66.79</td>
    </tr>
    <tr>
        <td>133</td>
        <td>HENRY</td>
        <td>PAULINE</td>
        <td>98.73</td>
    </tr>
    <tr>
        <td>29</td>
        <td>HERNANDEZ</td>
        <td>ANGELA</td>
        <td>140.64</td>
    </tr>
    <tr>
        <td>266</td>
        <td>HERRERA</td>
        <td>NORA</td>
        <td>118.72</td>
    </tr>
    <tr>
        <td>589</td>
        <td>HERRMANN</td>
        <td>TRACY</td>
        <td>129.72</td>
    </tr>
    <tr>
        <td>528</td>
        <td>HERZOG</td>
        <td>CLAUDE</td>
        <td>111.75</td>
    </tr>
    <tr>
        <td>594</td>
        <td>HIATT</td>
        <td>EDUARDO</td>
        <td>130.73</td>
    </tr>
    <tr>
        <td>131</td>
        <td>HICKS</td>
        <td>MONICA</td>
        <td>128.70</td>
    </tr>
    <tr>
        <td>444</td>
        <td>HIDALGO</td>
        <td>MARCUS</td>
        <td>115.70</td>
    </tr>
    <tr>
        <td>33</td>
        <td>HILL</td>
        <td>ANNA</td>
        <td>91.79</td>
    </tr>
    <tr>
        <td>479</td>
        <td>HITE</td>
        <td>ZACHARY</td>
        <td>146.69</td>
    </tr>
    <tr>
        <td>252</td>
        <td>HOFFMAN</td>
        <td>MATTIE</td>
        <td>64.78</td>
    </tr>
    <tr>
        <td>256</td>
        <td>HOLLAND</td>
        <td>MABEL</td>
        <td>112.70</td>
    </tr>
    <tr>
        <td>385</td>
        <td>HOLM</td>
        <td>PHILLIP</td>
        <td>101.74</td>
    </tr>
    <tr>
        <td>145</td>
        <td>HOLMES</td>
        <td>LUCILLE</td>
        <td>108.72</td>
    </tr>
    <tr>
        <td>291</td>
        <td>HOLT</td>
        <td>TONI</td>
        <td>95.77</td>
    </tr>
    <tr>
        <td>263</td>
        <td>HOPKINS</td>
        <td>HILDA</td>
        <td>122.71</td>
    </tr>
    <tr>
        <td>278</td>
        <td>HORTON</td>
        <td>BILLIE</td>
        <td>88.74</td>
    </tr>
    <tr>
        <td>430</td>
        <td>HOULE</td>
        <td>RAY</td>
        <td>79.78</td>
    </tr>
    <tr>
        <td>65</td>
        <td>HOWARD</td>
        <td>ROSE</td>
        <td>103.78</td>
    </tr>
    <tr>
        <td>219</td>
        <td>HOWELL</td>
        <td>WILLIE</td>
        <td>101.74</td>
    </tr>
    <tr>
        <td>508</td>
        <td>HOWLAND</td>
        <td>MILTON</td>
        <td>127.75</td>
    </tr>
    <tr>
        <td>162</td>
        <td>HUDSON</td>
        <td>LAUREN</td>
        <td>71.80</td>
    </tr>
    <tr>
        <td>366</td>
        <td>HUEY</td>
        <td>BRANDON</td>
        <td>152.63</td>
    </tr>
    <tr>
        <td>88</td>
        <td>HUGHES</td>
        <td>BONNIE</td>
        <td>87.79</td>
    </tr>
    <tr>
        <td>148</td>
        <td>HUNT</td>
        <td>ELEANOR</td>
        <td>216.54</td>
    </tr>
    <tr>
        <td>130</td>
        <td>HUNTER</td>
        <td>CHARLOTTE</td>
        <td>93.76</td>
    </tr>
    <tr>
        <td>374</td>
        <td>HURTADO</td>
        <td>JEREMY</td>
        <td>103.72</td>
    </tr>
    <tr>
        <td>410</td>
        <td>IRBY</td>
        <td>CURTIS</td>
        <td>167.62</td>
    </tr>
    <tr>
        <td>429</td>
        <td>ISBELL</td>
        <td>FREDERICK</td>
        <td>105.79</td>
    </tr>
    <tr>
        <td>399</td>
        <td>ISOM</td>
        <td>DANNY</td>
        <td>91.79</td>
    </tr>
    <tr>
        <td>13</td>
        <td>JACKSON</td>
        <td>KAREN</td>
        <td>131.73</td>
    </tr>
    <tr>
        <td>231</td>
        <td>JACOBS</td>
        <td>GEORGIA</td>
        <td>110.74</td>
    </tr>
    <tr>
        <td>71</td>
        <td>JAMES</td>
        <td>KATHY</td>
        <td>129.70</td>
    </tr>
    <tr>
        <td>83</td>
        <td>JENKINS</td>
        <td>LOUISE</td>
        <td>101.75</td>
    </tr>
    <tr>
        <td>274</td>
        <td>JENNINGS</td>
        <td>NAOMI</td>
        <td>152.65</td>
    </tr>
    <tr>
        <td>259</td>
        <td>JENSEN</td>
        <td>LENA</td>
        <td>170.67</td>
    </tr>
    <tr>
        <td>277</td>
        <td>JIMENEZ</td>
        <td>OLGA</td>
        <td>144.68</td>
    </tr>
    <tr>
        <td>2</td>
        <td>JOHNSON</td>
        <td>PATRICIA</td>
        <td>128.73</td>
    </tr>
    <tr>
        <td>214</td>
        <td>JOHNSTON</td>
        <td>KRISTIN</td>
        <td>116.69</td>
    </tr>
    <tr>
        <td>4</td>
        <td>JONES</td>
        <td>BARBARA</td>
        <td>81.78</td>
    </tr>
    <tr>
        <td>110</td>
        <td>JORDAN</td>
        <td>TIFFANY</td>
        <td>59.86</td>
    </tr>
    <tr>
        <td>337</td>
        <td>JORDON</td>
        <td>JERRY</td>
        <td>143.71</td>
    </tr>
    <tr>
        <td>307</td>
        <td>JOY</td>
        <td>JOSEPH</td>
        <td>134.70</td>
    </tr>
    <tr>
        <td>534</td>
        <td>JUNG</td>
        <td>CHRISTIAN</td>
        <td>88.76</td>
    </tr>
    <tr>
        <td>389</td>
        <td>KAHN</td>
        <td>ALAN</td>
        <td>124.74</td>
    </tr>
    <tr>
        <td>198</td>
        <td>KELLEY</td>
        <td>ELSIE</td>
        <td>141.63</td>
    </tr>
    <tr>
        <td>74</td>
        <td>KELLY</td>
        <td>DENISE</td>
        <td>103.73</td>
    </tr>
    <tr>
        <td>137</td>
        <td>KENNEDY</td>
        <td>RHONDA</td>
        <td>194.61</td>
    </tr>
    <tr>
        <td>464</td>
        <td>KENYON</td>
        <td>JEROME</td>
        <td>73.84</td>
    </tr>
    <tr>
        <td>233</td>
        <td>KIM</td>
        <td>LILLIE</td>
        <td>89.77</td>
    </tr>
    <tr>
        <td>500</td>
        <td>KINDER</td>
        <td>REGINALD</td>
        <td>115.72</td>
    </tr>
    <tr>
        <td>30</td>
        <td>KING</td>
        <td>MELISSA</td>
        <td>123.66</td>
    </tr>
    <tr>
        <td>155</td>
        <td>KNIGHT</td>
        <td>GAIL</td>
        <td>109.75</td>
    </tr>
    <tr>
        <td>546</td>
        <td>KNOTT</td>
        <td>KELLY</td>
        <td>107.74</td>
    </tr>
    <tr>
        <td>306</td>
        <td>KOWALSKI</td>
        <td>CHARLES</td>
        <td>138.68</td>
    </tr>
    <tr>
        <td>492</td>
        <td>KRAUS</td>
        <td>LESTER</td>
        <td>65.84</td>
    </tr>
    <tr>
        <td>428</td>
        <td>KRUGER</td>
        <td>HERBERT</td>
        <td>78.80</td>
    </tr>
    <tr>
        <td>292</td>
        <td>LAMBERT</td>
        <td>MISTY</td>
        <td>118.73</td>
    </tr>
    <tr>
        <td>420</td>
        <td>LANCE</td>
        <td>JACOB</td>
        <td>79.79</td>
    </tr>
    <tr>
        <td>182</td>
        <td>LANE</td>
        <td>RENEE</td>
        <td>97.74</td>
    </tr>
    <tr>
        <td>241</td>
        <td>LARSON</td>
        <td>HEIDI</td>
        <td>122.66</td>
    </tr>
    <tr>
        <td>579</td>
        <td>LARUE</td>
        <td>DARYL</td>
        <td>111.73</td>
    </tr>
    <tr>
        <td>192</td>
        <td>LAWRENCE</td>
        <td>LAURIE</td>
        <td>99.77</td>
    </tr>
    <tr>
        <td>200</td>
        <td>LAWSON</td>
        <td>JEANNE</td>
        <td>136.73</td>
    </tr>
    <tr>
        <td>361</td>
        <td>LAWTON</td>
        <td>LAWRENCE</td>
        <td>100.69</td>
    </tr>
    <tr>
        <td>24</td>
        <td>LEE</td>
        <td>KIMBERLY</td>
        <td>95.75</td>
    </tr>
    <tr>
        <td>373</td>
        <td>LEONE</td>
        <td>LOUIS</td>
        <td>161.65</td>
    </tr>
    <tr>
        <td>23</td>
        <td>LEWIS</td>
        <td>SARAH</td>
        <td>119.70</td>
    </tr>
    <tr>
        <td>314</td>
        <td>LINTON</td>
        <td>GEORGE</td>
        <td>131.67</td>
    </tr>
    <tr>
        <td>226</td>
        <td>LITTLE</td>
        <td>MAUREEN</td>
        <td>87.79</td>
    </tr>
    <tr>
        <td>555</td>
        <td>LOMBARDI</td>
        <td>DWIGHT</td>
        <td>74.83</td>
    </tr>
    <tr>
        <td>86</td>
        <td>LONG</td>
        <td>JACQUELINE</td>
        <td>148.67</td>
    </tr>
    <tr>
        <td>32</td>
        <td>LOPEZ</td>
        <td>AMY</td>
        <td>127.71</td>
    </tr>
    <tr>
        <td>438</td>
        <td>LOVELACE</td>
        <td>BARRY</td>
        <td>134.67</td>
    </tr>
    <tr>
        <td>273</td>
        <td>LOWE</td>
        <td>PRISCILLA</td>
        <td>157.65</td>
    </tr>
    <tr>
        <td>286</td>
        <td>LUCAS</td>
        <td>VELMA</td>
        <td>117.73</td>
    </tr>
    <tr>
        <td>578</td>
        <td>LUMPKIN</td>
        <td>WILLARD</td>
        <td>96.78</td>
    </tr>
    <tr>
        <td>478</td>
        <td>LYMAN</td>
        <td>LEWIS</td>
        <td>86.81</td>
    </tr>
    <tr>
        <td>235</td>
        <td>LYNCH</td>
        <td>JACKIE</td>
        <td>93.75</td>
    </tr>
    <tr>
        <td>372</td>
        <td>MACKENZIE</td>
        <td>STEVE</td>
        <td>158.66</td>
    </tr>
    <tr>
        <td>360</td>
        <td>MADRIGAL</td>
        <td>RALPH</td>
        <td>150.66</td>
    </tr>
    <tr>
        <td>323</td>
        <td>MAHAN</td>
        <td>MATTHEW</td>
        <td>114.69</td>
    </tr>
    <tr>
        <td>313</td>
        <td>MAHON</td>
        <td>DONALD</td>
        <td>89.77</td>
    </tr>
    <tr>
        <td>577</td>
        <td>MALCOLM</td>
        <td>CLIFTON</td>
        <td>118.72</td>
    </tr>
    <tr>
        <td>336</td>
        <td>MARK</td>
        <td>JOSHUA</td>
        <td>119.70</td>
    </tr>
    <tr>
        <td>359</td>
        <td>MARKHAM</td>
        <td>WILLIE</td>
        <td>101.75</td>
    </tr>
    <tr>
        <td>358</td>
        <td>MARLOW</td>
        <td>SAMUEL</td>
        <td>80.79</td>
    </tr>
    <tr>
        <td>119</td>
        <td>MARSHALL</td>
        <td>SHERRY</td>
        <td>153.66</td>
    </tr>
    <tr>
        <td>453</td>
        <td>MARTEL</td>
        <td>CALVIN</td>
        <td>111.77</td>
    </tr>
    <tr>
        <td>16</td>
        <td>MARTIN</td>
        <td>SANDRA</td>
        <td>120.71</td>
    </tr>
    <tr>
        <td>19</td>
        <td>MARTINEZ</td>
        <td>RUTH</td>
        <td>125.76</td>
    </tr>
    <tr>
        <td>342</td>
        <td>MARTINO</td>
        <td>HAROLD</td>
        <td>130.68</td>
    </tr>
    <tr>
        <td>135</td>
        <td>MASON</td>
        <td>JUANITA</td>
        <td>110.70</td>
    </tr>
    <tr>
        <td>169</td>
        <td>MATTHEWS</td>
        <td>ERICA</td>
        <td>95.78</td>
    </tr>
    <tr>
        <td>491</td>
        <td>MATTOX</td>
        <td>RICK</td>
        <td>124.73</td>
    </tr>
    <tr>
        <td>335</td>
        <td>MAULDIN</td>
        <td>GREGORY</td>
        <td>78.77</td>
    </tr>
    <tr>
        <td>264</td>
        <td>MAY</td>
        <td>GWENDOLYN</td>
        <td>98.75</td>
    </tr>
    <tr>
        <td>567</td>
        <td>MCADAMS</td>
        <td>ALFREDO</td>
        <td>85.80</td>
    </tr>
    <tr>
        <td>593</td>
        <td>MCALISTER</td>
        <td>RENE</td>
        <td>113.74</td>
    </tr>
    <tr>
        <td>576</td>
        <td>MCCARTER</td>
        <td>MORRIS</td>
        <td>139.66</td>
    </tr>
    <tr>
        <td>427</td>
        <td>MCCARTNEY</td>
        <td>JESUS</td>
        <td>114.76</td>
    </tr>
    <tr>
        <td>218</td>
        <td>MCCOY</td>
        <td>VERA</td>
        <td>67.82</td>
    </tr>
    <tr>
        <td>305</td>
        <td>MCCRARY</td>
        <td>RICHARD</td>
        <td>109.75</td>
    </tr>
    <tr>
        <td>517</td>
        <td>MCCURDY</td>
        <td>BRAD</td>
        <td>105.75</td>
    </tr>
    <tr>
        <td>117</td>
        <td>MCDONALD</td>
        <td>EDITH</td>
        <td>71.81</td>
    </tr>
    <tr>
        <td>490</td>
        <td>MCDUFFIE</td>
        <td>SAM</td>
        <td>117.76</td>
    </tr>
    <tr>
        <td>285</td>
        <td>MCKINNEY</td>
        <td>MIRIAM</td>
        <td>135.74</td>
    </tr>
    <tr>
        <td>334</td>
        <td>MCWHORTER</td>
        <td>RAYMOND</td>
        <td>135.70</td>
    </tr>
    <tr>
        <td>489</td>
        <td>MEADOR</td>
        <td>RICARDO</td>
        <td>99.79</td>
    </tr>
    <tr>
        <td>249</td>
        <td>MEDINA</td>
        <td>DORA</td>
        <td>107.77</td>
    </tr>
    <tr>
        <td>527</td>
        <td>MEEHAN</td>
        <td>CORY</td>
        <td>81.76</td>
    </tr>
    <tr>
        <td>398</td>
        <td>MEEK</td>
        <td>ANTONIO</td>
        <td>78.84</td>
    </tr>
    <tr>
        <td>566</td>
        <td>MENA</td>
        <td>CASEY</td>
        <td>141.66</td>
    </tr>
    <tr>
        <td>341</td>
        <td>MENARD</td>
        <td>PETER</td>
        <td>106.77</td>
    </tr>
    <tr>
        <td>246</td>
        <td>MENDOZA</td>
        <td>MARIAN</td>
        <td>107.77</td>
    </tr>
    <tr>
        <td>216</td>
        <td>MEYER</td>
        <td>NATALIE</td>
        <td>95.77</td>
    </tr>
    <tr>
        <td>533</td>
        <td>MILAM</td>
        <td>JESSIE</td>
        <td>141.67</td>
    </tr>
    <tr>
        <td>287</td>
        <td>MILES</td>
        <td>BECKY</td>
        <td>115.71</td>
    </tr>
    <tr>
        <td>488</td>
        <td>MILLARD</td>
        <td>SHANE</td>
        <td>95.78</td>
    </tr>
    <tr>
        <td>7</td>
        <td>MILLER</td>
        <td>MARIA</td>
        <td>151.67</td>
    </tr>
    <tr>
        <td>152</td>
        <td>MILLS</td>
        <td>ALICIA</td>
        <td>83.79</td>
    </tr>
    <tr>
        <td>452</td>
        <td>MILNER</td>
        <td>TOM</td>
        <td>107.68</td>
    </tr>
    <tr>
        <td>41</td>
        <td>MITCHELL</td>
        <td>STEPHANIE</td>
        <td>118.75</td>
    </tr>
    <tr>
        <td>409</td>
        <td>MOELLER</td>
        <td>RODNEY</td>
        <td>104.77</td>
    </tr>
    <tr>
        <td>211</td>
        <td>MONTGOMERY</td>
        <td>STACEY</td>
        <td>151.66</td>
    </tr>
    <tr>
        <td>9</td>
        <td>MOORE</td>
        <td>MARGARET</td>
        <td>89.77</td>
    </tr>
    <tr>
        <td>136</td>
        <td>MORALES</td>
        <td>ANITA</td>
        <td>62.85</td>
    </tr>
    <tr>
        <td>247</td>
        <td>MORENO</td>
        <td>STELLA</td>
        <td>104.78</td>
    </tr>
    <tr>
        <td>57</td>
        <td>MORGAN</td>
        <td>EVELYN</td>
        <td>114.72</td>
    </tr>
    <tr>
        <td>388</td>
        <td>MORRELL</td>
        <td>CRAIG</td>
        <td>124.70</td>
    </tr>
    <tr>
        <td>53</td>
        <td>MORRIS</td>
        <td>HEATHER</td>
        <td>115.70</td>
    </tr>
    <tr>
        <td>221</td>
        <td>MORRISON</td>
        <td>BESSIE</td>
        <td>132.72</td>
    </tr>
    <tr>
        <td>322</td>
        <td>MORRISSEY</td>
        <td>JASON</td>
        <td>128.72</td>
    </tr>
    <tr>
        <td>426</td>
        <td>MOTLEY</td>
        <td>BRADLEY</td>
        <td>126.73</td>
    </tr>
    <tr>
        <td>59</td>
        <td>MURPHY</td>
        <td>CHERYL</td>
        <td>133.73</td>
    </tr>
    <tr>
        <td>122</td>
        <td>MURRAY</td>
        <td>THELMA</td>
        <td>126.68</td>
    </tr>
    <tr>
        <td>408</td>
        <td>MURRELL</td>
        <td>MANUEL</td>
        <td>116.70</td>
    </tr>
    <tr>
        <td>101</td>
        <td>MYERS</td>
        <td>PEGGY</td>
        <td>96.76</td>
    </tr>
    <tr>
        <td>271</td>
        <td>NEAL</td>
        <td>PENNY</td>
        <td>68.82</td>
    </tr>
    <tr>
        <td>39</td>
        <td>NELSON</td>
        <td>DEBRA</td>
        <td>141.71</td>
    </tr>
    <tr>
        <td>565</td>
        <td>NETTLES</td>
        <td>JAIME</td>
        <td>126.71</td>
    </tr>
    <tr>
        <td>437</td>
        <td>NEUMANN</td>
        <td>RANDALL</td>
        <td>99.77</td>
    </tr>
    <tr>
        <td>340</td>
        <td>NEWSOM</td>
        <td>PATRICK</td>
        <td>119.69</td>
    </tr>
    <tr>
        <td>354</td>
        <td>NGO</td>
        <td>JUSTIN</td>
        <td>129.64</td>
    </tr>
    <tr>
        <td>229</td>
        <td>NGUYEN</td>
        <td>TAMARA</td>
        <td>93.75</td>
    </tr>
    <tr>
        <td>153</td>
        <td>NICHOLS</td>
        <td>SUZANNE</td>
        <td>94.76</td>
    </tr>
    <tr>
        <td>516</td>
        <td>NOE</td>
        <td>ELMER</td>
        <td>98.74</td>
    </tr>
    <tr>
        <td>545</td>
        <td>NOLAND</td>
        <td>JULIO</td>
        <td>89.79</td>
    </tr>
    <tr>
        <td>544</td>
        <td>NOLEN</td>
        <td>CODY</td>
        <td>98.78</td>
    </tr>
    <tr>
        <td>281</td>
        <td>OBRIEN</td>
        <td>LEONA</td>
        <td>50.86</td>
    </tr>
    <tr>
        <td>588</td>
        <td>OCAMPO</td>
        <td>MARION</td>
        <td>115.71</td>
    </tr>
    <tr>
        <td>575</td>
        <td>OGLESBY</td>
        <td>ISAAC</td>
        <td>126.71</td>
    </tr>
    <tr>
        <td>473</td>
        <td>OLIVARES</td>
        <td>JORGE</td>
        <td>134.66</td>
    </tr>
    <tr>
        <td>210</td>
        <td>OLIVER</td>
        <td>ELLA</td>
        <td>137.69</td>
    </tr>
    <tr>
        <td>175</td>
        <td>OLSON</td>
        <td>ANNETTE</td>
        <td>98.76</td>
    </tr>
    <tr>
        <td>554</td>
        <td>OLVERA</td>
        <td>DWAYNE</td>
        <td>101.78</td>
    </tr>
    <tr>
        <td>120</td>
        <td>ORTIZ</td>
        <td>SYLVIA</td>
        <td>143.68</td>
    </tr>
    <tr>
        <td>499</td>
        <td>OUTLAW</td>
        <td>MARC</td>
        <td>123.70</td>
    </tr>
    <tr>
        <td>111</td>
        <td>OWENS</td>
        <td>CARMEN</td>
        <td>97.74</td>
    </tr>
    <tr>
        <td>477</td>
        <td>PAINE</td>
        <td>DAN</td>
        <td>109.78</td>
    </tr>
    <tr>
        <td>151</td>
        <td>PALMER</td>
        <td>MEGAN</td>
        <td>92.73</td>
    </tr>
    <tr>
        <td>47</td>
        <td>PARKER</td>
        <td>FRANCES</td>
        <td>108.78</td>
    </tr>
    <tr>
        <td>87</td>
        <td>PATTERSON</td>
        <td>WANDA</td>
        <td>145.70</td>
    </tr>
    <tr>
        <td>166</td>
        <td>PAYNE</td>
        <td>LYNN</td>
        <td>123.72</td>
    </tr>
    <tr>
        <td>255</td>
        <td>PEARSON</td>
        <td>IRMA</td>
        <td>70.82</td>
    </tr>
    <tr>
        <td>543</td>
        <td>PEMBERTON</td>
        <td>LANCE</td>
        <td>82.78</td>
    </tr>
    <tr>
        <td>298</td>
        <td>PENA</td>
        <td>ERIKA</td>
        <td>101.74</td>
    </tr>
    <tr>
        <td>42</td>
        <td>PEREZ</td>
        <td>CAROLYN</td>
        <td>117.70</td>
    </tr>
    <tr>
        <td>161</td>
        <td>PERKINS</td>
        <td>GERALDINE</td>
        <td>112.70</td>
    </tr>
    <tr>
        <td>84</td>
        <td>PERRY</td>
        <td>SARA</td>
        <td>141.67</td>
    </tr>
    <tr>
        <td>339</td>
        <td>PERRYMAN</td>
        <td>WALTER</td>
        <td>127.70</td>
    </tr>
    <tr>
        <td>197</td>
        <td>PETERS</td>
        <td>SUE</td>
        <td>154.60</td>
    </tr>
    <tr>
        <td>68</td>
        <td>PETERSON</td>
        <td>NICOLE</td>
        <td>94.78</td>
    </tr>
    <tr>
        <td>564</td>
        <td>PFEIFFER</td>
        <td>BOB</td>
        <td>91.76</td>
    </tr>
    <tr>
        <td>45</td>
        <td>PHILLIPS</td>
        <td>JANET</td>
        <td>127.73</td>
    </tr>
    <tr>
        <td>167</td>
        <td>PIERCE</td>
        <td>SALLY</td>
        <td>119.68</td>
    </tr>
    <tr>
        <td>416</td>
        <td>PINSON</td>
        <td>JEFFERY</td>
        <td>121.69</td>
    </tr>
    <tr>
        <td>553</td>
        <td>PITT</td>
        <td>MAX</td>
        <td>107.76</td>
    </tr>
    <tr>
        <td>487</td>
        <td>POINDEXTER</td>
        <td>HECTOR</td>
        <td>119.74</td>
    </tr>
    <tr>
        <td>129</td>
        <td>PORTER</td>
        <td>CARRIE</td>
        <td>124.66</td>
    </tr>
    <tr>
        <td>371</td>
        <td>POULIN</td>
        <td>BILLY</td>
        <td>149.65</td>
    </tr>
    <tr>
        <td>85</td>
        <td>POWELL</td>
        <td>ANNE</td>
        <td>87.77</td>
    </tr>
    <tr>
        <td>463</td>
        <td>POWER</td>
        <td>DARRELL</td>
        <td>91.75</td>
    </tr>
    <tr>
        <td>563</td>
        <td>PREWITT</td>
        <td>KEN</td>
        <td>110.71</td>
    </tr>
    <tr>
        <td>76</td>
        <td>PRICE</td>
        <td>IRENE</td>
        <td>77.77</td>
    </tr>
    <tr>
        <td>415</td>
        <td>PULLEN</td>
        <td>GLENN</td>
        <td>93.77</td>
    </tr>
    <tr>
        <td>333</td>
        <td>PURDY</td>
        <td>ANDREW</td>
        <td>109.73</td>
    </tr>
    <tr>
        <td>332</td>
        <td>QUALLS</td>
        <td>STEPHEN</td>
        <td>118.72</td>
    </tr>
    <tr>
        <td>436</td>
        <td>QUIGLEY</td>
        <td>TROY</td>
        <td>144.70</td>
    </tr>
    <tr>
        <td>348</td>
        <td>QUINTANILLA</td>
        <td>ROGER</td>
        <td>146.64</td>
    </tr>
    <tr>
        <td>414</td>
        <td>RALSTON</td>
        <td>VINCENT</td>
        <td>105.75</td>
    </tr>
    <tr>
        <td>70</td>
        <td>RAMIREZ</td>
        <td>CHRISTINA</td>
        <td>80.82</td>
    </tr>
    <tr>
        <td>140</td>
        <td>RAMOS</td>
        <td>EVA</td>
        <td>83.82</td>
    </tr>
    <tr>
        <td>515</td>
        <td>RAPP</td>
        <td>ANDRE</td>
        <td>126.72</td>
    </tr>
    <tr>
        <td>407</td>
        <td>RATCLIFF</td>
        <td>DALE</td>
        <td>112.73</td>
    </tr>
    <tr>
        <td>173</td>
        <td>RAY</td>
        <td>AUDREY</td>
        <td>119.71</td>
    </tr>
    <tr>
        <td>451</td>
        <td>REA</td>
        <td>JIM</td>
        <td>128.67</td>
    </tr>
    <tr>
        <td>55</td>
        <td>REED</td>
        <td>DORIS</td>
        <td>100.78</td>
    </tr>
    <tr>
        <td>232</td>
        <td>REID</td>
        <td>CONSTANCE</td>
        <td>95.75</td>
    </tr>
    <tr>
        <td>532</td>
        <td>RENNER</td>
        <td>NEIL</td>
        <td>152.68</td>
    </tr>
    <tr>
        <td>141</td>
        <td>REYES</td>
        <td>DEBBIE</td>
        <td>130.68</td>
    </tr>
    <tr>
        <td>112</td>
        <td>REYNOLDS</td>
        <td>ROSA</td>
        <td>133.70</td>
    </tr>
    <tr>
        <td>507</td>
        <td>RHOADS</td>
        <td>EDGAR</td>
        <td>95.75</td>
    </tr>
    <tr>
        <td>297</td>
        <td>RHODES</td>
        <td>SHERRI</td>
        <td>128.67</td>
    </tr>
    <tr>
        <td>146</td>
        <td>RICE</td>
        <td>JAMIE</td>
        <td>139.71</td>
    </tr>
    <tr>
        <td>212</td>
        <td>RICHARDS</td>
        <td>WILMA</td>
        <td>91.80</td>
    </tr>
    <tr>
        <td>63</td>
        <td>RICHARDSON</td>
        <td>ASHLEY</td>
        <td>112.75</td>
    </tr>
    <tr>
        <td>456</td>
        <td>RICKETTS</td>
        <td>RONNIE</td>
        <td>100.75</td>
    </tr>
    <tr>
        <td>357</td>
        <td>RICO</td>
        <td>KEITH</td>
        <td>89.74</td>
    </tr>
    <tr>
        <td>187</td>
        <td>RILEY</td>
        <td>BRITTANY</td>
        <td>159.72</td>
    </tr>
    <tr>
        <td>312</td>
        <td>RINEHART</td>
        <td>MARK</td>
        <td>104.74</td>
    </tr>
    <tr>
        <td>61</td>
        <td>RIVERA</td>
        <td>KATHERINE</td>
        <td>58.86</td>
    </tr>
    <tr>
        <td>450</td>
        <td>ROBB</td>
        <td>JAY</td>
        <td>89.74</td>
    </tr>
    <tr>
        <td>331</td>
        <td>ROBERT</td>
        <td>ERIC</td>
        <td>122.73</td>
    </tr>
    <tr>
        <td>43</td>
        <td>ROBERTS</td>
        <td>CHRISTINE</td>
        <td>99.76</td>
    </tr>
    <tr>
        <td>147</td>
        <td>ROBERTSON</td>
        <td>JOANNE</td>
        <td>127.66</td>
    </tr>
    <tr>
        <td>472</td>
        <td>ROBINS</td>
        <td>GREG</td>
        <td>141.70</td>
    </tr>
    <tr>
        <td>20</td>
        <td>ROBINSON</td>
        <td>SHARON</td>
        <td>115.70</td>
    </tr>
    <tr>
        <td>22</td>
        <td>RODRIGUEZ</td>
        <td>LAURA</td>
        <td>113.78</td>
    </tr>
    <tr>
        <td>289</td>
        <td>RODRIQUEZ</td>
        <td>VIOLET</td>
        <td>142.70</td>
    </tr>
    <tr>
        <td>54</td>
        <td>ROGERS</td>
        <td>TERESA</td>
        <td>128.71</td>
    </tr>
    <tr>
        <td>239</td>
        <td>ROMERO</td>
        <td>MINNIE</td>
        <td>142.66</td>
    </tr>
    <tr>
        <td>157</td>
        <td>ROSE</td>
        <td>DARLENE</td>
        <td>113.69</td>
    </tr>
    <tr>
        <td>80</td>
        <td>ROSS</td>
        <td>MARILYN</td>
        <td>137.70</td>
    </tr>
    <tr>
        <td>592</td>
        <td>ROUSH</td>
        <td>TERRANCE</td>
        <td>111.71</td>
    </tr>
    <tr>
        <td>304</td>
        <td>ROYAL</td>
        <td>DAVID</td>
        <td>115.74</td>
    </tr>
    <tr>
        <td>184</td>
        <td>RUIZ</td>
        <td>VIVIAN</td>
        <td>90.77</td>
    </tr>
    <tr>
        <td>406</td>
        <td>RUNYON</td>
        <td>NATHAN</td>
        <td>122.68</td>
    </tr>
    <tr>
        <td>97</td>
        <td>RUSSELL</td>
        <td>ANNIE</td>
        <td>58.82</td>
    </tr>
    <tr>
        <td>203</td>
        <td>RYAN</td>
        <td>TARA</td>
        <td>88.80</td>
    </tr>
    <tr>
        <td>347</td>
        <td>SALISBURY</td>
        <td>RYAN</td>
        <td>142.70</td>
    </tr>
    <tr>
        <td>498</td>
        <td>SANBORN</td>
        <td>GENE</td>
        <td>97.73</td>
    </tr>
    <tr>
        <td>52</td>
        <td>SANCHEZ</td>
        <td>JULIE</td>
        <td>107.71</td>
    </tr>
    <tr>
        <td>75</td>
        <td>SANDERS</td>
        <td>TAMMY</td>
        <td>155.59</td>
    </tr>
    <tr>
        <td>303</td>
        <td>SATTERFIELD</td>
        <td>WILLIAM</td>
        <td>100.74</td>
    </tr>
    <tr>
        <td>471</td>
        <td>SAUER</td>
        <td>DEAN</td>
        <td>109.73</td>
    </tr>
    <tr>
        <td>353</td>
        <td>SCARBOROUGH</td>
        <td>JONATHAN</td>
        <td>72.82</td>
    </tr>
    <tr>
        <td>387</td>
        <td>SCHILLING</td>
        <td>JESSE</td>
        <td>101.74</td>
    </tr>
    <tr>
        <td>204</td>
        <td>SCHMIDT</td>
        <td>ROSEMARY</td>
        <td>147.65</td>
    </tr>
    <tr>
        <td>405</td>
        <td>SCHOFIELD</td>
        <td>LEONARD</td>
        <td>109.68</td>
    </tr>
    <tr>
        <td>397</td>
        <td>SCHRADER</td>
        <td>JIMMY</td>
        <td>105.71</td>
    </tr>
    <tr>
        <td>321</td>
        <td>SCHULER</td>
        <td>KEVIN</td>
        <td>116.78</td>
    </tr>
    <tr>
        <td>320</td>
        <td>SCHWAB</td>
        <td>ANTHONY</td>
        <td>71.80</td>
    </tr>
    <tr>
        <td>365</td>
        <td>SCHWARZ</td>
        <td>BRUCE</td>
        <td>103.77</td>
    </tr>
    <tr>
        <td>34</td>
        <td>SCOTT</td>
        <td>REBECCA</td>
        <td>89.76</td>
    </tr>
    <tr>
        <td>404</td>
        <td>SCROGGINS</td>
        <td>STANLEY</td>
        <td>139.70</td>
    </tr>
    <tr>
        <td>526</td>
        <td>SEAL</td>
        <td>KARL</td>
        <td>221.55</td>
    </tr>
    <tr>
        <td>375</td>
        <td>SELBY</td>
        <td>AARON</td>
        <td>110.76</td>
    </tr>
    <tr>
        <td>506</td>
        <td>SEWARD</td>
        <td>LESLIE</td>
        <td>152.65</td>
    </tr>
    <tr>
        <td>396</td>
        <td>SHANKS</td>
        <td>EARL</td>
        <td>111.73</td>
    </tr>
    <tr>
        <td>144</td>
        <td>SHAW</td>
        <td>CLARA</td>
        <td>195.58</td>
    </tr>
    <tr>
        <td>435</td>
        <td>SHELBY</td>
        <td>RICKY</td>
        <td>91.75</td>
    </tr>
    <tr>
        <td>330</td>
        <td>SHELLEY</td>
        <td>SCOTT</td>
        <td>94.75</td>
    </tr>
    <tr>
        <td>279</td>
        <td>SHELTON</td>
        <td>DIANNE</td>
        <td>135.69</td>
    </tr>
    <tr>
        <td>462</td>
        <td>SHERROD</td>
        <td>WARREN</td>
        <td>159.67</td>
    </tr>
    <tr>
        <td>425</td>
        <td>SIKES</td>
        <td>FRANCIS</td>
        <td>104.74</td>
    </tr>
    <tr>
        <td>254</td>
        <td>SILVA</td>
        <td>MAXINE</td>
        <td>116.68</td>
    </tr>
    <tr>
        <td>302</td>
        <td>SILVERMAN</td>
        <td>MICHAEL</td>
        <td>127.71</td>
    </tr>
    <tr>
        <td>92</td>
        <td>SIMMONS</td>
        <td>TINA</td>
        <td>133.72</td>
    </tr>
    <tr>
        <td>346</td>
        <td>SIMPKINS</td>
        <td>ARTHUR</td>
        <td>155.68</td>
    </tr>
    <tr>
        <td>126</td>
        <td>SIMPSON</td>
        <td>ELLEN</td>
        <td>117.72</td>
    </tr>
    <tr>
        <td>195</td>
        <td>SIMS</td>
        <td>VANESSA</td>
        <td>86.81</td>
    </tr>
    <tr>
        <td>443</td>
        <td>SKIDMORE</td>
        <td>FRANCISCO</td>
        <td>98.78</td>
    </tr>
    <tr>
        <td>497</td>
        <td>SLEDGE</td>
        <td>GILBERT</td>
        <td>129.72</td>
    </tr>
    <tr>
        <td>562</td>
        <td>SLONE</td>
        <td>WALLACE</td>
        <td>109.75</td>
    </tr>
    <tr>
        <td>1</td>
        <td>SMITH</td>
        <td>MARY</td>
        <td>118.68</td>
    </tr>
    <tr>
        <td>178</td>
        <td>SNYDER</td>
        <td>MARION</td>
        <td>194.61</td>
    </tr>
    <tr>
        <td>268</td>
        <td>SOTO</td>
        <td>NINA</td>
        <td>123.71</td>
    </tr>
    <tr>
        <td>521</td>
        <td>SOUTH</td>
        <td>ROLAND</td>
        <td>80.77</td>
    </tr>
    <tr>
        <td>328</td>
        <td>SPEAR</td>
        <td>JEFFREY</td>
        <td>90.77</td>
    </tr>
    <tr>
        <td>163</td>
        <td>SPENCER</td>
        <td>CATHY</td>
        <td>122.71</td>
    </tr>
    <tr>
        <td>424</td>
        <td>SPURLOCK</td>
        <td>KYLE</td>
        <td>110.70</td>
    </tr>
    <tr>
        <td>587</td>
        <td>STANFIELD</td>
        <td>SERGIO</td>
        <td>108.74</td>
    </tr>
    <tr>
        <td>228</td>
        <td>STANLEY</td>
        <td>ALLISON</td>
        <td>92.73</td>
    </tr>
    <tr>
        <td>586</td>
        <td>STCLAIR</td>
        <td>KIRK</td>
        <td>64.81</td>
    </tr>
    <tr>
        <td>165</td>
        <td>STEPHENS</td>
        <td>LORRAINE</td>
        <td>86.79</td>
    </tr>
    <tr>
        <td>384</td>
        <td>STEPP</td>
        <td>ERNEST</td>
        <td>89.75</td>
    </tr>
    <tr>
        <td>127</td>
        <td>STEVENS</td>
        <td>ELAINE</td>
        <td>107.76</td>
    </tr>
    <tr>
        <td>51</td>
        <td>STEWART</td>
        <td>ALICE</td>
        <td>138.67</td>
    </tr>
    <tr>
        <td>561</td>
        <td>STILL</td>
        <td>IAN</td>
        <td>96.73</td>
    </tr>
    <tr>
        <td>158</td>
        <td>STONE</td>
        <td>VERONICA</td>
        <td>126.68</td>
    </tr>
    <tr>
        <td>105</td>
        <td>SULLIVAN</td>
        <td>DAWN</td>
        <td>120.74</td>
    </tr>
    <tr>
        <td>283</td>
        <td>SUTTON</td>
        <td>FELICIA</td>
        <td>86.72</td>
    </tr>
    <tr>
        <td>585</td>
        <td>SWAFFORD</td>
        <td>PERRY</td>
        <td>117.76</td>
    </tr>
    <tr>
        <td>486</td>
        <td>TALBERT</td>
        <td>GLEN</td>
        <td>113.74</td>
    </tr>
    <tr>
        <td>386</td>
        <td>TAN</td>
        <td>TODD</td>
        <td>117.71</td>
    </tr>
    <tr>
        <td>10</td>
        <td>TAYLOR</td>
        <td>DOROTHY</td>
        <td>99.75</td>
    </tr>
    <tr>
        <td>584</td>
        <td>TEEL</td>
        <td>SALVADOR</td>
        <td>129.70</td>
    </tr>
    <tr>
        <td>265</td>
        <td>TERRY</td>
        <td>JENNIE</td>
        <td>133.71</td>
    </tr>
    <tr>
        <td>12</td>
        <td>THOMAS</td>
        <td>NANCY</td>
        <td>103.72</td>
    </tr>
    <tr>
        <td>17</td>
        <td>THOMPSON</td>
        <td>DONNA</td>
        <td>98.79</td>
    </tr>
    <tr>
        <td>583</td>
        <td>THORN</td>
        <td>MARSHALL</td>
        <td>117.77</td>
    </tr>
    <tr>
        <td>327</td>
        <td>THRASHER</td>
        <td>LARRY</td>
        <td>112.74</td>
    </tr>
    <tr>
        <td>542</td>
        <td>TIRADO</td>
        <td>LONNIE</td>
        <td>94.82</td>
    </tr>
    <tr>
        <td>485</td>
        <td>TOBIAS</td>
        <td>CLYDE</td>
        <td>115.71</td>
    </tr>
    <tr>
        <td>434</td>
        <td>TOMLIN</td>
        <td>EDDIE</td>
        <td>128.73</td>
    </tr>
    <tr>
        <td>67</td>
        <td>TORRES</td>
        <td>KELLY</td>
        <td>99.78</td>
    </tr>
    <tr>
        <td>311</td>
        <td>TROUT</td>
        <td>PAUL</td>
        <td>120.77</td>
    </tr>
    <tr>
        <td>514</td>
        <td>TROUTMAN</td>
        <td>FRANKLIN</td>
        <td>74.78</td>
    </tr>
    <tr>
        <td>370</td>
        <td>TRUONG</td>
        <td>WAYNE</td>
        <td>70.81</td>
    </tr>
    <tr>
        <td>513</td>
        <td>TUBBS</td>
        <td>DUANE</td>
        <td>148.69</td>
    </tr>
    <tr>
        <td>128</td>
        <td>TUCKER</td>
        <td>MARJORIE</td>
        <td>127.68</td>
    </tr>
    <tr>
        <td>44</td>
        <td>TURNER</td>
        <td>MARIE</td>
        <td>114.74</td>
    </tr>
    <tr>
        <td>395</td>
        <td>TURPIN</td>
        <td>JOHNNY</td>
        <td>57.81</td>
    </tr>
    <tr>
        <td>582</td>
        <td>VANHORN</td>
        <td>ANDY</td>
        <td>113.75</td>
    </tr>
    <tr>
        <td>260</td>
        <td>VARGAS</td>
        <td>CHRISTY</td>
        <td>122.69</td>
    </tr>
    <tr>
        <td>364</td>
        <td>VARNEY</td>
        <td>BENJAMIN</td>
        <td>95.77</td>
    </tr>
    <tr>
        <td>206</td>
        <td>VASQUEZ</td>
        <td>TERRI</td>
        <td>126.73</td>
    </tr>
    <tr>
        <td>574</td>
        <td>VEST</td>
        <td>JULIAN</td>
        <td>109.72</td>
    </tr>
    <tr>
        <td>512</td>
        <td>VINES</td>
        <td>CECIL</td>
        <td>115.74</td>
    </tr>
    <tr>
        <td>484</td>
        <td>VU</td>
        <td>ROBERTO</td>
        <td>139.70</td>
    </tr>
    <tr>
        <td>267</td>
        <td>WADE</td>
        <td>MARGIE</td>
        <td>159.64</td>
    </tr>
    <tr>
        <td>329</td>
        <td>WAGGONER</td>
        <td>FRANK</td>
        <td>127.68</td>
    </tr>
    <tr>
        <td>171</td>
        <td>WAGNER</td>
        <td>DOLORES</td>
        <td>114.74</td>
    </tr>
    <tr>
        <td>552</td>
        <td>WALDROP</td>
        <td>HUGH</td>
        <td>90.79</td>
    </tr>
    <tr>
        <td>25</td>
        <td>WALKER</td>
        <td>DEBORAH</td>
        <td>115.71</td>
    </tr>
    <tr>
        <td>106</td>
        <td>WALLACE</td>
        <td>CONNIE</td>
        <td>100.77</td>
    </tr>
    <tr>
        <td>269</td>
        <td>WALTERS</td>
        <td>CASSANDRA</td>
        <td>129.70</td>
    </tr>
    <tr>
        <td>66</td>
        <td>WARD</td>
        <td>JANICE</td>
        <td>144.66</td>
    </tr>
    <tr>
        <td>138</td>
        <td>WARREN</td>
        <td>HAZEL</td>
        <td>110.66</td>
    </tr>
    <tr>
        <td>90</td>
        <td>WASHINGTON</td>
        <td>RUBY</td>
        <td>110.72</td>
    </tr>
    <tr>
        <td>174</td>
        <td>WATKINS</td>
        <td>YVONNE</td>
        <td>92.79</td>
    </tr>
    <tr>
        <td>72</td>
        <td>WATSON</td>
        <td>THERESA</td>
        <td>99.70</td>
    </tr>
    <tr>
        <td>294</td>
        <td>WATTS</td>
        <td>SHELLY</td>
        <td>113.74</td>
    </tr>
    <tr>
        <td>531</td>
        <td>WAUGH</td>
        <td>JAMIE</td>
        <td>118.75</td>
    </tr>
    <tr>
        <td>403</td>
        <td>WAY</td>
        <td>MIKE</td>
        <td>166.65</td>
    </tr>
    <tr>
        <td>190</td>
        <td>WEAVER</td>
        <td>YOLANDA</td>
        <td>110.73</td>
    </tr>
    <tr>
        <td>125</td>
        <td>WEBB</td>
        <td>ETHEL</td>
        <td>135.68</td>
    </tr>
    <tr>
        <td>319</td>
        <td>WEINER</td>
        <td>RONALD</td>
        <td>132.70</td>
    </tr>
    <tr>
        <td>240</td>
        <td>WELCH</td>
        <td>MARLENE</td>
        <td>117.74</td>
    </tr>
    <tr>
        <td>124</td>
        <td>WELLS</td>
        <td>SHEILA</td>
        <td>73.82</td>
    </tr>
    <tr>
        <td>109</td>
        <td>WEST</td>
        <td>EDNA</td>
        <td>107.74</td>
    </tr>
    <tr>
        <td>520</td>
        <td>WESTMORELAND</td>
        <td>MITCHELL</td>
        <td>134.68</td>
    </tr>
    <tr>
        <td>369</td>
        <td>WHEAT</td>
        <td>FRED</td>
        <td>88.75</td>
    </tr>
    <tr>
        <td>208</td>
        <td>WHEELER</td>
        <td>LUCY</td>
        <td>91.74</td>
    </tr>
    <tr>
        <td>14</td>
        <td>WHITE</td>
        <td>BETTY</td>
        <td>117.72</td>
    </tr>
    <tr>
        <td>363</td>
        <td>WHITING</td>
        <td>ROY</td>
        <td>143.71</td>
    </tr>
    <tr>
        <td>455</td>
        <td>WILES</td>
        <td>JON</td>
        <td>87.76</td>
    </tr>
    <tr>
        <td>3</td>
        <td>WILLIAMS</td>
        <td>LINDA</td>
        <td>135.74</td>
    </tr>
    <tr>
        <td>213</td>
        <td>WILLIAMSON</td>
        <td>GINA</td>
        <td>111.72</td>
    </tr>
    <tr>
        <td>172</td>
        <td>WILLIS</td>
        <td>BERNICE</td>
        <td>145.67</td>
    </tr>
    <tr>
        <td>8</td>
        <td>WILSON</td>
        <td>SUSAN</td>
        <td>92.76</td>
    </tr>
    <tr>
        <td>541</td>
        <td>WINDHAM</td>
        <td>DARREN</td>
        <td>108.76</td>
    </tr>
    <tr>
        <td>581</td>
        <td>WOFFORD</td>
        <td>VIRGIL</td>
        <td>107.73</td>
    </tr>
    <tr>
        <td>78</td>
        <td>WOOD</td>
        <td>LORI</td>
        <td>141.69</td>
    </tr>
    <tr>
        <td>107</td>
        <td>WOODS</td>
        <td>FLORENCE</td>
        <td>126.70</td>
    </tr>
    <tr>
        <td>496</td>
        <td>WREN</td>
        <td>TYLER</td>
        <td>88.79</td>
    </tr>
    <tr>
        <td>31</td>
        <td>WRIGHT</td>
        <td>BRENDA</td>
        <td>104.74</td>
    </tr>
    <tr>
        <td>318</td>
        <td>WYMAN</td>
        <td>BRIAN</td>
        <td>52.88</td>
    </tr>
    <tr>
        <td>402</td>
        <td>YANEZ</td>
        <td>LUIS</td>
        <td>79.80</td>
    </tr>
    <tr>
        <td>413</td>
        <td>YEE</td>
        <td>MARVIN</td>
        <td>75.79</td>
    </tr>
    <tr>
        <td>28</td>
        <td>YOUNG</td>
        <td>CYNTHIA</td>
        <td>111.68</td>
    </tr>
</table>



### 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.


```python
%%sql
SELECT f.title FROM film f
WHERE f.language_id = (
	SELECT language_id FROM language l WHERE l.name = 'English'
    )
AND (f.title like 'K%' OR f.title LIKE 'Q%')
;
```

    15 rows affected.





<table>
    <tr>
        <th>title</th>
    </tr>
    <tr>
        <td>KANE EXORCIST</td>
    </tr>
    <tr>
        <td>KARATE MOON</td>
    </tr>
    <tr>
        <td>KENTUCKIAN GIANT</td>
    </tr>
    <tr>
        <td>KICK SAVANNAH</td>
    </tr>
    <tr>
        <td>KILL BROTHERHOOD</td>
    </tr>
    <tr>
        <td>KILLER INNOCENT</td>
    </tr>
    <tr>
        <td>KING EVOLUTION</td>
    </tr>
    <tr>
        <td>KISS GLORY</td>
    </tr>
    <tr>
        <td>KISSING DOLLS</td>
    </tr>
    <tr>
        <td>KNOCK WARLOCK</td>
    </tr>
    <tr>
        <td>KRAMER CHOCOLATE</td>
    </tr>
    <tr>
        <td>KWAI HOMEWARD</td>
    </tr>
    <tr>
        <td>QUEEN LUKE</td>
    </tr>
    <tr>
        <td>QUEST MUSSOLINI</td>
    </tr>
    <tr>
        <td>QUILLS BULL</td>
    </tr>
</table>



### 7b. Use subqueries to display all actors who appear in the film Alone Trip.


```python
%%sql
SELECT a.first_name, a.last_name from actor a
WHERE a.actor_id IN (
	SELECT fa.actor_id FROM film_actor fa
	WHERE film_id IN (
		SELECT film_id FROM film WHERE title = 'Alone Trip'
		)
	)
;
```

    8 rows affected.





<table>
    <tr>
        <th>first_name</th>
        <th>last_name</th>
    </tr>
    <tr>
        <td>ED</td>
        <td>CHASE</td>
    </tr>
    <tr>
        <td>KARL</td>
        <td>BERRY</td>
    </tr>
    <tr>
        <td>UMA</td>
        <td>WOOD</td>
    </tr>
    <tr>
        <td>WOODY</td>
        <td>JOLIE</td>
    </tr>
    <tr>
        <td>SPENCER</td>
        <td>DEPP</td>
    </tr>
    <tr>
        <td>CHRIS</td>
        <td>DEPP</td>
    </tr>
    <tr>
        <td>LAURENCE</td>
        <td>BULLOCK</td>
    </tr>
    <tr>
        <td>RENEE</td>
        <td>BALL</td>
    </tr>
</table>



### 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.


```python
%%sql
SELECT c.first_name, c.last_name, c.email FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
WHERE a.city_id IN (
	SELECT ci.city_id from city ci
	INNER JOIN country co
	ON ci.country_id = co.country_id
	WHERE co.country = 'Canada'
	)
;
```

    5 rows affected.





<table>
    <tr>
        <th>first_name</th>
        <th>last_name</th>
        <th>email</th>
    </tr>
    <tr>
        <td>DERRICK</td>
        <td>BOURQUE</td>
        <td>DERRICK.BOURQUE@sakilacustomer.org</td>
    </tr>
    <tr>
        <td>DARRELL</td>
        <td>POWER</td>
        <td>DARRELL.POWER@sakilacustomer.org</td>
    </tr>
    <tr>
        <td>LORETTA</td>
        <td>CARPENTER</td>
        <td>LORETTA.CARPENTER@sakilacustomer.org</td>
    </tr>
    <tr>
        <td>CURTIS</td>
        <td>IRBY</td>
        <td>CURTIS.IRBY@sakilacustomer.org</td>
    </tr>
    <tr>
        <td>TROY</td>
        <td>QUIGLEY</td>
        <td>TROY.QUIGLEY@sakilacustomer.org</td>
    </tr>
</table>



### 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.


```python
%%sql
SELECT f.title FROM film f
WHERE f.film_id IN (
	SELECT fc.film_id FROM film_category fc WHERE fc.category_id = (
		SELECT c.category_id from category c WHERE c.name = 'Family'
		)
	)
;
```

    69 rows affected.





<table>
    <tr>
        <th>title</th>
    </tr>
    <tr>
        <td>AFRICAN EGG</td>
    </tr>
    <tr>
        <td>APACHE DIVINE</td>
    </tr>
    <tr>
        <td>ATLANTIS CAUSE</td>
    </tr>
    <tr>
        <td>BAKED CLEOPATRA</td>
    </tr>
    <tr>
        <td>BANG KWAI</td>
    </tr>
    <tr>
        <td>BEDAZZLED MARRIED</td>
    </tr>
    <tr>
        <td>BILKO ANONYMOUS</td>
    </tr>
    <tr>
        <td>BLANKET BEVERLY</td>
    </tr>
    <tr>
        <td>BLOOD ARGONAUTS</td>
    </tr>
    <tr>
        <td>BLUES INSTINCT</td>
    </tr>
    <tr>
        <td>BRAVEHEART HUMAN</td>
    </tr>
    <tr>
        <td>CHASING FIGHT</td>
    </tr>
    <tr>
        <td>CHISUM BEHAVIOR</td>
    </tr>
    <tr>
        <td>CHOCOLAT HARRY</td>
    </tr>
    <tr>
        <td>CONFUSED CANDLES</td>
    </tr>
    <tr>
        <td>CONVERSATION DOWNHILL</td>
    </tr>
    <tr>
        <td>DATE SPEED</td>
    </tr>
    <tr>
        <td>DINOSAUR SECRETARY</td>
    </tr>
    <tr>
        <td>DUMBO LUST</td>
    </tr>
    <tr>
        <td>EARRING INSTINCT</td>
    </tr>
    <tr>
        <td>EFFECT GLADIATOR</td>
    </tr>
    <tr>
        <td>FEUD FROGMEN</td>
    </tr>
    <tr>
        <td>FINDING ANACONDA</td>
    </tr>
    <tr>
        <td>GABLES METROPOLIS</td>
    </tr>
    <tr>
        <td>GANDHI KWAI</td>
    </tr>
    <tr>
        <td>GLADIATOR WESTWARD</td>
    </tr>
    <tr>
        <td>GREASE YOUTH</td>
    </tr>
    <tr>
        <td>HALF OUTFIELD</td>
    </tr>
    <tr>
        <td>HOCUS FRIDA</td>
    </tr>
    <tr>
        <td>HOMICIDE PEACH</td>
    </tr>
    <tr>
        <td>HOUSE DYNAMITE</td>
    </tr>
    <tr>
        <td>HUNTING MUSKETEERS</td>
    </tr>
    <tr>
        <td>INDIAN LOVE</td>
    </tr>
    <tr>
        <td>JASON TRAP</td>
    </tr>
    <tr>
        <td>JEDI BENEATH</td>
    </tr>
    <tr>
        <td>KILLER INNOCENT</td>
    </tr>
    <tr>
        <td>KING EVOLUTION</td>
    </tr>
    <tr>
        <td>LOLITA WORLD</td>
    </tr>
    <tr>
        <td>LOUISIANA HARRY</td>
    </tr>
    <tr>
        <td>MAGUIRE APACHE</td>
    </tr>
    <tr>
        <td>MANCHURIAN CURTAIN</td>
    </tr>
    <tr>
        <td>MOVIE SHAKESPEARE</td>
    </tr>
    <tr>
        <td>MUSIC BOONDOCK</td>
    </tr>
    <tr>
        <td>NATURAL STOCK</td>
    </tr>
    <tr>
        <td>NETWORK PEAK</td>
    </tr>
    <tr>
        <td>ODDS BOOGIE</td>
    </tr>
    <tr>
        <td>OPPOSITE NECKLACE</td>
    </tr>
    <tr>
        <td>PILOT HOOSIERS</td>
    </tr>
    <tr>
        <td>PITTSBURGH HUNCHBACK</td>
    </tr>
    <tr>
        <td>PRESIDENT BANG</td>
    </tr>
    <tr>
        <td>PRIX UNDEFEATED</td>
    </tr>
    <tr>
        <td>RAGE GAMES</td>
    </tr>
    <tr>
        <td>RANGE MOONWALKER</td>
    </tr>
    <tr>
        <td>REMEMBER DIARY</td>
    </tr>
    <tr>
        <td>RESURRECTION SILVERADO</td>
    </tr>
    <tr>
        <td>ROBBERY BRIGHT</td>
    </tr>
    <tr>
        <td>RUSH GOODFELLAS</td>
    </tr>
    <tr>
        <td>SECRETS PARADISE</td>
    </tr>
    <tr>
        <td>SENSIBILITY REAR</td>
    </tr>
    <tr>
        <td>SIEGE MADRE</td>
    </tr>
    <tr>
        <td>SLUMS DUCK</td>
    </tr>
    <tr>
        <td>SOUP WISDOM</td>
    </tr>
    <tr>
        <td>SPARTACUS CHEAPER</td>
    </tr>
    <tr>
        <td>SPINAL ROCKY</td>
    </tr>
    <tr>
        <td>SPLASH GUMP</td>
    </tr>
    <tr>
        <td>SUNSET RACER</td>
    </tr>
    <tr>
        <td>SUPER WYOMING</td>
    </tr>
    <tr>
        <td>VIRTUAL SPOILERS</td>
    </tr>
    <tr>
        <td>WILLOW TRACY</td>
    </tr>
</table>



### 7e. Display the most frequently rented movies in descending order.


```python
%%sql
SELECT f.title, SUM(frequency) AS rental_frequency 
FROM 
	(SELECT r.inventory_id, COUNT(r.inventory_id) AS frequency FROM rental r
	GROUP BY r.inventory_id
	ORDER BY frequency DESC) AS freq, 
    inventory i, 
    film f
WHERE freq.inventory_id = i.inventory_id
AND i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY rental_frequency DESC
;
```

    958 rows affected.





<table>
    <tr>
        <th>title</th>
        <th>rental_frequency</th>
    </tr>
    <tr>
        <td>BUCKET BROTHERHOOD</td>
        <td>34</td>
    </tr>
    <tr>
        <td>ROCKETEER MOTHER</td>
        <td>33</td>
    </tr>
    <tr>
        <td>JUGGLER HARDLY</td>
        <td>32</td>
    </tr>
    <tr>
        <td>FORWARD TEMPLE</td>
        <td>32</td>
    </tr>
    <tr>
        <td>SCALAWAG DUCK</td>
        <td>32</td>
    </tr>
    <tr>
        <td>GRIT CLOCKWORK</td>
        <td>32</td>
    </tr>
    <tr>
        <td>RIDGEMONT SUBMARINE</td>
        <td>32</td>
    </tr>
    <tr>
        <td>WIFE TURN</td>
        <td>31</td>
    </tr>
    <tr>
        <td>ROBBERS JOON</td>
        <td>31</td>
    </tr>
    <tr>
        <td>APACHE DIVINE</td>
        <td>31</td>
    </tr>
    <tr>
        <td>TIMBERLAND SKY</td>
        <td>31</td>
    </tr>
    <tr>
        <td>GOODFELLAS SALUTE</td>
        <td>31</td>
    </tr>
    <tr>
        <td>ZORRO ARK</td>
        <td>31</td>
    </tr>
    <tr>
        <td>RUSH GOODFELLAS</td>
        <td>31</td>
    </tr>
    <tr>
        <td>NETWORK PEAK</td>
        <td>31</td>
    </tr>
    <tr>
        <td>HOBBIT ALIEN</td>
        <td>31</td>
    </tr>
    <tr>
        <td>MASSACRE USUAL</td>
        <td>30</td>
    </tr>
    <tr>
        <td>SUSPECTS QUILLS</td>
        <td>30</td>
    </tr>
    <tr>
        <td>SHOCK CABIN</td>
        <td>30</td>
    </tr>
    <tr>
        <td>RUGRATS SHAKESPEARE</td>
        <td>30</td>
    </tr>
    <tr>
        <td>HARRY IDAHO</td>
        <td>30</td>
    </tr>
    <tr>
        <td>MUSCLE BRIGHT</td>
        <td>30</td>
    </tr>
    <tr>
        <td>WITCHES PANIC</td>
        <td>30</td>
    </tr>
    <tr>
        <td>FROST HEAD</td>
        <td>30</td>
    </tr>
    <tr>
        <td>DOGMA FAMILY</td>
        <td>30</td>
    </tr>
    <tr>
        <td>BUTTERFLY CHOCOLAT</td>
        <td>30</td>
    </tr>
    <tr>
        <td>CAT CONEHEADS</td>
        <td>30</td>
    </tr>
    <tr>
        <td>PULP BEVERLY</td>
        <td>30</td>
    </tr>
    <tr>
        <td>GRAFFITI LOVE</td>
        <td>30</td>
    </tr>
    <tr>
        <td>ENGLISH BULWORTH</td>
        <td>30</td>
    </tr>
    <tr>
        <td>MARRIED GO</td>
        <td>30</td>
    </tr>
    <tr>
        <td>IDOLS SNATCHERS</td>
        <td>30</td>
    </tr>
    <tr>
        <td>DEER VIRGINIAN</td>
        <td>29</td>
    </tr>
    <tr>
        <td>GLEAMING JAWBREAKER</td>
        <td>29</td>
    </tr>
    <tr>
        <td>VIRGINIAN PLUTO</td>
        <td>29</td>
    </tr>
    <tr>
        <td>STORM HAPPINESS</td>
        <td>29</td>
    </tr>
    <tr>
        <td>TITANS JERK</td>
        <td>29</td>
    </tr>
    <tr>
        <td>SWEETHEARTS SUSPECTS</td>
        <td>29</td>
    </tr>
    <tr>
        <td>BINGO TALENTED</td>
        <td>29</td>
    </tr>
    <tr>
        <td>BOOGIE AMELIE</td>
        <td>29</td>
    </tr>
    <tr>
        <td>GREATEST NORTH</td>
        <td>29</td>
    </tr>
    <tr>
        <td>TALENTED HOMICIDE</td>
        <td>29</td>
    </tr>
    <tr>
        <td>MOON BUNCH</td>
        <td>29</td>
    </tr>
    <tr>
        <td>CONFIDENTIAL INTERVIEW</td>
        <td>29</td>
    </tr>
    <tr>
        <td>FAMILY SWEET</td>
        <td>29</td>
    </tr>
    <tr>
        <td>ENEMY ODDS</td>
        <td>29</td>
    </tr>
    <tr>
        <td>VIDEOTAPE ARSENIC</td>
        <td>29</td>
    </tr>
    <tr>
        <td>SATURDAY LAMBS</td>
        <td>28</td>
    </tr>
    <tr>
        <td>CLOSER BANG</td>
        <td>28</td>
    </tr>
    <tr>
        <td>EXPENDABLE STALLION</td>
        <td>28</td>
    </tr>
    <tr>
        <td>TRIP NEWTON</td>
        <td>28</td>
    </tr>
    <tr>
        <td>HANDICAP BOONDOCK</td>
        <td>28</td>
    </tr>
    <tr>
        <td>FATAL HAUNTED</td>
        <td>28</td>
    </tr>
    <tr>
        <td>GIANT TROOPERS</td>
        <td>28</td>
    </tr>
    <tr>
        <td>VOYAGE LEGALLY</td>
        <td>28</td>
    </tr>
    <tr>
        <td>ROSES TREASURE</td>
        <td>28</td>
    </tr>
    <tr>
        <td>STORY SIDE</td>
        <td>28</td>
    </tr>
    <tr>
        <td>GILMORE BOILED</td>
        <td>28</td>
    </tr>
    <tr>
        <td>CURTAIN VIDEOTAPE</td>
        <td>27</td>
    </tr>
    <tr>
        <td>PRIMARY GLASS</td>
        <td>27</td>
    </tr>
    <tr>
        <td>RANGE MOONWALKER</td>
        <td>27</td>
    </tr>
    <tr>
        <td>TELEGRAPH VOYAGE</td>
        <td>27</td>
    </tr>
    <tr>
        <td>CHANCE RESURRECTION</td>
        <td>27</td>
    </tr>
    <tr>
        <td>TORQUE BOUND</td>
        <td>27</td>
    </tr>
    <tr>
        <td>SWARM GOLD</td>
        <td>27</td>
    </tr>
    <tr>
        <td>DORADO NOTTING</td>
        <td>27</td>
    </tr>
    <tr>
        <td>CAMELOT VACATION</td>
        <td>27</td>
    </tr>
    <tr>
        <td>SPY MILE</td>
        <td>27</td>
    </tr>
    <tr>
        <td>HORROR REIGN</td>
        <td>27</td>
    </tr>
    <tr>
        <td>LOSE INCH</td>
        <td>27</td>
    </tr>
    <tr>
        <td>INVASION CYCLONE</td>
        <td>27</td>
    </tr>
    <tr>
        <td>GOLDMINE TYCOON</td>
        <td>27</td>
    </tr>
    <tr>
        <td>GANGS PRIDE</td>
        <td>27</td>
    </tr>
    <tr>
        <td>MOVIE SHAKESPEARE</td>
        <td>27</td>
    </tr>
    <tr>
        <td>NONE SPIKING</td>
        <td>27</td>
    </tr>
    <tr>
        <td>LIES TREATMENT</td>
        <td>27</td>
    </tr>
    <tr>
        <td>PRINCESS GIANT</td>
        <td>27</td>
    </tr>
    <tr>
        <td>FORRESTER COMANCHEROS</td>
        <td>27</td>
    </tr>
    <tr>
        <td>OPERATION OPERATION</td>
        <td>27</td>
    </tr>
    <tr>
        <td>WARDROBE PHANTOM</td>
        <td>27</td>
    </tr>
    <tr>
        <td>DETECTIVE VISION</td>
        <td>27</td>
    </tr>
    <tr>
        <td>DANCING FEVER</td>
        <td>27</td>
    </tr>
    <tr>
        <td>LOATHING LEGALLY</td>
        <td>27</td>
    </tr>
    <tr>
        <td>BLACKOUT PRIVATE</td>
        <td>27</td>
    </tr>
    <tr>
        <td>HANKY OCTOBER</td>
        <td>26</td>
    </tr>
    <tr>
        <td>MALKOVICH PET</td>
        <td>26</td>
    </tr>
    <tr>
        <td>METROPOLIS COMA</td>
        <td>26</td>
    </tr>
    <tr>
        <td>SEABISCUIT PUNK</td>
        <td>26</td>
    </tr>
    <tr>
        <td>BROTHERHOOD BLANKET</td>
        <td>26</td>
    </tr>
    <tr>
        <td>HALF OUTFIELD</td>
        <td>26</td>
    </tr>
    <tr>
        <td>TIGHTS DAWN</td>
        <td>26</td>
    </tr>
    <tr>
        <td>ALASKA PHANTOM</td>
        <td>26</td>
    </tr>
    <tr>
        <td>ISLAND EXORCIST</td>
        <td>26</td>
    </tr>
    <tr>
        <td>STAGECOACH ARMAGEDDON</td>
        <td>26</td>
    </tr>
    <tr>
        <td>PITY BOUND</td>
        <td>26</td>
    </tr>
    <tr>
        <td>VELVET TERMINATOR</td>
        <td>26</td>
    </tr>
    <tr>
        <td>TRACY CIDER</td>
        <td>26</td>
    </tr>
    <tr>
        <td>DURHAM PANKY</td>
        <td>26</td>
    </tr>
    <tr>
        <td>PELICAN COMFORTS</td>
        <td>26</td>
    </tr>
    <tr>
        <td>CONTACT ANONYMOUS</td>
        <td>26</td>
    </tr>
    <tr>
        <td>WESTWARD SEABISCUIT</td>
        <td>26</td>
    </tr>
    <tr>
        <td>INNOCENT USUAL</td>
        <td>26</td>
    </tr>
    <tr>
        <td>FANTASY TROOPERS</td>
        <td>26</td>
    </tr>
    <tr>
        <td>HYDE DOCTOR</td>
        <td>26</td>
    </tr>
    <tr>
        <td>FELLOWSHIP AUTUMN</td>
        <td>26</td>
    </tr>
    <tr>
        <td>DISTURBING SCARFACE</td>
        <td>26</td>
    </tr>
    <tr>
        <td>POCUS PULP</td>
        <td>26</td>
    </tr>
    <tr>
        <td>COMA HEAD</td>
        <td>26</td>
    </tr>
    <tr>
        <td>SHEPHERD MIDSUMMER</td>
        <td>25</td>
    </tr>
    <tr>
        <td>CLASH FREDDY</td>
        <td>25</td>
    </tr>
    <tr>
        <td>CONEHEADS SMOOCHY</td>
        <td>25</td>
    </tr>
    <tr>
        <td>SHOW LORD</td>
        <td>25</td>
    </tr>
    <tr>
        <td>FISH OPUS</td>
        <td>25</td>
    </tr>
    <tr>
        <td>DOUBLE WRATH</td>
        <td>25</td>
    </tr>
    <tr>
        <td>STREETCAR INTENTIONS</td>
        <td>25</td>
    </tr>
    <tr>
        <td>EFFECT GLADIATOR</td>
        <td>25</td>
    </tr>
    <tr>
        <td>TRADING PINOCCHIO</td>
        <td>25</td>
    </tr>
    <tr>
        <td>MADNESS ATTACKS</td>
        <td>25</td>
    </tr>
    <tr>
        <td>OSCAR GOLD</td>
        <td>25</td>
    </tr>
    <tr>
        <td>NIGHTMARE CHILL</td>
        <td>25</td>
    </tr>
    <tr>
        <td>MALLRATS UNITED</td>
        <td>25</td>
    </tr>
    <tr>
        <td>ESCAPE METROPOLIS</td>
        <td>25</td>
    </tr>
    <tr>
        <td>FEUD FROGMEN</td>
        <td>25</td>
    </tr>
    <tr>
        <td>METAL ARMAGEDDON</td>
        <td>25</td>
    </tr>
    <tr>
        <td>DYNAMITE TARZAN</td>
        <td>25</td>
    </tr>
    <tr>
        <td>SUN CONFESSIONS</td>
        <td>25</td>
    </tr>
    <tr>
        <td>DOWNHILL ENOUGH</td>
        <td>25</td>
    </tr>
    <tr>
        <td>TOMORROW HUSTLER</td>
        <td>25</td>
    </tr>
    <tr>
        <td>GUN BONNIE</td>
        <td>25</td>
    </tr>
    <tr>
        <td>HILLS NEIGHBORS</td>
        <td>25</td>
    </tr>
    <tr>
        <td>CLUELESS BUCKET</td>
        <td>25</td>
    </tr>
    <tr>
        <td>SAMURAI LION</td>
        <td>25</td>
    </tr>
    <tr>
        <td>TELEMARK HEARTBREAKERS</td>
        <td>25</td>
    </tr>
    <tr>
        <td>WORKING MICROCOSMOS</td>
        <td>25</td>
    </tr>
    <tr>
        <td>BARBARELLA STREETCAR</td>
        <td>25</td>
    </tr>
    <tr>
        <td>ATTRACTION NEWTON</td>
        <td>24</td>
    </tr>
    <tr>
        <td>SLUMS DUCK</td>
        <td>24</td>
    </tr>
    <tr>
        <td>COLOR PHILADELPHIA</td>
        <td>24</td>
    </tr>
    <tr>
        <td>PACIFIC AMISTAD</td>
        <td>24</td>
    </tr>
    <tr>
        <td>HORN WORKING</td>
        <td>24</td>
    </tr>
    <tr>
        <td>STRANGELOVE DESIRE</td>
        <td>24</td>
    </tr>
    <tr>
        <td>OZ LIAISONS</td>
        <td>24</td>
    </tr>
    <tr>
        <td>MOCKINGBIRD HOLLYWOOD</td>
        <td>24</td>
    </tr>
    <tr>
        <td>JUMPING WRATH</td>
        <td>24</td>
    </tr>
    <tr>
        <td>FARGO GANDHI</td>
        <td>24</td>
    </tr>
    <tr>
        <td>SEATTLE EXPECATIONS</td>
        <td>24</td>
    </tr>
    <tr>
        <td>GUNFIGHT MOON</td>
        <td>24</td>
    </tr>
    <tr>
        <td>KNOCK WARLOCK</td>
        <td>24</td>
    </tr>
    <tr>
        <td>SUNRISE LEAGUE</td>
        <td>24</td>
    </tr>
    <tr>
        <td>SHOOTIST SUPERFLY</td>
        <td>24</td>
    </tr>
    <tr>
        <td>LOLA AGENT</td>
        <td>24</td>
    </tr>
    <tr>
        <td>DRIFTER COMMANDMENTS</td>
        <td>24</td>
    </tr>
    <tr>
        <td>CELEBRITY HORN</td>
        <td>24</td>
    </tr>
    <tr>
        <td>ROMAN PUNK</td>
        <td>24</td>
    </tr>
    <tr>
        <td>ARACHNOPHOBIA ROLLERCOASTER</td>
        <td>24</td>
    </tr>
    <tr>
        <td>ORANGE GRAPES</td>
        <td>24</td>
    </tr>
    <tr>
        <td>WEDDING APOLLO</td>
        <td>24</td>
    </tr>
    <tr>
        <td>SLEEPING SUSPECTS</td>
        <td>24</td>
    </tr>
    <tr>
        <td>ATLANTIS CAUSE</td>
        <td>24</td>
    </tr>
    <tr>
        <td>BOUND CHEAPER</td>
        <td>24</td>
    </tr>
    <tr>
        <td>GOLDFINGER SENSIBILITY</td>
        <td>24</td>
    </tr>
    <tr>
        <td>ICE CROSSING</td>
        <td>24</td>
    </tr>
    <tr>
        <td>MAIDEN HOME</td>
        <td>24</td>
    </tr>
    <tr>
        <td>JASON TRAP</td>
        <td>24</td>
    </tr>
    <tr>
        <td>CAPER MOTIONS</td>
        <td>24</td>
    </tr>
    <tr>
        <td>HURRICANE AFFAIR</td>
        <td>24</td>
    </tr>
    <tr>
        <td>ALAMO VIDEOTAPE</td>
        <td>24</td>
    </tr>
    <tr>
        <td>CENTER DINOSAUR</td>
        <td>24</td>
    </tr>
    <tr>
        <td>WIND PHANTOM</td>
        <td>23</td>
    </tr>
    <tr>
        <td>CROOKED FROGMEN</td>
        <td>23</td>
    </tr>
    <tr>
        <td>SNOWMAN ROLLERCOASTER</td>
        <td>23</td>
    </tr>
    <tr>
        <td>YENTL IDAHO</td>
        <td>23</td>
    </tr>
    <tr>
        <td>SALUTE APOLLO</td>
        <td>23</td>
    </tr>
    <tr>
        <td>NAME DETECTIVE</td>
        <td>23</td>
    </tr>
    <tr>
        <td>PHILADELPHIA WIFE</td>
        <td>23</td>
    </tr>
    <tr>
        <td>TITANIC BOONDOCK</td>
        <td>23</td>
    </tr>
    <tr>
        <td>EASY GLADIATOR</td>
        <td>23</td>
    </tr>
    <tr>
        <td>STRICTLY SCARFACE</td>
        <td>23</td>
    </tr>
    <tr>
        <td>ACADEMY DINOSAUR</td>
        <td>23</td>
    </tr>
    <tr>
        <td>HOUSE DYNAMITE</td>
        <td>23</td>
    </tr>
    <tr>
        <td>ALADDIN CALENDAR</td>
        <td>23</td>
    </tr>
    <tr>
        <td>MURDER ANTITRUST</td>
        <td>23</td>
    </tr>
    <tr>
        <td>GENTLEMEN STAGE</td>
        <td>23</td>
    </tr>
    <tr>
        <td>KWAI HOMEWARD</td>
        <td>23</td>
    </tr>
    <tr>
        <td>CANDLES GRAPES</td>
        <td>23</td>
    </tr>
    <tr>
        <td>KARATE MOON</td>
        <td>23</td>
    </tr>
    <tr>
        <td>SCORPION APOLLO</td>
        <td>23</td>
    </tr>
    <tr>
        <td>FOOL MOCKINGBIRD</td>
        <td>23</td>
    </tr>
    <tr>
        <td>CARRIE BUNCH</td>
        <td>23</td>
    </tr>
    <tr>
        <td>AFFAIR PREJUDICE</td>
        <td>23</td>
    </tr>
    <tr>
        <td>STEEL SANTA</td>
        <td>23</td>
    </tr>
    <tr>
        <td>OTHERS SOUP</td>
        <td>23</td>
    </tr>
    <tr>
        <td>CUPBOARD SINNERS</td>
        <td>23</td>
    </tr>
    <tr>
        <td>OUTBREAK DIVINE</td>
        <td>23</td>
    </tr>
    <tr>
        <td>WASH HEAVENLY</td>
        <td>23</td>
    </tr>
    <tr>
        <td>WOMEN DORADO</td>
        <td>23</td>
    </tr>
    <tr>
        <td>HEAVYWEIGHTS BEAST</td>
        <td>23</td>
    </tr>
    <tr>
        <td>TROUBLE DATE</td>
        <td>23</td>
    </tr>
    <tr>
        <td>TRUMAN CRAZY</td>
        <td>23</td>
    </tr>
    <tr>
        <td>BALLOON HOMEWARD</td>
        <td>23</td>
    </tr>
    <tr>
        <td>PATTON INTERVIEW</td>
        <td>23</td>
    </tr>
    <tr>
        <td>FREDDY STORM</td>
        <td>23</td>
    </tr>
    <tr>
        <td>EARTH VISION</td>
        <td>23</td>
    </tr>
    <tr>
        <td>FLAMINGOS CONNECTICUT</td>
        <td>23</td>
    </tr>
    <tr>
        <td>QUEEN LUKE</td>
        <td>22</td>
    </tr>
    <tr>
        <td>HIGH ENCINO</td>
        <td>22</td>
    </tr>
    <tr>
        <td>HAUNTING PIANIST</td>
        <td>22</td>
    </tr>
    <tr>
        <td>WHISPERER GIANT</td>
        <td>22</td>
    </tr>
    <tr>
        <td>TOURIST PELICAN</td>
        <td>22</td>
    </tr>
    <tr>
        <td>BANGER PINOCCHIO</td>
        <td>22</td>
    </tr>
    <tr>
        <td>BORROWERS BEDAZZLED</td>
        <td>22</td>
    </tr>
    <tr>
        <td>HUSTLER PARTY</td>
        <td>22</td>
    </tr>
    <tr>
        <td>PACKER MADIGAN</td>
        <td>22</td>
    </tr>
    <tr>
        <td>AMERICAN CIRCUS</td>
        <td>22</td>
    </tr>
    <tr>
        <td>BEAUTY GREASE</td>
        <td>22</td>
    </tr>
    <tr>
        <td>CHICKEN HELLFIGHTERS</td>
        <td>22</td>
    </tr>
    <tr>
        <td>LIAISONS SWEET</td>
        <td>22</td>
    </tr>
    <tr>
        <td>FALCON VOLUME</td>
        <td>22</td>
    </tr>
    <tr>
        <td>ANNIE IDENTITY</td>
        <td>22</td>
    </tr>
    <tr>
        <td>SEA VIRGIN</td>
        <td>22</td>
    </tr>
    <tr>
        <td>MIDSUMMER GROUNDHOG</td>
        <td>22</td>
    </tr>
    <tr>
        <td>FIGHT JAWBREAKER</td>
        <td>22</td>
    </tr>
    <tr>
        <td>DREAM PICKUP</td>
        <td>22</td>
    </tr>
    <tr>
        <td>HOMICIDE PEACH</td>
        <td>22</td>
    </tr>
    <tr>
        <td>VOLCANO TEXAS</td>
        <td>22</td>
    </tr>
    <tr>
        <td>CONGENIALITY QUEST</td>
        <td>22</td>
    </tr>
    <tr>
        <td>FLATLINERS KILLER</td>
        <td>22</td>
    </tr>
    <tr>
        <td>EAGLES PANKY</td>
        <td>22</td>
    </tr>
    <tr>
        <td>MALTESE HOPE</td>
        <td>22</td>
    </tr>
    <tr>
        <td>BLADE POLISH</td>
        <td>22</td>
    </tr>
    <tr>
        <td>HEAD STRANGER</td>
        <td>22</td>
    </tr>
    <tr>
        <td>ALIEN CENTER</td>
        <td>22</td>
    </tr>
    <tr>
        <td>SHAKESPEARE SADDLE</td>
        <td>22</td>
    </tr>
    <tr>
        <td>KISS GLORY</td>
        <td>22</td>
    </tr>
    <tr>
        <td>CHILL LUCK</td>
        <td>22</td>
    </tr>
    <tr>
        <td>GRAPES FURY</td>
        <td>22</td>
    </tr>
    <tr>
        <td>ALTER VICTORY</td>
        <td>22</td>
    </tr>
    <tr>
        <td>BEAR GRACELAND</td>
        <td>22</td>
    </tr>
    <tr>
        <td>WONDERLAND CHRISTMAS</td>
        <td>22</td>
    </tr>
    <tr>
        <td>SINNERS ATLANTIS</td>
        <td>22</td>
    </tr>
    <tr>
        <td>SNATCH SLIPPER</td>
        <td>22</td>
    </tr>
    <tr>
        <td>SOUTH WAIT</td>
        <td>22</td>
    </tr>
    <tr>
        <td>ANGELS LIFE</td>
        <td>22</td>
    </tr>
    <tr>
        <td>SPLENDOR PATTON</td>
        <td>21</td>
    </tr>
    <tr>
        <td>EXCITEMENT EVE</td>
        <td>21</td>
    </tr>
    <tr>
        <td>DECEIVER BETRAYED</td>
        <td>21</td>
    </tr>
    <tr>
        <td>OPEN AFRICAN</td>
        <td>21</td>
    </tr>
    <tr>
        <td>AMISTAD MIDSUMMER</td>
        <td>21</td>
    </tr>
    <tr>
        <td>RESURRECTION SILVERADO</td>
        <td>21</td>
    </tr>
    <tr>
        <td>BASIC EASY</td>
        <td>21</td>
    </tr>
    <tr>
        <td>MOONSHINE CABIN</td>
        <td>21</td>
    </tr>
    <tr>
        <td>AGENT TRUMAN</td>
        <td>21</td>
    </tr>
    <tr>
        <td>EMPIRE MALKOVICH</td>
        <td>21</td>
    </tr>
    <tr>
        <td>STAR OPERATION</td>
        <td>21</td>
    </tr>
    <tr>
        <td>MOURNING PURPLE</td>
        <td>21</td>
    </tr>
    <tr>
        <td>CROSSROADS CASUALTIES</td>
        <td>21</td>
    </tr>
    <tr>
        <td>EGG IGBY</td>
        <td>21</td>
    </tr>
    <tr>
        <td>BLUES INSTINCT</td>
        <td>21</td>
    </tr>
    <tr>
        <td>CAUSE DATE</td>
        <td>21</td>
    </tr>
    <tr>
        <td>DOOM DANCING</td>
        <td>21</td>
    </tr>
    <tr>
        <td>DRIVING POLISH</td>
        <td>21</td>
    </tr>
    <tr>
        <td>SLEEPY JAPANESE</td>
        <td>21</td>
    </tr>
    <tr>
        <td>BROOKLYN DESERT</td>
        <td>21</td>
    </tr>
    <tr>
        <td>SABRINA MIDNIGHT</td>
        <td>21</td>
    </tr>
    <tr>
        <td>SLEUTH ORIENT</td>
        <td>21</td>
    </tr>
    <tr>
        <td>PIRATES ROXANNE</td>
        <td>21</td>
    </tr>
    <tr>
        <td>ANACONDA CONFESSIONS</td>
        <td>21</td>
    </tr>
    <tr>
        <td>WAIT CIDER</td>
        <td>21</td>
    </tr>
    <tr>
        <td>VACATION BOONDOCK</td>
        <td>21</td>
    </tr>
    <tr>
        <td>CALENDAR GUNFIGHT</td>
        <td>21</td>
    </tr>
    <tr>
        <td>DRACULA CRYSTAL</td>
        <td>21</td>
    </tr>
    <tr>
        <td>HIGHBALL POTTER</td>
        <td>21</td>
    </tr>
    <tr>
        <td>AMADEUS HOLY</td>
        <td>21</td>
    </tr>
    <tr>
        <td>CHRISTMAS MOONSHINE</td>
        <td>21</td>
    </tr>
    <tr>
        <td>COAST RAINBOW</td>
        <td>21</td>
    </tr>
    <tr>
        <td>CHARIOTS CONSPIRACY</td>
        <td>21</td>
    </tr>
    <tr>
        <td>FIREBALL PHILADELPHIA</td>
        <td>21</td>
    </tr>
    <tr>
        <td>ARMAGEDDON LOST</td>
        <td>21</td>
    </tr>
    <tr>
        <td>SUIT WALLS</td>
        <td>21</td>
    </tr>
    <tr>
        <td>PIANIST OUTFIELD</td>
        <td>21</td>
    </tr>
    <tr>
        <td>BERETS AGENT</td>
        <td>21</td>
    </tr>
    <tr>
        <td>STING PERSONAL</td>
        <td>21</td>
    </tr>
    <tr>
        <td>SECRET GROUNDHOG</td>
        <td>21</td>
    </tr>
    <tr>
        <td>ARIZONA BANG</td>
        <td>21</td>
    </tr>
    <tr>
        <td>GHOST GROUNDHOG</td>
        <td>21</td>
    </tr>
    <tr>
        <td>UNDEFEATED DALMATIONS</td>
        <td>21</td>
    </tr>
    <tr>
        <td>BADMAN DAWN</td>
        <td>21</td>
    </tr>
    <tr>
        <td>GREASE YOUTH</td>
        <td>21</td>
    </tr>
    <tr>
        <td>DIVIDE MONSTER</td>
        <td>21</td>
    </tr>
    <tr>
        <td>WOLVES DESIRE</td>
        <td>21</td>
    </tr>
    <tr>
        <td>UNBREAKABLE KARATE</td>
        <td>21</td>
    </tr>
    <tr>
        <td>CHAINSAW UPTOWN</td>
        <td>21</td>
    </tr>
    <tr>
        <td>FIDELITY DEVIL</td>
        <td>21</td>
    </tr>
    <tr>
        <td>LEBOWSKI SOLDIERS</td>
        <td>21</td>
    </tr>
    <tr>
        <td>BEVERLY OUTLAW</td>
        <td>21</td>
    </tr>
    <tr>
        <td>STEPMOM DREAM</td>
        <td>20</td>
    </tr>
    <tr>
        <td>SPICE SORORITY</td>
        <td>20</td>
    </tr>
    <tr>
        <td>PINOCCHIO SIMON</td>
        <td>20</td>
    </tr>
    <tr>
        <td>PREJUDICE OLEANDER</td>
        <td>20</td>
    </tr>
    <tr>
        <td>HUNCHBACK IMPOSSIBLE</td>
        <td>20</td>
    </tr>
    <tr>
        <td>REDEMPTION COMFORTS</td>
        <td>20</td>
    </tr>
    <tr>
        <td>HARPER DYING</td>
        <td>20</td>
    </tr>
    <tr>
        <td>MILLION ACE</td>
        <td>20</td>
    </tr>
    <tr>
        <td>ROOM ROMAN</td>
        <td>20</td>
    </tr>
    <tr>
        <td>QUEST MUSSOLINI</td>
        <td>20</td>
    </tr>
    <tr>
        <td>TRAMP OTHERS</td>
        <td>20</td>
    </tr>
    <tr>
        <td>INSIDER ARIZONA</td>
        <td>20</td>
    </tr>
    <tr>
        <td>FLYING HOOK</td>
        <td>20</td>
    </tr>
    <tr>
        <td>JET NEIGHBORS</td>
        <td>20</td>
    </tr>
    <tr>
        <td>HEARTBREAKERS BRIGHT</td>
        <td>20</td>
    </tr>
    <tr>
        <td>JERK PAYCHECK</td>
        <td>20</td>
    </tr>
    <tr>
        <td>MONEY HAROLD</td>
        <td>20</td>
    </tr>
    <tr>
        <td>KICK SAVANNAH</td>
        <td>20</td>
    </tr>
    <tr>
        <td>RIVER OUTLAW</td>
        <td>20</td>
    </tr>
    <tr>
        <td>GARDEN ISLAND</td>
        <td>20</td>
    </tr>
    <tr>
        <td>BRINGING HYSTERICAL</td>
        <td>20</td>
    </tr>
    <tr>
        <td>STRAIGHT HOURS</td>
        <td>20</td>
    </tr>
    <tr>
        <td>KISSING DOLLS</td>
        <td>20</td>
    </tr>
    <tr>
        <td>SECRETS PARADISE</td>
        <td>20</td>
    </tr>
    <tr>
        <td>REIGN GENTLEMEN</td>
        <td>20</td>
    </tr>
    <tr>
        <td>REUNION WITCHES</td>
        <td>20</td>
    </tr>
    <tr>
        <td>SLEEPLESS MONSOON</td>
        <td>20</td>
    </tr>
    <tr>
        <td>INTERVIEW LIAISONS</td>
        <td>20</td>
    </tr>
    <tr>
        <td>GO PURPLE</td>
        <td>20</td>
    </tr>
    <tr>
        <td>MASKED BUBBLE</td>
        <td>20</td>
    </tr>
    <tr>
        <td>WRONG BEHAVIOR</td>
        <td>20</td>
    </tr>
    <tr>
        <td>NORTHWEST POLISH</td>
        <td>20</td>
    </tr>
    <tr>
        <td>LOVE SUICIDES</td>
        <td>20</td>
    </tr>
    <tr>
        <td>HELLFIGHTERS SIERRA</td>
        <td>20</td>
    </tr>
    <tr>
        <td>OUTFIELD MASSACRE</td>
        <td>20</td>
    </tr>
    <tr>
        <td>CHOCOLAT HARRY</td>
        <td>20</td>
    </tr>
    <tr>
        <td>DINOSAUR SECRETARY</td>
        <td>20</td>
    </tr>
    <tr>
        <td>PEAK FOREVER</td>
        <td>20</td>
    </tr>
    <tr>
        <td>INTRIGUE WORST</td>
        <td>20</td>
    </tr>
    <tr>
        <td>CHASING FIGHT</td>
        <td>20</td>
    </tr>
    <tr>
        <td>CHEAPER CLYDE</td>
        <td>20</td>
    </tr>
    <tr>
        <td>MINDS TRUMAN</td>
        <td>20</td>
    </tr>
    <tr>
        <td>DALMATIONS SWEDEN</td>
        <td>20</td>
    </tr>
    <tr>
        <td>JEDI BENEATH</td>
        <td>19</td>
    </tr>
    <tr>
        <td>ENCINO ELF</td>
        <td>19</td>
    </tr>
    <tr>
        <td>MARS ROMAN</td>
        <td>19</td>
    </tr>
    <tr>
        <td>HONEY TIES</td>
        <td>19</td>
    </tr>
    <tr>
        <td>CLUB GRAFFITI</td>
        <td>19</td>
    </tr>
    <tr>
        <td>REQUIEM TYCOON</td>
        <td>19</td>
    </tr>
    <tr>
        <td>HOURS RAGE</td>
        <td>19</td>
    </tr>
    <tr>
        <td>FICTION CHRISTMAS</td>
        <td>19</td>
    </tr>
    <tr>
        <td>DETAILS PACKER</td>
        <td>19</td>
    </tr>
    <tr>
        <td>BRIDE INTRIGUE</td>
        <td>19</td>
    </tr>
    <tr>
        <td>SUNDANCE INVASION</td>
        <td>19</td>
    </tr>
    <tr>
        <td>MUSIC BOONDOCK</td>
        <td>19</td>
    </tr>
    <tr>
        <td>DISCIPLE MOTHER</td>
        <td>19</td>
    </tr>
    <tr>
        <td>CAMPUS REMEMBER</td>
        <td>19</td>
    </tr>
    <tr>
        <td>THIEF PELICAN</td>
        <td>19</td>
    </tr>
    <tr>
        <td>POND SEATTLE</td>
        <td>19</td>
    </tr>
    <tr>
        <td>DOORS PRESIDENT</td>
        <td>19</td>
    </tr>
    <tr>
        <td>SHAWSHANK BUBBLE</td>
        <td>19</td>
    </tr>
    <tr>
        <td>BILL OTHERS</td>
        <td>19</td>
    </tr>
    <tr>
        <td>NATIONAL STORY</td>
        <td>19</td>
    </tr>
    <tr>
        <td>CIDER DESIRE</td>
        <td>19</td>
    </tr>
    <tr>
        <td>INDEPENDENCE HOTEL</td>
        <td>19</td>
    </tr>
    <tr>
        <td>BACKLASH UNDEFEATED</td>
        <td>19</td>
    </tr>
    <tr>
        <td>SOMETHING DUCK</td>
        <td>19</td>
    </tr>
    <tr>
        <td>FURY MURDER</td>
        <td>19</td>
    </tr>
    <tr>
        <td>EYES DRIVING</td>
        <td>19</td>
    </tr>
    <tr>
        <td>VOICE PEACH</td>
        <td>19</td>
    </tr>
    <tr>
        <td>HANGING DEEP</td>
        <td>19</td>
    </tr>
    <tr>
        <td>ROAD ROXANNE</td>
        <td>19</td>
    </tr>
    <tr>
        <td>ROXANNE REBEL</td>
        <td>19</td>
    </tr>
    <tr>
        <td>NOVOCAINE FLIGHT</td>
        <td>19</td>
    </tr>
    <tr>
        <td>GABLES METROPOLIS</td>
        <td>19</td>
    </tr>
    <tr>
        <td>MINE TITANS</td>
        <td>19</td>
    </tr>
    <tr>
        <td>RAGE GAMES</td>
        <td>19</td>
    </tr>
    <tr>
        <td>EARRING INSTINCT</td>
        <td>19</td>
    </tr>
    <tr>
        <td>CLONES PINOCCHIO</td>
        <td>19</td>
    </tr>
    <tr>
        <td>DESERT POSEIDON</td>
        <td>19</td>
    </tr>
    <tr>
        <td>GORGEOUS BINGO</td>
        <td>19</td>
    </tr>
    <tr>
        <td>FANTASIA PARK</td>
        <td>19</td>
    </tr>
    <tr>
        <td>TROJAN TOMORROW</td>
        <td>19</td>
    </tr>
    <tr>
        <td>NEIGHBORS CHARADE</td>
        <td>19</td>
    </tr>
    <tr>
        <td>ENCOUNTERS CURTAIN</td>
        <td>19</td>
    </tr>
    <tr>
        <td>PATIENT SISTER</td>
        <td>19</td>
    </tr>
    <tr>
        <td>CANYON STOCK</td>
        <td>19</td>
    </tr>
    <tr>
        <td>IGBY MAKER</td>
        <td>19</td>
    </tr>
    <tr>
        <td>REMEMBER DIARY</td>
        <td>18</td>
    </tr>
    <tr>
        <td>ALONE TRIP</td>
        <td>18</td>
    </tr>
    <tr>
        <td>WHALE BIKINI</td>
        <td>18</td>
    </tr>
    <tr>
        <td>DRAGONFLY STRANGERS</td>
        <td>18</td>
    </tr>
    <tr>
        <td>DRIVER ANNIE</td>
        <td>18</td>
    </tr>
    <tr>
        <td>DAWN POND</td>
        <td>18</td>
    </tr>
    <tr>
        <td>GROOVE FICTION</td>
        <td>18</td>
    </tr>
    <tr>
        <td>INSECTS STONE</td>
        <td>18</td>
    </tr>
    <tr>
        <td>RACER EGG</td>
        <td>18</td>
    </tr>
    <tr>
        <td>DARN FORRESTER</td>
        <td>18</td>
    </tr>
    <tr>
        <td>LION UNCUT</td>
        <td>18</td>
    </tr>
    <tr>
        <td>FORREST SONS</td>
        <td>18</td>
    </tr>
    <tr>
        <td>SCARFACE BANG</td>
        <td>18</td>
    </tr>
    <tr>
        <td>ENOUGH RAGING</td>
        <td>18</td>
    </tr>
    <tr>
        <td>SECRETARY ROUGE</td>
        <td>18</td>
    </tr>
    <tr>
        <td>VANISHING ROCKY</td>
        <td>18</td>
    </tr>
    <tr>
        <td>JADE BUNCH</td>
        <td>18</td>
    </tr>
    <tr>
        <td>BOULEVARD MOB</td>
        <td>18</td>
    </tr>
    <tr>
        <td>HEAVEN FREEDOM</td>
        <td>18</td>
    </tr>
    <tr>
        <td>UNFORGIVEN ZOOLANDER</td>
        <td>18</td>
    </tr>
    <tr>
        <td>EXPECATIONS NATURAL</td>
        <td>18</td>
    </tr>
    <tr>
        <td>SWEDEN SHINING</td>
        <td>18</td>
    </tr>
    <tr>
        <td>INCH JET</td>
        <td>18</td>
    </tr>
    <tr>
        <td>HOPE TOOTSIE</td>
        <td>18</td>
    </tr>
    <tr>
        <td>POLISH BROOKLYN</td>
        <td>18</td>
    </tr>
    <tr>
        <td>POLLOCK DELIVERANCE</td>
        <td>18</td>
    </tr>
    <tr>
        <td>INSTINCT AIRPORT</td>
        <td>18</td>
    </tr>
    <tr>
        <td>MISSION ZOOLANDER</td>
        <td>18</td>
    </tr>
    <tr>
        <td>CAROL TEXAS</td>
        <td>18</td>
    </tr>
    <tr>
        <td>ROUGE SQUAD</td>
        <td>18</td>
    </tr>
    <tr>
        <td>PARADISE SABRINA</td>
        <td>18</td>
    </tr>
    <tr>
        <td>WONKA SEA</td>
        <td>18</td>
    </tr>
    <tr>
        <td>CANDIDATE PERDITION</td>
        <td>18</td>
    </tr>
    <tr>
        <td>BIRDS PERDITION</td>
        <td>18</td>
    </tr>
    <tr>
        <td>CORE SUIT</td>
        <td>18</td>
    </tr>
    <tr>
        <td>SMOKING BARBARELLA</td>
        <td>18</td>
    </tr>
    <tr>
        <td>GALAXY SWEETHEARTS</td>
        <td>18</td>
    </tr>
    <tr>
        <td>AIRPORT POLLOCK</td>
        <td>18</td>
    </tr>
    <tr>
        <td>BAREFOOT MANCHURIAN</td>
        <td>18</td>
    </tr>
    <tr>
        <td>CLEOPATRA DEVIL</td>
        <td>18</td>
    </tr>
    <tr>
        <td>JACKET FRISCO</td>
        <td>18</td>
    </tr>
    <tr>
        <td>GROUNDHOG UNCUT</td>
        <td>18</td>
    </tr>
    <tr>
        <td>WEEKEND PERSONAL</td>
        <td>18</td>
    </tr>
    <tr>
        <td>SUGAR WONKA</td>
        <td>17</td>
    </tr>
    <tr>
        <td>FLINTSTONES HAPPINESS</td>
        <td>17</td>
    </tr>
    <tr>
        <td>LEAGUE HELLFIGHTERS</td>
        <td>17</td>
    </tr>
    <tr>
        <td>WATERFRONT DELIVERANCE</td>
        <td>17</td>
    </tr>
    <tr>
        <td>MIDNIGHT WESTWARD</td>
        <td>17</td>
    </tr>
    <tr>
        <td>MUSKETEERS WAIT</td>
        <td>17</td>
    </tr>
    <tr>
        <td>FRENCH HOLIDAY</td>
        <td>17</td>
    </tr>
    <tr>
        <td>ROOTS REMEMBER</td>
        <td>17</td>
    </tr>
    <tr>
        <td>SATISFACTION CONFIDENTIAL</td>
        <td>17</td>
    </tr>
    <tr>
        <td>IDAHO LOVE</td>
        <td>17</td>
    </tr>
    <tr>
        <td>NOON PAPI</td>
        <td>17</td>
    </tr>
    <tr>
        <td>GREEK EVERYONE</td>
        <td>17</td>
    </tr>
    <tr>
        <td>TEEN APOLLO</td>
        <td>17</td>
    </tr>
    <tr>
        <td>ZOOLANDER FICTION</td>
        <td>17</td>
    </tr>
    <tr>
        <td>HANOVER GALAXY</td>
        <td>17</td>
    </tr>
    <tr>
        <td>ROCK INSTINCT</td>
        <td>17</td>
    </tr>
    <tr>
        <td>BEACH HEARTBREAKERS</td>
        <td>17</td>
    </tr>
    <tr>
        <td>INTENTIONS EMPIRE</td>
        <td>17</td>
    </tr>
    <tr>
        <td>FACTORY DRAGON</td>
        <td>17</td>
    </tr>
    <tr>
        <td>POTTER CONNECTICUT</td>
        <td>17</td>
    </tr>
    <tr>
        <td>PERFECT GROOVE</td>
        <td>17</td>
    </tr>
    <tr>
        <td>SLACKER LIAISONS</td>
        <td>17</td>
    </tr>
    <tr>
        <td>GANDHI KWAI</td>
        <td>17</td>
    </tr>
    <tr>
        <td>HOLOCAUST HIGHBALL</td>
        <td>17</td>
    </tr>
    <tr>
        <td>NEWTON LABYRINTH</td>
        <td>17</td>
    </tr>
    <tr>
        <td>LOUISIANA HARRY</td>
        <td>17</td>
    </tr>
    <tr>
        <td>TAXI KICK</td>
        <td>17</td>
    </tr>
    <tr>
        <td>DYING MAKER</td>
        <td>17</td>
    </tr>
    <tr>
        <td>REAR TRADING</td>
        <td>17</td>
    </tr>
    <tr>
        <td>FREAKY POCUS</td>
        <td>17</td>
    </tr>
    <tr>
        <td>UNITED PILOT</td>
        <td>17</td>
    </tr>
    <tr>
        <td>EGYPT TENENBAUMS</td>
        <td>17</td>
    </tr>
    <tr>
        <td>POSEIDON FOREVER</td>
        <td>17</td>
    </tr>
    <tr>
        <td>COMFORTS RUSH</td>
        <td>17</td>
    </tr>
    <tr>
        <td>VIRGIN DAISY</td>
        <td>17</td>
    </tr>
    <tr>
        <td>JERICHO MULAN</td>
        <td>17</td>
    </tr>
    <tr>
        <td>MAJESTIC FLOATS</td>
        <td>17</td>
    </tr>
    <tr>
        <td>JEKYLL FROGMEN</td>
        <td>17</td>
    </tr>
    <tr>
        <td>LADY STAGE</td>
        <td>17</td>
    </tr>
    <tr>
        <td>MASK PEACH</td>
        <td>17</td>
    </tr>
    <tr>
        <td>JOON NORTHWEST</td>
        <td>17</td>
    </tr>
    <tr>
        <td>LAWLESS VISION</td>
        <td>17</td>
    </tr>
    <tr>
        <td>CONVERSATION DOWNHILL</td>
        <td>17</td>
    </tr>
    <tr>
        <td>STRANGERS GRAFFITI</td>
        <td>17</td>
    </tr>
    <tr>
        <td>BIKINI BORROWERS</td>
        <td>17</td>
    </tr>
    <tr>
        <td>CONFUSED CANDLES</td>
        <td>17</td>
    </tr>
    <tr>
        <td>FERRIS MOTHER</td>
        <td>17</td>
    </tr>
    <tr>
        <td>ORIENT CLOSER</td>
        <td>17</td>
    </tr>
    <tr>
        <td>BREAKFAST GOLDFINGER</td>
        <td>17</td>
    </tr>
    <tr>
        <td>REAP UNFAITHFUL</td>
        <td>16</td>
    </tr>
    <tr>
        <td>WORDS HUNTER</td>
        <td>16</td>
    </tr>
    <tr>
        <td>MUMMY CREATURES</td>
        <td>16</td>
    </tr>
    <tr>
        <td>LOCK REAR</td>
        <td>16</td>
    </tr>
    <tr>
        <td>ATTACKS HATE</td>
        <td>16</td>
    </tr>
    <tr>
        <td>WATCH TRACY</td>
        <td>16</td>
    </tr>
    <tr>
        <td>SUMMER SCARFACE</td>
        <td>16</td>
    </tr>
    <tr>
        <td>ROCKY WAR</td>
        <td>16</td>
    </tr>
    <tr>
        <td>WORST BANGER</td>
        <td>16</td>
    </tr>
    <tr>
        <td>BAKED CLEOPATRA</td>
        <td>16</td>
    </tr>
    <tr>
        <td>CREATURES SHAKESPEARE</td>
        <td>16</td>
    </tr>
    <tr>
        <td>DAISY MENAGERIE</td>
        <td>16</td>
    </tr>
    <tr>
        <td>INDIAN LOVE</td>
        <td>16</td>
    </tr>
    <tr>
        <td>BONNIE HOLOCAUST</td>
        <td>16</td>
    </tr>
    <tr>
        <td>GRADUATE LORD</td>
        <td>16</td>
    </tr>
    <tr>
        <td>MOTIONS DETAILS</td>
        <td>16</td>
    </tr>
    <tr>
        <td>GASLIGHT CRUSADE</td>
        <td>16</td>
    </tr>
    <tr>
        <td>TRAP GUYS</td>
        <td>16</td>
    </tr>
    <tr>
        <td>PICKUP DRIVING</td>
        <td>16</td>
    </tr>
    <tr>
        <td>SAGEBRUSH CLUELESS</td>
        <td>16</td>
    </tr>
    <tr>
        <td>UPRISING UPTOWN</td>
        <td>16</td>
    </tr>
    <tr>
        <td>CHICAGO NORTH</td>
        <td>16</td>
    </tr>
    <tr>
        <td>HOMEWARD CIDER</td>
        <td>16</td>
    </tr>
    <tr>
        <td>DESTINY SATURDAY</td>
        <td>16</td>
    </tr>
    <tr>
        <td>PILOT HOOSIERS</td>
        <td>16</td>
    </tr>
    <tr>
        <td>RULES HUMAN</td>
        <td>16</td>
    </tr>
    <tr>
        <td>DUDE BLINDNESS</td>
        <td>16</td>
    </tr>
    <tr>
        <td>ARTIST COLDBLOODED</td>
        <td>16</td>
    </tr>
    <tr>
        <td>MERMAID INSECTS</td>
        <td>16</td>
    </tr>
    <tr>
        <td>ARMY FLINTSTONES</td>
        <td>16</td>
    </tr>
    <tr>
        <td>PRIDE ALAMO</td>
        <td>16</td>
    </tr>
    <tr>
        <td>PAYCHECK WAIT</td>
        <td>16</td>
    </tr>
    <tr>
        <td>BULL SHAWSHANK</td>
        <td>16</td>
    </tr>
    <tr>
        <td>WANDA CHAMBER</td>
        <td>16</td>
    </tr>
    <tr>
        <td>PLUTO OLEANDER</td>
        <td>16</td>
    </tr>
    <tr>
        <td>CASABLANCA SUPER</td>
        <td>16</td>
    </tr>
    <tr>
        <td>CRAFT OUTFIELD</td>
        <td>16</td>
    </tr>
    <tr>
        <td>SLIPPER FIDELITY</td>
        <td>16</td>
    </tr>
    <tr>
        <td>STREAK RIDGEMONT</td>
        <td>16</td>
    </tr>
    <tr>
        <td>WIZARD COLDBLOODED</td>
        <td>16</td>
    </tr>
    <tr>
        <td>MOULIN WAKE</td>
        <td>16</td>
    </tr>
    <tr>
        <td>CADDYSHACK JEDI</td>
        <td>16</td>
    </tr>
    <tr>
        <td>COMMAND DARLING</td>
        <td>16</td>
    </tr>
    <tr>
        <td>PATRIOT ROMAN</td>
        <td>16</td>
    </tr>
    <tr>
        <td>QUILLS BULL</td>
        <td>16</td>
    </tr>
    <tr>
        <td>WILLOW TRACY</td>
        <td>16</td>
    </tr>
    <tr>
        <td>PURE RUNNER</td>
        <td>16</td>
    </tr>
    <tr>
        <td>WEST LION</td>
        <td>16</td>
    </tr>
    <tr>
        <td>VARSITY TRIP</td>
        <td>16</td>
    </tr>
    <tr>
        <td>CONQUERER NUTS</td>
        <td>16</td>
    </tr>
    <tr>
        <td>SILENCE KANE</td>
        <td>16</td>
    </tr>
    <tr>
        <td>HALL CASSIDY</td>
        <td>16</td>
    </tr>
    <tr>
        <td>COLDBLOODED DARLING</td>
        <td>16</td>
    </tr>
    <tr>
        <td>JEEPERS WEDDING</td>
        <td>16</td>
    </tr>
    <tr>
        <td>STEERS ARMAGEDDON</td>
        <td>15</td>
    </tr>
    <tr>
        <td>SUBMARINE BED</td>
        <td>15</td>
    </tr>
    <tr>
        <td>CABIN FLASH</td>
        <td>15</td>
    </tr>
    <tr>
        <td>HOLES BRANNIGAN</td>
        <td>15</td>
    </tr>
    <tr>
        <td>HUMAN GRAFFITI</td>
        <td>15</td>
    </tr>
    <tr>
        <td>BETRAYED REAR</td>
        <td>15</td>
    </tr>
    <tr>
        <td>EDGE KISSING</td>
        <td>15</td>
    </tr>
    <tr>
        <td>SWEET BROTHERHOOD</td>
        <td>15</td>
    </tr>
    <tr>
        <td>DIVINE RESURRECTION</td>
        <td>15</td>
    </tr>
    <tr>
        <td>ILLUSION AMELIE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>RINGS HEARTBREAKERS</td>
        <td>15</td>
    </tr>
    <tr>
        <td>MONSTER SPARTACUS</td>
        <td>15</td>
    </tr>
    <tr>
        <td>NECKLACE OUTBREAK</td>
        <td>15</td>
    </tr>
    <tr>
        <td>MODERN DORADO</td>
        <td>15</td>
    </tr>
    <tr>
        <td>DEVIL DESIRE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>LABYRINTH LEAGUE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>HYSTERICAL GRAIL</td>
        <td>15</td>
    </tr>
    <tr>
        <td>SHREK LICENSE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>AIRPLANE SIERRA</td>
        <td>15</td>
    </tr>
    <tr>
        <td>DIRTY ACE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>TRANSLATION SUMMER</td>
        <td>15</td>
    </tr>
    <tr>
        <td>LONELY ELEPHANT</td>
        <td>15</td>
    </tr>
    <tr>
        <td>MADISON TRAP</td>
        <td>15</td>
    </tr>
    <tr>
        <td>CYCLONE FAMILY</td>
        <td>15</td>
    </tr>
    <tr>
        <td>WASTELAND DIVINE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>ANTHEM LUKE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>NASH CHOCOLAT</td>
        <td>15</td>
    </tr>
    <tr>
        <td>ENTRAPMENT SATISFACTION</td>
        <td>15</td>
    </tr>
    <tr>
        <td>PANTHER REDS</td>
        <td>15</td>
    </tr>
    <tr>
        <td>CIRCUS YOUTH</td>
        <td>15</td>
    </tr>
    <tr>
        <td>TOOTSIE PILOT</td>
        <td>15</td>
    </tr>
    <tr>
        <td>ODDS BOOGIE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>HUNTING MUSKETEERS</td>
        <td>15</td>
    </tr>
    <tr>
        <td>MODEL FISH</td>
        <td>15</td>
    </tr>
    <tr>
        <td>VALLEY PACKER</td>
        <td>15</td>
    </tr>
    <tr>
        <td>WORKER TARZAN</td>
        <td>15</td>
    </tr>
    <tr>
        <td>PANKY SUBMARINE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>SIEGE MADRE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>SIERRA DIVIDE</td>
        <td>15</td>
    </tr>
    <tr>
        <td>SPIRIT FLINTSTONES</td>
        <td>15</td>
    </tr>
    <tr>
        <td>SHIP WONDERLAND</td>
        <td>15</td>
    </tr>
    <tr>
        <td>MOSQUITO ARMAGEDDON</td>
        <td>15</td>
    </tr>
    <tr>
        <td>LUST LOCK</td>
        <td>15</td>
    </tr>
    <tr>
        <td>SONS INTERVIEW</td>
        <td>15</td>
    </tr>
    <tr>
        <td>HOLIDAY GAMES</td>
        <td>15</td>
    </tr>
    <tr>
        <td>SCISSORHANDS SLUMS</td>
        <td>15</td>
    </tr>
    <tr>
        <td>MANCHURIAN CURTAIN</td>
        <td>15</td>
    </tr>
    <tr>
        <td>LOSER HUSTLER</td>
        <td>15</td>
    </tr>
    <tr>
        <td>BOILED DARES</td>
        <td>15</td>
    </tr>
    <tr>
        <td>VIETNAM SMOOCHY</td>
        <td>15</td>
    </tr>
    <tr>
        <td>CHARADE DUFFEL</td>
        <td>15</td>
    </tr>
    <tr>
        <td>BLINDNESS GUN</td>
        <td>14</td>
    </tr>
    <tr>
        <td>TOWN ARK</td>
        <td>14</td>
    </tr>
    <tr>
        <td>KANE EXORCIST</td>
        <td>14</td>
    </tr>
    <tr>
        <td>MOTHER OLEANDER</td>
        <td>14</td>
    </tr>
    <tr>
        <td>PARIS WEEKEND</td>
        <td>14</td>
    </tr>
    <tr>
        <td>MADRE GABLES</td>
        <td>14</td>
    </tr>
    <tr>
        <td>TURN STAR</td>
        <td>14</td>
    </tr>
    <tr>
        <td>GAMES BOWFINGER</td>
        <td>14</td>
    </tr>
    <tr>
        <td>DANCES NONE</td>
        <td>14</td>
    </tr>
    <tr>
        <td>SEARCHERS WAIT</td>
        <td>14</td>
    </tr>
    <tr>
        <td>CREEPERS KANE</td>
        <td>14</td>
    </tr>
    <tr>
        <td>LOVELY JINGLE</td>
        <td>14</td>
    </tr>
    <tr>
        <td>JAWS HARRY</td>
        <td>14</td>
    </tr>
    <tr>
        <td>NEMO CAMPUS</td>
        <td>14</td>
    </tr>
    <tr>
        <td>GOLD RIVER</td>
        <td>14</td>
    </tr>
    <tr>
        <td>TOMATOES HELLFIGHTERS</td>
        <td>14</td>
    </tr>
    <tr>
        <td>DEEP CRUSADE</td>
        <td>14</td>
    </tr>
    <tr>
        <td>GRINCH MASSAGE</td>
        <td>14</td>
    </tr>
    <tr>
        <td>SADDLE ANTITRUST</td>
        <td>14</td>
    </tr>
    <tr>
        <td>PEACH INNOCENT</td>
        <td>14</td>
    </tr>
    <tr>
        <td>STAMPEDE DISTURBING</td>
        <td>14</td>
    </tr>
    <tr>
        <td>VIRTUAL SPOILERS</td>
        <td>14</td>
    </tr>
    <tr>
        <td>UNCUT SUICIDES</td>
        <td>14</td>
    </tr>
    <tr>
        <td>STOCK GLASS</td>
        <td>14</td>
    </tr>
    <tr>
        <td>ALLEY EVOLUTION</td>
        <td>14</td>
    </tr>
    <tr>
        <td>GLASS DYING</td>
        <td>14</td>
    </tr>
    <tr>
        <td>PAJAMA JAWBREAKER</td>
        <td>14</td>
    </tr>
    <tr>
        <td>ELEPHANT TROJAN</td>
        <td>14</td>
    </tr>
    <tr>
        <td>CONFESSIONS MAGUIRE</td>
        <td>14</td>
    </tr>
    <tr>
        <td>OUTLAW HANKY</td>
        <td>14</td>
    </tr>
    <tr>
        <td>NOTORIOUS REUNION</td>
        <td>14</td>
    </tr>
    <tr>
        <td>GREEDY ROOTS</td>
        <td>14</td>
    </tr>
    <tr>
        <td>WRATH MILE</td>
        <td>14</td>
    </tr>
    <tr>
        <td>ANALYZE HOOSIERS</td>
        <td>14</td>
    </tr>
    <tr>
        <td>DAY UNFAITHFUL</td>
        <td>14</td>
    </tr>
    <tr>
        <td>SHANE DARKNESS</td>
        <td>14</td>
    </tr>
    <tr>
        <td>SHRUNK DIVINE</td>
        <td>14</td>
    </tr>
    <tr>
        <td>IMAGE PRINCESS</td>
        <td>14</td>
    </tr>
    <tr>
        <td>SHANGHAI TYCOON</td>
        <td>14</td>
    </tr>
    <tr>
        <td>HAMLET WISDOM</td>
        <td>14</td>
    </tr>
    <tr>
        <td>TROOPERS METAL</td>
        <td>14</td>
    </tr>
    <tr>
        <td>WEREWOLF LOLA</td>
        <td>14</td>
    </tr>
    <tr>
        <td>HOME PITY</td>
        <td>14</td>
    </tr>
    <tr>
        <td>PERSONAL LADYBUGS</td>
        <td>14</td>
    </tr>
    <tr>
        <td>SPLASH GUMP</td>
        <td>14</td>
    </tr>
    <tr>
        <td>DONNIE ALLEY</td>
        <td>14</td>
    </tr>
    <tr>
        <td>IMPOSSIBLE PREJUDICE</td>
        <td>14</td>
    </tr>
    <tr>
        <td>DRUMS DYNAMITE</td>
        <td>13</td>
    </tr>
    <tr>
        <td>CITIZEN SHREK</td>
        <td>13</td>
    </tr>
    <tr>
        <td>JINGLE SAGEBRUSH</td>
        <td>13</td>
    </tr>
    <tr>
        <td>BRIGHT ENCOUNTERS</td>
        <td>13</td>
    </tr>
    <tr>
        <td>PURPLE MOVIE</td>
        <td>13</td>
    </tr>
    <tr>
        <td>CHAMBER ITALIAN</td>
        <td>13</td>
    </tr>
    <tr>
        <td>PAST SUICIDES</td>
        <td>13</td>
    </tr>
    <tr>
        <td>IDENTITY LOVER</td>
        <td>13</td>
    </tr>
    <tr>
        <td>FLASH WARS</td>
        <td>13</td>
    </tr>
    <tr>
        <td>WYOMING STORM</td>
        <td>13</td>
    </tr>
    <tr>
        <td>PARTY KNOCK</td>
        <td>13</td>
    </tr>
    <tr>
        <td>LUCKY FLYING</td>
        <td>13</td>
    </tr>
    <tr>
        <td>EXORCIST STING</td>
        <td>13</td>
    </tr>
    <tr>
        <td>CONNECTICUT TRAMP</td>
        <td>13</td>
    </tr>
    <tr>
        <td>NATURAL STOCK</td>
        <td>13</td>
    </tr>
    <tr>
        <td>MEMENTO ZOOLANDER</td>
        <td>13</td>
    </tr>
    <tr>
        <td>SUPER WYOMING</td>
        <td>13</td>
    </tr>
    <tr>
        <td>ANONYMOUS HUMAN</td>
        <td>13</td>
    </tr>
    <tr>
        <td>TENENBAUMS COMMAND</td>
        <td>13</td>
    </tr>
    <tr>
        <td>CHISUM BEHAVIOR</td>
        <td>13</td>
    </tr>
    <tr>
        <td>DADDY PITTSBURGH</td>
        <td>13</td>
    </tr>
    <tr>
        <td>BREAKING HOME</td>
        <td>13</td>
    </tr>
    <tr>
        <td>LAWRENCE LOVE</td>
        <td>13</td>
    </tr>
    <tr>
        <td>CHAMPION FLATLINERS</td>
        <td>13</td>
    </tr>
    <tr>
        <td>MONTEREY LABYRINTH</td>
        <td>13</td>
    </tr>
    <tr>
        <td>ARABIA DOGMA</td>
        <td>13</td>
    </tr>
    <tr>
        <td>BEDAZZLED MARRIED</td>
        <td>13</td>
    </tr>
    <tr>
        <td>RAGING AIRPLANE</td>
        <td>13</td>
    </tr>
    <tr>
        <td>HOLLYWOOD ANONYMOUS</td>
        <td>13</td>
    </tr>
    <tr>
        <td>SASSY PACKER</td>
        <td>13</td>
    </tr>
    <tr>
        <td>STATE WASTELAND</td>
        <td>13</td>
    </tr>
    <tr>
        <td>MILE MULAN</td>
        <td>13</td>
    </tr>
    <tr>
        <td>SPINAL ROCKY</td>
        <td>13</td>
    </tr>
    <tr>
        <td>USUAL UNTOUCHABLES</td>
        <td>13</td>
    </tr>
    <tr>
        <td>DATE SPEED</td>
        <td>13</td>
    </tr>
    <tr>
        <td>FOREVER CANDIDATE</td>
        <td>13</td>
    </tr>
    <tr>
        <td>CINCINATTI WHISPERER</td>
        <td>13</td>
    </tr>
    <tr>
        <td>HOOK CHARIOTS</td>
        <td>13</td>
    </tr>
    <tr>
        <td>HUNGER ROOF</td>
        <td>13</td>
    </tr>
    <tr>
        <td>BEHAVIOR RUNAWAY</td>
        <td>13</td>
    </tr>
    <tr>
        <td>SATURN NAME</td>
        <td>13</td>
    </tr>
    <tr>
        <td>EXPRESS LONELY</td>
        <td>13</td>
    </tr>
    <tr>
        <td>SPIKING ELEMENT</td>
        <td>13</td>
    </tr>
    <tr>
        <td>OPPOSITE NECKLACE</td>
        <td>13</td>
    </tr>
    <tr>
        <td>MICROCOSMOS PARADISE</td>
        <td>13</td>
    </tr>
    <tr>
        <td>TUXEDO MILE</td>
        <td>13</td>
    </tr>
    <tr>
        <td>MOONWALKER FOOL</td>
        <td>13</td>
    </tr>
    <tr>
        <td>EVERYONE CRAFT</td>
        <td>13</td>
    </tr>
    <tr>
        <td>MULAN MOON</td>
        <td>13</td>
    </tr>
    <tr>
        <td>DARKNESS WAR</td>
        <td>13</td>
    </tr>
    <tr>
        <td>ROBBERY BRIGHT</td>
        <td>13</td>
    </tr>
    <tr>
        <td>BILKO ANONYMOUS</td>
        <td>13</td>
    </tr>
    <tr>
        <td>ADAPTATION HOLES</td>
        <td>12</td>
    </tr>
    <tr>
        <td>FINDING ANACONDA</td>
        <td>12</td>
    </tr>
    <tr>
        <td>LOVERBOY ATTACKS</td>
        <td>12</td>
    </tr>
    <tr>
        <td>FLIGHT LIES</td>
        <td>12</td>
    </tr>
    <tr>
        <td>MEET CHOCOLATE</td>
        <td>12</td>
    </tr>
    <tr>
        <td>LOST BIRD</td>
        <td>12</td>
    </tr>
    <tr>
        <td>CALIFORNIA BIRDS</td>
        <td>12</td>
    </tr>
    <tr>
        <td>LIBERTY MAGNIFICENT</td>
        <td>12</td>
    </tr>
    <tr>
        <td>SMOOCHY CONTROL</td>
        <td>12</td>
    </tr>
    <tr>
        <td>MOB DUFFEL</td>
        <td>12</td>
    </tr>
    <tr>
        <td>SAVANNAH TOWN</td>
        <td>12</td>
    </tr>
    <tr>
        <td>SILVERADO GOLDFINGER</td>
        <td>12</td>
    </tr>
    <tr>
        <td>EVOLUTION ALTER</td>
        <td>12</td>
    </tr>
    <tr>
        <td>WAR NOTTING</td>
        <td>12</td>
    </tr>
    <tr>
        <td>HEDWIG ALTER</td>
        <td>12</td>
    </tr>
    <tr>
        <td>MINORITY KISS</td>
        <td>12</td>
    </tr>
    <tr>
        <td>PITTSBURGH HUNCHBACK</td>
        <td>12</td>
    </tr>
    <tr>
        <td>TYCOON GATHERING</td>
        <td>12</td>
    </tr>
    <tr>
        <td>TEMPLE ATTRACTION</td>
        <td>12</td>
    </tr>
    <tr>
        <td>BORN SPINAL</td>
        <td>12</td>
    </tr>
    <tr>
        <td>MIGHTY LUCK</td>
        <td>12</td>
    </tr>
    <tr>
        <td>VALENTINE VANISHING</td>
        <td>12</td>
    </tr>
    <tr>
        <td>AFRICAN EGG</td>
        <td>12</td>
    </tr>
    <tr>
        <td>UPTOWN YOUNG</td>
        <td>12</td>
    </tr>
    <tr>
        <td>BRANNIGAN SUNRISE</td>
        <td>12</td>
    </tr>
    <tr>
        <td>BLANKET BEVERLY</td>
        <td>12</td>
    </tr>
    <tr>
        <td>SIDE ARK</td>
        <td>12</td>
    </tr>
    <tr>
        <td>DANGEROUS UPTOWN</td>
        <td>12</td>
    </tr>
    <tr>
        <td>GUNFIGHTER MUSSOLINI</td>
        <td>12</td>
    </tr>
    <tr>
        <td>WINDOW SIDE</td>
        <td>12</td>
    </tr>
    <tr>
        <td>SORORITY QUEEN</td>
        <td>12</td>
    </tr>
    <tr>
        <td>VAMPIRE WHALE</td>
        <td>12</td>
    </tr>
    <tr>
        <td>CROW GREASE</td>
        <td>12</td>
    </tr>
    <tr>
        <td>ALABAMA DEVIL</td>
        <td>12</td>
    </tr>
    <tr>
        <td>MASSAGE IMAGE</td>
        <td>12</td>
    </tr>
    <tr>
        <td>SPEAKEASY DATE</td>
        <td>12</td>
    </tr>
    <tr>
        <td>CRANES RESERVOIR</td>
        <td>11</td>
    </tr>
    <tr>
        <td>PRIX UNDEFEATED</td>
        <td>11</td>
    </tr>
    <tr>
        <td>THEORY MERMAID</td>
        <td>11</td>
    </tr>
    <tr>
        <td>BOWFINGER GABLES</td>
        <td>11</td>
    </tr>
    <tr>
        <td>ENDING CROWDS</td>
        <td>11</td>
    </tr>
    <tr>
        <td>STONE FIRE</td>
        <td>11</td>
    </tr>
    <tr>
        <td>FRIDA SLIPPER</td>
        <td>11</td>
    </tr>
    <tr>
        <td>DRUMLINE CYCLONE</td>
        <td>11</td>
    </tr>
    <tr>
        <td>IRON MOON</td>
        <td>11</td>
    </tr>
    <tr>
        <td>OPUS ICE</td>
        <td>11</td>
    </tr>
    <tr>
        <td>FUGITIVE MAGUIRE</td>
        <td>11</td>
    </tr>
    <tr>
        <td>TIES HUNGER</td>
        <td>11</td>
    </tr>
    <tr>
        <td>BUGSY SONG</td>
        <td>11</td>
    </tr>
    <tr>
        <td>DARKO DORADO</td>
        <td>11</td>
    </tr>
    <tr>
        <td>BEETHOVEN EXORCIST</td>
        <td>11</td>
    </tr>
    <tr>
        <td>REEF SALUTE</td>
        <td>11</td>
    </tr>
    <tr>
        <td>BIRCH ANTITRUST</td>
        <td>11</td>
    </tr>
    <tr>
        <td>LANGUAGE COWBOY</td>
        <td>11</td>
    </tr>
    <tr>
        <td>SPIRITED CASUALTIES</td>
        <td>11</td>
    </tr>
    <tr>
        <td>THIN SAGEBRUSH</td>
        <td>11</td>
    </tr>
    <tr>
        <td>NORTH TEQUILA</td>
        <td>11</td>
    </tr>
    <tr>
        <td>FEATHERS METAL</td>
        <td>11</td>
    </tr>
    <tr>
        <td>DRAGON SQUAD</td>
        <td>11</td>
    </tr>
    <tr>
        <td>TWISTED PIRATES</td>
        <td>11</td>
    </tr>
    <tr>
        <td>MAGNOLIA FORRESTER</td>
        <td>11</td>
    </tr>
    <tr>
        <td>TRAINSPOTTING STRANGERS</td>
        <td>11</td>
    </tr>
    <tr>
        <td>GATHERING CALENDAR</td>
        <td>11</td>
    </tr>
    <tr>
        <td>STRANGER STRANGERS</td>
        <td>11</td>
    </tr>
    <tr>
        <td>BEAST HUNCHBACK</td>
        <td>11</td>
    </tr>
    <tr>
        <td>AUTUMN CROW</td>
        <td>11</td>
    </tr>
    <tr>
        <td>MOD SECRETARY</td>
        <td>11</td>
    </tr>
    <tr>
        <td>LORD ARIZONA</td>
        <td>11</td>
    </tr>
    <tr>
        <td>TOWERS HURRICANE</td>
        <td>11</td>
    </tr>
    <tr>
        <td>RIDER CADDYSHACK</td>
        <td>11</td>
    </tr>
    <tr>
        <td>SANTA PARIS</td>
        <td>11</td>
    </tr>
    <tr>
        <td>POTLUCK MIXED</td>
        <td>11</td>
    </tr>
    <tr>
        <td>SONG HEDWIG</td>
        <td>11</td>
    </tr>
    <tr>
        <td>BIRD INDEPENDENCE</td>
        <td>11</td>
    </tr>
    <tr>
        <td>OCTOBER SUBMARINE</td>
        <td>11</td>
    </tr>
    <tr>
        <td>GONE TROUBLE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>LOVER TRUMAN</td>
        <td>10</td>
    </tr>
    <tr>
        <td>GRAIL FRANKENSTEIN</td>
        <td>10</td>
    </tr>
    <tr>
        <td>FROGMEN BREAKING</td>
        <td>10</td>
    </tr>
    <tr>
        <td>SUPERFLY TRIP</td>
        <td>10</td>
    </tr>
    <tr>
        <td>PATHS CONTROL</td>
        <td>10</td>
    </tr>
    <tr>
        <td>FIDDLER LOST</td>
        <td>10</td>
    </tr>
    <tr>
        <td>ELEMENT FREDDY</td>
        <td>10</td>
    </tr>
    <tr>
        <td>WAGON JAWS</td>
        <td>10</td>
    </tr>
    <tr>
        <td>ANTITRUST TOMATOES</td>
        <td>10</td>
    </tr>
    <tr>
        <td>ELIZABETH SHANE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>RIGHT CRANES</td>
        <td>10</td>
    </tr>
    <tr>
        <td>MYSTIC TRUMAN</td>
        <td>10</td>
    </tr>
    <tr>
        <td>OLEANDER CLUE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>LOLITA WORLD</td>
        <td>10</td>
    </tr>
    <tr>
        <td>AMELIE HELLFIGHTERS</td>
        <td>10</td>
    </tr>
    <tr>
        <td>JEOPARDY ENCINO</td>
        <td>10</td>
    </tr>
    <tr>
        <td>WARS PLUTO</td>
        <td>10</td>
    </tr>
    <tr>
        <td>BENEATH RUSH</td>
        <td>10</td>
    </tr>
    <tr>
        <td>NOTTING SPEAKEASY</td>
        <td>10</td>
    </tr>
    <tr>
        <td>LUCK OPUS</td>
        <td>10</td>
    </tr>
    <tr>
        <td>MAKER GABLES</td>
        <td>10</td>
    </tr>
    <tr>
        <td>SENSIBILITY REAR</td>
        <td>10</td>
    </tr>
    <tr>
        <td>HALLOWEEN NUTS</td>
        <td>10</td>
    </tr>
    <tr>
        <td>CLOCKWORK PARADISE</td>
        <td>10</td>
    </tr>
    <tr>
        <td>BLOOD ARGONAUTS</td>
        <td>10</td>
    </tr>
    <tr>
        <td>SMILE EARRING</td>
        <td>10</td>
    </tr>
    <tr>
        <td>ROLLERCOASTER BRINGING</td>
        <td>10</td>
    </tr>
    <tr>
        <td>RUN PACIFIC</td>
        <td>10</td>
    </tr>
    <tr>
        <td>DOUBTFIRE LABYRINTH</td>
        <td>10</td>
    </tr>
    <tr>
        <td>SPOILERS HELLFIGHTERS</td>
        <td>10</td>
    </tr>
    <tr>
        <td>JAWBREAKER BROOKLYN</td>
        <td>10</td>
    </tr>
    <tr>
        <td>LIFE TWISTED</td>
        <td>10</td>
    </tr>
    <tr>
        <td>HOLLOW JEOPARDY</td>
        <td>10</td>
    </tr>
    <tr>
        <td>MADIGAN DORADO</td>
        <td>10</td>
    </tr>
    <tr>
        <td>STAGE WORLD</td>
        <td>10</td>
    </tr>
    <tr>
        <td>LAMBS CINCINATTI</td>
        <td>10</td>
    </tr>
    <tr>
        <td>RESERVOIR ADAPTATION</td>
        <td>10</td>
    </tr>
    <tr>
        <td>WONDERFUL DROP</td>
        <td>9</td>
    </tr>
    <tr>
        <td>ANYTHING SAVANNAH</td>
        <td>9</td>
    </tr>
    <tr>
        <td>MIRACLE VIRTUAL</td>
        <td>9</td>
    </tr>
    <tr>
        <td>DARLING BREAKING</td>
        <td>9</td>
    </tr>
    <tr>
        <td>GHOSTBUSTERS ELF</td>
        <td>9</td>
    </tr>
    <tr>
        <td>DIARY PANIC</td>
        <td>9</td>
    </tr>
    <tr>
        <td>JUNGLE CLOSER</td>
        <td>9</td>
    </tr>
    <tr>
        <td>VICTORY ACADEMY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>KING EVOLUTION</td>
        <td>9</td>
    </tr>
    <tr>
        <td>CRAZY HOME</td>
        <td>9</td>
    </tr>
    <tr>
        <td>DOLLS RAGE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>NUTS TIES</td>
        <td>9</td>
    </tr>
    <tr>
        <td>LEGEND JEDI</td>
        <td>9</td>
    </tr>
    <tr>
        <td>MONTEZUMA COMMAND</td>
        <td>9</td>
    </tr>
    <tr>
        <td>HOLY TADPOLE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>CARIBBEAN LIBERTY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>SPARTACUS CHEAPER</td>
        <td>9</td>
    </tr>
    <tr>
        <td>MATRIX SNOWMAN</td>
        <td>9</td>
    </tr>
    <tr>
        <td>FRISCO FORREST</td>
        <td>9</td>
    </tr>
    <tr>
        <td>PLATOON INSTINCT</td>
        <td>9</td>
    </tr>
    <tr>
        <td>KRAMER CHOCOLATE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>BIRDCAGE CASPER</td>
        <td>9</td>
    </tr>
    <tr>
        <td>WISDOM WORKER</td>
        <td>9</td>
    </tr>
    <tr>
        <td>HOTEL HAPPINESS</td>
        <td>9</td>
    </tr>
    <tr>
        <td>DWARFS ALTER</td>
        <td>9</td>
    </tr>
    <tr>
        <td>GILBERT PELICAN</td>
        <td>9</td>
    </tr>
    <tr>
        <td>IMPACT ALADDIN</td>
        <td>9</td>
    </tr>
    <tr>
        <td>DROP WATERFRONT</td>
        <td>9</td>
    </tr>
    <tr>
        <td>VANILLA DAY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>RANDOM GO</td>
        <td>9</td>
    </tr>
    <tr>
        <td>SNATCHERS MONTEZUMA</td>
        <td>9</td>
    </tr>
    <tr>
        <td>ALI FOREVER</td>
        <td>9</td>
    </tr>
    <tr>
        <td>CASUALTIES ENCINO</td>
        <td>9</td>
    </tr>
    <tr>
        <td>INTOLERABLE INTENTIONS</td>
        <td>9</td>
    </tr>
    <tr>
        <td>ZHIVAGO CORE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>DARES PLUTO</td>
        <td>9</td>
    </tr>
    <tr>
        <td>LEGALLY SECRETARY</td>
        <td>9</td>
    </tr>
    <tr>
        <td>DAUGHTER MADIGAN</td>
        <td>9</td>
    </tr>
    <tr>
        <td>MONSOON CAUSE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>SPEED SUIT</td>
        <td>9</td>
    </tr>
    <tr>
        <td>GUYS FALCON</td>
        <td>9</td>
    </tr>
    <tr>
        <td>REDS POCUS</td>
        <td>9</td>
    </tr>
    <tr>
        <td>MAGUIRE APACHE</td>
        <td>9</td>
    </tr>
    <tr>
        <td>WON DARES</td>
        <td>9</td>
    </tr>
    <tr>
        <td>PUNK DIVORCE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>RUNAWAY TENENBAUMS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>CLYDE THEORY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>WORLD LEATHERNECKS</td>
        <td>8</td>
    </tr>
    <tr>
        <td>DESTINATION JERK</td>
        <td>8</td>
    </tr>
    <tr>
        <td>GOSFORD DONNIE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>MAGNIFICENT CHITTY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>RECORDS ZORRO</td>
        <td>8</td>
    </tr>
    <tr>
        <td>GODFATHER DIARY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>PAPI NECKLACE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>GROSSE WONDERFUL</td>
        <td>8</td>
    </tr>
    <tr>
        <td>VERTIGO NORTHWEST</td>
        <td>8</td>
    </tr>
    <tr>
        <td>RUNNER MADIGAN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>JUMANJI BLADE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>UNTOUCHABLES SUNRISE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>SUNSET RACER</td>
        <td>8</td>
    </tr>
    <tr>
        <td>SOLDIERS EVOLUTION</td>
        <td>8</td>
    </tr>
    <tr>
        <td>SAINTS BRIDE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>REBEL AIRPORT</td>
        <td>8</td>
    </tr>
    <tr>
        <td>BALLROOM MOCKINGBIRD</td>
        <td>8</td>
    </tr>
    <tr>
        <td>DESIRE ALIEN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>MAUDE MOD</td>
        <td>8</td>
    </tr>
    <tr>
        <td>SOUP WISDOM</td>
        <td>8</td>
    </tr>
    <tr>
        <td>PET HAUNTING</td>
        <td>8</td>
    </tr>
    <tr>
        <td>CHITTY LOCK</td>
        <td>8</td>
    </tr>
    <tr>
        <td>HOOSIERS BIRDCAGE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>CASPER DRAGONFLY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>SHINING ROSES</td>
        <td>8</td>
    </tr>
    <tr>
        <td>CRUSADE HONEY</td>
        <td>8</td>
    </tr>
    <tr>
        <td>HAROLD FRENCH</td>
        <td>8</td>
    </tr>
    <tr>
        <td>BABY HALL</td>
        <td>8</td>
    </tr>
    <tr>
        <td>TARZAN VIDEOTAPE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>CHAPLIN LICENSE</td>
        <td>8</td>
    </tr>
    <tr>
        <td>PARK CITIZEN</td>
        <td>8</td>
    </tr>
    <tr>
        <td>UNFAITHFUL KILL</td>
        <td>8</td>
    </tr>
    <tr>
        <td>LIGHTS DEER</td>
        <td>8</td>
    </tr>
    <tr>
        <td>FIRE WOLVES</td>
        <td>7</td>
    </tr>
    <tr>
        <td>DIVORCE SHINING</td>
        <td>7</td>
    </tr>
    <tr>
        <td>MENAGERIE RUSHMORE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>ISHTAR ROCKETEER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>PRESIDENT BANG</td>
        <td>7</td>
    </tr>
    <tr>
        <td>DUFFEL APOCALYPSE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>CRUELTY UNFORGIVEN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>CONTROL ANTHEM</td>
        <td>7</td>
    </tr>
    <tr>
        <td>EARLY HOME</td>
        <td>7</td>
    </tr>
    <tr>
        <td>MAGIC MALLRATS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>PIZZA JUMANJI</td>
        <td>7</td>
    </tr>
    <tr>
        <td>HAWK CHILL</td>
        <td>7</td>
    </tr>
    <tr>
        <td>LESSON CLEOPATRA</td>
        <td>7</td>
    </tr>
    <tr>
        <td>CLERKS ANGELS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>DOZEN LION</td>
        <td>7</td>
    </tr>
    <tr>
        <td>MULHOLLAND BEAST</td>
        <td>7</td>
    </tr>
    <tr>
        <td>SENSE GREEK</td>
        <td>7</td>
    </tr>
    <tr>
        <td>VANISHED GARDEN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>EVE RESURRECTION</td>
        <td>7</td>
    </tr>
    <tr>
        <td>TREATMENT JEKYLL</td>
        <td>7</td>
    </tr>
    <tr>
        <td>LEATHERNECKS DWARFS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>VISION TORQUE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>CLUE GRAIL</td>
        <td>7</td>
    </tr>
    <tr>
        <td>ACE GOLDFINGER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>HEAVENLY GUN</td>
        <td>7</td>
    </tr>
    <tr>
        <td>LUKE MUMMY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>ELF MURDER</td>
        <td>7</td>
    </tr>
    <tr>
        <td>STALLION SUNDANCE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>YOUNG LANGUAGE</td>
        <td>7</td>
    </tr>
    <tr>
        <td>BULWORTH COMMANDMENTS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>DOCTOR GRAIL</td>
        <td>7</td>
    </tr>
    <tr>
        <td>NEWSIES STORY</td>
        <td>7</td>
    </tr>
    <tr>
        <td>COWBOY DOOM</td>
        <td>7</td>
    </tr>
    <tr>
        <td>SQUAD FISH</td>
        <td>7</td>
    </tr>
    <tr>
        <td>LICENSE WEEKEND</td>
        <td>7</td>
    </tr>
    <tr>
        <td>CONNECTION MICROCOSMOS</td>
        <td>7</td>
    </tr>
    <tr>
        <td>PANIC CLUB</td>
        <td>7</td>
    </tr>
    <tr>
        <td>BANG KWAI</td>
        <td>7</td>
    </tr>
    <tr>
        <td>WARLOCK WEREWOLF</td>
        <td>6</td>
    </tr>
    <tr>
        <td>PHANTOM GLORY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>CASSIDY WYOMING</td>
        <td>6</td>
    </tr>
    <tr>
        <td>EXTRAORDINARY CONQUERER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>YOUTH KICK</td>
        <td>6</td>
    </tr>
    <tr>
        <td>DESPERATE TRAINSPOTTING</td>
        <td>6</td>
    </tr>
    <tr>
        <td>JERSEY SASSY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>LADYBUGS ARMAGEDDON</td>
        <td>6</td>
    </tr>
    <tr>
        <td>HAUNTED ANTITRUST</td>
        <td>6</td>
    </tr>
    <tr>
        <td>DUMBO LUST</td>
        <td>6</td>
    </tr>
    <tr>
        <td>TERMINATOR CLUB</td>
        <td>6</td>
    </tr>
    <tr>
        <td>RUSHMORE MERMAID</td>
        <td>6</td>
    </tr>
    <tr>
        <td>GRACELAND DYNAMITE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>JAPANESE RUN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>HAPPINESS UNITED</td>
        <td>6</td>
    </tr>
    <tr>
        <td>WILD APOLLO</td>
        <td>6</td>
    </tr>
    <tr>
        <td>WATERSHIP FRONTIER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>SCHOOL JACKET</td>
        <td>6</td>
    </tr>
    <tr>
        <td>KILLER INNOCENT</td>
        <td>6</td>
    </tr>
    <tr>
        <td>TEXAS WATCH</td>
        <td>6</td>
    </tr>
    <tr>
        <td>BUBBLE GROSSE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>TEQUILA PAST</td>
        <td>6</td>
    </tr>
    <tr>
        <td>SIMON NORTH</td>
        <td>6</td>
    </tr>
    <tr>
        <td>SLING LUKE</td>
        <td>6</td>
    </tr>
    <tr>
        <td>COMANCHEROS ENEMY</td>
        <td>6</td>
    </tr>
    <tr>
        <td>FRONTIER CABIN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>APOCALYPSE FLAMINGOS</td>
        <td>6</td>
    </tr>
    <tr>
        <td>DUCK RACER</td>
        <td>6</td>
    </tr>
    <tr>
        <td>ITALIAN AFRICAN</td>
        <td>6</td>
    </tr>
    <tr>
        <td>OKLAHOMA JUMANJI</td>
        <td>6</td>
    </tr>
    <tr>
        <td>BED HIGHBALL</td>
        <td>6</td>
    </tr>
    <tr>
        <td>BRAVEHEART HUMAN</td>
        <td>5</td>
    </tr>
    <tr>
        <td>BUNCH MINDS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>FULL FLATLINERS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>INFORMER DOUBLE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>GLORY TRACY</td>
        <td>5</td>
    </tr>
    <tr>
        <td>FEVER EMPIRE</td>
        <td>5</td>
    </tr>
    <tr>
        <td>HUNTER ALTER</td>
        <td>5</td>
    </tr>
    <tr>
        <td>MUSSOLINI SPOILERS</td>
        <td>5</td>
    </tr>
    <tr>
        <td>CONSPIRACY SPIRIT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>FREEDOM CLEOPATRA</td>
        <td>5</td>
    </tr>
    <tr>
        <td>MANNEQUIN WORST</td>
        <td>5</td>
    </tr>
    <tr>
        <td>PRIVATE DROP</td>
        <td>5</td>
    </tr>
    <tr>
        <td>TRAFFIC HOBBIT</td>
        <td>5</td>
    </tr>
    <tr>
        <td>SEVEN SWARM</td>
        <td>5</td>
    </tr>
    <tr>
        <td>HARDLY ROBBERS</td>
        <td>4</td>
    </tr>
    <tr>
        <td>TRAIN BUNCH</td>
        <td>4</td>
    </tr>
    <tr>
        <td>MIXED DOORS</td>
        <td>4</td>
    </tr>
</table>



### 7f. Write a query to display how much business, in dollars, each store brought in.


```python
%%sql
SELECT store.store_id, sum(sales) AS total_sales 
FROM
	(select staff_id, sum(amount) as sales from payment
	group by staff_id) as sales,
    staff,
    store
WHERE sales.staff_id = staff.staff_id 
AND staff.store_id = store.store_id
GROUP BY store.store_id
;
```

    2 rows affected.





<table>
    <tr>
        <th>store_id</th>
        <th>total_sales</th>
    </tr>
    <tr>
        <td>1</td>
        <td>33489.47</td>
    </tr>
    <tr>
        <td>2</td>
        <td>33927.04</td>
    </tr>
</table>



### 7g. Write a query to display for each store its store ID, city, and country.


```python
%%sql
SELECT s.store_id, c.city, co.country
FROM store s, address a, city c, country co
WHERE s.address_id = a.address_id
AND a.city_id = c.city_id
AND c.country_id = co.country_id
;
```

    2 rows affected.





<table>
    <tr>
        <th>store_id</th>
        <th>city</th>
        <th>country</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Lethbridge</td>
        <td>Canada</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Woodridge</td>
        <td>Australia</td>
    </tr>
</table>



### 7h. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)


```python
%%sql
SELECT c.name AS genre, SUM(fr.revenue) AS gross_revenue
FROM 
	(SELECT i.film_id, SUM(sales.amount) AS revenue
	FROM 
		(SELECT sum(amount) amount, inventory_id
		FROM payment p, rental r
		WHERE p.rental_id = r.rental_id
		GROUP BY r.inventory_id) AS sales,
		inventory i
	WHERE i.inventory_id = sales.inventory_id
	GROUP BY i.film_id ) AS fr,
    film_category fc,
    category c
WHERE fr.film_id = fc.film_id
AND fc.category_id = c.category_id
GROUP BY c.category_id
ORDER BY gross_revenue DESC
;
```

    16 rows affected.





<table>
    <tr>
        <th>genre</th>
        <th>gross_revenue</th>
    </tr>
    <tr>
        <td>Sports</td>
        <td>5314.21</td>
    </tr>
    <tr>
        <td>Sci-Fi</td>
        <td>4756.98</td>
    </tr>
    <tr>
        <td>Animation</td>
        <td>4656.30</td>
    </tr>
    <tr>
        <td>Drama</td>
        <td>4587.39</td>
    </tr>
    <tr>
        <td>Comedy</td>
        <td>4383.58</td>
    </tr>
    <tr>
        <td>Action</td>
        <td>4375.85</td>
    </tr>
    <tr>
        <td>New</td>
        <td>4351.62</td>
    </tr>
    <tr>
        <td>Games</td>
        <td>4281.33</td>
    </tr>
    <tr>
        <td>Foreign</td>
        <td>4270.67</td>
    </tr>
    <tr>
        <td>Family</td>
        <td>4226.07</td>
    </tr>
    <tr>
        <td>Documentary</td>
        <td>4217.52</td>
    </tr>
    <tr>
        <td>Horror</td>
        <td>3722.54</td>
    </tr>
    <tr>
        <td>Children</td>
        <td>3655.55</td>
    </tr>
    <tr>
        <td>Classics</td>
        <td>3639.59</td>
    </tr>
    <tr>
        <td>Travel</td>
        <td>3549.64</td>
    </tr>
    <tr>
        <td>Music</td>
        <td>3417.72</td>
    </tr>
</table>



###  8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.


```python
%%sql
CREATE VIEW top_five_genres (id, genre, revenue)
AS 	
	SELECT c.category_id, c.name AS genre, SUM(fr.revenue) AS gross_revenue
	FROM 
		(SELECT i.film_id, SUM(sales.amount) AS revenue
		FROM 
			(SELECT sum(amount) amount, inventory_id
			FROM payment p, rental r
			WHERE p.rental_id = r.rental_id
			GROUP BY r.inventory_id) AS sales,
			inventory i
		WHERE i.inventory_id = sales.inventory_id
		GROUP BY i.film_id ) AS fr,
		film_category fc,
		category c
	WHERE fr.film_id = fc.film_id
	AND fc.category_id = c.category_id
	GROUP BY c.category_id
	ORDER BY gross_revenue DESC
    LIMIT 5
;
```

    0 rows affected.





    []



### 8b. How would you display the view that you created in 8a?


```python
%sql SELECT * FROM top_five_genres;
```

    5 rows affected.





<table>
    <tr>
        <th>id</th>
        <th>genre</th>
        <th>revenue</th>
    </tr>
    <tr>
        <td>15</td>
        <td>Sports</td>
        <td>5314.21</td>
    </tr>
    <tr>
        <td>14</td>
        <td>Sci-Fi</td>
        <td>4756.98</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Animation</td>
        <td>4656.30</td>
    </tr>
    <tr>
        <td>7</td>
        <td>Drama</td>
        <td>4587.39</td>
    </tr>
    <tr>
        <td>5</td>
        <td>Comedy</td>
        <td>4383.58</td>
    </tr>
</table>



### 8c. You find that you no longer need the view top_five_genres. Write a query to delete it.


```python
%%sql
DROP VIEW top_five_genres;
```

    0 rows affected.





    []


