class HighloadBlogApiClient
  include HTTParty
  base_uri "#{ENV['BASE_URL']}:#{ENV['PORT']}"

  def create_post(query)
    post_creating_relative_url = Rails.application.routes.url_helpers.posts_url(only_path: true)
    self.class.post(post_creating_relative_url, query: query)
  end

  def users(params)
    self.class.get("/2.2/users", params)
  end
end
