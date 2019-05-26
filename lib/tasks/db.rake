# frozen_string_literal: true

require 'colorize'

namespace :db do
  desc "Refresh top rating posts' materialized view"
  task refresh_top_rating_posts_view: :environment do
    puts "Refreshing top rating posts' materialized view. Current time: #{Time.now}"
    TopRatingPost.refresh
    puts 'Done'.green
  end

  desc "Refresh not unique ip addresses' materialized view"
  task refresh_not_unique_ip_addresses_view: :environment do
    puts "Refreshing not unique ip addresses' materialized view. Current time: #{Time.now}"
    NotUniqueIpAddress.refresh
    puts 'Done'.green
  end
end
