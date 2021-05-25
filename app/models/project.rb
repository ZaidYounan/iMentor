class Project < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user
    has_many :projects_students
    has_many :students, { :through => :projects_students }
end
