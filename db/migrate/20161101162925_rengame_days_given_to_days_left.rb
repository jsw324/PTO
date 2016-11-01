class RengameDaysGivenToDaysLeft < ActiveRecord::Migration
  def change
    rename_column :days, :daysGiven, :daysLeft
  end
end
