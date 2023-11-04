# frozen_string_literal: true

json.extract! post, :id, :content, :comments_count
json.likes_count post.cached_votes_up

json.user do
  json.extract! post.user, :id, :full_name
end
