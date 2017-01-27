class BookingController < ApplicationController

	def new
		@booking = Booking.new()
		@event = Event.find(params[:event])
	end

	def create
		@booking = Booking.new( price_ticket: 		params[:booking][:price_ticket],
														ticket_quantity: 	params[:booking][:ticket_quantity],
														payment_method: 	params[:booking][:payment_method],
														event_id: 				params[:booking][:event_id]
													 )
		
	end

end


 # create_table "bookings", force: :cascade do |t|
 #    t.float    "price_ticket",      null: false
 #    t.integer  "ticket_quantity",   null: false
 #    t.string   "payment_method",    null: false
 #    t.float    "ticket_commission", null: false
 #    t.float    "total_commission",  null: false
 #    t.float    "total_price",       null: false
 #    t.integer  "event_id"
 #    t.datetime "created_at",        null: false
 #    t.datetime "updated_at",        null: false
 #    t.index ["event_id"], name: "index_bookings_on_event_id", using: :btree
 #  end