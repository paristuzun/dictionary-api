class LoginController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { token: token, username: @user.username }, status: :ok
    else
      render json: { errors: "Could not login with those credentials" },
        status: :unauthorized
    end
  end
end
