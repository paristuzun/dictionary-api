# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Category.destroy_all
Topic.destroy_all
Entry.destroy_all

10.times do
  user =  User.create!(
               username: Faker::Internet.username,
               password: Faker::Internet.password(10, 20, true))
end



5.times do
  category =  Category.create([{ name: 'today' },
                               { name: 'trending' },
                               { name: 'sports' },
                               { name: 'relationships'},
                               { name: 'politics' },
                               { name: 'travel' },
                               { name: 'science'},
                               { name: 'literature' },
                               { name: 'economy' }])

end

10.times do
  topic = Topic.create!(description: Faker::GameOfThrones.quote,
              title: Faker::Lorem.sentence(rand(4) + 1, true),
               user_id: User.all.sample.id)
end


10.times do
  entry =  Entry.create!(body: Faker::GameOfThrones.quote,
                user_id: User.all.sample.id,
                topic_id: Topic.all.sample.id)
end
