class ScoresController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  before_action :set_score, only: [:show, :destroy]
  helper_method :sort_column, :sort_direction

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
  
  def list
    @scores = Score.order("#{sort_column} #{sort_direction}")
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
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end
   
  def sort_column
    Score.column_names.include?(params[:sort]) ? params[:sort] : 'distance'
  end
end
