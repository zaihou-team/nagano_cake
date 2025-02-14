class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { unavailable: 0, pending: 1, in_progress: 2, completed: 3 }

end
