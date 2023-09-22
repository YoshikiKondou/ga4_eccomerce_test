class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.integer :price
      t.string :brand
      t.string :cost_category
      t.string :price_category
      t.string :product_category

      t.timestamps
    end
  end
end
