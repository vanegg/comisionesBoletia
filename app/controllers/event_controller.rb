class EventController < ApplicationController

	def search
		if params[:event_id] != nil && params[:event_id] != ""
			id = params[:event_id]
			redirect_to event_path(id)
		end
	end

	def show
		if Event.exists?(params[:id])
				@event = Event.find(params[:id])
				@user = User.find(@event.user_id).name
				@status = true
				flash.now[:success] = "¡Evento encontrado!"				
		else
				@status = false
				# flash.now[:danger] = "¡Evento no encontrado!"	
		end
	end

	def destroy
	end

end
