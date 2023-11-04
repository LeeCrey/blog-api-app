# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  private

  def check
    @record.user_id == @user.id
  end
end
