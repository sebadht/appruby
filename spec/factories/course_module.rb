require 'faker'
FactoryBot.define do
  factory :course_module do
    title { 'any title' }
    description { Faker::Lorem.sentence }
  end
end