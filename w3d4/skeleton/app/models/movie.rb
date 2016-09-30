# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  yr          :integer          not null
#  score       :float            not null
#  votes       :integer          not null
#  director_id :integer          not null
#

class Movie < ActiveRecord::Base
	belongs_to :director, 
		class_name: "Actor"
	has_many :castings
	has_many :actors, through: :castings
end
