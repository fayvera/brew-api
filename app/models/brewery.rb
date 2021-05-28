class Brewery < ApplicationRecord
  include ActiveModel::Serializers::JSON 

  belongs_to :location
  has_many :likes
  has_many :users, through: :likes

  def attributes
    {"name" => nil, "phone" => nil, "website_url" => nil, "brewery_type" => nil, "location_id" => nil}
  end
end
