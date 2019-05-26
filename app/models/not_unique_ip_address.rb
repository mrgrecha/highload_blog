# frozen_string_literal: true

class NotUniqueIpAddress < ActiveRecord::Base
  self.primary_key = :id

  def self.refresh
    Scenic
      .database
      .refresh_materialized_view(table_name, concurrently: true)
  end

  def readonly?
    true
  end
end
