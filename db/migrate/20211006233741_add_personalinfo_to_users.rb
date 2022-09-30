class AddPersonalinfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :personal_info, :text
  end
end
