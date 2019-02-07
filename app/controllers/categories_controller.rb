class CategoriesController < ApplicationController
  before_action :require_user, only: [:create]
  #before_action :require_admin

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors.full_messages, status: 422
    end
  end

  def show
    @category = Category.find_by(name: params[:id])
    json = {
      name: @category.name,
      topics: @category.topics
    }
    render json: json, status: :ok
  end

  def index
    @categories = Category.all
    render json: @categories, status: :ok
  end

  private
  def category_params
    params.permit(:name)
  end
end
