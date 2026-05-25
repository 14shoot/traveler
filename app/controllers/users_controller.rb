class UsersController < ApplicationController
  def index
    @users =  User.page(params[:page]).per(5).reverse_order
  end

def show
  @user = User.find(params[:id])
  @posts = @user.posts.page(params[:page]).per(5)

  @following_users = @user.following_user
  @follower_users = @user.follower_user

  @isRoom = false

  if current_user != @user
    current_user_entries = current_user.entries
    user_entries = @user.entries

    current_user_entries.each do |cu|
      user_entries.each do |u|
        if cu.room_id == u.room_id
          @isRoom = true
          @roomId = cu.room_id
        end
      end
    end
    if @isRoom != true
      @room = Room.new
      @entry = Entry.new
    end
  end
end

  def edit
    @user = User.find(params[:id])
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
  end
end
