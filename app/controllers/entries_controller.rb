class EntriesController < ApplicationController
  before_action :set_feed

  def show
	@entries = @feed.entries.order(published: :desc)
  end


  private

  def set_feed
    @feed = Feed.find_by!(id: params[:id])
  end
end
