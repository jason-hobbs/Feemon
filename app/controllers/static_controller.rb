class StaticController < ApplicationController
  before_action :get_user

  def index
    if @user
      redirect_to dashboards_path
    else
      @topstories = Topstories.all
    end
  end

end
