
  class Course < ActiveRecord::Base

    #
    # Relations
    #
    has_many :students, through: :student_courses
    has_many :student_courses
    has_many :tests

    has_one :teacher

    #has_many :companies, through: :cities
    
  end
  