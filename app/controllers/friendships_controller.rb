class FriendshipsController < ApplicationController
    
  def index
     @friendships = current_user.friendships 
  end
    
  # Send request
  def create
      @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
         flash[:success] = "Friend request sent!"
         redirect_to :back
      else
         flash[:error] = "Unable to request friend :("
         redirect_to :back
      end
  end

  # Accept or decline request
  def update
    @friendship = Friendship.find_by(user_id: params[:id])
    @friendship.update_attributes(accepted: true)
    redirect_to root_url, notice: "Successfully confirmed friend!" 
  end

  # Defriend
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Defriended"
    redirect_to :back
  end
    
end
