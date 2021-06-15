class AddColumnToBreweries < ActiveRecord::Migration[6.1]
  def change
      add_column :breweries, :odb_id, :integer
  end
end
