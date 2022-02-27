# frozen_string_literal: true

module UserConcern
  extend ActiveSupport::Concern

  included do
    validates :email, :first_name, :password, presence: true
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, length: { within: 1..30 }
    # last can be nil but if it exist, its length should not exceed 30 chars
    validates :last_name, length: { within: 1..30 }, if: -> { last_name.present? }
    validates :password, length: { minimum: 6 }

    has_secure_password
  end

  def token_get
    JsonWebToken.encode({ email: email })
  end

  def full_name
    return first_name if last_name.blank?

    "#{first_name} #{last_name}"
  end
end
