class ChangeVisitTimeFromVisitor < ActiveRecord::Migration[5.0]
  def change
    change_table :visitors do |t|
      t.change :visit_time, :datetime
    end

  end
end
