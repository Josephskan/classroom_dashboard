class StudentMembership < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :student

    def as_json(options={})
    super(methods:[:classroom])
  end
end
