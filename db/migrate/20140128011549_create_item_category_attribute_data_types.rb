class CreateItemCategoryAttributeDataTypes < ActiveRecord::Migration
  def change
    create_table :item_category_attribute_data_types do |t|
      t.string :label
      t.string :rails_data_type

      t.timestamps
    end
  end
end
