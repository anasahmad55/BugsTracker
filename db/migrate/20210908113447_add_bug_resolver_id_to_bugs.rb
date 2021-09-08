class AddBugResolverIdToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :bug_resolver_id, :integer
  end
end
