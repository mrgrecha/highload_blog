# frozen_string_literal: true

class CreateTopRatingPosts < ActiveRecord::Migration[5.2]
  def change
    create_view :top_rating_posts, materialized: true
    add_index :top_rating_posts, :post_id, unique: true
    add_index :top_rating_posts, :average_rating
  end
end
