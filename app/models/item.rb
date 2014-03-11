class Item < ActiveRecord::Base

  # This allows our hstore field to be both dynamic, but within the contraints
  # set by the item category attributes
  # http://stackoverflow.com/questions/18349622/dynamic-active-record-store-accessors-based-off-a-user-form
  after_initialize :add_field_accessors
  after_save       :add_field_accessors

  belongs_to :item_category
  has_many :item_category_attributes, :through => :item_category






  private
  def add_store_accessor field_name
    singleton_class.class_eval {store_accessor :values, field_name}
  end

  # Todo, this is going to have to go to the DB every time, could be slow.  
  # Move it to a method and cache it for a given item category?
  def add_field_accessors
    self.item_category_attributes.pluck(:label).each do |field_name|
      add_store_accessor field_name
    end
  end
end
