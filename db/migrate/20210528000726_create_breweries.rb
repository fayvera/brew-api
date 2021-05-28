class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :phone
      t.string :website_url
      t.string :brewery_type
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
