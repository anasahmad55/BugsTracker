class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.belongs_to :user
      t.string :title, null: false
      t.text :description
      t.datetime :deadline
      t.string :type, null: false
      t.string :status, null: false
      t.string :screenShoot
    end
  end
end
