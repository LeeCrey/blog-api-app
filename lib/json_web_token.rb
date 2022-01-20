# frozen_string_literal: true

module CustomeImplementation
  def encode(payload, exp = 6.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode payload, hmac_secret, 'HS256'
  end

  def decode(token)
    JWT.decode(token, hmac_secret, { algorithm: 'HS256' }).first
  rescue JWT::DecodeError
    nil
  end

  def hmac_secret
    Rails.application.secrets.secret_key_base
  end

  private :hmac_secret
end

class JsonWebToken
  class << self
    include CustomeImplementation
  end
end
