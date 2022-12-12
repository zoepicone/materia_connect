# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


mod1 = Mod.create!(title: 'Mod 1',
                   description: 'This is the first mod.',
                   tags: 'mod, first, body',
                   download_url: 'https://youtube.com/watch?v=dQw4w9WgXcQ',
                   user_id: 1)

mod2 = Mod.create!(title: 'Mod 2',
                   description: 'This is the second mod.',
                   tags: 'mod, second, clothing',
                   download_url: 'https://youtube.com/watch?v=dQw4w9WgXcQ',
                   user_id: 1)
