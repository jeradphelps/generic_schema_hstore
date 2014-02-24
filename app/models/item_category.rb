class ItemCategory < ActiveRecord::Base
  # attr_accessible :name, :item_category_attributes_attributes

  has_many :item_category_attributes
  has_many :items
  
  accepts_nested_attributes_for :item_category_attributes

  validates_presence_of :name
end
