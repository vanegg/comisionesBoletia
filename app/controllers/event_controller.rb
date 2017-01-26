class EventController < ApplicationController

	def show
		if params[:event_id] != nil && params[:event_id] != ""
			id = params[:event_id]
			if Event.exists?(id)
				@event = Event.find(id)
				@user = User.find(@event.user_id).name
				@status = true

      	#format.js { flash.now[:success] = "¡Evento encontrado!" }
			else
				@status = false
      	#format.js { flash.now[:danger]	= "¡Evento no encontrado" }
			end
		end
	end

end
