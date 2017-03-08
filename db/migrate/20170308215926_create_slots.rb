class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :schedule_id
      t.integer :course_id
      t.string :year
      t.string :quarter
      t.boolean :completed
      t.string :grade

      t.timestamps

    end
  end
end
