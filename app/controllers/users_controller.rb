class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all 
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, notice: 'User deleted'
  end

  def delete_picture
    current_user.picture.purge
    redirect_to users_show_path(:id => current_user.id)
  end

end