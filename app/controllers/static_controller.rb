class StaticController < ApplicationController
  before_action :get_user

  def index
    @topstories = Topstories.all
  end

end
