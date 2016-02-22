class AddingMemberships < ActiveRecord::Migration
  def change
    create_table :student_memberships do |t|
      t.integer :student_id
      t.integer :classroom_id
    end

    create_table :parent_memberships do |t|
      t.integer :parent_id
      t.integer :classroom_id
    end
  end
end
