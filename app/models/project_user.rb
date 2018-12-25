class ProjectUser < ApplicationRecord
	belongs_to :project, foreign_key: true
	belongs_to :user, foreign_key: true
end
