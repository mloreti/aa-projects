# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(birth_date: "2015/01/02", color: "black", name: "Bill", sex: "F", description: "Pretty kitty ;)")
Cat.create!(birth_date: "1994/02/10", color: "red", name: "Phil", sex: "F", description: "Pretty kitty ;)")
Cat.create!(birth_date: "2015/01/02", color: "Pink", name: "Tom", sex: "F", description: "Pretty kitty ;)")
Cat.create!(birth_date: "2015/01/02", color: "black", name: "Jennifer", sex: "F", description: "Pretty kitty ;)")
Cat.create!(birth_date: "2015/08/02", color: "Pink", name: "Solaris", sex: "F", description: "Pretty kitty ;)")
Cat.create!(birth_date: "2015/01/02", color: "Blue", name: "Venus", sex: "F", description: "Pretty kitty ;)")
Cat.create!(birth_date: "2015/08/02", color: "Pink", name: "Chrysanthemum", sex: "F", description: "Pretty kitty ;)")
Cat.create!(birth_date: "2015/01/02", color: "Blue", name: "Joanne", sex: "F", description: "Pretty kitty ;)")
Cat.create!(birth_date: "2015/08/02", color: "black", name: "Mellisa", sex: "F", description: "Pretty kitty ;)")
Cat.create!(birth_date: "2015/01/02", color: "Blue", name: "Kuckerberg", sex: "F", description: "Pretty kitty ;)")

CatRental.create!(cat_id: 1, start_date: "01/01/2016", end_date:"01/03/2016")
CatRental.create!(cat_id: 2, start_date: "01/01/2016", end_date:"01/03/2016")
CatRental.create!(cat_id: 3, start_date: "01/01/2016", end_date:"01/03/2016")
CatRental.create!(cat_id: 4, start_date: "01/01/2016", end_date:"01/03/2016")
CatRental.create!(cat_id: 5, start_date: "01/01/2016", end_date:"01/03/2016")
CatRental.create!(cat_id: 6, start_date: "01/01/2016", end_date:"01/03/2016")
