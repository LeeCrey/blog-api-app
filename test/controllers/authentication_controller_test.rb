require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:leecrey)
    @data = { email: @user.email, password: 'incorrect password' }
  end

  test 'should be unauthorized' do
    post login_url, params: { user: @data }, as: :json
    assert_response :unauthorized

    assert_equal @response.body, %({"error":"Incorrect username or password"})
  end

  test 'should be authorized' do
    # correct password
    @data[:password] = 'hello world'
    post login_url, params: { user: @data }, as: :json
    assert_response :success
  end
end
