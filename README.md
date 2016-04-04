# Programación

>1.­ Escriba una función/método que determine la cantidad de 0’s a la derecha de n! (factorial)

Please check `ruby/app/lib/factorial`

>2.­ Escriba una función/método que dado un número entero, entregue su representación en palabras, Ej. 145 ­> “ciento cuarenta y cinco”

Please check `ruby/app/lib/letters`

>3.­ Considere un tablero de ajedrez de NxN, realice un algoritmo que visite cada espacio del tablero, usando solamente los movimientos de un caballo. (Puntos extras si se visita cada espacio una sola vez)

Please check `ruby/app/lib/knight_tour`

# Modelo de datos

>1.­ Un colegio necesita un sistema para administrar sus cursos. El sistema tiene que suportar que se le ingresen varios cursos. Cada curso tendrá un profesor a cargo y una serie de alumnos inscritos. Cada profesor, así como cada alumno puede estar en más de un curso.  Además cada curso tendrá una cantidad no determinada de pruebas, y el sistema debe permitir ingresar la nota para cada alumno en cada prueba. Todas las pruebas valen lo mismo. Escriba a continuación las tablas que utilizaría para resolver este problema con los campos y llaves de éstas. Intente hacer el sistema lo más robusto posible, pero sin incluir datos adicionales a los que se plantean acá.

Please check `database` to see a workbench for the structure schema and a SQL dump

>2.­ Escriba un Query que entregue la lista de  alumnos para el curso “programación”.

```
SELECT s.* FROM students AS s
INNER JOIN student_courses AS sc ON s.id = sc.student_id
INNER JOIN courses AS c ON sc.`course_id` = c.id
WHERE c.title = "programación"
```

>3.­ Escriba un Query que calcule el promedio de notas de un alumno en un
curso.

```
SELECT AVG(student_course_tests.grade) FROM student_course_tests
INNER JOIN students AS s ON student_course_tests.student_id = s.id
INNER JOIN course_tests AS ct ON student_course_tests.course_test_id = ct.id
INNER JOIN courses AS c ON ct.course_id = c.id
WHERE c.title = "programación" AND s.name = "Laurent"
```

>4.­ Escriba un Query que entregue a los alumnos y el promedio que tiene en cada ramo.

```
SELECT AVG(student_course_tests.grade) AS average, s.*, courses.title FROM student_course_tests

INNER JOIN students AS s ON student_course_tests.student_id = s.id
INNER JOIN student_courses ON s.id = student_courses.student_id 
INNER JOIN courses ON courses.id = student_courses.course_id GROUP BY s.id, courses.title
```

>5.­ Escriba un Query que lista a todos los alumnos con más de un ramo conpromedio rojo.

*NOTE : I had to ask around about the Chilean grade system (below 4.0/7 is "promedio rojo") to make this as accurate as possible for the test.*

```
SELECT savg.*
FROM (

SELECT AVG(student_course_tests.grade) AS avg, s.id AS sid, s.name, courses.title FROM student_course_tests

INNER JOIN students AS s ON student_course_tests.student_id = s.id
INNER JOIN student_courses ON s.id = student_courses.student_id 
INNER JOIN courses ON courses.id = student_courses.course_id GROUP BY s.id, courses.title

) AS savg GROUP BY savg.sid HAVING SUM( IF (savg.avg < 4,1,0) ) > 1
```

>6.­ Se tiene una tabla con información de jugadores de tenis: PLAYERS(Nombre, Pais, Ranking). Suponga que Ranking es un número de 1 a 100 que es distinto para cada jugador. Si la tabla en un momento dado tiene solo 20 tuplas, indique cuantas tuplas tiene la tabla que resulta de la siguiente consulta: SELECT c1.Nombre, c2.Nombre FROM PLAYERS c1, PLAYERS c2 WHERE c1.Ranking > c2.Ranking : a) 400 b) 190 c) 20 d) imposible saberlo

If we consider only 20 instances the first result would be 19, then 18 and successively because we are facing a ">" and not a ">=" on the same set of data. This goes again until 0 which would result as ((n-1)*n)/2 = 190.

# Diseño

>1.­  Si usted estuviera resolviendo el problema del colegio con
programación orientada a objetos, defina que clases usaría, métodos y las
variables de estas clases. Puede utilizar el lenguaje que más le acomode
o bien pseudos código.

Please check the `database/highschool` ; it's a Rails application containing all the SQL request in the ActiveRecord way. You must do `rake db:migrate` followed by a `rake db:seed` to try it out. The models tests are in `database/highschool/app/controllers/home_controller.rb`

>2.­ Diseñe un mazo de cartas (orientado a objetos) con propiedades y métodos básicos que considere para ser utilizado en distintas aplicaciones que utilicen cartas.

Please check `ruby/app/lib/card_game`.

NOTE : This exercise was BY FAR the greatest to do for me.

>3. Diseño código frontend

Please check `front`

# Big note

I encapsulated the `ruby` part in a general scope so you can launch exercises and change what's executed by doing a `ruby runner.rb` in the folder ; `binding.pry` is available too for testing purpose. The different exercises should be usable in standalone :)

General TDD has been done for the whole `ruby` section despite the instructions weren't clear on the fact i should do it or not. They stay very general. Just run `rpsec` in the folder `ruby` to run them all.

_<48 hours were honestly short to do so many exercises properly. I hope it's taken into consideration ; I had to do it all straight ..._