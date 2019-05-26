# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :ratings
  belongs_to :ip_address
end
