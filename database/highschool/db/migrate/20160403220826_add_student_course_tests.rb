class AddStudentCourseTests < ActiveRecord::Migration

  def change

    create_table :student_course_tests do |t|

      t.integer :course_test_id, index: true, foreign_key: true
      t.integer :student_id, index: true, foreign_key: true

      t.float :grade, index: true

      t.timestamps
      
    end

  end

end
