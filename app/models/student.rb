class Student < User
  has_and_belongs_to_many :classrooms, :through => :student_memberships
end
