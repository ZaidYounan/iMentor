class Comment < ApplicationRecord
  validates :body, length: { minimum: 2, :message => "Message too short." }
  validates :body, presence: true
  belongs_to :project
  belongs_to :user
end
