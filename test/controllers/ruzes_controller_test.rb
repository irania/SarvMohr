require 'test_helper'

class RuzesControllerTest < ActionController::TestCase
  setup do
    @ruze = ruzes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ruzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ruze" do
    assert_difference('Ruze.count') do
      post :create, ruze: { name: @ruze.name, tedad: @ruze.tedad, tozihat: @ruze.tozihat }
    end

    assert_redirected_to ruze_path(assigns(:ruze))
  end

  test "should show ruze" do
    get :show, id: @ruze
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ruze
    assert_response :success
  end

  test "should update ruze" do
    patch :update, id: @ruze, ruze: { name: @ruze.name, tedad: @ruze.tedad, tozihat: @ruze.tozihat }
    assert_redirected_to ruze_path(assigns(:ruze))
  end

  test "should destroy ruze" do
    assert_difference('Ruze.count', -1) do
      delete :destroy, id: @ruze
    end

    assert_redirected_to ruzes_path
  end
end
