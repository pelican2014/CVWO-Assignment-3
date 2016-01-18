class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end

    change_table :tasks do |t|
    	t.references :tags, index: true, foreign_key: true
    end
  end
end
