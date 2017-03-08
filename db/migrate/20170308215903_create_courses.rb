class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :dept_code
      t.string :department

      t.timestamps

    end
  end
end
