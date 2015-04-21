class YadavarsController < ApplicationController
  before_action :set_yadavar, only: [:show, :edit, :update, :destroy]

  # GET /yadavars
  # GET /yadavars.json
  def index
    @yadavars = Yadavar.all
  end

  # GET /yadavars/1
  # GET /yadavars/1.json
  def show
  end

  # GET /yadavars/new
  def new
    @yadavar = Yadavar.new
  end

  # GET /yadavars/1/edit
  def edit
  end

  # POST /yadavars
  # POST /yadavars.json
  def create
    @yadavar = Yadavar.new(yadavar_params)
    @yadavar.user_id=current_user.id

    respond_to do |format|
      if @yadavar.save
        format.html { redirect_to @yadavar, notice: 'Yadavar was successfully created.' }
        format.json { render :show, status: :created, location: @yadavar }
      else
        format.html { render :new }
        format.json { render json: @yadavar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yadavars/1
  # PATCH/PUT /yadavars/1.json
  def update
    respond_to do |format|
      if @yadavar.update(yadavar_params)
        format.html { redirect_to @yadavar, notice: 'Yadavar was successfully updated.' }
        format.json { render :show, status: :ok, location: @yadavar }
      else
        format.html { render :edit }
        format.json { render json: @yadavar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yadavars/1
  # DELETE /yadavars/1.json
  def destroy
    @yadavar.destroy
    respond_to do |format|
      format.html { redirect_to yadavars_url, notice: 'Yadavar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yadavar
      @yadavar = Yadavar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yadavar_params
      params.require(:yadavar).permit(:saat, :min, :tozihat)
    end
end
