# frozen_string_literal: true

require 'colorize'
require 'benchmark'

MAX_TIME_FOR_RESPONSE = 100

namespace :requests do
  desc 'Create a post '
  task create_post: :environment do
    author_login = ENV['AUTHOR'].present? ? ENV['AUTHOR'] : User.pluck(:login).sample
    author_ip_address = ENV['IP_ADDRESS'].present? ? ENV['IP_ADDRESS'] : Post.pluck(:author_ip_address).sample
    post_title = ENV['POST_TITLE'].present? ? ENV['POST_TITLE'] : Faker::Lorem.words(rand(2..10)).join(' ')
    post_body = ENV['POST_BODY'].present? ? ENV['POST_BODY'] : Faker::Lorem.paragraphs(rand(2..8)).join(' ')

    request_params = {
      author: {
        login: author_login,
      },
      post: {
        title: post_title,
        body: post_body,
        author_ip_address: author_ip_address,
      }
    }

    time = Benchmark.measure do
      HighloadBlogApiClient.new.create_post(request_params)
    end

    result_time = time.real * 1000 < MAX_TIME_FOR_RESPONSE ? (time.real * 1000).to_s.green : (time.real * 1000).to_s.red
    puts "Necessary time #{result_time} ms"
  end

  desc 'Rate the post '
  task rate_post: :environment do
    post_id = ENV['POST_ID'].present? ? ENV['POST_ID'] : Post.pluck(:id).sample
    rating_value = ENV['RATING_VALUE'].present? ? ENV['RATING_VALUE'] : (1..5).to_a.sample

    request_params = {
      rating: {
        post_id: post_id,
        value: rating_value,
      }
    }

    time = Benchmark.measure do
      HighloadBlogApiClient.new.rate_the_post(request_params)
    end

    result_time = time.real * 1000 < MAX_TIME_FOR_RESPONSE ? (time.real * 1000).to_s.green : (time.real * 1000).to_s.red
    puts "Necessary time #{result_time} ms"
  end

end
