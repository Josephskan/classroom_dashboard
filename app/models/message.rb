class Message < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :classroom
  has_many :comments, dependent: :destroy
end