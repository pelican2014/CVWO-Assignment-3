class AddReferenceToTags < ActiveRecord::Migration
  def change
  	add_reference(:tags, :tasks, index: true, foreign_key: true)
  end
end
