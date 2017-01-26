class EventController < ApplicationController
	def show
		if params[:event_id] != nil && params[:event_id] != ""
			id = params[:event_id]
			if Event.exists?(id)
				@event = Event.find(id)
				@status = true

				respond_to do |format|
      		format.js { flash.now[:success] = "¡Evento encontrado!" }
    		end
			else
				@status = false

				respond_to do |format|
      		format.js { flash.now[:danger]	= "¡Evento no encontrado" }
    		end
			end
		end
	end

end
