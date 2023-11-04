# frozen_string_literal: true

json.ok true
json.message t('created', res: 'Comment')

json.comments do
  json.partial! 'api/v1/android/comments/comment', comment: @comment
end
