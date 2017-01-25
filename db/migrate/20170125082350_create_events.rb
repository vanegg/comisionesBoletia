class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
			t.string 			:name, 					null: false
    	t.string 			:place, 				null: false
    	t.string 			:category, 			null: false
    	t.integer 		:assistance, 		null: false
    	t.datetime		:date_event, 		null: false
    	t.text	 			:description
    	t.boolean 		:hasCommission, default: false
    	t.belongs_to 	:user
      t.timestamps
    end
  end
end
