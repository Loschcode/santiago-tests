class AddCourseTests < ActiveRecord::Migration

  def change

    create_table :course_tests do |t|

      t.integer :course_id, index: true, foreign_key: true
      t.string :title

      t.timestamps
      
    end

  end

end
