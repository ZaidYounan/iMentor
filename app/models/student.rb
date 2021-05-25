class Student < User
    has_many :projects_students
    has_many :projects, { :through => :projects_students }

    def student?
        true
    end
end