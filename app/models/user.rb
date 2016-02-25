class User < ActiveRecord::Base

  has_secure_password
  has_many :comments

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :type, presence: true

  class << self
    def types
      %w(Teacher Student Parent)
    end
  end

end
