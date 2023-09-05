class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, presence: true
  validates :level, presence: true
end
