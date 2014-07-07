# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
VERBS = %w[clean type program walk eat help run walk]
NOUNS = %w[computer dog apple kitchen homework soap]

josh = User.create(name: 'Josh', email: 'josh@test.com', password: '123')
programming = josh.todo_lists.create(title: 'Programming')
chores = josh.todo_lists.create(title: 'Home Chores')

15.times do
  programming.todos.create(title: "#{VERBS.sample} the #{NOUNS.sample}",
                           due: [Date.yesterday, Date.current, Date.tomorrow].sample)
  chores.todos.create(title: "#{VERBS.sample} the #{NOUNS.sample}",
                           due: [Date.yesterday, Date.current, Date.tomorrow].sample)
end
