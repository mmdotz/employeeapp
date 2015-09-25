class RemoveDaysLeftColumnFromVacations < ActiveRecord::Migration
  def change
    remove_column(:vacations, :days_left)

  end
end
