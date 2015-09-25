class Employee < ActiveRecord::Base
  has_many :vacations, :dependent => :destroy
  validates :employees, presence: true
end
