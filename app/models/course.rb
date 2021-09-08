class Course < ApplicationRecord
  belongs_to :user
  belongs_to :score
  validates :score, uniqueness: true
end