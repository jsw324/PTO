class RenamePtoToDays < ActiveRecord::Migration
  def change
    rename_table :Pto, :Days
  end
end
