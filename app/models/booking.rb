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

end
