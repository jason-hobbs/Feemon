module ApplicationHelper
	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def page_title
    if content_for?(:title)
      "Feemon - #{content_for(:title)}"
    else
      "Feemon"
    end
  end

  def nav_link_to(text, url)
    classes = ['button']
    classes << 'active' if current_page?(url)
    link_to(text, url, class: classes.join(' '))
  end
end
