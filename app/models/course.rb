class Course < ApplicationRecord
  validates :name, presence: { message: "must be given please" },
    length: {minimum: 5, message: "The name must have 5 charachters minimum"}
  validates :description, 
            presence: { message: "description cant be blank" } 
  validates :category, 
            presence: { message: "category cant be blank" }
    
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :course_modules, dependent: :destroy
  has_many :inscriptions, dependent: :destroy
  has_many :inscripted_users, through: :inscriptions, source: :user, dependent: :destroy

  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
    else
      all
    end 
  end
end
