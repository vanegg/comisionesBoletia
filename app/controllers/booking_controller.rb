class BookingController < ApplicationController

	def new
		@booking = Booking.new()
		@event = Event.find(params[:event])
	end

	def create
		event_id = params[:booking][:event_id]
		@booking = Booking.new( price_ticket: 		params[:booking][:price_ticket],
														ticket_quantity: 	params[:booking][:ticket_quantity],
														payment_method: 	params[:booking][:payment_method],
														event_id: 				event_id)
													 
		@commission = check_custom_commission(event_id) ? check_custom_commission(event_id) : default_commission(@booking.id)
		puts '******************'
		puts @commission.card
		puts @commission.deposit

		if @booking.payment_method == 'card'
			@booking.ticket_commission = @commission.card
		elsif @booking.payment_method == 'deposit'
			@booking.ticket_commission = @commission.deposit
		end

		@booking.total_commission = Booking.estimate_t_commission(@booking.ticket_commission, 
																															@booking.payment_method)
		puts @booking.total_commission	
	end

	private

		def check_custom_commission(event_id)
			if 	Event.exists?(event_id)

				event = Event.find(event_id)
				if event.hasCommission
						return event.commission
				else
					user = User.find(event.user_id)
					if  user.hasCommission
						return user.commission
					else
						return false
					end
				end

			end
		end

		def default_commission(booking_id)
			if Booking.exists?(booking_id)
				commission = Commission.create(booking_id: booking_id)
			end
		end

end