class SkillsController < ApplicationController
  before_action :set_skill, only: [:new,:edit,:destroy]

  def new
    @user = current_user
    @skill = Skill.new
    @category_id = params[:category_id]
  end

 def create

  @skill = current_user.skills.build(skill_params)
  if @skill.save
    # スキルが正常に作成された場合
    # カテゴリーにスキルを関連付ける
    redirect_to edit_skill_path(@skill)
     flash[:success] = "#{@skill.category.name}に#{@skill.name}を習得レベル#{@skill.level}で追加しました！"
  else
    #errors = @skill.errors.full_messages
    #puts errors
    #binding.pry # スキルの作成に失敗した場合
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
      redirect_to edit_skill_path
       flash[:danger] = "#{@skill.name}の習得レベルを保存しました！"
    else

      render :edit
    end
  end

  def destroy
   @skill = Skill.find(params[:id])
   @skill.destroy
   redirect_to edit_skill_path
   flash[:danger] = "#{@skill.name}の削除しまいした"
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