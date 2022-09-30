class AddReferenceToCourseModules < ActiveRecord::Migration[5.2]
  def change
    add_reference :course_modules, :course, foreign_key: true
  end
end
