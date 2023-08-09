class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :introduce,length: { in: 50..200 }
end
