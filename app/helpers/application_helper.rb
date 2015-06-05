#
module ApplicationHelper
  def user_links
    if logged_in?
      "#{link_to 'Log out', logout_path}
      #{link_to 'Edit', edit_user_path(current_user)}"
    else
      "#{link_to 'Sign up now!', signup_path}
      #{link_to 'Login', login_path}"
    end
  end
end
