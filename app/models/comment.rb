class Comment < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  belongs_to :course_module

  has_many    :replies, dependent: :destroy
end
