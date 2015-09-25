class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.date :date_taken
      t.integer :days_left

      t.timestamps null: false
    end
  end
end
