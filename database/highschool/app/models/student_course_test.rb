class StudentCourseTest < ActiveRecord::Base

  #
  # Relations
  #
  has_one :course, through: :course_test
  belongs_to :course_test
  belongs_to :student

  # Returns all companies with no Subscriptions
  def self.for_student(name)
    self.joins(:student).where({'students.name' => name})
  end

  def self.for_course(title)
    self.joins(:course).where({'courses.title' => title})
  end
  def self.average_grade
    self.average(:grade)
  end

  def self.get_student_average_per_course
    StudentCourseTest.joins({:student => :courses }).group('students.id', 'courses.title').select('AVG(student_course_tests.grade) AS avg, students.*, students.id AS sid, courses.title')
  end

end
