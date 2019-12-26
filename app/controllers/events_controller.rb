class EventsController < ApplicationController


  def create
    @event = @user.events.create(event_params)
    
    if @event.save
      flash[:success]= "Event Created"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = @user.events.find(params[:id])
  end

  def index
    @events = @user.events.all
  end

  private
  def event_params
    params.require(:event).permit(:description)
  end
end
