class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
     render json: @user, status: :created
    else
     render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
     render json: @user, status: :accepted
    else
     render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end

  def set_user
    @user = User.find_by(username: params[:id])
  end

end
