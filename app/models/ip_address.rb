# frozen_string_literal: true

class IpAddress < ApplicationRecord
  has_many :posts
end
