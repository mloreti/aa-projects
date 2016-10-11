class Sub < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User

end
