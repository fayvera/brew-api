class AddColumnToBreweries < ActiveRecord::Migration[6.1]
  def change
      add_column :breweries, :obdb_id, :string
  end
end
