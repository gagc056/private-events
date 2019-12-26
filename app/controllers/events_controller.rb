class EventsController < ApplicationController
  def  new
    @event = Event.new
  end

  def create
    @event= current_user.events.build(event_params)
    if @event.save
      flash[:success]= "Event Created"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    redirect_to current_user
  end

  def index
    @events = Event.all
  end

  private
  def event_params
    params.require(:event).permit(:description, date)
  end
end
