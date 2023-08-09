class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :introduce,length: { in: 50..200 }
  has_secure_password
end
