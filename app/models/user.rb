class User < ActiveRecord::Base

  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

end

# class Teacher < User
#   has_many :classrooms
# end

# class Student < User
# end

# class Parent < User
# end
