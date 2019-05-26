# frozen_string_literal: true

class RatingForm < BaseForm
  attribute :value, Integer
  attribute :post_id, Integer

  validates :value, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  validate :post_presence

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      Rating.create(value: value, post_id: post_id)
      rating_average_value = Rating.where(post_id: post_id).average(:value)
      rating_average_value
    end
  end

  private

  def post_presence
    errors.add(:post_id, 'There is no such post') unless Post.where(id: post_id).exists?
  end
end
