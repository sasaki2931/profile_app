class SkillsController < ApplicationController
  before_action :set_skill, only: [:new,:edit,:destroy]

  def new
    @skill = Skill.new

  end

  def create
  @categories = Category.all
  @skill = Skill.new(skill_params) # 新しいスキルを作成するだけで保存はしない

    if @skill.save
    # スキルが正常に作成された場合
      redirect_to edit_skill_path(@skill) # 新しいスキルの編集ページにリダイレクト
    else
    # スキルの作成に失敗した場合
    render :new
    end
  end







  def edit
    @categories = Category.all
    @frontend = Category.find_by(name: "フロントエンド")&.skills
    @backend = Category.find_by(name: "バックエンド")&.skills
    @infra = Category.find_by(name: "インフラ")&.skills

  end

  def update
    @categories = Category.all
    @skill = Skill.find(params[:id]) if params[:id]
    if @skill.update(update_params)

      #redirect_to categores_path

      redirect_to edit_skill_path
    else

      render :edit
    end
  end

  def destroy
   @skill = Skill.find(params[:id])
   @skill.destroy
   redirect_to categores_path

  end

  private

    def skill_params
      params.require(:skill).permit(:name, :level, :category_id)
    end

    def set_skill
      @skills = current_user.skills
    end

    def update_params
      params.require(:skill).permit(:level)
    end


end