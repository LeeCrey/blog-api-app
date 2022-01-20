# frozen_string_literal: true

module UserConcern
  extend ActiveSupport::Concern

  included do
    validates :email, :first_name, presence: true
    validates :email, uniqueness: true
    validates :first_name, length: { within: 1..30 }
    validates :password, length: { minimum: 6 }
    validates_format_of :email, with: /[a-z0-9]+@/i

    has_secure_password
  end

  def authenticate(pwd)
    password == pwd
  end

  def token_get
    JsonWebToken.encode({ email: email })
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
