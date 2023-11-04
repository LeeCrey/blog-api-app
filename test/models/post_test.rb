# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  content         :text             not null
#  user_id         :bigint           not null
#  cached_votes_up :integer          default(0), not null
#  comments_count  :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @lee_crey = users(:leecrey)
  end

  test 'should not create post without body and user id' do
    assert_not Post.new.save, 'Post created without body and user id'
  end

  test 'should raise non null constrain exception without content' do
    assert_raises(ActiveRecord::NotNullViolation) do
      Post.new(user_id: @lee_crey.id).save
    end
  end

  test 'should not create post without user id' do
    assert_not Post.new(content: 'hello world').save, 'created post without user id'
  end

  test 'should create post' do
    assert Post.new(content: 'hello world', user_id: @lee_crey.id).save, 'not able to create post' 
  end
end
