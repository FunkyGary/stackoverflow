class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :answer_upvotes, dependent: :destroy
  has_many :upvoted_users, through: :answer_upvotes, source: :user
  def is_upvoted?(user)
    self.upvoted_users.include?(user)
  end
  def count_upvotes
    self.upvotes_count = self.upvotes.size
    self.save
  end
end
