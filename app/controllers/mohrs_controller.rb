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

  def mohr_input
      #url must be /mohrs/:id/mohr_input?t=n&n=2&p=""
      #http://localhost:3000/mohrs/1/mohr_input?t=n&n=4&p=5
    
      @period = params[:p].to_i
      now_time
      now_date
      find_user
      if type_namaz?
        @rakat = params[:n].to_i
        @last_namaz = get_last_namaz
        @owghat_range= get_owghat_range #owghat 1 = namaz_sobh , owghat 2 = namaz_zohr_asr , owghat 3= namaz_maghreb o esha else -1
        @now_namaz = get_num_of_namaz
        update_namaz 
      elsif type_zekr?
        @num_of_zekr = params[:n].to_i
        update_zekrs
      end
  end  

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mohr
      @mohr = Mohr.find(params[:id])
    end

    # Never trust t=parameters from the scary internet, only allow the white list through.
    def mohr_params
      params.require(:mohr).permit(:mohr_code)
    end

    def type_namaz?
      return params[:t]==="n"
    end

    def type_zekr?
      return params[:t]==="z"
    end

    def get_last_namaz 
      @user = find_user
      return @user.last_modified
    end

    def get_owghat_range 
      if @start_time<420 and @start_time>300
        return 1
        elsif @start_time>720 and @start_time<1140
          return 2
        elsif @start_time>1200 and @start_time<1440 
          return 3
      end
    end

    def get_num_of_namaz
      @namaz_status = "خوانده شده"
      if @owghat_range === 1 and @rakat === 2 and !namaz_sobh_read
        @namaz_type = "صبح"
        return @date*5+1
      end
      if @owghat_range == 2 and @rakat == 4
        if !namaz_zohr_read
          @namaz_type="ظهر"
          return @date*5+2
        else
          if !namaz_asr_read
            @namaz_type="عصر"
            return @date*5+3
          end
        end

      end
      if @owghat_range == 3 and @rakat == 3 and !namaz_maghreb_read
        @namaz_type="مغرب"
        return @date*5+4
      end
      if @owghat_range == 3 and @rakat == 4 and !namaz_esha_read
        @namaz_type="عشا"
        return @date*5+5
      end
      @namaz_type = "چند رکعتی"
      @namaz_status = "نامشخص"
        return -1
    end

    def namaz_sobh_read
      if @last_namaz >= @date*5+1
        return true
      end
      return false
    end

    def namaz_zohr_read
      if @last_namaz >= @date*5+2
        return true
      end
      return false
    end

    def namaz_asr_read
      if @last_namaz >= @date*5+3
        return true
      end
      return false
    end

    def namaz_maghreb_read
      if @last_namaz >= @date*5+4
        return true
      end
      return false
    end

    def namaz_esha_read
      if @last_namaz >= @date*5+5
        return true
      end
      return false
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

    def update_namaz
      #add all unread namaz to db
      
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
      #add this namaz to db

      @this_namaz = ReadedNamaz.new(:namaz_type => @namaz_type ,
                                      :start_time => @start_time,
                                      :date => @date,
                                      :period => @period,
                                      :stateus => @namaz_status,
                                      :user => @user
                                      ) 
      @this_namaz.save
      #update last modified
      update_last_modified 
    end

    def update_zekrs
      @this_zekr = SaidZekr.new(:zekr_type => "نا مشخص" ,
                                      :num_of_zekrs => @num_of_zekr,
                                      :user => @user
                                      ) 
      @this_zekr.save
    end

    def update_last_modified
      @user.update(last_modified: @now_namaz)
    end

    def find_user
      @user = User.find_by(mohr_id: params[:id])#???
    end

    def now_time
      @start_time = (Time.now.hour-1) *60 + Time.now.min - @period
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

    end
end