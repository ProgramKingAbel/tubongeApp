# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create 20 users
users = []
20.times do |i|
  puts "Creating User #{i + 1}"
  user = User.create(
    name: "user_#{i + 1}",
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: "I am user #{i + 1}"
  )
  users << user
end

# Create posts and comments for each user
users.each do |user|
  5.times do |i|
    puts "Creating Post for User #{user.id}"
    post = Post.create(
      author: user,
      title: "Hello from User #{user.id}, Post #{i + 1}",
      text: "This is the post of User #{user.id}, Post #{i + 1}"
    )

    puts "Creating Comment for Post #{post.id} by User #{user.id}"
    Comment.create(
      post: post,
      author: users.sample,
      text: "Hi Tom!"
    )
  end
end
