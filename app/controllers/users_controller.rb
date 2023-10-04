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
    else
      flash.now[:danger] = 'ユーザーの作成に失敗しました'
      render :new
    end
  end

  def show
    @user = current_user
    @user_skills = @user.skills.includes(:category)
    @categories = @user_skills.map { |skill| skill.category }.uniq

    frontend_category_id = @categories.select { |category| category.name == "フロントエンド" }.pluck(:id)
    august_period = Time.new(2023, 8, 1)..Time.new(2023, 8, 31).end_of_day
    september_period = Time.new(2023, 9, 1)..Time.new(2023, 9, 30).end_of_day
    october_period = Time.new(2023, 10, 1)..Time.new(2023, 10, 31).end_of_day

    august_total = @user_skills.where(created_at: august_period,category_id: frontend_category_id).sum(:level)
    september_total = @user_skills.where(created_at: september_period ,category_id: frontend_category_id).sum(:level)
    october_total = @user_skills.where(created_at: october_period ,category_id: frontend_category_id).sum(:level)
    @frontend_data = [august_total, september_total, october_total]


    backend_category_id = @categories.select { |category| category.name == "バックエンド" }.pluck(:id)
    august_total = @user_skills.where(created_at: august_period,category_id: backend_category_id).sum(:level)
    september_total = @user_skills.where(created_at: september_period ,category_id: backend_category_id).sum(:level)
    october_total = @user_skills.where(created_at: october_period ,category_id: backend_category_id).sum(:level)
    @backend_data = [august_total, september_total, october_total]

    infra_category_id = @categories.select { |category| category.name == "バックエンド" }.pluck(:id)
    august_total = @user_skills.where(created_at: august_period,category_id: infra_category_id).sum(:level)
    september_total = @user_skills.where(created_at: september_period ,category_id: infra_category_id).sum(:level)
    october_total = @user_skills.where(created_at: october_period ,category_id: infra_category_id).sum(:level)
    @infra_data = [august_total, september_total, october_total]

  
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
