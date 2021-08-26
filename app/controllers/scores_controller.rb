class ScoresController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

  def index
    @scores = Score.includes(:user).order("created_at DESC")
  end

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)
    if @score.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @score = Score.find(params[:id])
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def score_params
    params.require(:score).permit(:image, :distance, :hour, :minute, :second, :area_id, :date, :private, :challenge_id).merge(user_id: current_user.id)
  end
end
