class AddTeachers < ActiveRecord::Migration

  def change

    create_table :teachers do |t|

      t.string :name

      t.timestamps
      
    end

  end

end
