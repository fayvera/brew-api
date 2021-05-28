class Like < ApplicationRecord
  belongs_to :user_id
  belongs_to :brewery_id
end
