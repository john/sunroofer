class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: ['show']

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Building.all
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        
        if @building.sunroof_ajax_url.present? && @building.roof_sq_feet.blank?
          response = HTTParty.get( @building.sunroof_ajax_url )

          if response.code == 200
            response_string = response.body.gsub(")]}'\n","")
            wrapper = JSON.parse(response_string)
            roof_info = wrapper['HouseInfoResponse']

            @building.latitude = roof_info[5][0]
            @building.longitude = roof_info[5][1]
            @building.utility = roof_info[7][2]
            @building.roof_sq_feet = roof_info[7][5]
            @building.sunlight_hours = roof_info[7][6]
            @building.save
          else
            puts "Response was #{response.code}, skipping."
          end
        end
        
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_params
      params.require(:building).permit(:roof_set_id, :name, :sunroof_ajax_url, :sunroof_url, :slug, :description, :notes, :exclude, :address, :city, :state, :zipcode, :latitude, :longitude, :adjusted_sq_feet, :installed_kw, :roof_sq_feet, :sunlight_hours, :utility)
    end
end
