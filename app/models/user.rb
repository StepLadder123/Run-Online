class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, on: :create
    validates :birthday
  end
  
  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :sex_id
    validates :area_id
  end

  has_many :scores
  has_many :comments
end
