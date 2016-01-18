class CreateTasksTagsJoinTable < ActiveRecord::Migration
  def change
  	remove_reference(:tags, :tasks, index: true, foreign_key: true)
  	remove_reference(:tasks, :tags, index: true, foreign_key: true)

    create_table :tags_tasks, id: false do |t|
      t.integer :tag_id
      t.integer :task_id
    end
 
    add_index :tags_tasks, :tag_id
    add_index :tags_tasks, :task_id

  end
end
