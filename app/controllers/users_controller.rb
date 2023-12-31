class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to("/workouts")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def sign_in
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to("/")
    else
      @user = User.new
      flash[:failure] = "ログインできませんでした"
      @email = params[:email]
      render("users/sign_in")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to("/")
  end

  def show
    if params[:id] == session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def user_params
    params.require(:user).permit(
    :name,
    :email,
    :sex,
    :pref,
    :age,
    :password,
    :password_confirmation,
    )
  end
end