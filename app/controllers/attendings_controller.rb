class AttendingsController < ApplicationController

    def new
        @attending = Attending.new
    end

    def create

        @event = Event.find_by(id: attendings_params[:attended_id])
        @attending = @event.attendees << User.find(current_user)
        # redirect_to @attending

        # if @attending.save
        #     redirect_to events_path
        # else
        #     render 'new'
        # end
    end

    def destroy
        @event = Event.find_by(attended_info[0])

        @attending = @event.attendings.find

        @attending.delete
    end


    private

    def attendings_params
        params.permit(:attendee_id, :attended_id)
    end
end
