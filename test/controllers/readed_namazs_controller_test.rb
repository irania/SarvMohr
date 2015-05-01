require 'test_helper'

class ReadedNamazsControllerTest < ActionController::TestCase
  setup do
    @readed_namaz = readed_namazs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:readed_namazs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create readed_namaz" do
    assert_difference('ReadedNamaz.count') do
      post :create, readed_namaz: { date: @readed_namaz.date, period: @readed_namaz.period, start_time: @readed_namaz.start_time, stateus: @readed_namaz.stateus, type: @readed_namaz.type }
    end

    assert_redirected_to readed_namaz_path(assigns(:readed_namaz))
  end

  test "should show readed_namaz" do
    get :show, id: @readed_namaz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @readed_namaz
    assert_response :success
  end

  test "should update readed_namaz" do
    patch :update, id: @readed_namaz, readed_namaz: { date: @readed_namaz.date, period: @readed_namaz.period, start_time: @readed_namaz.start_time, stateus: @readed_namaz.stateus, type: @readed_namaz.type }
    assert_redirected_to readed_namaz_path(assigns(:readed_namaz))
  end

  test "should destroy readed_namaz" do
    assert_difference('ReadedNamaz.count', -1) do
      delete :destroy, id: @readed_namaz
    end

    assert_redirected_to readed_namazs_path
  end
end
