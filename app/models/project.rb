class Project < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc)}
  mount_uploaders :pictures, PictureUploader
  validates :title, presence: true
  validates :content, presence: true
  #Svalidate :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
