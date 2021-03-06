/* Select World */
/*http://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial*/

/*Observe the result of running this SQL command to show the name, 
continent and population of all countries.  */

SELECT name, continent, population FROM world

/*Show the name for the countries that have a population 
of at least 200 million. 200 million is 200000000, there are eight zeros.  */

SELECT name FROM world
WHERE population >= 200000000

/* Give the name and the per capita GDP for those countries with a population of at least 200 million. */

SELECT name, gdp/population AS  per_capita
FROM world
WHERE population >= 200000000

/*Show the name and population in millions for the countries of the continent 'South America'. 
Divide the population by 1000000 to get population in millions.  */

SELECT name , population/1000000 AS population
FROM world
WHERE Continent = 'South America';

/*Show the name and population for France, Germany, Italy  */

SELECT name, population
FROM world
WHERE name IN ('France','Germany','Italy');

/*Show the countries which have a name that includes the word 'United'  */

SELECT name
FROM world
WHERE name LIKE '%United%';

/*Two ways to be big: A country is big if it has an area of more than 3 million sq km or it 
has a population of more than 250 million.
Show the countries that are big by area or big by population. Show name, population and area. */

SELECT name, population,area
FROM world
WHERE population >=250000000 OR area >= 3000000;

/*Exclusive OR (XOR). Show the countries that are big by area or big by population but 
not both. Show name, population and area. */

SELECT name, population,area
FROM world
WHERE population >=250000000 XOR area >= 3000000;

/*Show the name and population in millions and the GDP in billions for the countries of the continent 
'South America'. Use the ROUND function to show the values to two decimal places.
For South America show population in millions and GDP in billions both to 2 decimal places.*/

SELECT name, ROUND(population/1000000,2) AS population, ROUND(gdp/1000000000,2) AS GDP
FROM world
WHERE continent = 'South America';

/*Show the name and per-capita GDP for those countries with a GDP of at least one trillion
 (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000. */

SELECT name,  Round(gdp/population,-3) AS per_capita
FROM world
WHERE gdp>=1000000000000;

/*Greece has capital Athens.
Each of the strings 'Greece', and 'Athens' has 6 characters.
Show the name and capital where the name and the capital have the same number of characters. */

SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

 /*The capital of Sweden is Stockholm. Both words start with the letter 'S'.
Show the name and the capital where the first letters of each match. Don't
 include countries where the name and the capital are the same word. */

 SELECT name,  capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND  capital != name

/*Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. 
They don't count because they have more than one word in the name. */

SELECT name
   FROM world
WHERE name LIKE'%a%'AND name LIKE'%e%' AND name LIKE'%i%' AND  name LIKE'%o%' AND name LIKE'%u%' AND
name NOT LIKE '% %' ;

/*Nobel*/
/* http://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial */

/* Change the query shown so that it displays Nobel prizes for 1950.  */

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

/* Show who won the 1962 prize for Literature.  */

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

/*Show the year and subject that won 'Albert Einstein' his prize.  */

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

/*Give the name of the 'Peace' winners since the year 2000, including 2000.  */

SELECT Winner
from nobel
WHERE subject = 'Peace' AND yr >= 2000

/*Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. */

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature'
AND yr BETWEEN 1980 AND 1989;

/*Show all details of the presidential winners:
    Theodore Roosevelt
    Woodrow Wilson
    Jimmy Carter
    Barack Obama */

SELECT *
FROM nobel
WHERE WINNER IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter','Barack Obama');

/*Show the winners with first name John */

SELECT winner
FROM nobel
WHERE winner LIKE 'john_%'

/*Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984. */

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Physics' AND yr=1980
OR subject = 'Chemistry' AND yr=1984;

/*Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine */

SELECT yr, subject, winner
FROM nobel
WHERE yr=1980 AND
 subject NOT IN ('Chemistry','Medicine');

/*Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910)
together with winners of a 'Literature' prize in a later year (after 2004, including 2004) */

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Medicine' AND yr<1910 
OR subject = 'Literature' AND yr>=2004;

/*Harder Questions*/

/*Find all details of the prize won by PETER GRÜNBERG  */

SELECT *
FROM nobel
WHERE winner LIKE concat('%gr',char(252),'nberg');

/*Find all details of the prize won by EUGENE O'NEILL  */

SELECT *
FROM nobel
WHERE winner LIKE 'Eugene O\'Neill'

/*Knights in order
List the winners, year and subject where the winner starts with Sir. Show the the most 
recent first, then by name order. */

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir_%'
ORDER BY yr DESC;

/*The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last. */

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry') , subject,winner; 