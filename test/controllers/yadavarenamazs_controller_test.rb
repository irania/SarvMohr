require 'test_helper'

class YadavarenamazsControllerTest < ActionController::TestCase
  setup do
    @yadavarenamaz = yadavarenamazs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yadavarenamazs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yadavarenamaz" do
    assert_difference('Yadavarenamaz.count') do
      post :create, yadavarenamaz: { min: @yadavarenamaz.min, saat: @yadavarenamaz.saat, tozihat: @yadavarenamaz.tozihat }
    end

    assert_redirected_to yadavarenamaz_path(assigns(:yadavarenamaz))
  end

  test "should show yadavarenamaz" do
    get :show, id: @yadavarenamaz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yadavarenamaz
    assert_response :success
  end

  test "should update yadavarenamaz" do
    patch :update, id: @yadavarenamaz, yadavarenamaz: { min: @yadavarenamaz.min, saat: @yadavarenamaz.saat, tozihat: @yadavarenamaz.tozihat }
    assert_redirected_to yadavarenamaz_path(assigns(:yadavarenamaz))
  end

  test "should destroy yadavarenamaz" do
    assert_difference('Yadavarenamaz.count', -1) do
      delete :destroy, id: @yadavarenamaz
    end

    assert_redirected_to yadavarenamazs_path
  end
end
