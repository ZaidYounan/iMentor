class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :project_description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
