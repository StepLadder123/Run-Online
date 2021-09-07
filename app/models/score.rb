class Score < ApplicationRecord
  belongs_to :user
  has_one :course
  has_many :comments
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  with_options presence: true do
    validates :image
    validates :date
  end
  
  with_options presence: true, numericality: { greater_than: 0} do
    validates :distance
    validates :time
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :area_id
  end
end
