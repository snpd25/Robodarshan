class AddTitleToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :title, :string
  end
end
