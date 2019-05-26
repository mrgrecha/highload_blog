# frozen_string_literal: true

# As we have only 4 tables I left all seeds stuff in one file.
# Otherwise I suggest splitting to one file per table.
INCREASE_COEFFICIENT = ENV['INCREASE_COEFFICIENT'].to_i

COUNT_OF_USERS = ENV['COUNT_OF_USERS'].to_i * INCREASE_COEFFICIENT
COUNT_OF_POSTS = ENV['COUNT_OF_POSTS'].to_i * INCREASE_COEFFICIENT
COUNT_OF_IPS = ENV['COUNT_OF_IPS'].to_i * INCREASE_COEFFICIENT
AVERAGE_NUMBER_OF_RATINGS_PER_POST = ENV['AVERAGE_NUMBER_OF_RATINGS_PER_POST'].to_i

# Posts, users and ip addresses
COUNT_OF_POSTS.times do |index_of_operation|
  request_params = {
    post: {
      title: Faker::Lorem.words(rand(2..10)).join(' '),
      body: Faker::Lorem.paragraphs(rand(2..8)).join(' '),
      author_login: Faker::Name.name,
      author_ip_address: Faker::Internet.ip_v4_address,
    }
  }

  HighloadBlogApiClient.new.create_post(request_params)
  puts "Post ##{index_of_operation} is created"
end

puts '=========================='
puts 'Posts are created'.green
puts '=========================='

post_ids = Post.pluck(:id)
(COUNT_OF_POSTS * AVERAGE_NUMBER_OF_RATINGS_PER_POST).times do |index_of_operation|
  request_params = {
    rating: {
      post_id: post_ids.sample,
      value: rand(1..5)
    }
  }

  HighloadBlogApiClient.new.rate_the_post(request_params)
  puts "Rating ##{index_of_operation} is created"
end

puts 'Done. Seeds are created'.green
