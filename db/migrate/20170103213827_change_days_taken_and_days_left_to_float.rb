class ChangeDaysTakenAndDaysLeftToFloat < ActiveRecord::Migration
  def change
    change_column :days, :daysTaken, :float
    change_column :days, :daysLeft, :float
  end
end
