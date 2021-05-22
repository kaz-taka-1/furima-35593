class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipalities
    validates :street_number
    validates :phone_number
  end
  belongs_to :purchase
end
