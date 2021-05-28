class Location < ApplicationRecord
    include ActiveModel::Serializers::JSON 
    has_many: breweries

    def attributes
        {"country" => nil, "state" => nil, "city" => nil, "address" => nil, "street" => nil, "latitude" => nil, "longitute" => nil}
    end
end
