class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :content, null:false
      t.integer :author_id, null:false
      t.timestamps null: false
    end
  end
end
