# frozen_string_literal: true

require 'colorize'

namespace :fast_seeds do
  desc 'Running fast seeds'
  task run: :environment do

    INCREASE_COEFFICIENT = ENV['INCREASE_COEFFICIENT'].to_i

    COUNT_OF_USERS = ENV['COUNT_OF_USERS'].to_i * INCREASE_COEFFICIENT
    COUNT_OF_POSTS = ENV['COUNT_OF_POSTS'].to_i * INCREASE_COEFFICIENT
    COUNT_OF_IPS = ENV['COUNT_OF_IPS'].to_i * INCREASE_COEFFICIENT
    AVERAGE_NUMBER_OF_RATINGS_PER_POST = ENV['AVERAGE_NUMBER_OF_RATINGS_PER_POST'].to_i

    # Users
    user_values = Array.new(COUNT_OF_USERS) { { login: Faker::Name.unique.name } }

    User.import user_values, validate: false
    puts 'Users are created'

    # Ip addresses

    ip_addresses = Array.new(COUNT_OF_IPS) { { value: Faker::Internet.unique.ip_v4_address } }
    IpAddress.import ip_addresses, validate: false

    puts 'Ip addresses are created'

    # Posts
    author_ids = User.pluck(:id)
    ip_address_ids = IpAddress.pluck(:id)
    post_values = Array.new(COUNT_OF_POSTS) do
      {
        author_id: author_ids.sample,
        title: Faker::Lorem.words(rand(2..10)).join(' '),
        body: Faker::Lorem.paragraphs(rand(2..8)).join(' '),
        ip_address_id: ip_address_ids.sample
      }
    end

    Post.import post_values, validate: false, batch_size: 10_000
    puts 'Posts are created'

    # Ratings
    post_ids = Post.pluck(:id)
    rating_values = Array.new(COUNT_OF_POSTS * AVERAGE_NUMBER_OF_RATINGS_PER_POST) do
      {
        post_id: post_ids.sample,
        value: rand(1..5)
      }
    end

    Rating.import rating_values, validate: false, batch_size: 10_000
    puts 'Ratings are created'
    puts 'Done. Seeds are created'.green
  end
end
