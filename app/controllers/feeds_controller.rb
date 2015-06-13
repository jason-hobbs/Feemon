class FeedsController < ApplicationController
  before_action :require_signin
  before_action :require_admin
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :get_user

  # GET /feeds
  # GET /feeds.json
  def index
    if session[:user_id]
      @user = current_user
    end
    @feeds = Feed.order(:title)
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)

    #respond_to do |format|
      if @feed.save
        redirect_to @feed, notice: 'Feed was successfully created.'
        #format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        #format.json { render :show, status: :created, location: @feed }
      else
        render :new
        #format.html { render :new }
        #format.json { render json: @feed.errors, status: :unprocessable_entity }
      #end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    #respond_to do |format|
      if @feed.update(feed_params)
        redirect_to @feed, notice: 'Feed was successfully updated.'
        #format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        #format.json { render :show, status: :ok, location: @feed }
      else
        render :edit
        #format.html { render :edit }
        #format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    #@entries = Entry.where(feed_id: @feed.id)
    #@entries.each do |entry|
    #  entry.destroy
    #end
    #@dashboards = Dashboard.where(feed_id: @feed.id)
    #@dashboards.each do |dashboard|
    #  dashboard.destroy
    #end
    #@feed.destroy
    @feed.destroy
    #respond_to do |format|
      redirect_to feeds_url, notice: 'Feed was successfully destroyed.'
      #format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:title, :site, :url)
    end

end
