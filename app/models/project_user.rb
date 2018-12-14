class ProjectUser < ApplicationRecord
	belongs_to :project
	belongs_to :users
end
