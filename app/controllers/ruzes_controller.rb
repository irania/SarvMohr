class RuzesController < ApplicationController
  before_action :set_ruze, only: [:show, :edit, :update, :destroy]

  # GET /ruzes
  # GET /ruzes.json
  def index
    @ruzes = Ruze.all
  end

  # GET /ruzes/1
  # GET /ruzes/1.json
  def show
  end

  # GET /ruzes/new
  def new
    @ruze = Ruze.new
  end

  # GET /ruzes/1/edit
  def edit
  end

  # POST /ruzes
  # POST /ruzes.json
  def create
    @ruze = Ruze.new(ruze_params)
    @ruze.user_id=current_user.id
    respond_to do |format|
      if @ruze.save
        format.html { redirect_to @ruze, notice: 'Ruze was successfully created.' }
        format.json { render :show, status: :created, location: @ruze }
      else
        format.html { render :new }
        format.json { render json: @ruze.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruzes/1
  # PATCH/PUT /ruzes/1.json
  def update
    respond_to do |format|
      if @ruze.update(ruze_params)
        format.html { redirect_to @ruze, notice: 'Ruze was successfully updated.' }
        format.json { render :show, status: :ok, location: @ruze }
      else
        format.html { render :edit }
        format.json { render json: @ruze.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruzes/1
  # DELETE /ruzes/1.json
  def destroy
    @ruze.destroy
    respond_to do |format|
      format.html { redirect_to ruzes_url, notice: 'Ruze was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruze
      @ruze = Ruze.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ruze_params
      params.require(:ruze).permit(:name, :tozihat, :tedad)
    end
end
