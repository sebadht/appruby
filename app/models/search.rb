class Search < ApplicationRecord
  def search_courses
    courses = Course.all
    courses = courses.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present?
    courses = courses.where(["category LIKE ?", category]) if category.present?
    return courses
  end
end
