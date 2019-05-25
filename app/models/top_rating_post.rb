class TopRatingPost < ActiveRecord::Base
  self.primary_key = :post_id

  def self.refresh
    Scenic
      .database
      .refresh_materialized_view(table_name, concurrently: true)
  end

  def readonly?
    true
  end
end
