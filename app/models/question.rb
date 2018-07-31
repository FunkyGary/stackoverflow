class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :upvotes, dependent: :destroy
  has_many :upvoted_users, through: :upvotes, source: :user
  def is_favorited?(user)
    self.favorited_users.include?(user)
  end
  def is_upvoted?(user)
    self.upvoted_users.include?(user)
  end
  def count_favorites
    self.favorites_count = self.favorites.size
    self.save
  end
  def count_upvotes
    self.upvotes_count = self.upvotes.size
    self.save
  end
end
