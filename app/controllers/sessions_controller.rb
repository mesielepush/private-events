# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def log_in?
    !current_user.nil?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      sign_in(user)
      redirect_to(user)
    else
      flash.now[:danger] = "I don't know that User you said you are, sorry, but not really..."
      render('new')
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
