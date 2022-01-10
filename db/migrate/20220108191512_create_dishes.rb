class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
