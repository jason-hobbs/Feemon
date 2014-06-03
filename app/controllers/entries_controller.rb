class EntriesController < ApplicationController
  before_action :set_feed
  before_action :get_user
  before_action :get_counts, only: [:show]

  def show
    @unread = @user.dashboards.where("feed_id = ?", params[:feed_id])
	  @entry = @feed.entries.find_by(id: params[:id])
  end

  def index
    @entries = @feed.entries.order(published: :desc)
  end

  def edit
    
  end

  private

  def get_counts
    @counts = Hash.new
    @ids = Hash.new
    @user.feeds.each do |feed|
      @counts[feed.title] = @user.dashboards.where("feed_id = ?", feed.id).size
      @ids[feed.title] = feed.id
    end
  end

  def set_feed
    @feed = Feed.find_by!(id: params[:feed_id])
  end

  def get_user
    if session[:user_id]    
      @user = current_user
    end
  end
end
