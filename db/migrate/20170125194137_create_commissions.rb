class CreateCommissions < ActiveRecord::Migration[5.0]
  def change
    create_table :commissions do |t|
    	t.decimal			:card,			null: false,		default: 3.5
    	t.decimal			:deposit,		null: false,		default: 10.00
    	t.belongs_to	:user
    	t.belongs_to	:event
    	t.belongs_to	:booking
      t.timestamps
    end
  end
end
