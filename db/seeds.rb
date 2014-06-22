# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
lists = []

5.times do
  users << User.create(name: Faker::Name.first_name)
end

users.each do |user|
  times = 5
  while times > 0 do
    lists << TodoList.create(title: Faker::Lorem.word,
                             user: user)
    times -= 1
  end
end

lists.each do |list|
  times = 5
  while times > 0 do
    todo = Todo.create(title: Faker::Lorem.sentence(1, false, 3),
                       todo_list: list)
    todo.save
    times -= 1
  end
end
