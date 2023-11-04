# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |ex|
    render_json_error(ex.message, :unprocessable_entity)
  end

  protected

  def update_last_seen_at
    current_user.touch :last_seen_at unless current_user.online?
  end

  def render_json_error(msg, code)
    render json: { ok: false, reason: msg }, status: code
  end

  def render_success(msg, code)
    render json: { ok: true, _message: msg }, status: code
  end

  def raise_if_blank(resource, name)
    return if resource.present?

    raise ActiveRecord::RecordNotFound, t('not_found', resource: name)
  end
end
