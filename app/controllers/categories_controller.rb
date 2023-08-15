class CategoriesController < ApplicationController


  def new
     @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to category_path(@category.id)
    else
      render :new
    end
  end

  def show
    @categories = Category.all
  end

  def destroy
     @category.destroy
     redirect_to categories_path, notice:"ブログを削除しました！"
  end


    private

    def category_params
      params.require(:category).permit(:name )
    end


    def set_category
      @category = Category.find(params[:id])
    end

end
