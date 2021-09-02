class Score < ApplicationRecord
  belongs_to :user
  # belongs_to :challenge
  has_one :course
  has_many :comments
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  with_options presence: true do
    validates :image
    validates :date
    validates :hour
    validates :minute
    validates :second
  end
  
  with_options presence: true, numericality: { greater_than: 0} do
    validates :distance
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :area_id
  end
end
