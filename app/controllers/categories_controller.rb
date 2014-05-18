class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
    redirect_to category_path(category)
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])    
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    redirect_to category_path(category)
  end

  def destroy
    Category.delete(params[:id])   
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title) 
  end

end