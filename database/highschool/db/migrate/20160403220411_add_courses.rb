class AddCourses < ActiveRecord::Migration

  def change

    create_table :courses do |t|

      t.integer :teacher_id, index: true, foreign_key: true
      t.string :title

      t.timestamps
      
    end

  end

end
