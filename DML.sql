--
-- MovieList 
--
select movie.name FROM movie;


--
-- MovieInfo page 
--
select movie.name, year, movie_type, country, length FROM movie where movie_id =1;

--
-- CastList page 
--
select fname, lname, cast_fname, cast_lname from movie
INNER JOIN movie_cast ON movie_cast_movie_id = movie_id
INNER JOIN cast ON cast_id = movie_cast_cast_id 
where movie_id = 1;
