class Bug < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }
  has_one_attached :screenshot
  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if screenshot.attached? && !screenshot.content_type.in?(%w(application/png application/gif))
      errors.add(:screenshot, 'Must be a png or a gif file')
    end
  end
end