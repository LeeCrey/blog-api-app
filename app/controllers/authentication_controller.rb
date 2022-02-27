# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authorize_api_request!

  # POST /login or POST /
  def create
    token = AuthenticateUser.new(login_params).call
    if token.present?
      crypt_msg = MessageEncrypt.new.encrypt(token)
      render json: { authorization: crypt_msg }
    else
      render json: { error: 'Incorrect username or password' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
