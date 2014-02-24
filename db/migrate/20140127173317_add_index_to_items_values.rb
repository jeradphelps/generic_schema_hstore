class AddIndexToItemsValues < ActiveRecord::Migration
  def up
    execute "CREATE INDEX items_values ON items USING GIN(values)"
  end

  def down
    execute "DROP INDEX items_values"
  end
end
