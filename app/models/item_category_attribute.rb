class ItemCategoryAttribute < ActiveRecord::Base
  # attr_accessible :item_category_attribute_data_type_id, :item_category_id, :label

  belongs_to :item_category
  belongs_to :item_category_attribute_data_type
  
  validates_presence_of :label, :item_category_attribute_data_type
end

