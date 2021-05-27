class Project < ApplicationRecord
    validates :project_description, length: { minimum: 10, :message => "Description too short." }
    validates :start_date, presence: true
    validate :date_validation
    has_many :comments, dependent: :destroy
    belongs_to :user
    has_many :projects_students
    has_many :students, { :through => :projects_students }

    def date_validation
        errors.add(:base, "End date cannot be before the starting date.") if end_date.before? start_date
    end
end
