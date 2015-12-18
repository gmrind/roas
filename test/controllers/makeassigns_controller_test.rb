require 'test_helper'

class MakeassignsControllerTest < ActionController::TestCase
  setup do
    @makeassign = makeassigns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:makeassigns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create makeassign" do
    assert_difference('Makeassign.count') do
      post :create, makeassign: { assign_no: @makeassign.assign_no, body: @makeassign.body, coursesemester_id: @makeassign.coursesemester_id, end_date: @makeassign.end_date, start_date: @makeassign.start_date, subject_id: @makeassign.subject_id, user_id: @makeassign.user_id }
    end

    assert_redirected_to makeassign_path(assigns(:makeassign))
  end

  test "should show makeassign" do
    get :show, id: @makeassign
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @makeassign
    assert_response :success
  end

  test "should update makeassign" do
    patch :update, id: @makeassign, makeassign: { assign_no: @makeassign.assign_no, body: @makeassign.body, coursesemester_id: @makeassign.coursesemester_id, end_date: @makeassign.end_date, start_date: @makeassign.start_date, subject_id: @makeassign.subject_id, user_id: @makeassign.user_id }
    assert_redirected_to makeassign_path(assigns(:makeassign))
  end

  test "should destroy makeassign" do
    assert_difference('Makeassign.count', -1) do
      delete :destroy, id: @makeassign
    end

    assert_redirected_to makeassigns_path
  end
end
