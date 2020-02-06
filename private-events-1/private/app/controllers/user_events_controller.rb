
class UserEventsController < ApplicationController
    before_action :logged_in_user
    def create
    
      #event = Event.find(user_event_params[:event_id])
      @userevent = UserEvent.new(user_id: :user_id, event_id: :event_id)
      if @userevent.save
        flash[:success] = 'You were registered successfully'
      else
        flash.now[:danger] = 'You are already registered!'
      end
      redirect_to root_path
      puts 'CREATING SOMETHIN'
    end
  
    private
  
    def user_event_params
      params.require(:user_id)
    end
  end
  


#class UserEventsController < ApplicationController
#before_action :logged_in_user, only: %i[create]
#  def create
#    event = Event.find(user_event_params[:event_id])
#    @userevent = UserEvent.new(user_id: user_event_params[:user_id], event_id: user_event_params[:event_id])
#    if @userevent.save
#      flash[:success] = 'You were registered successfully'
#    else
#      flash.now[:danger] = 'You are already registered!'
#    end
#    redirect_to root_path
#  end
#
#  private
#
#  def user_event_params
#    puts :user_id,:event_id
#    puts  'kashjgdkfhagbskdjhfgk'
#
#    params.require(:user_id)
#  end
#end
