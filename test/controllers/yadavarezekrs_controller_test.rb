require 'test_helper'

class YadavarezekrsControllerTest < ActionController::TestCase
  setup do
    @yadavarezekr = yadavarezekrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yadavarezekrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yadavarezekr" do
    assert_difference('Yadavarezekr.count') do
      post :create, yadavarezekr: { min: @yadavarezekr.min, saat: @yadavarezekr.saat, tozihat: @yadavarezekr.tozihat }
    end

    assert_redirected_to yadavarezekr_path(assigns(:yadavarezekr))
  end

  test "should show yadavarezekr" do
    get :show, id: @yadavarezekr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yadavarezekr
    assert_response :success
  end

  test "should update yadavarezekr" do
    patch :update, id: @yadavarezekr, yadavarezekr: { min: @yadavarezekr.min, saat: @yadavarezekr.saat, tozihat: @yadavarezekr.tozihat }
    assert_redirected_to yadavarezekr_path(assigns(:yadavarezekr))
  end

  test "should destroy yadavarezekr" do
    assert_difference('Yadavarezekr.count', -1) do
      delete :destroy, id: @yadavarezekr
    end

    assert_redirected_to yadavarezekrs_path
  end
end
