class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    follower = current_user.follower(@user)
    follower.save
    redirect_to request.referer
  end

  def destroy
    follower = current_user.unfollower(@user)
    follower.destroy
    redirect_to request.referer
  end

  private
  def set_user
    @user = User.find(params[:followed_id])
  end

end
