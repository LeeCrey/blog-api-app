# frozen_string_literal: true

json.ok true
json.message t('created', res: 'Comment')

json.comment do
  json.partial! 'api/v1/android/comments/comment', comment: @comment
end
