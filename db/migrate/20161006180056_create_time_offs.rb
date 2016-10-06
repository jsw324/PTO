class CreateTimeOffs < ActiveRecord::Migration
  def change
    create_table :time_offs do |t|
      t.string :name
      t.integer :daysGiven
      t.integer :daysTaken
      t.datetime :dateTaken

      t.timestamps null: false
    end
  end
end
