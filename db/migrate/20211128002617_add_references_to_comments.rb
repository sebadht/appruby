class AddReferencesToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :course_module, foreign_key: true
  end
end
