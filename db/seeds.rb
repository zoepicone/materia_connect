# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'John Doe',
                    email: 'john@example.com',
                    username: 'john_doe',
                    provider: 'developer',
                    uid: '1234567890')

50.times do
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              username: Faker::Internet.unique.username,
              provider: 'developer',
              uid: Faker::Number.unique.number(digits: 10))
end

50.times do
  title = Faker::Book.unique.title
  title = Faker::Book.unique.title while title.length > 48
  m = Mod.new(title:,
              description: Faker::Lorem.paragraph,
              tags: Faker::Lorem.words(number: 10),
              download_url: 'https://youtube.com/watch?v=dQw4w9WgXcQ',
              user_id: User.order(Arel.sql('RANDOM()')).first.id,
              nsfw: [true, false].sample,
              unlisted: [true, false].sample,
              premium: [true, false].sample)
  m.images.attach(io: File.open('app/assets/images/placeholder.png'),
                  filename: 'placeholder.png',
                  content_type: 'image/png')
  m.save
end
