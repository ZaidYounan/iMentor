class AddUserRefToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference(:projects, :user)
    add_foreign_key :projects, :users
  end
end
