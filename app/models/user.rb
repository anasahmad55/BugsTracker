class User < ApplicationRecord
  has_many :bugs, dependent: :destroy
  has_many :user_projects
  has_many :projects, through: :user_projects
  validates :name, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_RAGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 25 },
            format: { with: VALID_EMAIL_RAGEX }
end