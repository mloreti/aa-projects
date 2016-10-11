class Post < ActiveRecord::Base

  validates :title, :url, :content, :sub_id, :author_id, presence:true

  belongs_to :sub
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :comments
  
end
