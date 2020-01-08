# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Welcome #{user.name}"
      redirect_to root_path
    else
      flash.now[:error] = 'Wrong sign in information'
      render 'new'
    end
  end

  def destroy
    sign_out if sign_in?
    redirect_to root_url
  end
end
