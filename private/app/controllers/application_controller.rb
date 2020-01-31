# frozen_string_literal: true

class ApplicationController < ActionController::Base
  
  helper_method :current_user?, :current_user, :sign_out

  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= (session[:user_id] ? User.find(session[:user_id]) : nil)
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
end
