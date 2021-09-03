class UsersController < ApplicationController
  before_action :move_to_signed_in

  def show
    @user = User.find_by(id: params[:id])
    @scores = Score.all.where(user_id: params[:id]).order(date: :desc, id: :desc)
    user_score
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def user_score
    @term_year = Time.now.all_year
    @term_month = Time.now.all_month
    @term_week = Time.now.all_week
  end
end
