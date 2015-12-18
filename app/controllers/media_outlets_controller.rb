class MediaOutletsController < ApplicationController
  before_action :set_media_outlet, only: [:show, :edit, :update, :destroy]

  # GET /media_outlets
  # GET /media_outlets.json
  def index
    @media_outlets = MediaOutlet.all
  end

  # GET /media_outlets/1
  # GET /media_outlets/1.json
  def show
  end

  # GET /media_outlets/new
  def new
    @media_outlet = MediaOutlet.new
  end

  # GET /media_outlets/1/edit
  def edit
  end

  # POST /media_outlets
  # POST /media_outlets.json
  def create
    @media_outlet = MediaOutlet.new(media_outlet_params)

    respond_to do |format|
      if @media_outlet.save
        format.html { redirect_to @media_outlet, notice: 'Media outlet was successfully created.' }
        format.json { render :show, status: :created, location: @media_outlet }
      else
        format.html { render :new }
        format.json { render json: @media_outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_outlets/1
  # PATCH/PUT /media_outlets/1.json
  def update
    respond_to do |format|
      if @media_outlet.update(media_outlet_params)
        format.html { redirect_to @media_outlet, notice: 'Media outlet was successfully updated.' }
        format.json { render :show, status: :ok, location: @media_outlet }
      else
        format.html { render :edit }
        format.json { render json: @media_outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_outlets/1
  # DELETE /media_outlets/1.json
  def destroy
    @media_outlet.destroy
    respond_to do |format|
      format.html { redirect_to media_outlets_url, notice: 'Media outlet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_outlet
      @media_outlet = MediaOutlet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_outlet_params
      params.require(:media_outlet).permit(:title, :url, :type)
    end
end
