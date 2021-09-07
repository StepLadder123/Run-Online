class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    if current_user.id == @user.id
      @scores = Score.all.where(user_id: params[:id]).order(date: :desc, id: :desc)
    else
      @scores = Score.all.where(user_id: params[:id]).where(private: false).order(date: :desc, id: :desc)
    end
    user_score
  end
  
  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_score
    @term_year = Time.now.all_year
    @term_month = Time.now.all_month
    @term_week = Time.now.all_week
  end

  def user_params
    params.fetch(:user, {}).permit(:email, :nickname, :birthday, :p_birthday, :sex_id, :p_sex, :area_id, :p_area, :profile)
  end
end
