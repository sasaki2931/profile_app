class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :introduce,length: { in: 50..200 }
  has_many :skills, dependent: :destroy
  has_secure_password
  before_validation { email.downcase! }
  mount_uploader :image, ImageUploader


end

