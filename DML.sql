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

--
-- Review List
--
select rating, username from movie
INNER JOIN review_movie_association ON review_movie_association.movie_review_id= movie_id
INNER JOIN review ON  review_movie_association.review_id = review.review_id
INNER JOIN users ON review.user_id = users.user_id
where movie_id = 1

--
-- Users page
--
select B.*, A.*, COUNT(*) as num_reviews from users B
inner join review A on A.user_id = B.user_id
group by B.user_id;
