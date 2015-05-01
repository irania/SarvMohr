class SaidZekrsController < ApplicationController
  before_action :set_said_zekr, only: [:show, :edit, :update, :destroy]

  # GET /said_zekrs
  # GET /said_zekrs.json
  def index
    @said_zekrs = SaidZekr.all
  end

  # GET /said_zekrs/1
  # GET /said_zekrs/1.json
  def show
  end

  # GET /said_zekrs/new
  def new
    @said_zekr = SaidZekr.new
  end

  # GET /said_zekrs/1/edit
  def edit
  end

  # POST /said_zekrs
  # POST /said_zekrs.json
  def create
    @said_zekr = SaidZekr.new(said_zekr_params)

    respond_to do |format|
      if @said_zekr.save
        format.html { redirect_to @said_zekr, notice: 'Said zekr was successfully created.' }
        format.json { render :show, status: :created, location: @said_zekr }
      else
        format.html { render :new }
        format.json { render json: @said_zekr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /said_zekrs/1
  # PATCH/PUT /said_zekrs/1.json
  def update
    respond_to do |format|
      if @said_zekr.update(said_zekr_params)
        format.html { redirect_to @said_zekr, notice: 'Said zekr was successfully updated.' }
        format.json { render :show, status: :ok, location: @said_zekr }
      else
        format.html { render :edit }
        format.json { render json: @said_zekr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /said_zekrs/1
  # DELETE /said_zekrs/1.json
  def destroy
    @said_zekr.destroy
    respond_to do |format|
      format.html { redirect_to said_zekrs_url, notice: 'Said zekr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_user_said_zekrs
    @user = User.find(params[:id])
    @said_zekrs = SaidZekr.where(user_id: @user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_said_zekr
      @said_zekr = SaidZekr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def said_zekr_params
      params.require(:said_zekr).permit(:zekr_type, :num_of_zekrs, :start_time, :date)
    end
end
