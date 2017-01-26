class Commission < ApplicationRecord
	belongs_to	:user,			optional: true
	belongs_to	:event,			optional: true
	belongs_to	:booking,		optional: true

	validates		:card,
							:deposit,		numericality: { greater_than_or_equal_to: 0 }
end
