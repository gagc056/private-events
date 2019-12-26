class SessionsController < ApplicationController
    def new
      session= Session.new

    end

    def create
      @user=User.find_by(email: params[:session][:email])
      if @user
        sign_in @user
        redirect_to @user
      else
        flash.now[:error]= 'Wrong sign in information'
        render 'new'
    end

    def  destroy
      sign_out if sign_in?
      redirect_to root_url
    end
end
