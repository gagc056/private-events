class AttendingsController < ApplicationController

    def new
        @attending = Attending.new
    end

    def create

        @event = Event.find_by(id: attendings_params[:attended_id])
        @attending = @event.attendees << User.find(current_user)
        redirect_to @event
    end

    def destroy

        @attending = Attending.find_by(id: params[:id])

        @attending.delete

        redirect_to events_path
    end


 


    private

    def attendings_params
        params.permit(:attendee_id, :attended_id)
    end
end
