/*Vivek Panchal */

-- Q1 --

SELECT CONCAT(publisher.city,',',publisher.statecode) AS Location, COUNT(publisher.city) as Count
FROM Publisher
GROUP BY publisher.city,publisher.statecode
ORDER BY COUNT(publisher.city) ASC,CONCAT(publisher.city,',',publisher.statecode) DESC;

-- Q2 --

SELECT b.title, COUNT(br.Rating) as `Total Ratings`,MIN(br.Rating) as Low,MAX(br.Rating) as High,ROUND(AVG(br.Rating),2) as Average from book as b
LEFT OUTER JOIN BookReview as br
on b.ISBN = br.ISBN
GROUP BY b.title
ORDER BY COUNT(br.Rating) DESC,ROUND(AVG(br.Rating),2) DESC;

-- Q3 --

SELECT p.Name AS 'Publisher Name', COUNT(*) AS `Book Count`
FROM Book as b
LEFT JOIN Publisher as p
ON b.PublisherID = p.PublisherID
GROUP BY p.Name
HAVING `Book Count` > 2
ORDER BY COUNT(*) DESC;

-- Q4 --

SELECT Title,
LENGTH(Title) as Length,
SUBSTR(Title,INSTR(Title, 'bill')+4,LENGTH(Title)-INSTR(Title, 'bill')) as `After Bill`
FROM book
WHERE Title like '%bill%';

-- Q5 --

SELECT distinct b.title from book AS b
INNER JOIN ownersbook as o
ON o.ISBN = b.ISBN;






