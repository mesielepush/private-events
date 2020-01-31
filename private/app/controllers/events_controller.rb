require "will_paginate"
class EventsController < ApplicationController
    before_action :log_user, only: %i[new create]
    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(events_parameter)
        if @event.save
            flash[:success] = 'Event created succesfully'
            redirect_to( event_path(@event) )
        else
            flash.now[:danger] = 'Failed to create a new event'
            render('new')
        end
    end
    def show
        @event = Event.find(id: params[:id])
    end
    def index
        @events = Event.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
        @past_events = Event.past
        @events_upcoming = Event.upcoming
    end

    def log_user
        return if log_in?
        flash[:danger] = "I don't know what is happening..."
        redirect_to(login_url)
    
      end
end
