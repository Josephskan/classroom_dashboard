class AddingTeacherIdToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :teacher_id, :integer, foreign_key: true, index: true
  end
end
