#
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_login
    return deny_access unless logged_in?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns true if the user is logged in, nil otherwise.
  def logged_in?
    !current_user.nil?
    #current_user && current_user.id.present?
  end
  helper_method :logged_in?

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end
    helper_method :current_user

  def ensure_current_user
    return deny_access unless current_user #?(user)
    nil
  end


  def deny_access
    redirect_to root_url, notice: 'Access Denied'
  end
end
