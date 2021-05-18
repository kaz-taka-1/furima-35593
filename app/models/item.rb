class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :image
    with_options numericality:{ other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :prefectures_id
      validates :delivery_days_id
      end
      validates :price,numericality: {only_integer: true, greater_than_or_equal_to:300,less_than_or_equal_to:9999999,message: "is out of setting range." }
      
  end
 
 
  belongs_to :user
  # has_one :purchase
  has_one_attached :image
end
