# frozen_string_literal: true

module SessionsConcern
  private

  def current_token
    request.env['warden-jwt_auth.token']
  end

  # LOGIN
  def respond_with(_resource, _opt = {})
    if user_signed_in?
      render_success(I18n.t('devise.sessions.signed_in'), :ok)
    else
      msg = I18n.t('devise.failure.invalid', authentication_keys: 'Email')
      render_json_error(msg, :unauthorized)
    end
  end

  # LOGOUT
  def respond_to_on_destroy
    if student_signed_in?
      render_success({ _message: I18n.t('devise.sessions.signed_out') })
    else
      render_json_error(I18n.t('devise.failure.timeout'), :unauthorized)
    end
  end
end
