class Like < ApplicationRecord
  include ActiveModel::Serializers::JSON 

  belongs_to :user
  belongs_to :brewery

  def attributes
    {"brewery_id" => nil, "user_id" => nil, "liked" => nil}
  end

end
