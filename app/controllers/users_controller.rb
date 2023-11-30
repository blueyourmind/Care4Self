class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save

      noticed[:success] = " Dont forget to take your meds"
      redirect_to @user
    else

      noticed[:error] = "Hello"
      render :new
    end
  end
end
