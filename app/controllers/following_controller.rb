class FollowingController < ApplicationController
  def index
    @user  = User.find params[:user_id]
    @users = @user.following.paginate page: params[:page], per_page: 5
  end
end
