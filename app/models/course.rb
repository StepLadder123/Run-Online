class Course < ApplicationRecord
  belongs_to :user
  belongs_to :score
  validates :text, presence: true
end
