class AddPictureToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :picture, :string
  end
end
