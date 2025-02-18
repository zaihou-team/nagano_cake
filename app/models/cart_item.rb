class Cart_Item < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :count, presence: true, numericality: { greater_than: 0 }
end
