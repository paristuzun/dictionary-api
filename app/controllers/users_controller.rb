class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      @token = encode_token({ user_id: @user.id})
     render json: { user: @user, jwt: @token, message: 'success' }, status: :created
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
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find_by(username: params[:id])
  end

end
