class Project < ApplicationRecord
  has_many :project_users
  has_many :users, :through => :project_users
  default_scope -> { order(created_at: :desc)}
  validates :content, presence: true
end
