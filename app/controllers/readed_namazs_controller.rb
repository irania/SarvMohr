class ReadedNamazsController < ApplicationController
  before_action :set_readed_namaz, only: [:show, :edit, :update, :destroy]

  # GET /readed_namazs
  # GET /readed_namazs.json
  def index
    @readed_namazs = ReadedNamaz.all
  end

  # GET /readed_namazs/1
  # GET /readed_namazs/1.json
  def show
  end

  # GET /readed_namazs/new
  def new
    @readed_namaz = ReadedNamaz.new
  end

  # GET /readed_namazs/1/edit
  def edit
  end

  # POST /readed_namazs
  # POST /readed_namazs.json
  def create
    @readed_namaz = ReadedNamaz.new(readed_namaz_params)

    respond_to do |format|
      if @readed_namaz.save
        format.html { redirect_to @readed_namaz, notice: 'Readed namaz was successfully created.' }
        format.json { render :show, status: :created, location: @readed_namaz }
        format.js
      else
        format.html { render :new }
        format.json { render json: @readed_namaz.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /readed_namazs/1
  # PATCH/PUT /readed_namazs/1.json
  def update
    respond_to do |format|
      if @readed_namaz.update(readed_namaz_params)
        format.html { redirect_to @readed_namaz, notice: 'Readed namaz was successfully updated.' }
        format.json { render :show, status: :ok, location: @readed_namaz }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @readed_namaz.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /readed_namazs/1
  # DELETE /readed_namazs/1.json
  def destroy
    @readed_namaz.destroy
    respond_to do |format|
      format.html { redirect_to readed_namazs_url, notice: 'Readed namaz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_user_namaz
    @user = User.find(params[:id])
    update_user_namazs
    @readed_namazs = ReadedNamaz.where(user_id: @user)
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_readed_namaz
      @readed_namaz = ReadedNamaz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def readed_namaz_params
      params.require(:readed_namaz).permit(:date, :start_time, :period, :stateus, :type)
    end

    def update_user_namazs
      @last_namaz = get_last_namaz
      @now_namaz = get_num_of_namaz
      for i in (@last_namaz+1)..(@now_namaz-1)
        i_namaz_type = get_namaz_type i
        i_namaz_date = get_namaz_date i
        @this_namaz = ReadedNamaz.new(:namaz_type => i_namaz_type,
                                        :start_time => 0,
                                        :date => i_namaz_date,
                                        :period => 0,
                                        :stateus => "قضا",
                                        :user => @user
                                        ) 
          
        @this_namaz.save
      end
      update_last_modified 
    end

    def get_last_namaz 
      return @user.last_modified
    end

    def update_last_modified
      @user.update(last_modified: @now_namaz -1)
    end

    def get_num_of_namaz
      @owghat = get_owghat_range
      @date = now_date
      return @date*5+@owghat

    end
    
    def get_namaz_type (i)
      case i%5
      when 1
        return "صبح"
      when 2
        return "ظهر"
      when 3
        return "عصر"
      when 4
        return "مغرب"
      when 0 
        return "عشا"
      else
        return "نامشخص"
      end
    end

    def get_namaz_date(i)
      return i/5
    end

     def get_owghat_range
     @now = (Time.now.hour-1) *60 + Time.now.min 
      if @now <420 and @now>300
        return 1
        elsif @now>720 and @now<1140
          return 2
        elsif @now>1200 and @now<1440 
          return 4
      end
    end

    def now_date
      #baraie salhaie kabise kar nemikonad
      year = Date.today.to_pdate.strftime("%Y").to_i
      month = Date.today.to_pdate.strftime("%m").to_i
      day = Date.today.to_pdate.strftime("%d").to_i
      if month > 6
        @date = (year - 1394)*365 + (month - 1)*30 + 6 + day
      else
        @date = (year - 1394)*365 + (month - 1)*31 + day
      end
      return @date
    end

end
