class UsersController < ApplicationController
  def index
  	@all = User.all
  end

  def new
  end

  def create
  	user = User.new(user_params)
  	if user.save
      flash[:success] = "The form is valid."
      redirect_to "/"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    # user.update(user_params) 		This would just update all of them as a batch
    user.update(first_name: params[:first_name], last_name: params[:last_name], email_address: params[:email_address], password: params[:password])
      if (user.save)
	    redirect_to '/users'
	  else
		flash[:errors] = user.errors.full_messages
		redirect_to :back
	  end
  end

  def destroy
  	User.find(params[:id]).delete
  	redirect_to '/'
  end

  private 
  def user_params
    params.require(:userform).permit(:first_name, :last_name, :email_address, :password)
  end

end
