class User < ActiveRecord::Base

  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :type, presence: true

  # scope :teachers, -> { where(type: 'Teacher') }
  # scope :students, -> { where(type: 'Student') }
  # scope :parents, -> { where(type: 'Parent') }

  class << self
    def types
      %w(Teacher Student Parent)
    end
  end

end
