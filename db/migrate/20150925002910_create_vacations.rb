class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.date    :date_taken
      t.integer :days_left
      t.belongs_to :employee, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
