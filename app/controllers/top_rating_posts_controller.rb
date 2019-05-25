class TopRatingPostsController < ApplicationController
  def index
    number_of_posts = params.fetch(:number, 20)
    top_rating_posts = TopRatingPost.order('average_rating DESC').limit(number_of_posts)
    render json: { status: 200, post_data: PostSerializer.new(top_rating_posts,
                                                              { params: { skip_author_id: true } }).serializable_hash }
  end

  private

  def ip_address_params
    params.require(:ip_address).permit(:value)
  end
end
