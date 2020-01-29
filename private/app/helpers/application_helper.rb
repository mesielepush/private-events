# frozen_string_literal: true

module ApplicationHelper
    
  def log_in?
    !current_user.nil?
  end
end
