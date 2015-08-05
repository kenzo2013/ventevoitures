class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.decimal :price
      t.string :energy
      t.string :image

      t.timestamps null: false
    end
  end
end
