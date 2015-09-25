class ChangeDateTakentoString < ActiveRecord::Migration
  def change
    change_column(:vacations, :date_taken, :string, null:false)
  end
end
