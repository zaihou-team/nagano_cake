class Customer < ApplicationRecord
    has_many :addresses, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :orders, dependent: :destroy

      devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :address, :email, presence: true
    validates :last_name_kana, :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
    validates :last_name, :first_name, presence: true, length: { in: 1..50 }, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    # validates :email, presence: true, format: {with: /\A\S+@\S+\.\S+\z/ }

    def active_for_authentication?
      super && is_active?
    end
 
    def full_name
      "#{last_name} #{first_name}"
    end

    def full_name_kana
      "#{last_name_kana}" "#{first_name_kana}"
    end

end
