class SkillsController < ApplicationController
  before_action :login_required
  before_action :set_skill, only: [:new,:edit,:destroy]

  def new

    @user = current_user
    @skill = Skill.new
    @category_id = params[:category_id]

  end

 def create
  @skill = current_user.skills.build(skill_params)
  @category_id = @skill.category_id
  if @skill.save
    flash[:success] = "#{@skill.category.name}に#{@skill.name}を習得レベル#{@skill.level}で追加しました！"
    redirect_to edit_skill_path(@skill)
  else
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
      flash[:success] = "#{@skill.name}の習得レベルを保存しました！"
      redirect_to edit_skill_path

    else
      flash[:danger] = "習得レベル保存に失敗しました"
      render :edit

    end
  end

  def destroy
   @skill = Skill.find(params[:id])
   @skill.destroy
   redirect_to edit_skill_path
   flash[:success] = "#{@skill.name}の削除しまいした"
  end

  private

    def skill_params
      params.require(:skill).permit(:name, :level,:category_id)
    end

    def set_skill
      @skills = current_user.skills
    end

    def update_params
      params.require(:skill).permit(:level)
    end


end