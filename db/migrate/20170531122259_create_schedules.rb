class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :bike, foreign_key: true
      t.integer :oil
      t.integer :sparkplugs
      t.integer :airfilter
      t.integer :oilfilter
      t.integer :coolingfluid
      t.integer :chain
      t.integer :break_front
      t.integer :break_back
      t.integer :breakfluid
      t.integer :tyres

      t.timestamps
    end
  end
end
