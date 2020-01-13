# frozen_string_literal: true

module AttendingsHelper
  def find_by_attendee(attendee)
    @event.attendees.find_by(id: attendee.id)
  end

  def find_by_attending(current_user)
    @event.attendings.find_by(attendee_id: current_user.id)
  end
end
