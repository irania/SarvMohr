class ManBoardsController < ApplicationController
  before_action :set_man_board, only: [:show, :edit, :update, :destroy]

  # GET /man_boards
  # GET /man_boards.json
  def index
    @man_boards = ManBoard.all
  end

  # GET /man_boards/1
  # GET /man_boards/1.json
  def show
  end

  # GET /man_boards/new
  def new
    @man_board = ManBoard.new
  end

  # GET /man_boards/1/edit
  def edit
  end

  # POST /man_boards
  # POST /man_boards.json
  def create
    @man_board = ManBoard.new(man_board_params)

    respond_to do |format|
      if @man_board.save
        format.html { redirect_to @man_board, notice: 'Man board was successfully created.' }
        format.json { render :show, status: :created, location: @man_board }
      else
        format.html { render :new }
        format.json { render json: @man_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /man_boards/1
  # PATCH/PUT /man_boards/1.json
  def update
    respond_to do |format|
      if @man_board.update(man_board_params)
        format.html { redirect_to @man_board, notice: 'Man board was successfully updated.' }
        format.json { render :show, status: :ok, location: @man_board }
      else
        format.html { render :edit }
        format.json { render json: @man_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /man_boards/1
  # DELETE /man_boards/1.json
  def destroy
    @man_board.destroy
    respond_to do |format|
      format.html { redirect_to man_boards_url, notice: 'Man board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_man_board
      @man_board = ManBoard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def man_board_params
      params.require(:man_board).permit(:sadaghe, :komak_valedein, :namaze_aval_vaght, :doroogh, :gheibat, :tohmat, :control_khashm)
    end
end
