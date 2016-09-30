# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Mickey")
User.create!(name: "David")
User.create!(name: "Bob")
User.create!(name: "James")

Poll.create!(title: "Coding", user_id: 1)
Poll.create!(title: "Politics", user_id: 2)
Poll.create!(title: "Sports", user_id: 1)
Poll.create!(title: "Music", user_id: 4)

Question.create!(text: "Do you like Ruby?", poll_id: 1)
Question.create!(text: "Do you like Java?", poll_id: 1)
Question.create!(text: "Do you like Trump?", poll_id: 2)
Question.create!(text: "Who will win the championship?", poll_id: 3)
Question.create!(text: "Who is your favorite artist?", poll_id: 4)

Answer.create!(text: "Yes", question_id: 1) # Pol1: 1
Answer.create!(text: "No", question_id: 1) # Pol1: 1

Answer.create!(text: "Yes", question_id: 2) # Pol1: 1
Answer.create!(text: "No", question_id: 2) # Pol1: 1

Answer.create!(text: "Yes", question_id: 3) # Pol1: 2
Answer.create!(text: "No", question_id: 3) # Pol1: 2

Answer.create!(text: "Lakers", question_id: 4) # Pol1: 3
Answer.create!(text: "Warriors", question_id: 4) # Pol1: 3

Answer.create!(text: "Brittany Spears", question_id: 5) #Poll: 4
Answer.create!(text: "Shakira", question_id: 5) # Pol1: 4

Vote.create!(answer_id: 1, user_id: 3)
Vote.create!(answer_id: 2, user_id: 4)
Vote.create!(answer_id: 2, user_id: 2)

Vote.create!(answer_id: 3, user_id: 3)
Vote.create!(answer_id: 4, user_id: 2)

Vote.create!(answer_id: 5, user_id: 1)
Vote.create!(answer_id: 6, user_id: 3)

Vote.create!(answer_id: 7, user_id: 2)
Vote.create!(answer_id: 8, user_id: 4)

Vote.create!(answer_id: 9, user_id: 1)
Vote.create!(answer_id: 10, user_id: 3)
