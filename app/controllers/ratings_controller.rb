class RatingsController < ApplicationController

  def create
    # TODO think about better calculations and parallel requests
    result = rating_form.save
    if result
      render json: { status: 200, post_average_rating: result }, status: :ok
    else
      render json: { status: 422, errors: rating_form.errors }, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:post_id, :value)
  end

  def rating_form
    @rating_form ||= RatingForm.new
    @rating_form.attributes = rating_params
    @rating_form
  end
end
