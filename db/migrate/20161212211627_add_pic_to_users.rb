class AddPicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :employeePic, :string
  end
end
