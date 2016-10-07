# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  studio     :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  belongs_to :band
  has_many :tracks, dependent: :destroy

  validates :title, presence: true

end
