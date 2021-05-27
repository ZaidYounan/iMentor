class ProjectsStudent < ApplicationRecord
    self.table_name = "projects_students"
    belongs_to :student
    belongs_to :project
end
