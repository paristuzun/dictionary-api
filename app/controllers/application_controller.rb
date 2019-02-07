class ApplicationController < ActionController::API

  def current_user
    token = request.headers['Authorization']
    payload = JWT.decode(token, ENV['SECRET'], true, algorithm: 'HS256')
    user_id = decoded_token[0]['user_id']
    User.find_by(id: user_id)
  rescue JWT::DecodeError
    nil
  end

  def logged_in?
    !!current_user
  end

  def encode_token(payload)
    JWT.encode(payload, ENV['SECRET'], 'HS256')
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
