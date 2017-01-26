class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
    	t.float 			:price_ticket, 			null: false
    	t.integer			:ticket_quantity, 	null: false
    	t.string			:payment_method, 		null: false
    	t.float				:ticket_commission,	null: false
    	t.float				:total_commission,	null: false
    	t.float				:total_price,				null: false
    	t.belongs_to	:event
      t.timestamps
    end
  end
end
