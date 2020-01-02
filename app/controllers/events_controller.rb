class EventsController < ApplicationController

<<<<<<< HEAD
=======

  def new
    @user = current_user
    @event = Event.new
  end

>>>>>>> 7881d543214b8b9778620c21d16111e848ae3e11
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
    @event = Event.includes(:creator, :attendees).find(params[:id])
    redirect_to current_user
  end

  def index
<<<<<<< HEAD
    @events = @user.events.all
    @upcoming_events = Event.upcoming
    @prev_events = Event.past
=======
    @events = Event.all
>>>>>>> 7881d543214b8b9778620c21d16111e848ae3e11
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end

 
end
