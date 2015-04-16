require 'faker'

User.destroy_all

10.times do User.create(
  full_name: Faker::Name.name,
  username: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: "password",
  bio: Faker::Lorem.paragraph,
  profile_image: Faker::Avatar.image
  )
end
