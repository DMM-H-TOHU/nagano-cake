class SendAddress < ApplicationRecord
  belongs_to :customer

  validates :name, :address, :zipcode,
            presence: true
  validates :zipcode, length: {is: 7}, numericality: { only_integer: true }

  def full_deliveries
    self.zipcode + " " + self.address + " " + self.name
  end
end
