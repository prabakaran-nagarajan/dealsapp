class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.date :startdate
      t.date :enddate
      t.string :location
      t.integer :actualprice
      t.integer :discountprice
      t.string :type
      t.string :contact
      t.text :address
      t.references :member

      t.timestamps
    end
    add_index :deals, :member_id
  end
end
