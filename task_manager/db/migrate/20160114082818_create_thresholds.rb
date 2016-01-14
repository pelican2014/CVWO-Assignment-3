class CreateThresholds < ActiveRecord::Migration
  def change
    create_table :thresholds do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
