-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)

INSERT INTO city (id, name, countrycode, district, population) values (4080,'Smallville','USA','Kansas',45001);

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.
INSERT INTO countrylanguage (countrycode, language,isofficial, percentage) values ('USA','Kryptonese',true,0);

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.
UPDATE  countrylanguage
SET language = 'Krypto-babble'
WHERE language =(SELECT language FROM countrylanguage WHERE  language='Kryptonese');


-- 4. Set the US captial to Smallville, Kansas in the country table.
UPDATE  country
SET capital = 4080
WHERE country =(SELECT  country FROM country WHERE  code = 'USA' );
-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
delete from city where id= 4080;
	yes

-- 6. Return the US captial to Washington.

UPDATE  country
SET capital = 3813
WHERE country =(SELECT  country FROM country WHERE  code = 'USA' );
-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
delete from city where id= 4080;
-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)
SELECT countrylanguage
SET isofficial = !isofficial
FROM countrylanguage d
inner join city a on d.countrycode = a.countrycode
inner join country r on a.countrycode = r.code
WHERE r.code=(select countrycode from country where indepyear >= 1800 AND indepyear <=  1972  );

-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4068 rows affected)

-- 10. Assuming a country's surfacearea is expressed in miles, convert it to 
-- meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)
