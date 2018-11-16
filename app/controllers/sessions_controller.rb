class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]
    user = User.find_by_credentials(email, password)
    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ['Invalid Credentials']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
