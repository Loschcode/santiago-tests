
  class StudentCourse < ActiveRecord::Base

    #
    # Relations
    #
    belongs_to :course
    belongs_to :student
    
  end
