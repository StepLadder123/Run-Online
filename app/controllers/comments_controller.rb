class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.create(comment_params) 
    redirect_to score_path(comment.score.id)
   end
 
   private
 
   def comment_params
     params.require(:comment).permit(:text).merge(user_id: current_user.id, score_id: params[:score_id])
   end
end
