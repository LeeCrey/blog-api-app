# frozen_string_literal: true

class MessageCrypt
  def initialize
    @salt = Rails.application.credentials.salt_for_message
    @key_gen  = Rails.application.credentials.key_gen
    @key  = ActiveSupport::KeyGenerator.new(@key_gen).generate_key(@salt, 32)
    @crypt = ActiveSupport::MessageEncryptor.new(@key)
  end

  def encrypt(message)
    @crypt.encrypt_and_sign message
  end

  def decrypt(token)
    @crypt.decrypt_and_verify token
  end
end
