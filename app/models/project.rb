class Project < ApplicationRecord
  has_many :project_users
  has_many :users, :through => :project_users
  default_scope -> { order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :content, presence: true
  validate :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
