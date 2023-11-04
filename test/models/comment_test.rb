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
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @lee_crey = users(:leecrey)
    @post = posts(:first)
    @comment = Comment.new
  end

  test 'it should not be valid' do
    assert_not @comment.valid?, 'it is valid but it should not be'

    @comment.user_id = @lee_crey.id
    assert_not @comment.valid?, 'it is valid but it should not be'

    @comment.content = %(Et in id optio ab aliquam fuga nam debitis dolores eveniet)
    assert_not @comment.valid?
  end

  test 'it should be valid' do
    @comment.user_id = @lee_crey.id
    @comment.post_id = @post.id
    @comment.content = %(Et in id optio ab aliquam fuga nam debitis dolores eveniet)

    assert @comment.valid?
    assert @comment.save
  end
end
