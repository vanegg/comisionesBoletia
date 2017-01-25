class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
    	t.decimal 		:price_ticket, 			null: false
    	t.integer			:ticket_quantity, 	null: false
    	t.string			:payment_method, 		null: false
    	t.decimal			:commission, 				null: false
    	t.decimal			:total_commission, 	null: false
    	t.decimal			:total_price,				null: false
    	t.belongs_to	:event
      t.timestamps
    end
  end
end
