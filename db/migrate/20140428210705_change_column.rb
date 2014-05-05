class ChangeColumn < ActiveRecord::Migration
  def change
   rename_column :deals, :type, :dealtype
  end

  def down
  end
end
