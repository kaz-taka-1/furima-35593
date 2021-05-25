class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipalities, :street_number, :building_number, :phone_number,
                :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 0 }
    validates :municipalities
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities,
                   street_number: street_number, building_number: building_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end
