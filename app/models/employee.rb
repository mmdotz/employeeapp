class Employee < ActiveRecord::Base
  has_many :vacations, :dependent => :destroy
end
