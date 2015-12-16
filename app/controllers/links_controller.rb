class LinksController < ApplicationController
  respond_to :html, :js
  before_action :set_link, only: [:edit, :update, :destroy, :upvote, :unvote]
  before_action :set_timeline, only: [:update, :destroy, :upvote, :unvote]

  def new
    @link = Link.new
    @timeline_id = params[:timeline_id]
  end

  def create
    #render json: {result: params[:link][:timeline_id]}, status: 202
    @links = Link.all
    @link = Link.new(link_params)
    @link.user = current_user
    @link.total_shares = @link.extract_shares

    @timeline = Timeline.find(params[:link][:timeline_id])
    @timeline.links << @link
  end

  def edit
    @timeline_id = params[:timeline_id]
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @link.total_shares = @link.extract_shares
    @link.update_attributes(link_params)
  end

  def destroy
    @link.destroy
  end

  def upvote
    @link.upvote_by current_user
    @link.rating = @link.get_upvotes.size
    @link.save
    respond_to do |format|
      format.js   { render :layout => false }
      format.html { redirect_to timeline_path(@link.timeline)}
    end
  end

  def unvote
    @link.unvote_by current_user
    @link.rating = @link.get_upvotes.size
    @link.save
    respond_to do |format|
      format.js   { render :layout => false }
      format.html { redirect_to timeline_path(@link.timeline)}
    end
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def set_timeline
      @timeline = Timeline.find(@link.timeline_id)
    end

    def link_params
      params.require(:link).permit(:user_id, :timeline_id, :media_id, :lnk, :title, :text, :image, :rating, :total_shares)
    end
end