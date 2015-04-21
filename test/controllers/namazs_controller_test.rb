require 'test_helper'

class NamazsControllerTest < ActionController::TestCase
  setup do
    @namaz = namazs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:namazs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create namaz" do
    assert_difference('Namaz.count') do
      post :create, namaz: { name: @namaz.name, tedad: @namaz.tedad, tedad_rokat: @namaz.tedad_rokat, tozihat: @namaz.tozihat }
    end

    assert_redirected_to namaz_path(assigns(:namaz))
  end

  test "should show namaz" do
    get :show, id: @namaz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @namaz
    assert_response :success
  end

  test "should update namaz" do
    patch :update, id: @namaz, namaz: { name: @namaz.name, tedad: @namaz.tedad, tedad_rokat: @namaz.tedad_rokat, tozihat: @namaz.tozihat }
    assert_redirected_to namaz_path(assigns(:namaz))
  end

  test "should destroy namaz" do
    assert_difference('Namaz.count', -1) do
      delete :destroy, id: @namaz
    end

    assert_redirected_to namazs_path
  end
end
