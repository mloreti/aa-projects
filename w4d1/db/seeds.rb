# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Contact.create!(name: 'Billy',email: 'Billy12@disney.com', user_id: 3)
Contact.create!(name: 'Kit',email: 'kit@yahoo.com', user_id: 1)
Contact.create!(name: 'Zane',email: 'zane@hooli.com', user_id: 4)
Contact.create!(name: 'Barbara',email: 'barbara@kibble.com', user_id: 1)
Contact.create!(name: 'Mandy',email: 'sharklover404@turtletours.com', user_id: 2)

User.create!(username: 'billybob')
User.create!(username: 'kittykat')
User.create!(username: 'crazyzane')
User.create!(username: 'barbiegirl89')
User.create!(username: 'sharktoof4life')

ContactShare.create!(user_id: 4, contact_id: 1)
ContactShare.create!(user_id: 5, contact_id: 1)
ContactShare.create!(user_id: 1, contact_id: 2)
ContactShare.create!(user_id: 2, contact_id: 3)
ContactShare.create!(user_id: 3, contact_id: 4)
ContactShare.create!(user_id: 4, contact_id: 5)
