class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    # Ask why it cannot be user.session_token = reset_token!
    session[:session_token] = user.reset_token!
  end

  def sign_out
    current_user.try(:reset_token!)
    # Ask why it cannot be user.session_token = nil
    session[:session_token] = nil
  end

  private

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end
end
