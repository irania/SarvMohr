class YadavarenamazsController < ApplicationController
  before_action :set_yadavarenamaz, only: [:show, :edit, :update, :destroy]

  # GET /yadavarenamazs
  # GET /yadavarenamazs.json
  def index
    @yadavarenamazs = Yadavarenamaz.where(user_id: current_user.id, namaz_id: params[:namaz_id] )
  end

  # GET /yadavarenamazs/1
  # GET /yadavarenamazs/1.json
  def show
  end

  # GET /yadavarenamazs/new
  def new
    @yadavarenamaz = Yadavarenamaz.new
  end

  # GET /yadavarenamazs/1/edit
  def edit
  end

  # POST /yadavarenamazs
  # POST /yadavarenamazs.json
  def create
    @yadavarenamaz = Yadavarenamaz.new(yadavarenamaz_params)
    @yadavarenamaz.user_id=current_user.id
    respond_to do |format|
      if @yadavarenamaz.save
        format.html { redirect_to @yadavarenamaz, notice: 'Yadavarenamaz was successfully created.' }
        format.json { render :show, status: :created, location: @yadavarenamaz }
      else
        format.html { render :new }
        format.json { render json: @yadavarenamaz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yadavarenamazs/1
  # PATCH/PUT /yadavarenamazs/1.json
  def update
    respond_to do |format|
      if @yadavarenamaz.update(yadavarenamaz_params)
        format.html { redirect_to @yadavarenamaz, notice: 'Yadavarenamaz was successfully updated.' }
        format.json { render :show, status: :ok, location: @yadavarenamaz }
      else
        format.html { render :edit }
        format.json { render json: @yadavarenamaz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yadavarenamazs/1
  # DELETE /yadavarenamazs/1.json
  def destroy
    @yadavarenamaz.destroy
    respond_to do |format|
      format.html { redirect_to yadavarenamazs_url, notice: 'Yadavarenamaz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yadavarenamaz
      @yadavarenamaz = Yadavarenamaz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yadavarenamaz_params
      params.require(:yadavarenamaz).permit(:saat, :min, :tozihat , :namaz_id)
    end
end
