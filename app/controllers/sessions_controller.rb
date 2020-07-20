class SessionsController < ApplicationController
  # GET /login
  def new
    # ×　@session = Session.new
  end

  # POST /login
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    # passwordが有効かチェック
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # 本当は正しくない
      render 'new'
    end

  end
end
