class AddSendForApprovalToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :send_for_approval, :boolean, default: false
  end
end
