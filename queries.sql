-- 🎬 Movie Data Analysis Queries .

SELECT * FROM moviesdb.movies;
SELECT * FROM moviesdb.movies WHERE industry = 'bollywood';
SELECT COUNT(*) FROM moviesdb.movies WHERE industry = 'bollywood';
SELECT COUNT(*) FROM moviesdb.movies WHERE industry = 'hollywood';
SELECT DISTINCT industry FROM moviesdb.movies;
SELECT * FROM moviesdb.movies WHERE title LIKE '%thor%';
SELECT * FROM moviesdb.movies WHERE studio = '';
SELECT * FROM moviesdb.movies WHERE imdb_rating >= 9;
SELECT * FROM moviesdb.movies WHERE imdb_rating BETWEEN 6 AND 8;
SELECT * FROM moviesdb.movies WHERE studio IN ('marvel studio', 'zee studio');
SELECT * FROM moviesdb.movies ORDER BY imdb_rating;

-- Top-rated Bollywood & Hollywood movies
SELECT * FROM moviesdb.movies WHERE industry = 'bollywood' ORDER BY imdb_rating ASC LIMIT 5;
SELECT * FROM moviesdb.movies WHERE industry = 'hollywood' ORDER BY imdb_rating DESC;
SELECT * FROM moviesdb.movies WHERE industry = 'bollywood' ORDER BY imdb_rating DESC;
SELECT * FROM moviesdb.movies WHERE industry = 'hollywood' ORDER BY imdb_rating ASC;

-- Aggregate stats
SELECT MAX(imdb_rating) AS highest_rating FROM moviesdb.movies WHERE industry = 'bollywood';
SELECT MIN(imdb_rating) AS min_rating, MAX(imdb_rating) AS highest_rating, ROUND(AVG(imdb_rating), 2) AS avg_rating 
FROM moviesdb.movies WHERE studio = 'marvel studio';

-- Studio and Industry breakdown
SELECT studio, COUNT(*) AS cnt FROM moviesdb.movies GROUP BY studio ORDER BY cnt DESC;
SELECT industry, COUNT(industry) AS cnt, AVG(imdb_rating) AS avg_rating FROM moviesdb.movies GROUP BY industry;
SELECT studio, COUNT(studio) AS cnt, ROUND(AVG(imdb_rating), 2) AS avg_rating FROM moviesdb.movies GROUP BY studio ORDER BY avg_rating DESC;
SELECT studio, COUNT(studio) AS cnt, ROUND(AVG(imdb_rating), 2) AS avg_rating FROM moviesdb.movies 
WHERE studio != '' GROUP BY studio ORDER BY avg_rating DESC;

-- Year-based queries
SELECT release_year, COUNT(*) AS movies_count FROM moviesdb.movies GROUP BY release_year ORDER BY movies_count DESC;
SELECT release_year, COUNT(*) AS movies_count FROM moviesdb.movies GROUP BY release_year HAVING movies_count > 2 ORDER BY movies_count DESC;

-- Date & age-based queries
SELECT CURDATE();
SELECT YEAR(CURDATE()) AS current_year;
SELECT *, YEAR(CURDATE()) - birth_year AS age FROM actors;

-- Profit analysis
SELECT *, (revenue - budget) AS profit FROM moviesdb.financials;

