# frozen_string_literal: true

Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  # config.mailer = 'Devise::Mailer'
  # config.parent_mailer = 'ActionMailer::Base'

  require 'devise/orm/active_record'

  # config.authentication_keys = [:email]
  # config.request_keys = []
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  config.paranoid = true
  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 12

  # config.send_email_changed_notification = false
  # config.send_password_change_notification = false
  # config.allow_unconfirmed_access_for = 2.days
  # config.confirm_within = 3.days

  config.reconfirmable = true
  # config.confirmation_keys = [:email]
  # config.remember_for = 2.weeks

  config.expire_all_remember_me_on_sign_out = true
  # config.extend_remember_period = false

  # config.rememberable_options = {}
  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.timeout_in = 30.minutes

  config.lock_strategy = :failed_attempts
  # config.unlock_keys = [:email]
  config.unlock_strategy = :both

  config.maximum_attempts = 5
  config.unlock_in = 1.hour
  config.last_attempt_warning = true
  # config.reset_password_keys = [:email]
  config.reset_password_within = 6.hours
  # config.sign_in_after_reset_password = true

  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true

  # config.navigational_formats = ['*/*', :html, :turbo_stream]
  config.navigational_formats = []

  config.sign_out_via = :delete

  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  # JWT
  config.jwt do |jwt|
    jwt.secret = ENV.fetch("JWT_SECRET_KEY")
    jwt.dispatch_requests = [["POST", %r{^/login$}]]
    jwt.revocation_requests = [["DELETE", %r{^/logout$}]]
    jwt.expiration_time = 1.months.to_i
  end
end
