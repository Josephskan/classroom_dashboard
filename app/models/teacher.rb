class Teacher < User
  has_many :classrooms
  has_many :messages
end