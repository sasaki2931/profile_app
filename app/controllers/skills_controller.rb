class SkillsController < ApplicationController
   before_action :set_user, only: [:edit, :update]


  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.create(category_params)
    if @skill.save
      redirect_to skill_path(@skill.id)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "自己紹介を編集しました！"
    else
      render :edit
    end
  end


  def destrroy
     @category.destroy
     redirect_to categories_path, notice:"ブログを削除しました！"
  end



  private

    def skill_params
      params.require(:skill).permit(:name, :level )
    end


    def set_user
      @user = User.find(params[:id])
    end

end
