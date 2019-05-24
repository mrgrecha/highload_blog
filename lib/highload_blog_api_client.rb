class HighloadBlogApiClient
  include HTTParty
  base_uri "#{ENV['BASE_URL']}:#{ENV['PORT']}"

  def create_post(query)
    post_creating_relative_url = Rails.application.routes.url_helpers.posts_url(only_path: true)
    self.class.post(post_creating_relative_url, query: query)
  end

  def rate_the_post(query)
    rating_post_relative_url = Rails.application.routes.url_helpers.ratings_url(only_path: true)
    self.class.post(rating_post_relative_url, query: query)
  end
end
