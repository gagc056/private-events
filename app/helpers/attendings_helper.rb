# frozen_string_literal: true

module AttendingsHelper
    def find_by_attendee(attendee)
        @event.attendees.find_by(id: attendee.id)
    end
end
