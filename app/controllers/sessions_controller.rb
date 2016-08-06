class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    # call the authenticate method,
    # use bcrypt to match the password entered in the sign in form 
    # the password_digest stored in the database
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # read the value of intended_url in the session hash
      # if have intended_url will redirect otherwise redirect to user profile
      redirect_to(session[:intended_url] || @user)
      session[:intended_url] = nil 
    else
      render :new
    end
  end

  def facebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url, notice: "SIGNED IN"
  end

  # delete user_id from session hash
  def destroy
    # @user = User.find(params[:id])
    # remove user_id key from session
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_url, alert: "Account successfully deleted!"
  end
end