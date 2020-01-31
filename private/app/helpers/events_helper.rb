module EventsHelper
  
  private
  def events_params
      params.require(:event).permit(:name, :location, :date, :description)
    end
    
    
end
