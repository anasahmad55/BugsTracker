class RemoveProjectIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :project_id, :integer
  end
end
