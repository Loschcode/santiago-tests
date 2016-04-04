class AddStudentCourses < ActiveRecord::Migration

  def change

    create_table :student_courses do |t|

      t.integer :student_id, index: true, foreign_key: true
      t.integer :course_id, index: true, foreign_key: true

      t.timestamps
      
    end

  end

end
