# frozen_string_literal: true

class PostsController < ApplicationController
  def create
    result = post_form.save
    if result
      render json: { status: 200, post_data: PostSerializer.new(result).serializable_hash }, status: :ok
    else
      render json: { status: 422, errors: post_form.errors }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_login, :author_ip_address)
  end

  def post_form
    @post_form ||= PostForm.new
    @post_form.attributes = post_params
    @post_form
  end
end
