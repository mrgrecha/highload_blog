# As we have only 4 tables I left all seeds stuff in one file.
# Otherwise I suggest splitting to one file per table.

COUNT_OF_USERS = 100
COUNT_OF_POSTS = 200_000
COUNT_OF_IPS = 50
AVERAGE_NUMBER_OF_RATINGS_PER_POST = 2

# Users
user_values = Array.new(COUNT_OF_USERS) { { login: Faker::Name.unique.name } }

User.import user_values, validate: true
puts 'Users are created'

# Ip addresses

ip_addresses = Array.new(COUNT_OF_IPS) { { value: Faker::Internet.unique.ip_v4_address } }
IpAddress.import ip_addresses, validate: true

# Posts

post_values = Array.new(COUNT_OF_POSTS) do
  {
    author_id: rand(1..COUNT_OF_USERS),
    title: Faker::Lorem.words(rand(2..10)).join(' '),
    body: Faker::Lorem.paragraphs(rand(2..8)).join(' '),
    ip_address_id: rand(1..COUNT_OF_IPS)
  }
end

Post.import post_values, validate: true
puts 'Posts are created'

# Ratings
rating_values = Array.new(COUNT_OF_POSTS * AVERAGE_NUMBER_OF_RATINGS_PER_POST) do
  {
    post_id: rand(1..COUNT_OF_POSTS),
    value: rand(1..5)
  }
end

Rating.import rating_values, validate: true
puts 'Ratings are created'
