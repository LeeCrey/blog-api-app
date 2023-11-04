# frozen_string_literal: true

module UserConcern
  extend ActiveSupport::Concern

  included do
    validates :first_name, presence: true, length: { within: 1..30 }
    # last can be nil but if it exist, its length should not exceed 30 chars
    validates :last_name, length: { within: 1..30 }, if: -> { last_name.present? }
  end

  def to_s
    return first_name if last_name.blank?

    "#{first_name} #{last_name}"
  end

  # methods
  def online?
    !!(last_seen_at&.> 3.minutes.ago)
  end
end
