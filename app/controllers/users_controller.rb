class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

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
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    # => app/views/users/edit.html.erb
  end

  # PATHCH /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      # @users <= ここにデータが入っている
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end