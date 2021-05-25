class CreateProjectsStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_students do |t|
      t.references :project, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
