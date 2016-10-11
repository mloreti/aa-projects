class Comment < ActiveRecord::Base
  validates :content, :author_id, :post_id, presence: true

  belongs_to :post
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :child_comments,
    foreign_key: :parent_comment_id,
    class_name: :Comment,
    inverse_of: :parent_comment

  belongs_to :parent_comment,
    foreign_key: :parent_comment_id,
    class_name: :Comment,
    inverse_of: :child_comments
end
