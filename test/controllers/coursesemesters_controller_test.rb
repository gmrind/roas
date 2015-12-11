require 'test_helper'

class CoursesemestersControllerTest < ActionController::TestCase
  setup do
    @coursesemester = coursesemesters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coursesemesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coursesemester" do
    assert_difference('Coursesemester.count') do
      post :create, coursesemester: { course_id: @coursesemester.course_id, name: @coursesemester.name, user_id: @coursesemester.user_id }
    end

    assert_redirected_to coursesemester_path(assigns(:coursesemester))
  end

  test "should show coursesemester" do
    get :show, id: @coursesemester
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coursesemester
    assert_response :success
  end

  test "should update coursesemester" do
    patch :update, id: @coursesemester, coursesemester: { course_id: @coursesemester.course_id, name: @coursesemester.name, user_id: @coursesemester.user_id }
    assert_redirected_to coursesemester_path(assigns(:coursesemester))
  end

  test "should destroy coursesemester" do
    assert_difference('Coursesemester.count', -1) do
      delete :destroy, id: @coursesemester
    end

    assert_redirected_to coursesemesters_path
  end
end
