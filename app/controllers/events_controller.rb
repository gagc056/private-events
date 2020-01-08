# frozen_string_literal: true

class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create

    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event Created'
      redirect_to event_path(@event)
    else
      flash.now[:error] = "You can't post an event #{@event.errors.messages}"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @upcoming = Event.upcoming.all
    @past = Event.past.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
