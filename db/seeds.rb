puts 'creating account ....'

# User
10.times do
  pwd = Faker::Internet.password
  hash = { first_name: Faker::Name.unique.name, email: Faker::Internet.email }
  hash.merge!({ password: pwd })
  user = User.new(hash)
  user.password_confirmation = pwd
  user.save
end

# POSTS
@user = User.first
puts 'creating posts ....'
50.times do
  title = Faker::Lorem.sentence
  content =  Faker::Lorem.sentence(word_count: 30)
  hash = { title: title, content: content }
  @user.posts.new(hash).save
end

# comments
puts 'creating comment ....'

post = Post.first
100.times do
  content =  Faker::Lorem.sentence(word_count: 30)
  hash = { content: content }
  koment = post.comments.new(hash)
  koment.user = User.second
  koment.save
end
