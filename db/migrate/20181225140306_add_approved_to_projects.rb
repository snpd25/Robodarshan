class AddApprovedToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :approved, :boolean, default: false
  end
end
