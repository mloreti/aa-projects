# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true

  belongs_to :answer,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :Answer

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer,
    source: :question

  def sibling_votes
    all_votes = self.question.votes.where.not('votes.id = ?', self.id)

    # this works
    # all_votes = self.question.votes
    # sibling_votes = []
    #
    # all_votes.each do |vote|
    #   sibling_votes << vote unless vote == self
    # end
    # sibling_votes
  end
end
