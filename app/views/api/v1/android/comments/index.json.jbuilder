# frozen_string_literal: true

json.ok true

json.comments do
  json.partial! 'api/v1/android/comments/comment', collection: @comments, as: :comment
end

json.partial! 'api/v1/meta', { pagy: @pagy }
