class CommentsController < ApplicationController
  def create
    #find restaurant 
    @restaurant = Restaurant.find(params[:restaurant_id])
    #build relationship
    @comment = @restaurant.comments.build(comment_params)
    @comment.user = current_user
    #saver加了驚嘆號 代表如果出錯會直接丟出錯誤畫面
    @comment.save!
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.find(params[:id])

    if current_user.admin?
      @comment.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
