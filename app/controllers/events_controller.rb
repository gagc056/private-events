class EventsController < ApplicationController


  def new
    @user = current_user
    @event = Event.new
  end

  def create
    user = User.find_by(id: current_user)
    @event = user.events.build(user_id: current_user)
    @event = user.events.build(event_params)
    if @event.save
      flash[:success]= "Event Created"
      redirect_to events_path
    else
      flash.now[:error] = "You can't post an event #{@event.errors.messages}"
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
    params.require(:event).permit(:description, :date)
  end

 
end
