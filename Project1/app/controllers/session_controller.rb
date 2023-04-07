require_relative '../../lib/json_web_token'
require_relative '../models/personnel'

class SessionController < ApplicationController

  def create
    credentials = JSON.parse(request.body.read)
    user = Personnel.where(username: credentials['username']).first
    if user&.authenticate(credentials['password'])
      @token = JsonWebToken.encode(user_id: user.id)
      if LoginToken.where(personnel_id: user.id).first
        LoginToken.where(personnel_id: user.id).first.update(token: @token)
      else
        LoginToken.create(token: @token, personnel_id: user.id)
      end
      render json: { token: @token, user_title: user.title, user_id: user.id, username: user.username}, status: :created
    else
      render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
  end
end

