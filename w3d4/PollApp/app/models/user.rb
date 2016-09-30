# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :polls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Poll

  has_many :votes,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Vote

end
