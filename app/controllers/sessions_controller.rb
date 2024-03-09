class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})
    if @user != nil
      # 2. if the user exists -> check if they know their password
      if BCrypt::Password.new(@user["password"]) == params["password"]
        # 3. if they know their password -> login is successful
        # 4. if the user doesn't exist or they don't know their password -> login fails
        flash["notice"] = "Welcome."
        redirect_to "/places"
      else
        flash["notice"] = "Nope."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/login"
    end
  end

  def destroy
  end
end
  