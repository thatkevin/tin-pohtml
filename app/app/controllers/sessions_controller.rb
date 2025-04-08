class SessionsController < ApplicationController
  def new
    # Login page
    redirect_to admin_root_path if logged_in?
  end
  
  def create
    # Handle email login request
    user = User.find_by(email: params[:email].downcase)
    
    if user
      # Generate magic token
      token = user.generate_token
      # Send login email
      UserMailer.login_link(user, token).deliver_now
      redirect_to login_path, notice: "Check your email for a magic link to log in!"
    else
      flash.now[:alert] = "Email not found. Please try again or contact an administrator."
      render :new
    end
  end
  
  def magic_link
    user = User.find_by(id: params[:user_id])
    
    if user && user.valid_token?(params[:token])
      # Valid token, log in user
      session[:user_id] = user.id
      user.clear_token
      redirect_to admin_root_path, notice: "Successfully logged in!"
    else
      redirect_to login_path, alert: "Invalid or expired link. Please try again."
    end
  end
  
  def destroy
    # Log out
    session[:user_id] = nil
    redirect_to login_path, notice: "You have been logged out."
  end
end