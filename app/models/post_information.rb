# frozen_string_literal: true

class PostInformation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :ip_address
  has_one :post
  has_many :ratings
end
