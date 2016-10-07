class RenameTimeOffsToPto < ActiveRecord::Migration
  def change
    rename_table :time_offs, Pto
  end
end
