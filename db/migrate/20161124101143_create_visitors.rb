class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.integer :user_id
      t.string :user_name
      t.string :user_code
      t.integer :station_id
      t.string :station_name
      t.string :merchant
      t.string :ip
      t.integer :visist_status
      t.date :visit_time

      t.timestamps
    end
  end
end
