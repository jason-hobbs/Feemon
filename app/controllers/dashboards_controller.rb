class DashboardsController < ApplicationController
  before_action :require_signin
  before_action :get_user
  before_action :get_counts
  before_action :get_feed, only: [:dashfeed, :markall, :grid]


  def index
    @topstories = Topstories.all.includes(:entry)
  end


  def dashfeed
    get_unread(75)
    #@unread = @user.dashboards.where("feed_id = ?", params[:feed_id]).order(entry_published: :desc).limit(75).includes(:entry)
  end

  def markall
    @user.dashboards.where('feed_id = ?', @feed.id).update_all(:read => true)
    redirect_to dashboards_path
  end

  def grid
    get_unread(25)
    #@unread = @user.dashboards.where("feed_id = ?", params[:feed_id]).order(entry_published: :desc).limit(25).includes(:entry)
  end

  private

  def get_counts
    @counts = Hash.new
    @ids = Hash.new
    @user.feeds.each do |feed|
      @counts[feed.title] = @user.dashboards.where("feed_id = ?", feed.id).where("read = ?", "FALSE").size
      @ids[feed.title] = feed.id
    end
  end

  def get_feed
    @feed = Feed.find(params[:feed_id])
  end

  def get_unread(lim)
    @unread = @user.dashboards.where("feed_id = ?", params[:feed_id]).order(entry_published: :desc).limit(lim).includes(:entry)
  end

  def require_correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
  end
end
