class EntriesController < ApplicationController
  before_action :set_feed
  before_action :get_user

  def show
	@entries = @feed.entries.order(published: :desc)
  end


  private

  def set_feed
    @feed = Feed.find_by!(id: params[:id])
  end

  def get_user
    if session[:user_id]    
      @user = current_user
    end
  end
end
