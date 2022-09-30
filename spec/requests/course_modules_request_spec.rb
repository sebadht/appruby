require 'rails_helper'

class CourseModuleTest < ActiveSupport::TestCase

    RSpec.describe "CourseModules", type: :request do

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
            @valid_coursemodule = {
                title: "Title",
                description: "Description",
                worksheets: "Worksheets",
            }
            @invalid_coursemodule = {
                title: "",
                description: "",
                worksheets: "",
            }
            @attr_update = {
                title: "Update Title",
                description: "Update Description",
                worksheets: "Update Worksheets",
            }
        end

        # Module index tests
        # describe "index" do
        #     it "should return a succesfull request" do
        #         get "/course_modules/index"
        #         expect(response).to have_http_status(:ok)
        #     end
        # end

        # Module new tests
        describe "new" do
            it "should return a succesfull request" do
                user = User.create!(@valid_user)
                course = user.courses.create!(@valid_course)
                get course_modules_new_path(:id => course.id)
                expect(response).to have_http_status(:ok)
            end
        end

        # Module create tests
        describe "create" do
            it "should save after create a publication" do
                user = User.create!(@valid_user)
                course = user.courses.create!(@valid_course)
                expect do
                    post course_modules_create_path(:id => course.id), params: { course_module: @valid_coursemodule}
                end.to change(CourseModule, :count).by(1)
            end
            it "should redirect after not creating a publication" do
                user = User.create!(@valid_user)
                course = user.courses.create!(@valid_course)
                expect do
                    post course_modules_create_path(:id => course.id), params: { course_module: @invalid_coursemodule}
                end.to change(CourseModule, :count).by(0)
            end
        end

        ## Module show test
        describe 'show' do
            it 'should return a successful request' do
                user = User.create!(@valid_user)
                course = user.courses.create!(@valid_course)
                course_module = course.course_modules.create!(@valid_coursemodule)
                get course_modules_show_path(:id => course_module.id)
                expect(response).to have_http_status(:ok)
            end
        end
  
        ## Module edit test
        describe 'edit' do
            it 'should return a successful request' do
                user = User.create!(@valid_user)
                course = user.courses.create!(@valid_course)
                course_module = course.course_modules.create!(@valid_coursemodule)
                get course_modules_edit_path(:id => course_module.id)
                expect(response).to have_http_status(:ok)
            end
        end
  
        ## Module update test
        describe 'update' do
            it 'should update name attribute in a module' do
                user = User.create!(@valid_user)
                course = user.courses.create!(@valid_course)
                course_module = course.course_modules.create!(@valid_coursemodule)
                patch course_modules_update_path(id: course_module.id), params: { course_module: @attr_update }
                expect(course_module.title == 'Update Title')
            end
  
            it 'should update description attribute in a module' do
                user = User.create!(@valid_user)
                course = user.courses.create!(@valid_course)
                course_module = course.course_modules.create!(@valid_coursemodule)
                patch course_modules_update_path(id: course_module.id), params: { course_module: @attr_update }
                expect(course_module.description == 'Update Description')
            end
  
            it 'should update worksheet attribute in a module' do
                user = User.create!(@valid_user)
                course = user.courses.create!(@valid_course)
                course_module = course.course_modules.create!(@valid_coursemodule)
                patch course_modules_update_path(id: course_module.id), params: { course_module: @attr_update }
                expect(course_module.worksheets == 'Update Worksheet')
            end
        end
  
        ## Module delete test
        describe 'delete' do
            it 'should decrease the count after deletion of a game' do
                user = User.create!(@valid_user)
                course = user.courses.create!(@valid_course)
                course_module = course.course_modules.create!(@valid_coursemodule)
                expect do
                    delete course_modules_delete_path(id: course_module.id)
                end.to change(CourseModule, :count).by(-1)
            end
        end


        






    end
end 