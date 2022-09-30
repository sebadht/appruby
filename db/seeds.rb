# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin1 = User.create(email: 'admin@admin.cl', password: 'admin1', password_confirmation: 'admin1', name: 'ADMIN', is_admin: true, last_name: 'admin')
test_user = User.create(email: 'test@test.cl', password: 'testuser', password_confirmation: 'testuser', name: 'user', is_admin: false, last_name: 'test')
test_user.courses.create(
    name: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph,
    category: Faker::Educator.degree
  )

users_array = []
courses_array = []
3.times do
  password = Faker::Alphanumeric.alphanumeric(number: 10)
  user = User.create(
    name: Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    email: Faker::Internet.email,
    personal_info: Faker::Lorem.paragraph,
    password: password,
    password_confirmation: password,
    
  )
  users_array.push(user)
  course = user.courses.create(
    name: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph,
    category: Faker::Educator.degree
  )
  courses_array.push(course)
  3.times do
    course_module = course.course_modules.create(
      title: Faker::Educator.subject,
      description: Faker::Lorem.paragraph,
    )
  end
end

courses_array.each do |course|
  users_array.each do |user|
    if not user.id == course.user.id
      Inscription.create(user: user, course: course)
      user.reviews.create(
        title: Faker::Emotion.adjective,
        description: Faker::Lorem.paragraph,
        score: Faker::Number.between(from: 0, to: 5),
        course: course
      )
    end
  end
end