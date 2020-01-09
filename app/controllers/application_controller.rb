# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def sign_in(user)
    cookies.permanent[:user_id] = user.id
  end

  def current_user
    User.find_by(id: cookies[:user_id])
  end

  def sign_out
    cookies.delete :user_id
  end

  def sign_in?
    return true if cookies[:user_id]

    false
  end
end
