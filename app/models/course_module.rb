class CourseModule < ApplicationRecord
  validates :title, :description, presence: true
  belongs_to :course
  has_many :comments, dependent: :destroy

  has_one_attached :video
  has_one_attached :sheet
  has_one_attached :image

end
