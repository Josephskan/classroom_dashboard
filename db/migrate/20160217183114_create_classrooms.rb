class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.integer :passcode
      t.string :classroom_name

      t.timestamps null: false
    end
  end
end
