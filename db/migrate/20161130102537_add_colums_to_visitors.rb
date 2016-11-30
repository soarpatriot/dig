class AddColumsToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_column :visitors, :province, :string
    add_column :visitors, :city, :string
    add_column :visitors, :isp, :string
    add_column :visitors, :cname, :string
    remove_column :visitors, :merchant
  end
end
