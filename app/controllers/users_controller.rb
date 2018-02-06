class UsersController < ApplicationController

	def index
		render 'xxx'
	end


	def show
		@user = User.find(params[:id])
	end


	def new
	@user = User.new
	end


	def edit
		@user = User.find(params[:id])
	end


	def create
		@user = User.create(params_user)
		redirect_to user_path
	end

	
	def update
		@user = User.find(params[:id])
    		if 	@user.update(params_user)
      			redirect_to user_path
    		else
      			render 'edit'
    		end
	end

	
	def destroy
		@user = User.find(params[:id])
      	@user.destroy
      	redirect_to root_path
	end

	private

  		def params_user
    	params.require(:user).permit(:email, :password)
  		end

end
