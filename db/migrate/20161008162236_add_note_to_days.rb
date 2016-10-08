class AddNoteToDays < ActiveRecord::Migration
  def change
    add_column :days, :note, :string
  end
end
