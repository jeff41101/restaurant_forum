class FollowshipsController < ApplicationController
  
  def create
    #find 
    @followship = current_user.followships.build(following_id: params[:following_id])
    if @followship.save
      flash[:notice] = "Successfully followed"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @followship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    
  end
end
