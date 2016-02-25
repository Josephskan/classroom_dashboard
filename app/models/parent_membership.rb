class ParentMembership < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :parent
end