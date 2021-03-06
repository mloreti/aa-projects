# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  bonus      :boolean          not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord

  belongs_to :album
  has_one :band,
    through: :album,
    source: :band

  validates :album_id, :title, :lyrics, presence: true

end
