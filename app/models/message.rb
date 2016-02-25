class Message < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :classroom
  has_many :comments, dependent: :destroy

  validates :text, presence: true
  validates :teacher_id, presence: true
  validates :classroom_id, presence: true
  validates :title, presence: true
  validates :type, presence: true

  class << self
    def types
      %w(Homework General Reminder)
    end
  end
end