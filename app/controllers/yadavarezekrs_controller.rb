class YadavarezekrsController < ApplicationController
  before_action :set_yadavarezekr, only: [:show, :edit, :update, :destroy]

  # GET /yadavarezekrs
  # GET /yadavarezekrs.json
  def index
#<!*^*^>
    @yadavarezekrs = Yadavarezekr.where(user_id: current_user.id, zekr_id: params[:zekr_id] )
#<!*^*^> 
  end

  # GET /yadavarezekrs/1
  # GET /yadavarezekrs/1.json
  def show
  end

  # GET /yadavarezekrs/new
  def new
    @yadavarezekr = Yadavarezekr.new
  end

  # GET /yadavarezekrs/1/edit
  def edit
  end

  # POST /yadavarezekrs
  # POST /yadavarezekrs.json
  def create
    @yadavarezekr = Yadavarezekr.new(yadavarezekr_params)
#<!*^*^>
    @yadavarezekr.user_id=current_user.id
#<!*^*^>

    respond_to do |format|
      if @yadavarezekr.save
        format.html { redirect_to @yadavarezekr, notice: 'Yadavarezekr was successfully created.' }
        format.json { render :show, status: :created, location: @yadavarezekr }
      else
        format.html { render :new }
        format.json { render json: @yadavarezekr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yadavarezekrs/1
  # PATCH/PUT /yadavarezekrs/1.json
  def update
    respond_to do |format|
      if @yadavarezekr.update(yadavarezekr_params)
        format.html { redirect_to @yadavarezekr, notice: 'Yadavarezekr was successfully updated.' }
        format.json { render :show, status: :ok, location: @yadavarezekr }
      else
        format.html { render :edit }
        format.json { render json: @yadavarezekr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yadavarezekrs/1
  # DELETE /yadavarezekrs/1.json
  def destroy
    @yadavarezekr.destroy
    respond_to do |format|
      format.html { redirect_to yadavarezekrs_url, notice: 'Yadavarezekr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yadavarezekr
      @yadavarezekr = Yadavarezekr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yadavarezekr_params
#<!*^*^>bara amniat tahesh afzudan :zekr_id ro
      params.require(:yadavarezekr).permit(:saat, :min, :tozihat, :zekr_id)
#<!*^*^>
    end
end
