# frozen_string_literal: true
require 'will_paginate'
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Something is wrong... what happened????!!!!!!'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      @my_events_upcoming = @user.events.upcoming
      @my_events_past = @user.events.past
      @attended_upcoming_events = @user.attended_events.upcoming
      @attended_past_events = @user.attended_events.past
    else
      flash[:danger] = 'There is No User with that name or wherever'
      redirect_to(root_url)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
