require 'test_helper'

class MohrsControllerTest < ActionController::TestCase
  setup do
    @mohr = mohrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mohrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mohr" do
    assert_difference('Mohr.count') do
      post :create, mohr: { mohr_code: @mohr.mohr_code }
    end

    assert_redirected_to mohr_path(assigns(:mohr))
  end

  test "should show mohr" do
    get :show, id: @mohr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mohr
    assert_response :success
  end

  test "should update mohr" do
    patch :update, id: @mohr, mohr: { mohr_code: @mohr.mohr_code }
    assert_redirected_to mohr_path(assigns(:mohr))
  end

  test "should destroy mohr" do
    assert_difference('Mohr.count', -1) do
      delete :destroy, id: @mohr
    end

    assert_redirected_to mohrs_path
  end
end
