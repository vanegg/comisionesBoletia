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

		if @booking.payment_method == 'card'
			@booking.ticket_commission = @commission.card
		elsif @booking.payment_method == 'deposit'
			@booking.ticket_commission = @commission.deposit
		end

		@booking.total_commission = Booking.estimate_t_commission(@booking.price_ticket,
																															@booking.ticket_quantity,
																															@booking.ticket_commission, 
																															@booking.payment_method).round(2)

		@booking.total_price = Booking.estimate_total(@booking.price_ticket,
																									@booking.ticket_quantity,
																									@booking.total_commission).round(2)
		# puts '******************TOTALES'
		# puts @booking.total_commission
		# puts @booking.total_price	

		@booking.save

		unless has_custom_commission?(event_id)
			@commission.booking_id = @booking_id 
			@commission.save
		end

		redirect_to booking_path(@booking, format: :pdf)
		#redirect_to booking_path(@booking)

	end

	def show
		create_pdf(params[:id])
	end

	private

		def has_custom_commission?(event_id)
			if Event.exists?(event_id)
				event = Event.find(event_id)
				user 	= User.find(event.user_id)

				if event.hasCommission || user.hasCommission
					true
				end
			end
			false
		end

		def check_custom_commission(event_id)
			if 	Event.exists?(event_id)

				event = Event.find(event_id)
				if event.hasCommission
					event.commission
				else
					user = User.find(event.user_id)
					if  user.hasCommission
						user.commission
					else
						false
					end
				end

			end
		end

		def default_commission(booking_id)
			 c = Commission.create(booking_id: booking_id)
		end

		def create_pdf(booking)
      respond_to do |format|
      format.html
      format.pdf do
        @example_text = "some text"
        render :pdf => "booking",
               :template => "booking/booking.pdf.erb",
               :layout => "pdf.html",
               :footer => {
                    # :center => "Center",
                    # :left => "Left",
                    # :right => "Right"
                 }
      end
    end
    end

end