# frozen_string_literal: true

json.extract! comment, :id, :content, :replies_count, :post_id
json.likes_count comment.cached_votes_up

json.user do
  json.extract! comment.user, :id, :full_name
end
