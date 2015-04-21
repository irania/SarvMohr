class MohrsController < ApplicationController
  before_action :set_mohr, only: [:show, :edit, :update, :destroy]

  # GET /mohrs
  # GET /mohrs.json
  def index
    @mohrs = Mohr.all
  end

  # GET /mohrs/1
  # GET /mohrs/1.json
  def show
  end

  # GET /mohrs/new
  def new
    @mohr = Mohr.new
  end

  # GET /mohrs/1/edit
  def edit
  end

  # POST /mohrs
  # POST /mohrs.json
  def create
    @mohr = Mohr.new(mohr_params)

    respond_to do |format|
      if @mohr.save
        format.html { redirect_to @mohr, notice: 'Mohr was successfully created.' }
        format.json { render :show, status: :created, location: @mohr }
      else
        format.html { render :new }
        format.json { render json: @mohr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mohrs/1
  # PATCH/PUT /mohrs/1.json
  def update
    respond_to do |format|
      if @mohr.update(mohr_params)
        format.html { redirect_to @mohr, notice: 'Mohr was successfully updated.' }
        format.json { render :show, status: :ok, location: @mohr }
      else
        format.html { render :edit }
        format.json { render json: @mohr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mohrs/1
  # DELETE /mohrs/1.json
  def destroy
    @mohr.destroy
    respond_to do |format|
      format.html { redirect_to mohrs_url, notice: 'Mohr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mohr
      @mohr = Mohr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mohr_params
      params.require(:mohr).permit(:mohr_code)
    end
end
