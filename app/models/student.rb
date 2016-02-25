class Student < User
  has_and_belongs_to_many :classrooms, :join_table => :student_memberships
  has_many :student_memberships, dependent: :destroy
end
