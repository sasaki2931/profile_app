class SkillsController < ApplicationController

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
    @user = User.find(params[:id])
    @categories = Category.all
    @skill = Skill.find(params[:id]) if params[:id]
    @frontend = Category.find_by(name: "フロントエンド")&.skills
    @backend = Category.find_by(name: "バックエンド")&.skills
    @infra = Category.find_by(name: "インフラ")&.skills
  end

  def update
    @categories = Category.all
    @skill = Skill.find(params[:id]) if params[:id]
    if @skill.update(update_params)
      binding.pry
      redirect_to users_path, notice: "スキルを保存しました！"
    else

      render :edit
    end
  end

  def destroy
      @categories = Category.all
      @skill = Skill.find(params[:id]) if params[:id]
    @skill.destroy
    redirect_to categories_path, notice: "スキルを削除しました！"
  end

  private

    def skill_params
      params.require(:skill).permit(:name, :level, :category_id)
    end

    def update_params
      params.require(:skill).permit(:level)
    end


end