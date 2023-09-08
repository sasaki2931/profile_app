class CategoriesController < ApplicationController
　　before_action :login_required


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

    private

    def category_params
      params.require(:category).permit(:name )
    end


    def set_category
      @category = Category.find(params[:id])
    end
end
