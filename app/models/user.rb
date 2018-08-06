class User < ApplicationRecord
  mount_uploader :avator, AvatorUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_questions, through: :favorites, source: :question
  has_many :upvotes, dependent: :destroy
  has_many :upvoted_questions, through: :upvotes, source: :question
  has_many :anupvotes, dependent: :destroy
  has_many :upvoted_answers, through: :anupvotes, source: :answer
  def admin?
    self.role == "admin"
  end
  def count_totalupvotes
    totalupvotes = 0
    if self.answers.size > 0
      self.answers.each do |answer|
        totalupvotes += answer.upvotes_count
      end
    end
    if self.questions.size > 0
      self.questions.each do |question|
        totalupvotes += question.upvotes_count
      end
    end
    self.totalupvotes = totalupvotes
    self.save
  end
end
