namespace :dev do
  desc "drop; create; migrate; seed"
  task build: [ "db:drop", "db:create", "db:migrate", "db:seed" ]

  desc "Create fake data"
  task fake: :environment do
    user = User.find_or_create_by!(email: "andy@test.com") do |user|
      user.email = "andy@test.com"
      user.password = "111111"
      user.password_confirmation = "111111"
      user.name = "Andy"
    end

    Group.populate(10) do |group|
      group.title = Populator.words(1..10)
      group.description = Populator.sentences(1)
      group.user_id = user.id

      GroupUser.create!(group_id: group.id, user_id: user.id)

      Post.populate(5) do |post|
        post.content = Populator.paragraphs(1)
        post.group_id = group.id
        post.user_id = user.id
      end
    end
  end
end
