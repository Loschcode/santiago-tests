
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table course_tests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_tests`;

CREATE TABLE `course_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_course_tests_on_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `course_tests` WRITE;
/*!40000 ALTER TABLE `course_tests` DISABLE KEYS */;

INSERT INTO `course_tests` (`id`, `course_id`, `title`, `created_at`, `updated_at`)
VALUES
	(1,1,'maths test','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(2,2,'biology test','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(3,3,'programación test','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(4,4,'programación test Vol.2','2016-04-04 07:57:26','2016-04-04 07:57:26');

/*!40000 ALTER TABLE `course_tests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table courses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_courses_on_teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;

INSERT INTO `courses` (`id`, `teacher_id`, `title`, `created_at`, `updated_at`)
VALUES
	(1,1,'maths','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(2,2,'biology','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(3,1,'programación','2016-04-04 07:57:26','2016-04-04 07:57:26');

/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student_course_tests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_course_tests`;

CREATE TABLE `student_course_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_test_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `grade` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_student_course_tests_on_course_test_id` (`course_test_id`),
  KEY `index_student_course_tests_on_student_id` (`student_id`),
  KEY `index_student_course_tests_on_grade` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `student_course_tests` WRITE;
/*!40000 ALTER TABLE `student_course_tests` DISABLE KEYS */;

INSERT INTO `student_course_tests` (`id`, `course_test_id`, `student_id`, `grade`, `created_at`, `updated_at`)
VALUES
	(1,1,1,2.2,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(2,2,2,4.2,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(3,3,3,6.2,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(4,1,1,2.2,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(5,2,2,2.2,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(6,3,3,6.2,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(7,1,1,6.8,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(8,2,2,2.9,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(9,3,3,4.2,'2016-04-04 07:57:26','2016-04-04 07:57:26');

/*!40000 ALTER TABLE `student_course_tests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student_courses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_courses`;

CREATE TABLE `student_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_student_courses_on_student_id` (`student_id`),
  KEY `index_student_courses_on_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `student_courses` WRITE;
/*!40000 ALTER TABLE `student_courses` DISABLE KEYS */;

INSERT INTO `student_courses` (`id`, `student_id`, `course_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(2,1,2,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(3,1,3,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(4,2,1,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(5,2,2,'2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(6,2,3,'2016-04-04 07:57:26','2016-04-04 07:57:26');

/*!40000 ALTER TABLE `student_courses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table students
# ------------------------------------------------------------

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;

INSERT INTO `students` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Laurent','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(2,'Peter','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(3,'Raoul','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(4,'Jack','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(5,'Frank','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(6,'Jeremy','2016-04-04 07:57:26','2016-04-04 07:57:26');

/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teachers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;

INSERT INTO `teachers` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Mister Raphael','2016-04-04 07:57:26','2016-04-04 07:57:26'),
	(2,'Miss Eva','2016-04-04 07:57:26','2016-04-04 07:57:26');

/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
