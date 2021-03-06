class Project < ApplicationRecord
  has_many :bugs, dependent: :destroy
  has_many :user_projects
  has_many :users, through: :user_projects
end