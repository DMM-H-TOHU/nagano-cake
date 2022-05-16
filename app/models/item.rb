class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  belongs_to :genre
  has_many :order_details
end
