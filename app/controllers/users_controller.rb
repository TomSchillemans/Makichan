class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    # Imported automatically via before_action
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
