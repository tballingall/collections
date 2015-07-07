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
  end
  helper_method :logged_in?

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @_current_user ||= User.where(id: session[:user_id]).first
  end
  helper_method :current_user

  def ensure_current_user
    return deny_access unless current_user?(user)
    nil
  end

  def deny_access
    redirect_to root_url, notice: 'Access Denied'
  end

  # borrowed from Brian - hoping to stop user id from bring nil
  # also need to define current_user? to regain functionality
  # is there a better way to handle this? NullUser in user.rb model

  def current_user?(user)
    return false if user.nil?
    return false if user.is_a?(User::NullUser)
    current_user == user
  end
  helper_method :current_user?
end
