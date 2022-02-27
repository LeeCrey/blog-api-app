# frozen_string_literal: true

class ApiRequest
  attr_reader :headers

  def initialize(request_headers)
    @request_headers = request_headers
  end

  def authorize!
    raise InvalidTokenException if user_data_get.blank?

    User.find_by_email(user_data_get['email'])
  end

  private

  def user_data_get
    token = MessageEncrypt.new.decrypt(authorization_token)
    JsonWebToken.decode(token)
  end

  def authorization_token
    @request_headers['Authorization'].split(/\s+/).last if @request_headers['Authorization'].present?
  end
end
