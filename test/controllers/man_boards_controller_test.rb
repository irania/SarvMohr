require 'test_helper'

class ManBoardsControllerTest < ActionController::TestCase
  setup do
    @man_board = man_boards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:man_boards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create man_board" do
    assert_difference('ManBoard.count') do
      post :create, man_board: { control_khashm: @man_board.control_khashm, doroogh: @man_board.doroogh, gheibat: @man_board.gheibat, komak_valedein: @man_board.komak_valedein, namaze_aval_vaght: @man_board.namaze_aval_vaght, sadaghe: @man_board.sadaghe, tohmat: @man_board.tohmat }
    end

    assert_redirected_to man_board_path(assigns(:man_board))
  end

  test "should show man_board" do
    get :show, id: @man_board
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @man_board
    assert_response :success
  end

  test "should update man_board" do
    patch :update, id: @man_board, man_board: { control_khashm: @man_board.control_khashm, doroogh: @man_board.doroogh, gheibat: @man_board.gheibat, komak_valedein: @man_board.komak_valedein, namaze_aval_vaght: @man_board.namaze_aval_vaght, sadaghe: @man_board.sadaghe, tohmat: @man_board.tohmat }
    assert_redirected_to man_board_path(assigns(:man_board))
  end

  test "should destroy man_board" do
    assert_difference('ManBoard.count', -1) do
      delete :destroy, id: @man_board
    end

    assert_redirected_to man_boards_path
  end
end
