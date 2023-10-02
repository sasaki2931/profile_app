class UsersController < ApplicationController
  before_action :login_required,only: [:show, :edit,:update]
  before_action :set_user, only: [:show, :edit, :update]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
      binding.pry
    else
      flash.now[:danger] = 'ユーザーの作成に失敗しました'
      render :new
    end
  end

  def show
    @users = User.all
    @f_june_data = Skill.where(category_id: 1, created_at: Time.new(2023, 7, 1)..Time.new(2023, 7, 30).end_of_day).sum(:level)
    @f_july_data = Skill.where(category_id: 1, created_at: Time.new(2023, 8, 1)..Time.new(2023, 8, 31).end_of_day).sum(:level)
    @f_august_data = Skill.where(category_id: 1, created_at: Time.new(2023, 9, 1)..Time.new(2023, 9, 31).end_of_day).sum(:level)

    @frontend_data = [@f_june_data,@f_july_data,@f_august_data]

    @b_june_data = Skill.where(category_id: 2, created_at: Time.new(2023, 7, 1)..Time.new(2023, 7, 30).end_of_day).sum(:level)
    @b_july_data = Skill.where(category_id: 2, created_at: Time.new(2023, 8, 1)..Time.new(2023, 8, 31).end_of_day).sum(:level)
    @b_august_data = Skill.where(category_id: 2, created_at: Time.new(2023, 9, 1)..Time.new(2023, 9, 31).end_of_day).sum(:level)

    @backend_data = [@b_june_data,@b_july_data,@b_august_data]


    @i_june_data = Skill.where(category_id: 3, created_at: Time.new(2023, 7, 1)..Time.new(2023, 7, 30).end_of_day).sum(:level)
    @i_july_data = Skill.where(category_id: 3, created_at: Time.new(2023, 8, 1)..Time.new(2023, 8, 31).end_of_day).sum(:level)
    @i_august_data = Skill.where(category_id: 3, created_at: Time.new(2023, 9, 1)..Time.new(2023, 9, 31).end_of_day).sum(:level)

    @infra_data = [@i_june_data,@i_july_data,@i_august_data]
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      flash.now[:danger] = '自己紹介の作成に失敗しました'
      render :edit
    end
  end

  


    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:image,:image_cache,:introduce)
    end


    def set_user
      @user = User.find(params[:id])
    end
end
