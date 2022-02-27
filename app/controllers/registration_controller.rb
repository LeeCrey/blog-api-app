# frozen_string_literal: true

class RegistrationController < ApplicationController
  skip_before_action :authorize_api_request!, only: %i[create]

  # POST /register
  def create
    user = User.new register_params
    if user.save
      crypt = MessageEncrypt.new
      token = crypt.encrypt user.token_get
      render json: { authorization: token }, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users
  def destroy
    pwd = delete_params[:password]
    if @current_user.authenticate(pwd)
      @current_user.destroy
      head :no_content
    else
      render json: { error: 'Incorrect email or password' }, status: :unauthorized
    end
  end

  private

  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def delete_params
    params.require(:confirmation).permit(:password)
  end
end
