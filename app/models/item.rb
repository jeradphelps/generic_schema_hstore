class Item < ActiveRecord::Base
  # attr_accessible :item_category_id, :values

  belongs_to :item_category

end
