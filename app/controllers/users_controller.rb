class UsersController < ApplicationController
  def  new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:success]="Welcome #{params[:user][:name]}"
      sign_in @user
      sign_in?
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
<<<<<<< HEAD
    @user=User.includes(:created_events).find(params[:id])
    @prev_events = current_user.previous_events
    @upcoming_events = current_user.upcoming_events
=======
    @user = User.find(params[:id])
>>>>>>> 7881d543214b8b9778620c21d16111e848ae3e11
  end

  def index
    @users=User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
