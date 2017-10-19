user = User.new(email: "test@test.com", name: "test", password: "111111",
password_confirmation: "111111")
user.save!

group = Group.create!(title: "techbang", description: "test", user_id: user.id)
user.join!(group)

post = group.posts.build(content: "This is a demo post")
post.user_id = user.id
post.save!
