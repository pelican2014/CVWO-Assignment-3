class DeleteTagFromTasks < ActiveRecord::Migration
  def change
  	change_table :tasks do |t|
  		t.remove :tag
  	end
  end
end
