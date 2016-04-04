# Highschool seeds
#
Student.create([

  { name: 'Laurent' }, 
  { name: 'Peter' }, 
  { name: 'Raoul' },
  { name: 'Jack' },
  { name: 'Frank' },
  { name: 'Jeremy' },

])

Teacher.create([

  { name: 'Mister Raphael'},
  { name: 'Miss Eva'}

])

Course.create([

  { title: 'programación', teacher_id: 1},
  { title: 'maths', teacher_id: 1},
  { title: 'biology', teacher_id: 2}

])

StudentCourse.create([

  { course_id: 1, student_id: 1},
  { course_id: 2, student_id: 1},
  { course_id: 3, student_id: 1},

  { course_id: 1, student_id: 2},
  { course_id: 2, student_id: 2},
  { course_id: 3, student_id: 2},

])

CourseTest.create([

  { course_id: 1, title: 'maths test'},
  { course_id: 2, title: 'biology test'},
  { course_id: 3, title: 'programación test'},
  { course_id: 4, title: 'programación test Vol.2'},

])

StudentCourseTest.create([

  { course_test_id: 1, student_id: 1, grade: 2.2},
  { course_test_id: 2, student_id: 2, grade: 4.2},
  { course_test_id: 3, student_id: 3, grade: 6.2},
  { course_test_id: 1, student_id: 1, grade: 2.2},
  { course_test_id: 2, student_id: 2, grade: 2.2},
  { course_test_id: 3, student_id: 3, grade: 6.2},
  { course_test_id: 1, student_id: 1, grade: 6.8},
  { course_test_id: 2, student_id: 2, grade: 2.9},
  { course_test_id: 3, student_id: 3, grade: 4.2},

])
