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
    @link = Link.new(link_params)
    @link.user = current_user
    @link.total_shares = @link.extract_shares

    @timeline = Timeline.find(params[:link][:timeline_id])
    @timeline.links << @link

    if @timeline.save
      redirect_to @timeline, notice: 'Link was successfully created.' 
    end
  end

  def edit
    @timeline_id = params[:timeline_id]
  end

  def update
    @link.total_shares = @link.extract_shares
    @link.update_attributes(link_params)

    if @timeline.save
      redirect_to @timeline, notice: 'Link was successfully updated.' 
    end
  end

  def destroy
    @link.destroy
    redirect_to @timeline
  end

  def upvote
    @link.upvote_by current_user
    @link.total_votes = @link.get_upvotes.size
    @link.save
    respond_to do |format|
      format.js   { render :layout => false }
      format.html { redirect_to timeline_path(@link.timeline)}
    end
  end

  def unvote
    @link.unvote_by current_user
    @link.total_votes = @link.get_upvotes.size
    @link.save
    respond_to do |format|
      format.js   { render :layout => false }
      format.html { redirect_to timeline_path(@link.timeline)}
    end
  end

  def sort
    @timeline = Timeline.find(params[:timeline_id])
    @links = @timeline.links.by_type(params[:filter_types]).by_date(params[:ordr])
    puts '------------------------'
    puts params[:filter_types]
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def set_timeline
      @timeline = Timeline.find(@link.timeline_id)
    end

    def link_params
      params.require(:link).permit(:user_id, :timeline_id, :media_outlet_id, :lnk, :title, :text, :image, :rating, :share_rating, :total_shares, :date_published)
    end
end