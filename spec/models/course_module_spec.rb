require 'rails_helper'

RSpec.describe CourseModule, type: :model do

  let(:user) { create(:user) }
  
  course_params = {
    name: 'any name',
    description: 'any description',
    category: 'any category'
  }
  course_module_params = {
    title: 'any title',
    description: 'any description'
  }

  before { @course = user.courses.build(course_params) }
  subject { @course }
  before { @course_module = @course.course_modules.build(course_module_params) }
  subject { @course_module }

  context 'Module validation' do

    it 'is valid with valid attributes' do
      expect(@course_module).to be_valid
    end

    it 'is not valid without a title' do
      @course_module.title = nil
      expect(@course_module).not_to be_valid
    end

    it 'is not valid without a description' do
      @course_module.description = nil
      expect(@course_module).not_to be_valid
    end
    
  end
end