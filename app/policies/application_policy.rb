# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def update?
    check
  end

  def destroy?
    check
  end

  private

  def check
    raise NotImplementedError, "You must define #check in #{self.class}"
  end
end
