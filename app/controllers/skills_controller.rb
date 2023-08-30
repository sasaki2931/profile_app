class SkillsController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.create(skill_params)
    if @skill.save
      redirect_to skill_path(@skill.id)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @skill.update(skill_params)
      redirect_to users_path, notice: "スキルを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to categories_path, notice: "スキルを削除しました！"
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :level, :category_id)
  end

  def set_user
    @user = User.find(params[:id])
    @categories = Category.all
    @skill = Skill.find(params[:id]) if params[:id]
  end
end