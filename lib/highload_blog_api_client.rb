# frozen_string_literal: true

class HighloadBlogApiClient
  include HTTParty
  base_uri "#{ENV['BASE_URL']}:#{ENV['PORT']}"

  def create_post(query)
    post_creating_relative_url = Rails.application.routes.url_helpers.post_url(only_path: true)
    self.class.post(post_creating_relative_url, query: query)
  end

  def rate_the_post(query)
    rating_post_relative_url = Rails.application.routes.url_helpers.ratings_url(only_path: true)
    self.class.post(rating_post_relative_url, query: query)
  end

  def get_top_posts(query)
    post_top_relative_url = Rails.application.routes.url_helpers.top_rating_posts_url(only_path: true)
    self.class.get(post_top_relative_url, query: query)
  end

  def get_not_uniques_ip_addresses
    not_unique_ip_addresses_relative_url = Rails.application.routes.url_helpers.not_unique_ip_addresses_url(only_path: true)
    self.class.get(not_unique_ip_addresses_relative_url)
  end
end
