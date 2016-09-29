require 'securerandom'

class ShortenedURL < ActiveRecord::Base
  validates :long_url, :user_id, presence: true
  validates :short_url, uniqueness: true

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :url_id

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :user_visits

  def self.random_code
    code = SecureRandom.base64(12)
    while ShortenedURL.exists?(:short_url => code)
      code = SecureRandom.base64(12)
    end
    code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create!(user_id: user.id, long_url: long_url, short_url: random_code)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    # self.visits.select(:user_id).distinct.count
    visitors.count
  end

  def num_recent_uniques
    self.visits.select(:updated_at).distinct.where("updated_at > ?", 10.minutes.ago).count
  end

end
