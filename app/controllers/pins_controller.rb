class PinsController < ApplicationController
  # Finds a pin using a ID only on the specified methods
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]

  # Redirects the user back if they are not the owner
  before_action :user_is_owner, only: [:edit, :destroy]

  # Make sure a user is signed in before he can do stuff with the pins
  before_action :authenticate_user!, except: [:index, :show]

  # Index action
  def index
    @pins = Pin.all.order('created_at DESC')
  end

  # Show action
  def show

  end

  # New action
  def new
    @pin = current_user.pins.build
  end


  # Create action
  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: 'Successfully created new Pin!'
    else
      render 'new'
    end
  end

  # Edit action
  def edit

  end

  # Helper method for if an pin is updated
  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated'
    else
      render 'edit'
    end
  end

  # Destroys a pin
  def destroy
    @pin.destroy
    redirect_to root_path
  end

  def upvote
    if current_user.voted_for? @pin
      @pin.unliked_by current_user
    else
      @pin.liked_by current_user
    end

    redirect_to :back
  end

  private



  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

  def user_is_owner
    if current_user.email != @pin.user.email
      redirect_to root_path, notice: "You don't have access to this resource!"
    end
  end

end
