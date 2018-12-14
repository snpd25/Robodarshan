class CreateProjectUsers < ActiveRecord::Migration[5.2]
  def change
    create_table  :project_users, :id => false do |t|
    	t.belongs_to :project
    	t.belongs_to :user
    	

      t.timestamps
    end
  end
end
