class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :dept
      t.integer :yrs_employed
      t.string :position
      t.string :status
      t.string :pay

      t.timestamps null: false
    end
  end
end
