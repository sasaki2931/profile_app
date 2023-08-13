class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end


  def show
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "自己紹介を編集しました！"
    else
      render :edit
    end
  end

  def edit
  end


    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:image,:introduce)
    end


    def set_user
      @user = User.find(params[:id])
    end

end
