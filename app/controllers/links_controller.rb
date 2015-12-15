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

  def upvote
    @link = Link.find(params[:id])
    @timeline = Timeline.find(@link.timeline_id)
    @link.upvote_by current_user
    @link.rating = @link.get_upvotes.size
    @link.save
    respond_to do |format|
      format.js { render :layout => false }
      format.html {redirect_to timeline_path(@link.timeline)}
    end
  end

  def unvote
    @link = Link.find(params[:id])
    @timeline = Timeline.find(@link.timeline_id)
    @link.unvote_by current_user
    @link.rating = @link.get_upvotes.size
    @link.save
    respond_to do |format|
      format.js { render :layout => false }
      format.html {redirect_to timeline_path(@link.timeline)}
    end
  end  

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:user_id, :timeline_id, :media_id, :lnk, :title, :text, :image, :rating)
    end
end