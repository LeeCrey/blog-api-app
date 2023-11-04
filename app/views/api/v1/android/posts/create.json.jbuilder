# frozen_string_literal: true

json.ok true
json.message t('created', res: 'Post')

json.post do
  json.partial! 'api/v1/android/posts/post', post: @post
end
