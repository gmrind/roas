require 'test_helper'

class SessionenrollsControllerTest < ActionController::TestCase
  setup do
    @sessionenroll = sessionenrolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sessionenrolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sessionenroll" do
    assert_difference('Sessionenroll.count') do
      post :create, sessionenroll: { coursesession_id: @sessionenroll.coursesession_id, user_id: @sessionenroll.user_id }
    end

    assert_redirected_to sessionenroll_path(assigns(:sessionenroll))
  end

  test "should show sessionenroll" do
    get :show, id: @sessionenroll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sessionenroll
    assert_response :success
  end

  test "should update sessionenroll" do
    patch :update, id: @sessionenroll, sessionenroll: { coursesession_id: @sessionenroll.coursesession_id, user_id: @sessionenroll.user_id }
    assert_redirected_to sessionenroll_path(assigns(:sessionenroll))
  end

  test "should destroy sessionenroll" do
    assert_difference('Sessionenroll.count', -1) do
      delete :destroy, id: @sessionenroll
    end

    assert_redirected_to sessionenrolls_path
  end
end
