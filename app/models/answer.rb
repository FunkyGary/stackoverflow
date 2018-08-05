class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :anupvotes, dependent: :destroy
  has_many :upvoted_users, through: :anupvotes, source: :user
  def is_upvoted?(user)
    self.upvoted_users.include?(user)
  end
  def count_answer_upvotes
    self.upvotes_count = self.anupvotes.size
    self.save
  end
end
