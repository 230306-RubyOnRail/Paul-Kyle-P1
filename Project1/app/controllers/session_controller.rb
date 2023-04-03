require_relative '../../lib/json_web_token'

class SessionController < ApplicationController
  def create
    credentials = JSON.parse(request.body.read)
    user = Personnel.where(username: credentials['username']).first
    if user&.authenticate(credentials['password'])
      render json: { token: JsonWebToken.encode(user_id: user.id), user_id: user.id}, status: :created
    else
      render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
  end
end

