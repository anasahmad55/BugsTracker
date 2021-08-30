class Bug < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }
end