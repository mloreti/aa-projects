class Visit < ActiveRecord::Base
  validates :url_id, :user_id, presence: true

  belongs_to :url_visits,
    class_name: :ShortenedURL,
    primary_key: :id,
    foreign_key: :url_id

  belongs_to :user_visits,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  def self.record_visit!(user, shortened_url)
    self.create!(user_id: user.id, url_id: shortened_url.id)
  end


end
