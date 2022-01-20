# frozen_string_literal: true

class AuthenticateUser
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    user
  end

  def user
    user = User.find_by_email(@params['email'])
    return user.token_get if user&.authenticate(@params['password'])
  end

  private :user
end
