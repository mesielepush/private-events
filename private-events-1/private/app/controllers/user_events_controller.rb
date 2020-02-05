class UserEventsController < ApplicationController
    before_action :log_user, only: %i[create]
    def create
      @userevent = UserEvent.new(:user_id, :event_id)
      if @userevent.save
        flash[:success] = 'You were registered successfully'
      else
        flash.now[:danger] = 'You are already registered!'
      end
      redirect_to event_path(@userevent.attended_event)
    end
  
  end
  