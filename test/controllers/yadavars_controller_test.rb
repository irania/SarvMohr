require 'test_helper'

class YadavarsControllerTest < ActionController::TestCase
  setup do
    @yadavar = yadavars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yadavars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yadavar" do
    assert_difference('Yadavar.count') do
      post :create, yadavar: { min: @yadavar.min, saat: @yadavar.saat, tozihat: @yadavar.tozihat }
    end

    assert_redirected_to yadavar_path(assigns(:yadavar))
  end

  test "should show yadavar" do
    get :show, id: @yadavar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yadavar
    assert_response :success
  end

  test "should update yadavar" do
    patch :update, id: @yadavar, yadavar: { min: @yadavar.min, saat: @yadavar.saat, tozihat: @yadavar.tozihat }
    assert_redirected_to yadavar_path(assigns(:yadavar))
  end

  test "should destroy yadavar" do
    assert_difference('Yadavar.count', -1) do
      delete :destroy, id: @yadavar
    end

    assert_redirected_to yadavars_path
  end
end
