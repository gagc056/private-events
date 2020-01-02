class AttendingsController < ApplicationController
    def create
        invitation = Invitation.find(params[:invitation_id])
        @attending = Attending.new(attendee_id: invitation.invitee_id, attended_event_id: invitation.event_id)
        if @attending.save
            invitation.destroy
            flash[:success] = "The invitation was accepted"
            redirect_to invitation.event
        else
            flash[:error] = "Invitation cannot be accepted"
            redirect_to invitation.event
        end
    end
end
