class UsersController < ApplicationController


  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.order(id: "DESC")
  end

  def index
    @user = current_user
    @users = User.page(params[:page]).order(id: "DESC")
  	@book = Book.new
  end

  def new
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
  		redirect_to user_path(@user)
    end
  end

  def update
  	@user = User.find(params[:id])
  	 	if @user.update(user_params)
       flash[:notice] = "Your information was successfully updated!!"
    	 redirect_to user_path(@user.id)
    	else
    		flash[:test] = "error!"
    		render :edit
    	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image, :email, :caption)
  end


end