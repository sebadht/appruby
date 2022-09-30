require 'test_helper'

class CourseModulesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get course_modules_new_url
    assert_response :success
  end

  test "should get index" do
    get course_modules_index_url
    assert_response :success
  end

  test "should get show" do
    get course_modules_show_url
    assert_response :success
  end

  test "should get edit" do
    get course_modules_edit_url
    assert_response :success
  end

end
