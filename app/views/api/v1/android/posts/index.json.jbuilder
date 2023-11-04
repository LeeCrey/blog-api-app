# frozen_string_literal: true

json.ok true

json.posts do
  json.partial! 'api/v1/android/posts/post', collection: @posts, as: :post
end

json.partial! 'api/v1/meta', { pagy: @pagy }
