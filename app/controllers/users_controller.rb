class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    # Getting the user via the :find_user method
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

  def find_user
    @user = User.find_by username: params[:username]
  end

end
