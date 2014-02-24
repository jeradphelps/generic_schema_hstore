class ItemCategoryAttributeDataType < ActiveRecord::Base
  # attr_accessible :label, :rails_data_type

  has_many :item_category_attributes
end
