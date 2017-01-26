# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
	first_name 	= Faker::Name.first_name
	last_name		= Faker::Name.last_name
	user = User.create!(	name: 		first_name + ' ' + last_name,
												email: 		Faker::Internet.email(first_name),
												address: 	Faker::Address.street_address + ', ' + Faker::Address.city,
												phone: 		(Faker::PhoneNumber.phone_number).gsub!(/\D/,''),
												account: 	Faker::Business.credit_card_number
											)

	2.times do |n|
		event = Event.new(	name: 				Faker::App.name + ' Fest',
												place: 				Faker::Address.street_address + ', ' + Faker::Address.city,
												category: 		'Festival',
												assistance: 	Faker::Number.between(10, 50000),
												date_event: 	((n+1)*10).day.from_now,
												description:	Faker::Lorem.paragraph								
											)
		user.events << event
		event.save
	end
end
