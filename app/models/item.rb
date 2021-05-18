class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefectures_id
    validates :delivery_days_id
    validates_inclusion_of :price, in:300..9999999
    validates :image
  end
  belongs_to :user
  # has_one :purchase
  has_one_attached :image
end
