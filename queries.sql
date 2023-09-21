SELECT * FROM Movies WHERE revenue IS NULL;


SELECT imdb_id, title, budget FROM Movies WHERE budget IS NOT NULL ORDER BY budget DESC LIMIT 10;


SELECT  MIN(movies.popularity) AS popularity_min, 
	MAX(movies.popularity) AS popularity_max,
	MIN(movies.vote_average) AS vote_average_min,
	MAX(movies.vote_average) AS vote_average_max
	FROM movies;


SELECT title, overview FROM movies WHERE overview LIKE '%Einstein%';


SELECT DATE_PART('month', release_date) AS month, AVG(rating) as average_rating
	FROM ratings RIGHT OUTER JOIN movies ON movies.id = ratings.movieid
	WHERE release_date IS NOT NULL
	GROUP BY DATE_PART('month', release_date)
	ORDER BY month;


SELECT x1.genre, x2.title, x1.released_date 
FROM (SELECT genre, MAX(release_date) as released_date
	FROM movies NATURAL JOIN genres
	GROUP BY genres.genre) AS x1,
	(movies NATURAL JOIN genres) AS x2 
	WHERE x1.released_date = x2.release_date
	AND x1.genre = x2.genre;

SELECT m.title, string_agg(g.genre, ', ') AS genres
	FROM movies m, genres g
	WHERE m.id = g.id
	GROUP BY m.id 
	HAVING COUNT(g.id) >= 8
	ORDER BY m.title;


SELECT genre, AVG(revenue) FROM movies
NATURAL JOIN genres WHERE revenue IS NOT NULL
GROUP BY genre 
ORDER BY AVG(revenue) DESC;


SELECT genre, AVG(revenue), DATE_PART('year', release_date) as Year 
FROM movies NATURAL JOIN genres 
WHERE revenue IS NOT NULL
AND release_date BETWEEN '2015/01/01' AND NOW()
GROUP BY genre, DATE_PART('year', release_date)
ORDER BY genre, DATE_PART('year', release_date);


SELECT genre, AVG(rating) FROM genres NATURAL JOIN ratings 
WHERE genres.id = ratings.movieid
AND rating IS NOT NULL
GROUP BY genre 
ORDER BY AVG(rating) DESC;