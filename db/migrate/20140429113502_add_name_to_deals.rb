class AddNameToDeals < ActiveRecord::Migration
  def change
   add_column :deals, :dealname, :string
  end
end
