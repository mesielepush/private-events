module EventsHelper
    private
    def events_params
        params.require(:event).permit(:name, :location, :date, :description)
      end
    
    def log_user
      return if log_in?
      flash[:danger] = "I don't know what is happening..."
      redirect_to(login_url)

    end
end
