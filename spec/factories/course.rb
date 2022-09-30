require 'faker'
FactoryBot.define do
  factory :course do
    name { 'any title' }
    description {Faker::Lorem.sentence}
    category { 'any category' }
  end
end