class ProjectsStudent < ApplicationRecord
    self.table_name = "projects_students"
    validates :student_id, uniqueness: true
    belongs_to :student
    belongs_to :project
end
