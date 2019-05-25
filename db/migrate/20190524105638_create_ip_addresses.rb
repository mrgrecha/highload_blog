class CreateIpAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ip_addresses do |t|
      t.string :value

      t.timestamps
    end
  end
end
