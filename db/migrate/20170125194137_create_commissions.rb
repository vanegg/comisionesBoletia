class CreateCommissions < ActiveRecord::Migration[5.0]
  def change
    create_table :commissions do |t|
    	t.float				:card,			null: false,		default: 3.5
    	t.float				:deposit,		null: false,		default: 10.00
    	t.belongs_to	:user,			null: true
    	t.belongs_to	:event,			null: true
    	t.belongs_to	:booking,		null: true
      t.timestamps
    end
  end
end
