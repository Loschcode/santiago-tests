
  class CourseTest < ActiveRecord::Base

    #
    # Relations
    #
    has_many :students
    
    belongs_to :course

    #has_many :companies, through: :cities
    
  end
  