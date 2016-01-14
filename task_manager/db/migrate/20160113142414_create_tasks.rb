class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.text :content
      t.string :priority
      t.date :due
      t.string :tag

      t.timestamps null: false
    end
  end
end
