class Event < ApplicationRecord
	
	has_many		:bookings
	has_one			:commission
	belongs_to	:user

	validates		:name, 				presence: true, 
														length: { maximum: 50 }
	
	validates		:place,
							:category,
							:date_event,	presence: true
	
	validates 	:assistance, 	numericality: { only_integer: true, 
																						greater_than: 0, 
																						less_than_or_equal_to: 50000 }
	
	validates		:description,	length: { maximum: 500 }

	validate		:future_date

	private

		def future_date
			errors.add("Event date can't be in the past") if self.date_event != nil && self.date_event < Date.today	
		end							

end
