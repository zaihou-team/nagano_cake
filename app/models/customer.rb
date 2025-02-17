class Customer < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :last_name_kana, :first_name_kana,
            :postal_code, :address, :phone_number, :email, presence: true

 def active_for_authentication?
    super && is_active?
  end

end