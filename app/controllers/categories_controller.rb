class CategoriesController < ApplicationController
  before_action :require_user, except: [:show]
  #before_action :require_admin

  def create
    @category = Category.new(params.require(:category).permit(:name))
    if @category.save
      flash[:notice] = "New Category was created"
      redirect_to topics_path
    else
      render :new
    end
  end

  def show
    @category = Category.find_by(name: params[:id])
    render json: @category, status: 200
  end
end
