# Made for development purposes
# I think it should be changed in future
ENV['RAILS_ENV'] = 'development'
set :output, 'log/whenever.log'

every :minute do
  rake 'db:refresh_top_rating_posts_view'
end

every :minute do
  rake 'db:refresh_not_unique_ip_addresses_view'
end
