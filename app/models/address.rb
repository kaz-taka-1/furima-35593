class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :prefectures_id,numericality:{ other_than: 0 }
    validates :municipalities
    validates :street_number
    validates :phone_number
  end
  belongs_to :purchase
end
