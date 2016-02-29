class Classroom < ActiveRecord::Base
  belongs_to :teacher, class_name: "User"
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :students, :join_table => :student_memberships
  has_and_belongs_to_many :parents, :join_table => :parent_memberships
  has_many :student_memberships, dependent: :destroy
  has_many :parent_memberships, dependent: :destroy

  validates :classroom_name, presence: true 
  validates :teacher, presence: true

  def check_teacher(classroom, user)
    classroom.teacher == user
  end

  def check_student_membership(classroom, user)
    StudentMembership.where("classroom_id = ? AND student_id = ?", classroom.id, user.id)
  end

  def check_parent_membership(classroom, user)
    ParentMembership.where("classroom_id = ? AND parent_id = ?", classroom.id, user.id)
  end

  def as_json(opstions={})
    super(methods:[:teacher] )
  end
end
