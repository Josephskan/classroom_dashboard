class User < ActiveRecord::Base

  has_secure_password
  has_many :comments, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :type, presence: true

  def memberships_of_user(user)
    if user.is_a?(Student)
      return StudentMembership.where("student_id = ?", user.id)
    elsif user.is_a?(Parent)
      return ParentMembership.where("parent_id = ?", user.id)
    end
  end

  class << self
    def types
      %w(Teacher Student Parent)
    end
  end
end
