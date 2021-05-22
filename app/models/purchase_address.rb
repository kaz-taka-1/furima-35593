class purchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :street_number, :building_number, :phone_number, :purchase, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id,numericality:{ other_than: 0 }
    validates :municipalities
    validates :street_number
    validates :phone_number
  end
end

