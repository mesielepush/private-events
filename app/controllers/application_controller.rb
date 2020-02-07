# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user?, :current_user, :sign_out

  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def log_in?
    !current_user.nil?
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def logged_in?
    !current_user.nil?
  end
end
