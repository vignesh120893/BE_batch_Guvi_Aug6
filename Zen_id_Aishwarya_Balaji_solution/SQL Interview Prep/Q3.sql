--Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.

--Return the result table in any order.

--The query result format is in the following example.

 

--TVProgram table:
--+--------------------+--------------+-------------+
--| program_date       | content_id   | channel     |
--+--------------------+--------------+-------------+
--| 2020-06-10 08:00   | 1            | LC-Channel  |
--| 2020-05-11 12:00   | 2            | LC-Channel  |
--| 2020-05-12 12:00   | 3            | LC-Channel  |
--| 2020-05-13 14:00   | 4            | Disney Ch   |
--| 2020-06-18 14:00   | 4            | Disney Ch   |
--| 2020-07-15 16:00   | 5            | Disney Ch   |
--+--------------------+--------------+-------------+

--Content table:
--+------------+----------------+---------------+---------------+
--| content_id | title          | Kids_content  | content_type  |
--+------------+----------------+---------------+---------------+
--| 1          | ScienceFiction Movie | N             | Movies        |
--| 2          | Alg. for Kids  | Y             | Series        |
--| 3          | Database Sols  | N             | Series        |
--| 4          | Aladdin        | Y             | Movies        |
--| 5          | Cinderella     | Y             | Movies        |
--+------------+----------------+---------------+---------------+

--Result table:
--+--------------+
--| title        |
--+--------------+
--| Aladdin      |
--+--------------+
--"ScienceFiction Movie" is not a content for kids.
--"Alg. for Kids" is not a movie.
--"Database Sols" is not a movie
--"Alladin" is a movie, content for kids and was streamed in June 2020.
--"Cinderella" was not streamed in June 2020.

--solution:

CREATE TABLE TVProgram(program_date DATETIME, content_id INT, channel NVARCHAR(100));

CREATE TABLE content(content_id INT, title NVARCHAR(150), kids_content CHAR, content_type nvarchar(50));

INSERT INTO TVProgram VALUES('2020-06-10 08:00', 1, 'LC-Channel');
INSERT INTO TVProgram VALUES('2020-05-11 12:00', 2, 'LC-Channel');
INSERT INTO TVProgram VALUES('2020-05-12 12:00', 3, 'LC-Channel');
INSERT INTO TVProgram VALUES('2020-05-13 14:00', 4, 'Disney Ch');
INSERT INTO TVProgram VALUES('2020-06-18 14:00', 4, 'Disney Ch');
INSERT INTO TVProgram VALUES('2020-07-15 16:00', 5, 'Disney Ch');

SELECT * FROM TVProgram;

INSERT INTO content VALUES(1, 'ScienceFiction Movie', 'N', 'Movies');
INSERT INTO content VALUES(2, 'Alg. for Kids', 'Y', 'Series');
INSERT INTO content VALUES(3, 'Database Sols', 'N', 'Series');
INSERT INTO content VALUES(4, 'Aladdin', 'Y', 'Movies');
INSERT INTO content VALUES(5, 'Cinderella', 'Y', 'Movies');

SELECT * FROM content;

SELECT title FROM content 
INNER JOIN TVProgram tv on tv.content_id = content.content_id AND Month(tv.program_date) = 6 
WHERE content.content_type = 'Movies' AND content.kids_content = 'Y';