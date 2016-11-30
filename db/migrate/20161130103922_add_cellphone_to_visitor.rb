class AddCellphoneToVisitor < ActiveRecord::Migration[5.0]
  def change
    add_column :visitors, :cellphone, :string
  end
end
