class RatingsController < ApplicationController

  def create
    # TODO add validations and edge cases
    # Validations if there are no such posts, invalid value of rating
    # TODO add counter cache for optimization
    # TODO think about better calculations and parallel requests
    Rating.create(rating_params)
    rating_average_value = Rating.where(post_id: rating_params[:post_id]).average(:value)
    render json: { status: 200, post_average_rating: rating_average_value }
  end

  private

  def rating_params
    params.require(:rating).permit(:post_id, :value)
  end
end
