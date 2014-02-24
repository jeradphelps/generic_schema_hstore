class Item < ActiveRecord::Base
  # attr_accessible :item_category_id, :values

  store_accessor :values, :brand, :size

  belongs_to :item_category

end
