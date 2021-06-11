class User < ApplicationRecord
    include ActiveModel::Serializers::JSON 

    has_secure_password
    has_many :likes
    has_many :breweries, through: :likes

    def attributes
        {"name" => nil, "id" => nil, "email" => nil, "password_digest" => nil, "breweries" => {}}
    end
end
