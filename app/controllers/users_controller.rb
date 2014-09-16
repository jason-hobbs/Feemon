class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user_or_admin, only: [:edit, :update]
  before_action :require_admin, only: [:destroy, :index]
  before_action :get_user

def index
    @users = User.all
end

def new
  if current_user
    unless current_user_admin?
      redirect_to @user, notice: "already signed in!"
    end
  end
	@user=User.new
  @feeds = Feed.all
end

def show
	@user = User.find(params[:id])
end

def create
  		@user = User.new(user_params)
  		if @user.save
        unless current_user_admin?
		      session[:user_id] = @user.id
    		  redirect_to @user, notice: "Thanks for signing up! Click edit to add sites to start tracking! Then click dashboard on the top navigation bar!  You can also go to Gravatar.com to upload your avatar pic."
        else
          redirect_to users_path
        end
  		else
    		render :new
  		end
	end

	def edit
  		@user = User.find(params[:id])
      @feeds = Feed.all
	end

	def update
  	@user = User.find(params[:id])
    @feeds = Feed.all
		if @user.update(user_params)
    	redirect_to @user, notice: "Account successfully updated!"
  	else
    	render :edit
  	end
	end

	def destroy
  		@user = User.find(params[:id])
  		@user.destroy
      unless current_user_admin?
  		  session[:user_id] = nil
  		  redirect_to root_url, alert: "Account successfully deleted!"
      else
        redirect_to users_path
      end
	end

	private

	def user_params
  	  params.require(:user).permit(:name, :email, :password, :password_confirmation, feed_ids: [])
	end

	def require_correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
  end

  def require_correct_user_or_admin
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user) || current_user_admin?
  end

end
