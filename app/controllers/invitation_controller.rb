class InvitationController < ApplicationController

    def create
      @invitation= current_user.invitations.build(invitaion_params)
      if @invitation.save
        flash[:succses]='Your invitation had been sen it'
        redirect_to current_user
      else
        flash.now[:error]='Your invitation had not been send it'
        render 'new'
    end

    private
      def invitaion_params
        params[:invitation][:pending]=true
        params require(:invitation).permit(:)
      end



end
