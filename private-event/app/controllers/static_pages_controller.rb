class StaticPagesController < ApplicationController
  def home
    @events_upcoming = Event.upcoming
    @events_past = Event.past
  end
end
