class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  enum status: { waiting_for_payment: 0, payment_confirmed: 1, in_production: 2, preparing_for_shipment: 3, shipped: 4 }
  enum payment_method: { credit_card: 0, bank_transfer: 1 }


  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :total_payment, presence: true, numericality: { greater_than: 0 }
  validates :shopping_cost, presence: true, numericality: { greater_than_or_equal_to: 0 }

end