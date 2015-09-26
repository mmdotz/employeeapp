class Employee < ActiveRecord::Base
  has_many :vacations, :dependent => :destroy
  validates :id,
    :presence => {:message => "#{:id} is not a valid employee number."}
end
