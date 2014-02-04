namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 username: "exampleUser",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      username = "exampleUser#{n+1}"
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   username: username,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 6)
    50.times do
      description = Faker::Lorem.sentence(5)
      title = Faker::Name.title
      users.each { |user| user.posts.create!(description: description, title: title, youtube_id: "FVUSFVdmvYQ", category: "Other") }
    end
  end
end