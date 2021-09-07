class CoursesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    not_move_to_new
    @course = Course.new
  end

  def create
    not_move_to_new
    @course = Course.new(course_params)
    if @course.save
      redirect_to score_path(@score.id)
    else
      render :new
    end
  end

  def destroy
    course = Course.find_by(id: params[:id], score_id: params[:score_id])
    course.destroy
    redirect_to score_path(params[:score_id])
  end

  def challenge
    not_move_to_challenge
    @score = Score.new
  end

  private

  def not_move_to_new
    @score = Score.find(params[:score_id])
    unless current_user.id == @score.user_id
      redirect_to root_path
    end
  end

  def course_params
    params.require(:course).permit(:feature).merge(user_id: current_user.id, score_id: params[:score_id])
  end
end

def not_move_to_challenge
  @score_cf = Score.find(params[:score_id])
  @course_cf = Course.find_by(id: params[:id], score_id: params[:score_id])
  if current_user.id == @score_cf.user_id
    redirect_to root_path
  end
end