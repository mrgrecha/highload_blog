# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :value, null: false
      t.references :post, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
