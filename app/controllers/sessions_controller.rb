class SessionsController < ApplicationController
  def new
  end

  def create
 user = User.where(email: params[:session][:email].downcase).first
    if user && user.authenticate(params[:session][:password])
    	log_in user
      redirect_to user
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

end