class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  enum status: { unavailable: 0, pending: 1, in_progress: 2, completed: 3 }
  enum payment_method: { credit_card: 0, bank_transfer: 1 }
end