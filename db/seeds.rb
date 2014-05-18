# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@editor = User.create(nickname:  "PortfolioAdmin",
                      email: "editor@example.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "editor")
10.times do
  @post = Post.create(title: Faker::Company.catch_phrase,
              body:  Faker::Lorem.paragraphs.join("\n"),
              published: false,
              author_id: @editor.id)
  puts "Created sample post #{@post.title}"
end

puts "Done: Editor Seeded.\n #{@editor.to_yaml}"
