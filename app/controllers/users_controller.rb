class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users (+ params)
  def create
    @user = User.create(user_params)
    if @user.save
      # Success
    else
      # Failure
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end