class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id,:municipalities, :street_number, :building_number, :phone_number, :purchase, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id,numericality:{ other_than: 0 }
    validates :municipalities
    validates :street_number
    validates :phone_number
  end

  # def save
  #   purchase = Purchase.create( user_id: user_id,item_id:@item.id)
  #   Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities,street_number: street_number,building_number: building_number, phone_number: phone_number)
  # end

end

