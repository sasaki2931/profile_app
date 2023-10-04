class SkillsController < ApplicationController
  before_action :login_required
  before_action :set_skill, only: [:new,:edit,:destroy]

  def new
    @user = current_user
    @skill = Skill.new
    @category_id = params[:category_id]
    @category = Category.find(params[:category_id])

  end

 def create
   @skill = current_user.skills.build(skill_params)
   @category_id = @skill.category_id
   if @skill.save
      flash[:success] = "#{@skill.category.name}に#{@skill.name}を習得レベル#{@skill.level}で追加しました！"
      redirect_to edit_skill_path(@skill)
    else

      redirect_to new_skill_path(category_id: @category_id)
    end
   end


  def edit
    @user = current_user
    @user_skills = @user.skills.includes(:category)
    @categories = @user_skills.map(&:category).uniq
    if @user_skills.empty?
      frontend_category = Category.create(name: "フロントエンド")
      backend_category = Category.create(name: "バックエンド")
      infra_category = Category.create(name: "インフラ")
  
      frontend_skill = Skill.create(name: "サンプルスキル1", level: 0, category: frontend_category)
      backend_skill = Skill.create(name: "サンプルスキル2", level: 0, category: backend_category)
      infra_skill = Skill.create(name: "サンプルスキル3", level: 0, category: infra_category)
  
      @user.skills << frontend_skill
      @user.skills << backend_skill
      @user.skills << infra_skill
  
      @user_skills = @user.skills.includes(:category)
    end
  
    @frontend = @user_skills.where(category: frontend_category)
    @backend = @user_skills.where(category: backend_category)
    @infra = @user_skills.where(category: infra_category)
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
   flash[:success] = "#{@skill.name}を削除しました"
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