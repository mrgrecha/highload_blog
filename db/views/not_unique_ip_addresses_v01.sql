SELECT ip_addresses.id,
       ip_addresses.value as ip_address,
       array_agg(DISTINCT(users.login)) as array_of_authors
FROM "posts"
INNER JOIN "ip_addresses" ON "ip_addresses"."id" = "posts"."ip_address_id"
INNER JOIN "users" ON "users"."id" = "posts"."author_id"
GROUP BY ip_addresses.id
HAVING (COUNT(DISTINCT(posts.author_id)) > 1)
