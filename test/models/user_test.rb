# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string(30)       not null
#  last_name              :string(30)
#  last_seen_at           :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new({ first_name: 'Solomon', email: 'already-taken@gmail.com' })
    @user.password = 'hello world'
    @user.password_confirmation = 'hello world'
  end

  test 'should not be valid with' do
    # with existing email
    assert_not @user.valid?, 'Valid with already taken email'

    # with wrong confirmation password
    @user.password_confirmation = 'hello world32'
    assert_not @user.valid?, 'Valid with wrong confirmation password'

    # with wrong password length
    @user.password = 'hello'
    @user.password_confirmation = 'hello'
    assert_not @user.valid?, 'User is valid with invalid password length'

    # with empty first_name
    @user.first_name = ''
    @user.password = 'hello world'
    @user.password_confirmation = 'hello world'
    assert_not @user.valid?, 'Valid with empty first name but it should not'

    # with first_name length 31
    @user.first_name = %(Lorem ipsum dolor sit amet cons)
    assert_not @user.valid?, "Valid with invalid first name length #{@user.first_name.size}"

    # with invalid email
    @user.first_name = 'Solomon'
    @user.email = 'wrong-email'
    assert_not @user.valid?, "User is valid with invalid email address #{@user.email}"
  end

  test 'should be valid' do
    @user.email = 'correct-email@gmail.com'
    @user.first_name = %(Lorem ipsum dolor sit amet co)
    assert @user.valid?, 'Invalid with valid first name'

    # save
    assert @user.save, 'Can not create with valid data'
  end
end
