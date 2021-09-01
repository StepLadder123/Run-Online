class ScoresController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  before_action :set_score, only: [:show, :destroy]
  before_action :search_score, only: [:search, :list]
  before_action :score_all, only: [:search, :rank]

  def index
    @scores = Score.includes(:user).order("created_at DESC")
  end
  
  def new
    @score = Score.new
  end
  
  def create
    @score = Score.new(score_params)
    score_calc
    if @score.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @comment = Comment.new
    @comments = @score.comments.includes(:user)
  end
  
  def destroy
    @score.destroy
    redirect_to root_path
  end
  
  def search
  end
  
  def list
    @results = @s.result
  end
  
  def rank
    @term_year = Time.now.all_year
    @term_month = Time.now.all_month
    @term_week = Time.now.all_week
    @sort_distance_year = User.joins(:scores).where(scores: {date: @term_year}).group(:id).order('sum(scores.distance) desc')
    @sort_distance_month = User.joins(:scores).where(scores: {date: @term_month}).group(:id).order('sum(scores.distance) desc')
    @sort_distance_week = User.joins(:scores).where(scores: {date: @term_week}).group(:id).order('sum(scores.distance) desc')
  end
  
  private
  
  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
  
  def set_score
    @score = Score.find(params[:id])
  end
  
  def score_params
    params.require(:score).permit(:image, :distance, :hour, :minute, :second, :area_id, :date, :private, :challenge_id).merge(user_id: current_user.id)
  end
  
  def score_calc
    @score[:time] = (@score.hour * 60 + @score.minute) * 60 +@score.second
    @score[:lap] = @score.time / @score.distance
  end
  
  def search_score
    @s = Score.ransack(params[:q])
  end

  def score_all
    @scores = Score.all
  end
end
