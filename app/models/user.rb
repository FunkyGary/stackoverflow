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
  def admin?
    self.role == "admin"
  end
end
