-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: university
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academics`
--

DROP TABLE IF EXISTS `academics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academics` (
  `id_academic` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de academico',
  `id_coordinator` int(11) NOT NULL COMMENT 'FK de coordinadores',
  `id_school` int(11) NOT NULL COMMENT 'FK de escuelas',
  `year_academic` int(11) NOT NULL COMMENT 'Año academico.',
  `period_academic` varchar(2) NOT NULL COMMENT 'Periodo del anio academico.',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion.',
  PRIMARY KEY (`id_academic`),
  KEY `id_coordinator` (`id_coordinator`),
  KEY `id_school` (`id_school`),
  CONSTRAINT `academics_ibfk_1` FOREIGN KEY (`id_coordinator`) REFERENCES `coordinators` (`id_coordinator`),
  CONSTRAINT `academics_ibfk_2` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics`
--

LOCK TABLES `academics` WRITE;
/*!40000 ALTER TABLE `academics` DISABLE KEYS */;
/*!40000 ALTER TABLE `academics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `id_assignment` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de asignacion',
  `id_academic` int(11) NOT NULL COMMENT 'FK de academico',
  `id_course` int(11) NOT NULL COMMENT 'FK de cursos',
  `id_teacher` int(11) NOT NULL COMMENT 'FK de profesor',
  `id_turn` int(11) NOT NULL COMMENT 'FK de shifts',
  `id_section` int(11) NOT NULL COMMENT 'FK de secciones',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion.',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion.',
  PRIMARY KEY (`id_assignment`),
  KEY `id_academic` (`id_academic`),
  KEY `id_course` (`id_course`),
  KEY `id_teacher` (`id_teacher`),
  KEY `id_turn` (`id_turn`),
  KEY `id_section` (`id_section`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`id_academic`) REFERENCES `academics` (`id_academic`),
  CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`),
  CONSTRAINT `assignments_ibfk_3` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_teacher`),
  CONSTRAINT `assignments_ibfk_4` FOREIGN KEY (`id_turn`) REFERENCES `shifts` (`id_turn`),
  CONSTRAINT `assignments_ibfk_5` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id_section`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinators`
--

DROP TABLE IF EXISTS `coordinators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinators` (
  `id_coordinator` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de coordinador',
  `id_school` int(11) NOT NULL COMMENT 'coordinators_FK_schools',
  `dni_coordinator` varchar(8) NOT NULL COMMENT 'DNI del coordinador',
  `name_coordinator` varchar(200) NOT NULL COMMENT 'Nombre del coordinador',
  `lastname_coordinator` varchar(200) NOT NULL COMMENT 'Apellidos del coordinador',
  `email_coordinator` varchar(200) NOT NULL COMMENT 'Correo del coordinador',
  `cellphone_coordinator` varchar(9) NOT NULL COMMENT 'Celular del coordinador',
  `status_coordinator` tinyint(1) DEFAULT '1' COMMENT 'Si el coordinador esta activo',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_coordinator`),
  KEY `id_school` (`id_school`),
  CONSTRAINT `coordinators_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinators`
--

LOCK TABLES `coordinators` WRITE;
/*!40000 ALTER TABLE `coordinators` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordinators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id_course` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de curso',
  `id_semester` int(11) NOT NULL COMMENT 'FK semestres',
  `id_type_course` int(11) NOT NULL COMMENT 'FK de tipos de curso',
  `name_course` varchar(50) NOT NULL COMMENT 'Nombre del curso',
  `credit_course` int(11) NOT NULL COMMENT 'Numero de creditos del curso',
  `hours_course` int(11) NOT NULL COMMENT 'Numero de horas del curso.',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion.',
  PRIMARY KEY (`id_course`),
  KEY `id_semester` (`id_semester`),
  KEY `id_type_course` (`id_type_course`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`id_semester`) REFERENCES `semesters` (`id_semester`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`id_type_course`) REFERENCES `types_courses` (`id_type_course`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deans`
--

DROP TABLE IF EXISTS `deans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deans` (
  `id_dean` int(11) NOT NULL COMMENT 'ID de decanos',
  `id_faculty` int(11) NOT NULL COMMENT 'FK de facultades',
  `name_dean` varchar(200) NOT NULL COMMENT 'Nombre del decano.',
  `lastname_dean` varchar(200) NOT NULL COMMENT 'Apellido del decano.',
  `email_dean` varchar(200) NOT NULL COMMENT 'Correo del decano.',
  `cellphone_dean` varchar(9) NOT NULL COMMENT 'Celular del decano',
  `status_dean` tinyint(1) DEFAULT '1' COMMENT 'Si el decano esta activo',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion.',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion.',
  PRIMARY KEY (`id_dean`),
  KEY `id_faculty` (`id_faculty`),
  CONSTRAINT `deans_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `faculties` (`id_faculty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deans`
--

LOCK TABLES `deans` WRITE;
/*!40000 ALTER TABLE `deans` DISABLE KEYS */;
/*!40000 ALTER TABLE `deans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id_department` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de departamento',
  `id_faculty` int(11) NOT NULL COMMENT 'FK de facultades',
  `name_department` varchar(200) NOT NULL COMMENT 'Nombre del departamento.',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_department`),
  KEY `id_faculty` (`id_faculty`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `faculties` (`id_faculty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors` (
  `id_director` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de Director',
  `id_department` int(11) NOT NULL COMMENT 'FK departamentos',
  `dni_director` varchar(8) NOT NULL COMMENT 'DNI del director',
  `name_director` varchar(200) NOT NULL COMMENT 'Nombre del director',
  `lastname_director` varchar(200) NOT NULL COMMENT 'Apellidos del director',
  `email_director` varchar(200) NOT NULL COMMENT 'Correo del director.',
  `cellphone_director` varchar(9) NOT NULL COMMENT 'Celular del director.',
  `status_director` tinyint(1) DEFAULT '1' COMMENT 'Si esta activo el director',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_director`),
  KEY `id_department` (`id_department`),
  CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculties` (
  `id_faculty` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la facultad',
  `id_university` int(11) NOT NULL COMMENT 'FK de universidades',
  `name_faculty` varchar(200) NOT NULL COMMENT 'Nombre de la facultad',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion.',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion.',
  PRIMARY KEY (`id_faculty`),
  KEY `id_university` (`id_university`),
  CONSTRAINT `faculties_ibfk_1` FOREIGN KEY (`id_university`) REFERENCES `universities` (`id_university`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rectors`
--

DROP TABLE IF EXISTS `rectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rectors` (
  `id_rector` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de Rectores',
  `dni_rector` varchar(8) NOT NULL COMMENT 'DNI del Rector',
  `id_university` int(11) NOT NULL COMMENT 'FK de universidades',
  `name_rector` varchar(200) NOT NULL COMMENT 'Nombre del Rector',
  `lastname_rector` varchar(200) NOT NULL COMMENT 'Apellidos del Rector',
  `email_rector` varchar(200) NOT NULL COMMENT 'Correo del rector.',
  `cellphone_rector` varchar(9) NOT NULL COMMENT 'Celular del rector.',
  `status_rector` tinyint(1) DEFAULT '1' COMMENT 'Si esta activo el rector',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_rector`),
  KEY `id_university` (`id_university`),
  CONSTRAINT `rectors_ibfk_1` FOREIGN KEY (`id_university`) REFERENCES `universities` (`id_university`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rectors`
--

LOCK TABLES `rectors` WRITE;
/*!40000 ALTER TABLE `rectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `rectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id_school` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de escuelas',
  `id_department` int(11) NOT NULL COMMENT 'FK de departamentos',
  `name_school` varchar(200) NOT NULL COMMENT 'Nombre de la escuela',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_school`),
  KEY `id_department` (`id_department`),
  CONSTRAINT `schools_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id_section` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de seccion',
  `group_section` varchar(10) NOT NULL COMMENT 'Numero de grupo ',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_section`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters` (
  `id_semester` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codico unico del semestre',
  `id_study_plan` int(11) NOT NULL COMMENT 'FK de plan de estudios',
  `number_semester` int(11) NOT NULL COMMENT 'Numero de semestre',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion.',
  PRIMARY KEY (`id_semester`),
  KEY `id_study_plan` (`id_study_plan`),
  CONSTRAINT `semesters_ibfk_1` FOREIGN KEY (`id_study_plan`) REFERENCES `study_plans` (`id_study_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shifts` (
  `id_turn` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del turno',
  `description_turn` varchar(45) NOT NULL COMMENT 'Descripccion del turno si toca por la mañana o tarde',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_turn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de estudiantes',
  `id_school` int(11) NOT NULL COMMENT 'FK de escuelas',
  `dni_student` varchar(8) NOT NULL COMMENT 'DNI del estudiante',
  `name_student` varchar(200) NOT NULL COMMENT 'Nombre del estudiante',
  `lastname_student` varchar(200) NOT NULL COMMENT 'Apellidos del estudiante',
  `email_student` varchar(200) NOT NULL COMMENT 'Correo del estudiante',
  `address_student` varchar(200) NOT NULL COMMENT 'Direccion del estudiante',
  `birthdate_student` datetime NOT NULL COMMENT 'Cumpleaños del estudiante',
  `cellphone_student` varchar(9) NOT NULL COMMENT 'Celular del estudiante',
  `status_student` tinyint(1) DEFAULT '1' COMMENT 'Si el estudiante esta activo',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_student`),
  KEY `id_school` (`id_school`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_plans`
--

DROP TABLE IF EXISTS `study_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_plans` (
  `id_study_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de planes de estudios',
  `id_school` int(11) NOT NULL COMMENT 'FK de escuelas',
  `year_study_plan` int(11) NOT NULL COMMENT 'Año del plan de estudio.',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_study_plan`),
  KEY `id_school` (`id_school`),
  CONSTRAINT `study_plans_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plans`
--

LOCK TABLES `study_plans` WRITE;
/*!40000 ALTER TABLE `study_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id_teacher` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de profesor',
  `dni_teacher` varchar(8) NOT NULL COMMENT 'DNI del profesor',
  `name_teacher` varchar(200) NOT NULL COMMENT 'Nombre del profesor',
  `lastname_teacher` varchar(200) NOT NULL COMMENT 'Apellidos del profesor',
  `email_teacher` varchar(200) NOT NULL COMMENT 'Correo del profesor',
  `cellphone_teacher` varchar(9) NOT NULL COMMENT 'Celular del profesor',
  `status_teacher` tinyint(1) DEFAULT '1' COMMENT 'Si el profesor esta activo',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_teacher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_courses`
--

DROP TABLE IF EXISTS `types_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_courses` (
  `id_type_course` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de tipos de cursos.',
  `description_type_course` varchar(50) NOT NULL COMMENT 'Descripcion del tipo de curso.',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_type_course`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_courses`
--

LOCK TABLES `types_courses` WRITE;
/*!40000 ALTER TABLE `types_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `types_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universities`
--

DROP TABLE IF EXISTS `universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universities` (
  `id_university` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de universidad',
  `ruc_university` varchar(200) NOT NULL COMMENT 'RUC de universidad',
  `name_university` varchar(200) NOT NULL COMMENT 'Nombre de la Universidad',
  `address_university` varchar(200) NOT NULL COMMENT 'Direccion de la universidad',
  `phone_university` varchar(10) NOT NULL COMMENT 'Telefono fijo de la universidad.',
  `cellphone_university` varchar(9) NOT NULL COMMENT 'Celular de la universidad',
  `domain_university` varchar(200) NOT NULL COMMENT 'Dominio web de la universidad.',
  `created` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modified` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id_university`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-27 21:04:42
