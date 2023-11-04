# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  post_id         :bigint           not null
#  content         :text
#  cached_votes_up :integer          default(0), not null
#  replies_count   :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Validations
  validates :content, presence: true
end
