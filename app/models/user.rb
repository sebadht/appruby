class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name, :last_name, presence: true
  has_many :courses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :inscriptions, dependent: :destroy
  has_many :course_inscriptions, through: :inscriptions, source: :course, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy

  has_one_attached :picture
end
