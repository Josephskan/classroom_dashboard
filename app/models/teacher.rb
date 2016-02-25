class Teacher < User
  has_many :classrooms, dependent: :destroy
  has_many :messages, dependent: :destroy
end