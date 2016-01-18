class RemoveReferencesFromTags < ActiveRecord::Migration
  def change
  	remove_reference(:tags, :task, index: true, foreign_key: true)
  end
end
