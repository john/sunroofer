class RoofSetsController < ApplicationController
  before_action :set_roof_set, only: [:show, :edit, :update, :destroy]

  # GET /roof_sets
  # GET /roof_sets.json
  def index
    @roof_sets = RoofSet.all
  end

  # GET /roof_sets/1
  # GET /roof_sets/1.json
  def show
  end

  # GET /roof_sets/new
  def new
    @roof_set = RoofSet.new
  end

  # GET /roof_sets/1/edit
  def edit
  end

  # POST /roof_sets
  # POST /roof_sets.json
  def create
    @roof_set = RoofSet.new(roof_set_params)
    
    # save roofs files

    respond_to do |format|
      if @roof_set.save
        
        # Make async call to process roofs files
        
        format.html { redirect_to @roof_set, notice: 'Roof set was successfully created.' }
        format.json { render :show, status: :created, location: @roof_set }
      else
        format.html { render :new }
        format.json { render json: @roof_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roof_sets/1
  # PATCH/PUT /roof_sets/1.json
  def update
    respond_to do |format|
      if @roof_set.update(roof_set_params)
        format.html { redirect_to @roof_set, notice: 'Roof set was successfully updated.' }
        format.json { render :show, status: :ok, location: @roof_set }
      else
        format.html { render :edit }
        format.json { render json: @roof_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roof_sets/1
  # DELETE /roof_sets/1.json
  def destroy
    @roof_set.destroy
    respond_to do |format|
      format.html { redirect_to roof_sets_url, notice: 'Roof set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roof_set
      @roof_set = RoofSet.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roof_set_params
      params.require(:roof_set).permit(:name, :slug, :description, :csv)
    end
end
