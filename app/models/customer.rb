class Customer < ApplicationRecord
    has_many :addresses, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :orders, dependent: :destroy

      devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :last_name, :first_name, :last_name_kana, :first_name_kana,
            :postal_code, :address, :phone_number, :email, presence: true

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
