class Project < ApplicationRecord
    has_many :comments, dependent: :destroy

end
