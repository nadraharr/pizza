class CreateMeals < ActiveRecord::Migration[7.2]
  def change
    create_table :meals do |t|
      t.string :title
      t.string :ingredients, array: true, default: []
      t.integer :price
      t.boolean :in_menu
      t.integer :category

      t.timestamps
    end
  end
end
