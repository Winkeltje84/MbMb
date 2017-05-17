class ChangeAttributeTypeDate < ActiveRecord::Migration[5.0]
  def change
    remove_column :maintenances, :date, :datetime
    add_column :maintenances, :date, :date
  end
end
