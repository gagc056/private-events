module SessionsHelper
  def sign_in user
    cookies.permanent[:user_id] = user.id
  end
end
