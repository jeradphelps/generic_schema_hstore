[
  { :label => "True/False", :rails_data_type => "boolean" },
  { :label => "Number", :rails_data_type => "float" },
  { :label => "Integer", :rails_data_type => "integer" },
  { :label => "Short Text", :rails_data_type => "string"  },
  { :label => "Long Text", :rails_data_type => "text" }
].each do |data_type_hash|
  ItemCategoryAttributeDataType.find_or_create_by_label(data_type_hash)
end