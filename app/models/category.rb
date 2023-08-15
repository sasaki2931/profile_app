class Category < ApplicationRecord
  validates :name, presence: true
  has_many :skills, dependent: :destroy
end
