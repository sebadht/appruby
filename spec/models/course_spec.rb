require 'rails_helper'

RSpec.describe Course, type: :model do

  let(:user) {create(:user)}

  course_params = {
    name: 'any name',
    description: 'any description',
    category: 'any category'
  }

  before { @course = user.courses.build(course_params) }
  subject { @course }

  context 'Course validation' do

    it 'is valid with valid attributes' do
      expect(@course).to be_valid
    end

    it 'is not valid without a name' do
      @course.name = nil
      expect(@course).not_to be_valid
    end

    it 'is not valid with a short name' do
      @course.name = 'i'
      expect(@course).not_to be_valid
    end

    it 'is not valid without a description' do
      @course.description = nil
      expect(@course).not_to be_valid
    end

    it 'is not valid without a category' do
      @course.category = nil
      expect(@course).not_to be_valid
    end
  end

  context 'Course associations' do

    it 'should have many reviews' do
      reviews = Course.reflect_on_association(:reviews)
      expect(reviews.macro).to eq(:has_many)
    end

    it 'should have many course modules' do
      course_modules = Course.reflect_on_association(:course_modules)
      expect(course_modules.macro).to eq(:has_many)
    end

    it 'should have many inscriptions' do
      inscriptions = Course.reflect_on_association(:inscriptions)
      expect(inscriptions.macro).to eq(:has_many)
    end

    it 'should have many inscripted users' do
      inscripted_users = Course.reflect_on_association(:inscripted_users)
      expect(inscripted_users.macro).to eq(:has_many)
    end

  end
end