# frozen_string_literal: true

module SessionsHelper
  def sign_in(user)
    cookies.permanent[:user_id] = user.id
  end

  # sign_out if sign_in?

  def current_user
    cookies[:user_id]
  end

  def sign_out
    cookies.delete :user_id
  end

  def sign_in?
    return true if cookies[:user_id]

    false
  end
end
