
  class Student < ActiveRecord::Base

    #
    # Relations
    #
    has_many :courses, through: :student_courses
    has_many :student_courses
    has_many :tests, :class_name => StudentCourseTest

  end
