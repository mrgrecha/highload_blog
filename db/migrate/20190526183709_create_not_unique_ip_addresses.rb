# frozen_string_literal: true

class CreateNotUniqueIpAddresses < ActiveRecord::Migration[5.2]
  def change
    create_view :not_unique_ip_addresses, materialized: true
    add_index :not_unique_ip_addresses, :id, unique: true
  end
end
