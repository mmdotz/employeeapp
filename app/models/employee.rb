class Employee < ActiveRecord::Base
  has_many :vacations, :dependent => :destroy
  # validates :id,
  #   :presence => {:message => "#{:id} is not a valid employee number."}
end

#va;idation above did NOT allow a new id to be created, commenting out worked
