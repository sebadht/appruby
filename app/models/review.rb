class Review < ApplicationRecord
  validates :title, :description, presence: true
  validates :score, presence: true, numericality: { only_integer: true }, :inclusion => 0..5
  belongs_to :user
  belongs_to :course
end
