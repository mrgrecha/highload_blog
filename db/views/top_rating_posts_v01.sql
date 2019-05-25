SELECT
  posts.id as post_id,
  AVG(ratings.value) as average_rating,
  posts.title as title,
  posts.body as body
FROM
  posts INNER JOIN ratings ON posts.id = ratings.post_id
GROUP BY posts.id
ORDER BY average_rating DESC;
