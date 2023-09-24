class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 8 },
                    format: { with: /\A(?=.*\d)(?=.*[a-zA-Z])\w{8,}\z/ }
               
  validates :introduce,length: { in: 50..200 }
  has_many :skills, dependent: :destroy
  before_validation { email.downcase! }
  mount_uploader :image, ImageUploader


end

