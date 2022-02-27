require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:leecrey)
    @post = posts(:first)
    @comment = comments(:first)
    @crypt = MessageEncrypt.new
    @token = @crypt.encrypt @user.token_get
  end

  test 'should get index' do
    get post_comments_path(@post), as: :json
    assert_response :success
  end

  test 'should not create comment' do
    @token += 'x'
    assert_difference('Comment.count', 0) do
      post post_comments_path(@post),
      headers: { Authorization: @token },
      params: { comment: { content: @comment.content, post_id: @comment.post_id, user_id: @comment.user_id } },
      as: :json
    end

    assert_response :unauthorized
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post post_comments_path(@post),
      headers: { Authorization: @token },
      params: { comment: { content: @comment.content, post_id: @comment.post_id, user_id: @comment.user_id } },
      as: :json
    end

    assert_response :created
  end

  test 'should not show comment' do
    url = 'http://localhost:3000/comments/32'
    get url, as: :json
    assert_response :not_found
  end

  test 'should show comment' do
    get comment_url(@comment), as: :json
    assert_response :success
  end

  test 'should update comment' do
    content = 'New content'
    hash = { content: content, post_id: @comment.post_id, user_id: @comment.user_id }
    patch comment_url(@comment), headers: { Authorization: @token }, params: { comment: hash }, as: :json
    assert_response :success
  end

  test 'should not destroy comment' do
    @token += 'x'
    assert_difference('Comment.count', 0) do
      delete comment_url(@comment), headers: { Authorization: @token }, as: :json
    end

    assert_response :unauthorized
  end

  test 'should destroy comment' do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment), headers: { Authorization: @token }, as: :json
    end

    assert_response :no_content
  end
end
