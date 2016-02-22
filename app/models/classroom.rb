class Classroom < ActiveRecord::Base
  belongs_to :teacher
  has_and_belongs_to_many :students, :through => :student_memberships
  has_and_belongs_to_many :parents, :through => :parent_memberships

  validates :classroom_name, presence: true 
end
