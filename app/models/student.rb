class Student < User
    belongs_to :projects
    def student?
        true
    end
end