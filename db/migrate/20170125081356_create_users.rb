class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string 			:name, 					null: false
    	t.string 			:email, 				null: false
    	t.string 			:address, 			null: false
    	t.string 			:phone
    	t.string 			:account, 			null: false
    	t.boolean 		:hasCommission, default: false
      t.timestamps
    end
  end
end
