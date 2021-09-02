class Course < ApplicationRecord
  belongs_to :user
  belongs_to :score, uniqueness: true
  validates :text, presence: true
end
