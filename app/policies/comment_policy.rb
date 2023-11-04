# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  private

  def check
    @user.id == @record.user_id
  end
end
