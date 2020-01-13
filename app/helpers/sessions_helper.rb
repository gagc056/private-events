# frozen_string_literal: true

module SessionsHelper
  def sign_in?
    return true if cookies[:user_id]

    false
  end

  def current_user
    User.find_by(id: cookies[:user_id])
  end
end
