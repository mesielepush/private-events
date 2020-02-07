# frozen_string_literal: true

require 'will_paginate'
class UserEventsController < ApplicationController
  before_action :logged_in_user
  def create
    # event = Event.find(user_event_params[:event_id])
    if UserEvent.find_by(user_id: params[:user_id], event_id: params[:event_id]).nil?
      @userevent = UserEvent.new(user_id: params[:user_id], event_id: params[:event_id])

      flash[:success] = 'You were registered successfully' if @userevent.save
    else
      flash.now[:danger] = 'You are already registered!'
    end
    redirect_to event_path(params[:event_id])
    puts 'CREATING SOMETHIN'
  end

    private

  def show; end
  end
