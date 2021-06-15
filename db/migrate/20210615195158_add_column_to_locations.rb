class AddColumnToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :postal_code, :string
  end
end
