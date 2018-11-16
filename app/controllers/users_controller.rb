class UsersController < ApplicationController

  def new
    return redirect_to user_url(current_user) if current_user
    render :new
  end

  def create
    return redirect_to user_url(current_user) if current_user
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
