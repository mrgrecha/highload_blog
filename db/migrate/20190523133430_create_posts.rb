# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :author, foreign_key: { to_table: :users }, index: true, null: false
      t.string :author_ip_address, null: false

      t.timestamps
    end
  end
end
