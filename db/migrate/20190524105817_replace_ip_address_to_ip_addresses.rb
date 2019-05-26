# frozen_string_literal: true

class ReplaceIpAddressToIpAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :author_ip_address
    add_reference :posts, :ip_address, index: true, unique: true
  end
end
