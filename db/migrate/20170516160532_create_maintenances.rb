class CreateMaintenances < ActiveRecord::Migration[5.0]
  def change
    create_table :maintenances do |t|
      t.integer :odometer
      t.datetime :date
      t.decimal :costs
      t.boolean :oil
      t.boolean :sparkplugs
      t.boolean :airfilter
      t.boolean :oilfilter
      t.boolean :coolingfluid
      t.boolean :chain
      t.boolean :break_front
      t.boolean :break_back
      t.boolean :breakfluid
      t.boolean :tyres
      t.references :bike, foreign_key: true

      t.timestamps
    end
  end
end
