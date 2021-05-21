class Mentor < User
    has_many :projects
    def mentor?
        true
    end
end