class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.string :name
      t.integer :daysLeft

      t.timestamps null: false
    end
  end
end
