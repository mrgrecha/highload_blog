class PostsController < ApplicationController

  def create
    # TODO add validations and edge cases
    author_id = User.find_or_create_by(author_params).id
    post = Post.create(post_params.merge(author_id: author_id))
    render json: { status: 200, post_data: PostSerializer.new(post).serializable_hash }
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_ip_address)
  end

  def author_params
    params.require(:author).permit(:login)
  end
end
