class DashboardsController < ApplicationController
  before_action :require_signin
  before_action :get_user
  before_action :get_feed, only: [:dashfeed]


  def index
    @counts = Hash.new
    @user.feeds.each do |feed|
      @counts[feed.title] = @user.dashboards.where("feed_id = ?", feed.id).size
    end
  end


  def dashfeed    
    @unread = @user.dashboards.where("feed_id = ?", params[:feed_id])
  end



  private

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
