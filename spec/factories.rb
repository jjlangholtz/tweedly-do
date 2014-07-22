FactoryGirl.define do
  factory :user do
    name 'John'
    email 'foo@bar.com'
    password 'password'
  end

  factory :todo do
    title 'Clean cat litter'
  end

  factory :todo_list do
    title 'Chores'
  end
end
