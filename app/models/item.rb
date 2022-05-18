class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  belongs_to :genre
  has_many :order_details

  validates :name, presence: true
  validates :introduction, presence: true, length: {maximum: 200}
  validates :price, presence: true



  def get_image
    if image.attached?
      image
    else
      'logo.png'
    end
  end
end
