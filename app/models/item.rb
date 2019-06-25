class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :images
  has_many :likes
  has_many :comments
  belongs_to :saler, class_name: "User", foreign_key: 'saler'
  belongs_to :buyer, class_name: "User", foreign_key: 'buyer_id'
end