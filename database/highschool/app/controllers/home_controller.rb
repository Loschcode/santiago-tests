class HomeController < ApplicationController

  def index

    #
    # 1.­  Si usted estuviera resolviendo el problema del colegio con programación orientada a objetos, defina que clases usaría, métodos y las variables de estas clases. Puede utilizar el lenguaje que más le acomode o bien pseudos código.
    #
    
    #
    # Please `rake db:migrate` and `rake db:seed` before to try it out
    #
    
    # 2.
    # 
    # SELECT s.* FROM students AS s
    # INNER JOIN student_courses AS sc ON s.id = sc.student_id
    # INNER JOIN courses AS c ON sc.`course_id` = c.id
    # WHERE c.title = "programación"
    # 
    course = Course.where(title: 'programación').first
    ex2_result = course.students unless course.nil?

    # 3.
    # 
    # SELECT AVG(student_course_tests.grade) FROM student_course_tests
    # INNER JOIN students AS s ON student_course_tests.student_id = s.id
    # INNER JOIN course_tests AS ct ON student_course_tests.course_test_id = ct.id
    # INNER JOIN courses AS c ON ct.course_id = c.id
    # WHERE c.title = "programación" AND s.name = "Laurent"
    #
    ex3_result = StudentCourseTest.for_student("Laurent").for_course("programación").average(:grade)

    # 4.
    #
    # SELECT AVG(student_course_tests.grade) AS average, s.*, courses.title FROM student_course_tests
    # INNER JOIN students AS s ON student_course_tests.student_id = s.id
    # INNER JOIN student_courses ON s.id = student_courses.student_id 
    # INNER JOIN courses ON courses.id = student_courses.course_id GROUP BY s.id, courses.title
    # 
    ex4_result = StudentCourseTest.joins({:student => :courses }).group('students.id', 'courses.title').select('AVG(student_course_tests.grade) AS average, students.*, courses.title')

    # 5.
    #
    # SELECT savg.* FROM (
    # SELECT AVG(student_course_tests.grade) AS avg, s.id AS sid, s.name, courses.title FROM student_course_tests
    # INNER JOIN students AS s ON student_course_tests.student_id = s.id
    # INNER JOIN student_courses ON s.id = student_courses.student_id 
    # INNER JOIN courses ON courses.id = student_courses.course_id GROUP BY s.id, courses.title
    # ) AS savg GROUP BY savg.sid HAVING SUM( IF (savg.avg < 4,1,0) ) > 1
    # 
    ex5_result = StudentCourseTest.from("(#{StudentCourseTest.get_student_average_per_course.to_sql}) AS savg").group("savg.sid HAVING SUM( IF (savg.avg < 4,1,0) ) > 1").select("savg.*")

    binding.pry

  end

end
