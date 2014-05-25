class DashboardsController < ApplicationController
  before_action :require_signin
  before_action :get_user
  


  def index
    if session[:user_id]    
      @user = current_user
    end
  end




  private

  def get_user
    if session[:user_id]    
      @user = current_user
    end
  end
	
  def require_correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
  end	
end
