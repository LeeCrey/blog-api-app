# frozen_string_literal: true

module RegistrationsConcern
  private

  def respond_with(_resource, _opts = {})
    render_success(I18n.t('devise.registrations.signed_up_but_unconfirmed'), :ok)

    ## If you don't want paranoid message you can uncomment the below lines and
    ## comment the above line
    # if _resource.errors.empty? && _resource.persisted?
    #   render_success(I18n.t("devise.registrations.signed_up_but_unconfirmed"), :ok)
    # else
    #   render json: { ok: false, errors: resource.errors }, status: :unprocessable_entity
    # end
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :current_password)
  end

  # Overriding
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
