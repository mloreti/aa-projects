# == Schema Information
#
# Table name: castings
#
#  id       :integer          not null, primary key
#  movie_id :integer          not null
#  actor_id :integer          not null
#  ord      :integer          not null
#

class Casting < ActiveRecord::Base
	
	belongs_to :actor
	belongs_to :movie

end
