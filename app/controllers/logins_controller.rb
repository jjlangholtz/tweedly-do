class LoginsController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    respond_to do |format|
      if user && user.authenticate(params[:password])
        sign_in user
        format.html { redirect_to user }
        format.js
      else
        flash.now[:error] = 'Invalid email/password combination'
        format.html { render 'new' }
        format.js
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: 'You have successfully logged out.'
  end
end
