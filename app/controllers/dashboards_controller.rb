class DashboardsController < ApplicationController
  before_action :require_signin
  before_action :get_user
  before_action :get_counts
  before_action :get_feed, only: [:dashfeed]


  def index
    
  end


  def dashfeed    
    @unread = @user.dashboards.where("feed_id = ?", params[:feed_id])
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
  
  def get_user
    if session[:user_id]    
      @user = current_user
    end
  end

  def get_feed
    @feed = Feed.find(params[:feed_id])
  end
	
  def require_correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
  end	
end
