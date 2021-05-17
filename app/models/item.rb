class Item < ApplicationRecord

  validates :image, presence: true
  
  belongs_to :user
  # has_one :purchase
  has_one_attached :image
end
