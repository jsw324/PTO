class AddUserIdToDays < ActiveRecord::Migration
  def change
    add_column :days, :user_id, :int
  end
end
