class UserController < ApplicationController

	def search
		if params[:user_id] != nil && params[:user_id] != ""
			id = params[:user_id]
			redirect_to user_path(id)
		end
	end

	def show
		if User.exists?(params[:id])
				@user = User.find(params[:id])
				@status = true
				flash[:success] = "¡Usuario encontrado!"				
			else
				@status = false
				flash[:danger]	= "¡Usuario no encontrado!"
			end
	end
	
end
