class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.integer :build
      t.integer :odometer
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
