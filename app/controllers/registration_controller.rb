# frozen_string_literal: true

class RegistrationController < ApplicationController
  skip_before_action :authorize_api_request!, only: %i[create]

  # POST /register
  def create
    user = User.new register_params
    if user.save
      render json: { okay: true, authorization: user.token_get }, status: :created
    else
      render_error_response user.errors, :unprocessable_entity
    end
  end

  # DELETE /users
  def destroy
    pwd = delete_params[:confirmation_password]
    if @current_user.authenticate(pwd)
      @current_user.destroy
      head :no_content
    else
      render json: { okay: false, reason: 'Incorrect email or password' }, status: :unauthorized
    end
  end

  private

  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def delete_params
    params.permit(:confirmation_password)
  end
end
