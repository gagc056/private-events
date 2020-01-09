# frozen_string_literal: true

class AttendingsController < ApplicationController
  def new
    @attending = Attending.new
  end

  def create
    @event = Event.find_by(id: attendings_params[:attended_id])
    @attending = @event.attendees << User.find(current_user.id)
    redirect_to @event
  end

  def destroy
    @attending = Attending.find_by(id: params[:id])

    @attending.destroy

    redirect_to events_path
  end

  private

  def attendings_params
    params.permit(:attendee_id, :attended_id)
  end

  def find_by_attendee(attendee)
    @event.attendees.find_by(id: attendee.id)
  end

  def find_by_attending(current_user)
    @event.attendings.find_by(attendee_id: current_user.id)
  end
end
