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

	def self.estimate_t_commission(ticket_commission, payment_method)
		puts "Estimando comision total"
		return 300.0
	end

end
