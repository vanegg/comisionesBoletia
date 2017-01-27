class Booking < ApplicationRecord
	has_one		:commission
	belongs_to	:event

	validates	:payment_method,		presence:true

	validates	:price_ticket,
						:ticket_quantity,
						:ticket_commission,
						:total_commission,
						:total_price,				numericality: { greater_than: 0 }
	
	validates	:ticket_quantity,		numericality: { only_integer: true }

	def self.estimate_t_commission(price,quantity,ticket_commission, payment_method)
		if payment_method == 'card'
			price * quantity * (ticket_commission/100)

		elsif payment_method == 'deposit'
			quantity * ticket_commission

		else
			0.0
		end
	end

	def self.estimate_total(price,quantity,total_commission)
		price * quantity + total_commission
	end

end
