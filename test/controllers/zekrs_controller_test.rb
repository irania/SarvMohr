require 'test_helper'

class ZekrsControllerTest < ActionController::TestCase
  setup do
    @zekr = zekrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zekrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zekr" do
    assert_difference('Zekr.count') do
      post :create, zekr: { name: @zekr.name, tedad: @zekr.tedad, tozihat: @zekr.tozihat }
    end

    assert_redirected_to zekr_path(assigns(:zekr))
  end

  test "should show zekr" do
    get :show, id: @zekr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zekr
    assert_response :success
  end

  test "should update zekr" do
    patch :update, id: @zekr, zekr: { name: @zekr.name, tedad: @zekr.tedad, tozihat: @zekr.tozihat }
    assert_redirected_to zekr_path(assigns(:zekr))
  end

  test "should destroy zekr" do
    assert_difference('Zekr.count', -1) do
      delete :destroy, id: @zekr
    end

    assert_redirected_to zekrs_path
  end
end
