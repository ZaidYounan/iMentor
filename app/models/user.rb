class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_one :profile
  has_one_attached :avatar
  has_many :projects
  def mentor?
    false
  end

  def student?
    false
  end
end
