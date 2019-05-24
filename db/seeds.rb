# As we have only 3 tables I left all seeds stuff in one file.
# Otherwise I suggest splitting to one file per table.

COUNT_OF_USERS = 100
COUNT_OF_POSTS = 200_000
COUNT_OF_IPS = 50
AVERAGE_NUMBER_OF_RATINGS_PER_POST = 2

# Users
user_values = Array.new(COUNT_OF_USERS) { { login: Faker::Name.unique.name } }

User.import user_values, validate: true
puts 'Users are created'

# Posts
ip_adresses = Array.new(COUNT_OF_IPS) { Faker::Internet.unique.ip_v4_address }
post_values = Array.new(COUNT_OF_POSTS) do
  {
    author_id: rand(1..COUNT_OF_USERS),
    title: Faker::Lorem.words(rand(2..10)).join(' '),
    body: Faker::Lorem.paragraphs(rand(2..8)).join(' '),
    author_ip_address: ip_adresses.sample
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
