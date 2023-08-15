CREATE DATABASE sch;
USE sch;
--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255)  ,
  `email` VARCHAR(255)  ,
  `password` VARCHAR(255)  ,
  `level` INT  ,
  PRIMARY KEY (`admin_id`)
) ;
--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `student_id` INT  AUTO_INCREMENT,
  `name` VARCHAR(255)   ,
  `birthday` DATE ,
  `sex` VARCHAR(1)  ,
  `blood_group` VARCHAR(3) ,
  `address` longtext  ,
  `phone` INT ,
  `email` VARCHAR(255)  ,
  `password` VARCHAR(255)  ,
  `roll` INT  ,
  
 
  PRIMARY KEY (`student_id`)
)   ;
--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` int AUTO_INCREMENT,
  `name` VARCHAR(255)  ,
  `birthday` DATE ,
  `sex` VARCHAR(1)  ,
  `blood_group` VARCHAR(3)   ,
  `address` VARCHAR(255)  ,
  `phone` INT ,
  `email` VARCHAR(255)   ,
  `password` VARCHAR(255)  NOT NULL,
  PRIMARY KEY (`teacher_id`)
)  ;
--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `class_id` INT AUTO_INCREMENT,
  `name` VARCHAR(255) ,
  `Cteacher_id` INT ,
  PRIMARY KEY (`class_id`),
  FOREIGN KEY (`Cteacher_id`) REFERENCES `teacher`(`teacher_id`) ON DELETE SET NULL
)  ;
--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `book_id` INT AUTO_INCREMENT,
  `name` VARCHAR(255) ,
  `description` VARCHAR(255),
  `author` VARCHAR(255)  ,
  `class_id` INT  ,
  `status` VARCHAR(255),
  `price` VARCHAR(255) ,
  PRIMARY KEY (`book_id`),
  FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`) ON DELETE SET NULL
) ;
--
-- Table structure for table `parent`
--
CREATE TABLE IF NOT EXISTS `parent` (
  `parent_id` INT  AUTO_INCREMENT,
  `name` VARCHAR(255) ,
  `email` VARCHAR(255) ,
  `password` VARCHAR(255)  ,
  `student_id` INT ,
  `relation_with_student` VARCHAR(255),
  `phone` INT ,
  `address` VARCHAR(255) ,
  `profession` VARCHAR(255) ,
  PRIMARY KEY (`parent_id`),
  FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`) ON DELETE SET NULL
)  ;
--
-- Table structure for table `subject`
--
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_id` INT  AUTO_INCREMENT,
  `name` VARCHAR(255) ,
  `class_id` INT ,
  `teacher_id` INT ,
  PRIMARY KEY (`subject_id`),
  FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`) ON DELETE SET NULL,
  FOREIGN KEY (`teacher_id`) REFERENCES `teacher`(`teacher_id`) ON DELETE SET NULL
  
)  ;
--
-- Table structure for table `class_routine`
--

CREATE TABLE IF NOT EXISTS `class_routine` (
  `class_routine_id` INT  AUTO_INCREMENT,
  `class_id` INT ,
  `subject_id` INT ,
  `time_start` INT ,
  `time_end` INT ,
  `day` longtext ,
  PRIMARY KEY (`class_routine_id`),
   FOREIGN KEY (`subject_id`) REFERENCES `subject`(`subject_id`) ON DELETE SET NULL,
    FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`) ON DELETE SET NULL
  
  
);
--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `exam_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255)  ,
  `date` DATE ,
  `comment` longtext ,
  PRIMARY KEY (`exam_id`)
)  ;
--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `mark` (
  `mark_id` INT  AUTO_INCREMENT,
  `student_id` INT,
  `exam_id` INT ,
  `mark_obtained` INT DEFAULT '0',
  `mark_total` INT  DEFAULT '100',
  `comment` VARCHAR(255) ,
  PRIMARY KEY (`mark_id`),
  FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`) ON DELETE SET NULL,
    FOREIGN KEY (`exam_id`) REFERENCES `exam`(`exam_id`) ON DELETE SET NULL
  
)  ;
--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` INT AUTO_INCREMENT,
  `student_id` INT ,
  `title` VARCHAR(50) ,
  `description` VARCHAR(255)  ,
  `add_fee` INT,
  `security_fee` INT ,
  `tuition_fee` INT ,
  `annual_fee` INT ,
  `stationary_fee` INT,
  `multimedia_fee` INT ,
  `others` INT ,
  `amount` INT ,
  `creation_timestamp` TIMESTAMP,
  `due_date` date ,
  `payment_timestamp` TIMESTAMP ,
  `payment_method` VARCHAR(255) ,
  `payment_details` VARCHAR(255) ,
  `status` VARCHAR(255)   COMMENT 'paid or unpaid',
  PRIMARY KEY (`invoice_id`),
   FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`) ON DELETE SET NULL
  
)  ;








