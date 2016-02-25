class Parent < User
  has_and_belongs_to_many :classrooms, :join_table => :parent_memberships
  has_many :parent_memberships, dependent: :destroy
end