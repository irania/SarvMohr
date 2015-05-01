require 'test_helper'

class SaidZekrsControllerTest < ActionController::TestCase
  setup do
    @said_zekr = said_zekrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:said_zekrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create said_zekr" do
    assert_difference('SaidZekr.count') do
      post :create, said_zekr: { date: @said_zekr.date, num_of_zekrs: @said_zekr.num_of_zekrs, start_time: @said_zekr.start_time, zekr_type: @said_zekr.zekr_type }
    end

    assert_redirected_to said_zekr_path(assigns(:said_zekr))
  end

  test "should show said_zekr" do
    get :show, id: @said_zekr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @said_zekr
    assert_response :success
  end

  test "should update said_zekr" do
    patch :update, id: @said_zekr, said_zekr: { date: @said_zekr.date, num_of_zekrs: @said_zekr.num_of_zekrs, start_time: @said_zekr.start_time, zekr_type: @said_zekr.zekr_type }
    assert_redirected_to said_zekr_path(assigns(:said_zekr))
  end

  test "should destroy said_zekr" do
    assert_difference('SaidZekr.count', -1) do
      delete :destroy, id: @said_zekr
    end

    assert_redirected_to said_zekrs_path
  end
end
