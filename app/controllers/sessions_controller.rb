class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user
      sign_in(user)
      # redirect_to all_posts_url
      redirect_to home_url
    else
      flash.now[:errors] = ["Invalid username or password."]
      render :new
    end
  end

  def destroy
    sign_out
    # redirect_to new_user_url
    redirect_to home_url
  end
end
