class ParentMembership < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :parent

    def as_json(options={})
    super(methods:[:classroom])
  end
end