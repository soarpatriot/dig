class VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]
  before_action :sanitize_time_params, only: [:create]
  skip_before_filter :verify_authenticity_token, :only => :create
  skip_before_action :authenticate_user!, only: [:create]
  # GET /visitors
  # GET /visitors.json
  def index
    @visitors = Visitor.page params[:page]
    
  end

  # GET /visitors/1
  # GET /visitors/1.json
  def show
  end

  # GET /visitors/new
  def new
    @visitor = Visitor.new
  end

  # GET /visitors/1/edit
  def edit
  end

  # POST /visitors
  # POST /visitors.json
  def create
    user = params[:user]
    ip = params[:ip]
    log = params[:log] 
    unless log.nil?
			log.each do |l| 
				@visitor = Visitor.new()
				@visitor.user_name = user[:employeename] 
				@visitor.user_id = user[:employeeid] 
				@visitor.cellphone = user[:cellphone] 
				@visitor.user_code = user[:employeecode] 
				@visitor.station_name = user[:companyname] 
				@visitor.station_id = user[:employeeid] 
				@visitor.cname = ip[:cname] 
				@visitor.ip = ip[:cip] 
				@visitor.city = ip[:city] 
				@visitor.province = ip[:province] 
				@visitor.isp = ip[:isp] 
        @visitor.visist_status = 0 
				@visitor.visit_time = Time.at(l[:timestamp])
				@visitor.save
			end
    end
    unless @visitor.nil?
      @visitor = Visitor.new()
    end
    render json: {"code":1}
    #respond_to do |format|
    #  format.json { render :show, status: :created, location: {"code": 1} }
    #end
  end

  def cr

    @visitor = Visitor.new(visitor_params)
    @visitor.visit_time = Time.at(visitor_params[:visit_time])
    respond_to do |format|
      if @visitor.save
        format.html { redirect_to @visitor, notice: 'Visitor was successfully created.' }
        format.json { render :show, status: :created, location: @visitor }
      else
        format.html { render :new }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /visitors/1
  # PATCH/PUT /visitors/1.json
  def update
    respond_to do |format|
      if @visitor.update(visitor_params)
        format.html { redirect_to @visitor, notice: 'Visitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitor }
      else
        format.html { render :edit }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitors/1
  # DELETE /visitors/1.json
  def destroy
    @visitor.destroy
    respond_to do |format|
      format.html { redirect_to visitors_url, notice: 'Visitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def all
    Visitor.destroy_all
    respond_to do |format|
      format.html { redirect_to visitors_url, notice: 'Visitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_params
      params.require(:visitor).permit(:user_id, :user_name, :user_code, 
                                      :station_id, 
                                      :station_name, :merchant, :ip, 
                                      :visist_status, :visit_time)
    end

    def sanitize_time_params
     #  params[:visit_time] = Time.at(params[:visit_time].to_i)
    end

end
