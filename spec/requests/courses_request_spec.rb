require 'rails_helper'

class CourseTest < ActiveSupport::TestCase

  RSpec.describe 'Courses', type: :request do
    before(:each) do
      @valid_user = {
        name: 'Example name',
        last_name: 'Example last name',
        email: 'Example@email.cl',
        password: 'Example password'
      }
      @valid_course = {
        name: 'Example course',
        description: 'Example description',
        category: 'Example category'
      }
      @update_course = {
        name: 'Update course',
        description: 'Update description',
        category: 'Update category'
      }
      @invalid_course = {
        name: '',
        description: '',
        category: ''
      }
    end

    ## Courses new test
    describe 'new' do
      it 'should return a successful request' do
        user = User.create!(@valid_user)
        get courses_new_path(:id => user.id)
        expect(response).to have_http_status(:ok)
      end
    end

    ## Courses create test
    describe 'create' do
      it 'should redirect after create a publication' do
        expect do
          user = User.create!(@valid_user)
          post courses_create_path(:id => user.id), params: { course: @valid_course }
        end.to change(Course, :count).by(1)
      end

      it 'should redirect after not creating a publication' do
        expect do
          user = User.create!(@valid_user)
          post courses_create_path(:id => user.id), params: { course: @invalid_course }
        end.to change(Course, :count).by(0)
      end
    end

    ## Courses index test
    describe 'index' do
      it 'should return a successful request' do
        get '/courses/index'
        expect(response).to have_http_status(:ok)
      end
    end

    ## Courses show test
    describe 'show' do
      it 'should return a successful request' do
        user = User.create!(@valid_user)
        course = user.courses.create!(@valid_course)
        get courses_show_path(:id => course.id)
        expect(response).to have_http_status(:ok)
      end
    end

    ## Courses edit test
    describe 'edit' do
      it 'should return a successful request' do
        user = User.create!(@valid_user)
        course = user.courses.create!(@valid_course)
        get courses_edit_path(:id => course.id)
        expect(response).to have_http_status(:ok)
      end
    end

    ## Courses update test
    describe 'update' do
      it 'should update name attribute in a course' do
        user = User.create!(@valid_user)
        course = user.courses.create!(@valid_course)
        patch courses_update_path(id: course.id), params: { course: @update_course }
        expect(course.name == 'Update course')
      end

      it 'should update description update_course in a course' do
        user = User.create!(@valid_user)
        course = user.courses.create!(@valid_course)
        patch courses_update_path(id: course.id), params: { course: @update_course }
        expect(course.description == 'Update description')
      end

      it 'should update category update_course in a course' do
        user = User.create!(@valid_user)
        course = user.courses.create!(@valid_course)
        patch courses_update_path(id: course.id), params: { course: @update_course }
        expect(course.category == 'Update category')
      end
    end

    ## Courses delete test
    describe 'delete' do
      it 'should decrease the count after deletion of a game' do
        user = User.create!(@valid_user)
        course = user.courses.create!(@valid_course)
        expect do
          delete courses_delete_path(id: course.id)
        end.to change(Course, :count).by(-1)
      end
    end


  end
end
