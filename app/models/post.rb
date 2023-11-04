# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  content         :text             not null
#  user_id         :bigint           not null
#  cached_votes_up :integer          default(0), not null
#  comments_count  :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
end
