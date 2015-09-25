class AddDaysLefttoEmployee < ActiveRecord::Migration
  def change
    add_column(:employees, :days_left, :string)
  end
end
