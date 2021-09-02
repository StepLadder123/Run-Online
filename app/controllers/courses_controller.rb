class CoursesController < ApplicationController
  
  def new
    move_to_index
    @course = Course.new
  end

  def create
    move_to_index
    @course = Course.new(course_params)
    if @course.save
      redirect_to score_path(@score.id)
    else
      render :new
    end
  end

  private

  def move_to_index
    @score = Score.find(params[:score_id])
    unless current_user.id == @score.user_id
      redirect_to root_path
    end
  end

  def course_params
    params.require(:course).permit(:feature).merge(user_id: current_user.id, score_id: params[:score_id])
  end
end