require 'test_helper'

class RegistrationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:leecrey)
    # email is already exist
    @data = { first_name: @user.first_name, email: @user.email, password: 'hello world' }
    @data.merge!({ password_confirmation: 'hello world' })
  end

  test 'should return error' do
    post register_url, params: { user: @data }, as: :json
    assert_response :unprocessable_entity
    assert_equal @response.body, %({"email":["has already been taken"]})
  end

  test 'should return authorization token' do
    # email changed here
    @data[:email] = 'changed-email@gmail.com'
    post register_url, params: { user: @data }, as: :json
    assert_response :created, 'Expecting authorization token but did not get'
  end

  test 'should return authorization error' do
    # random garbage token
    token = JsonWebToken.encode({ email: 'leecrey@gmail.com' })
    delete users_url, headers: { 'Authorization': token }, as: :json
    assert_response :unauthorized, 'request was authorized with wrong token'
  end

  test 'should remove account' do
    token = MessageEncrypt.new.encrypt(@user.token_get)
    delete users_url, headers: { 'Authorization': token },
                      params: { confirmation: { password: 'hello world' } }, as: :json
    assert_response :no_content, 'request was unauthorized with correct token'
  end
end
