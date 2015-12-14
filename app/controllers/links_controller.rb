class LinksController < ApplicationController
  respond_to :html, :js

  def new
    @link = Link.new
    @timeline_id = params[:timeline_id]
  end

  def create
    #render json: {result: params[:link][:timeline_id]}, status: 202

    @links = Link.all
    @link = Link.new(link_params)
    @link.user = current_user

    @timeline = Timeline.find(params[:link][:timeline_id])
    @timeline.links << @link
  end

  def edit
    @link = Link.find(params[:id])
    @timeline_id = params[:timeline_id]
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @link = Link.find(params[:id])
    @timeline = Timeline.find(@link.timeline_id)
    @link.update_attributes(link_params)    
  end

  def destroy
    @link = Link.find(params[:id])
    @timeline = Timeline.find(@link.timeline_id)
    @link.destroy
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:user_id, :timeline_id, :text, :descr, :image, :rating)
    end
end