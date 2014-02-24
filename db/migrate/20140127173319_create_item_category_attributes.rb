class CreateItemCategoryAttributes < ActiveRecord::Migration
  def change
    create_table :item_category_attributes do |t|
      t.integer :item_category_id
      t.string :label
      t.integer :item_category_attribute_data_type_id

      t.timestamps
    end
  end
end
