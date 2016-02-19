class Classroom < ActiveRecord::Base
  
  belongs_to :teacher

  validates :classroom_name, presence: true 
end
