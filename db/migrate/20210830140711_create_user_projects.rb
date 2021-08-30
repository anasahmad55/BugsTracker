class CreateUserProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_projects do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.string :name
    end
  end
end
