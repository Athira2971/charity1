/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - chaarity
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chaarity` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `chaarity`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add category',7,'add_category'),
(26,'Can change category',7,'change_category'),
(27,'Can delete category',7,'delete_category'),
(28,'Can view category',7,'view_category'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add organizer',9,'add_organizer'),
(34,'Can change organizer',9,'change_organizer'),
(35,'Can delete organizer',9,'delete_organizer'),
(36,'Can view organizer',9,'view_organizer'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add review',11,'add_review'),
(42,'Can change review',11,'change_review'),
(43,'Can delete review',11,'delete_review'),
(44,'Can view review',11,'view_review'),
(45,'Can add request',12,'add_request'),
(46,'Can change request',12,'change_request'),
(47,'Can delete request',12,'delete_request'),
(48,'Can view request',12,'view_request'),
(49,'Can add other donation',13,'add_otherdonation'),
(50,'Can change other donation',13,'change_otherdonation'),
(51,'Can delete other donation',13,'delete_otherdonation'),
(52,'Can view other donation',13,'view_otherdonation'),
(53,'Can add feedback',14,'add_feedback'),
(54,'Can change feedback',14,'change_feedback'),
(55,'Can delete feedback',14,'delete_feedback'),
(56,'Can view feedback',14,'view_feedback'),
(57,'Can add donation',15,'add_donation'),
(58,'Can change donation',15,'change_donation'),
(59,'Can delete donation',15,'delete_donation'),
(60,'Can view donation',15,'view_donation'),
(61,'Can add complaint',16,'add_complaint'),
(62,'Can change complaint',16,'change_complaint'),
(63,'Can delete complaint',16,'delete_complaint'),
(64,'Can view complaint',16,'view_complaint');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'myapp','category'),
(16,'myapp','complaint'),
(15,'myapp','donation'),
(14,'myapp','feedback'),
(8,'myapp','login'),
(9,'myapp','organizer'),
(13,'myapp','otherdonation'),
(12,'myapp','request'),
(11,'myapp','review'),
(10,'myapp','user'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-11-05 05:17:56.917020'),
(2,'auth','0001_initial','2024-11-05 05:17:57.076253'),
(3,'admin','0001_initial','2024-11-05 05:17:57.488831'),
(4,'admin','0002_logentry_remove_auto_add','2024-11-05 05:17:57.598995'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-11-05 05:17:57.614653'),
(6,'contenttypes','0002_remove_content_type_name','2024-11-05 05:17:57.693322'),
(7,'auth','0002_alter_permission_name_max_length','2024-11-05 05:17:57.749062'),
(8,'auth','0003_alter_user_email_max_length','2024-11-05 05:17:57.783072'),
(9,'auth','0004_alter_user_username_opts','2024-11-05 05:17:57.790119'),
(10,'auth','0005_alter_user_last_login_null','2024-11-05 05:17:57.831264'),
(11,'auth','0006_require_contenttypes_0002','2024-11-05 05:17:57.836461'),
(12,'auth','0007_alter_validators_add_error_messages','2024-11-05 05:17:57.836461'),
(13,'auth','0008_alter_user_username_max_length','2024-11-05 05:17:57.898899'),
(14,'auth','0009_alter_user_last_name_max_length','2024-11-05 05:17:57.945951'),
(15,'auth','0010_alter_group_name_max_length','2024-11-05 05:17:58.003356'),
(16,'auth','0011_update_proxy_permissions','2024-11-05 05:17:58.008771'),
(17,'myapp','0001_initial','2024-11-05 05:17:58.391151'),
(18,'sessions','0001_initial','2024-11-05 05:17:58.801869'),
(19,'myapp','0002_auto_20241106_1034','2024-11-06 05:05:11.513027'),
(20,'myapp','0003_auto_20241106_1041','2024-11-06 05:11:06.370721');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('1aoqie79w6bnk2m9sfr6xcd8pn6r2wb5','ZTU2YTA1ZTM0NTVhY2RlODI0NmZiMjIxOTQwOTQ3NjI3ZGQzMzhlODp7ImxpZCI6OH0=','2024-11-26 15:01:56.935317'),
('97vrhbft30d9cp0cqsnvg7yqknz08te3','ZTYzMTU5NDg2Nzg3NjdmNzM5ZWU4YjU0OTBkYjRlZGRmOTA4Y2ZmZjp7ImxpZCI6OX0=','2024-11-24 14:20:37.774678'),
('bmdacvjtoor3bk8ebme7aejcez6cwgd3','ZTYzMTU5NDg2Nzg3NjdmNzM5ZWU4YjU0OTBkYjRlZGRmOTA4Y2ZmZjp7ImxpZCI6OX0=','2024-11-24 13:25:08.236042'),
('f7hmterd70jm36mko0h6j2jpl5f1pe0s','M2I3NjNlZTk2NjJhOTk5ODUzNzY2NDYwYmNiYmQ3Mjc5MjFlZjBlMDp7ImxpZCI6Mn0=','2024-11-16 08:52:01.396816'),
('fnhp7qqm7umorqi2ioa5bfvxc6fihi4d','ZTYzMTU5NDg2Nzg3NjdmNzM5ZWU4YjU0OTBkYjRlZGRmOTA4Y2ZmZjp7ImxpZCI6OX0=','2024-11-23 14:56:49.559356'),
('ki4177petw0zdylxnw0zm6wbq49xw7mc','ZjhjNDc2MTdjMTZiNzQ5NjlmYWY0NzFjOTUzODA0ODcxODdkMDZkODp7ImxpZCI6NH0=','2024-11-21 15:56:23.293876'),
('o5no4pt09s43hlqzorqy0d6fpkkvd1kf','ZTYzMTU5NDg2Nzg3NjdmNzM5ZWU4YjU0OTBkYjRlZGRmOTA4Y2ZmZjp7ImxpZCI6OX0=','2024-11-24 14:37:38.210954'),
('qkeueinqtt5avonw6kobcrzhl7k52fvw','ZTYzMTU5NDg2Nzg3NjdmNzM5ZWU4YjU0OTBkYjRlZGRmOTA4Y2ZmZjp7ImxpZCI6OX0=','2024-11-24 13:17:00.866760'),
('s8lbxsy6kd8pz0he2g25ys4crsp49jvq','ZTYzMTU5NDg2Nzg3NjdmNzM5ZWU4YjU0OTBkYjRlZGRmOTA4Y2ZmZjp7ImxpZCI6OX0=','2024-11-24 14:22:48.844090'),
('ty8z8hlah9zn4330tdvg0e1je6htk1pp','ZTYzMTU5NDg2Nzg3NjdmNzM5ZWU4YjU0OTBkYjRlZGRmOTA4Y2ZmZjp7ImxpZCI6OX0=','2024-11-21 16:34:33.370557'),
('uer9mt7j212c35w1fhkt84x6cun4kvlu','ZjI0MDM0NGM1NTdmOGYyYTczODVmOTMyZTZlNzA2NzY3YTQ4Y2RmNjp7ImxpZCI6NX0=','2024-11-14 15:18:12.367883'),
('ukbqeotjuriwdq0czmn7ub2bebqh9bpd','ZTYzMTU5NDg2Nzg3NjdmNzM5ZWU4YjU0OTBkYjRlZGRmOTA4Y2ZmZjp7ImxpZCI6OX0=','2024-11-24 13:59:18.877412'),
('v4gx73b11h4u6urd32mwdmdkdxtmtpvx','ZTU2YTA1ZTM0NTVhY2RlODI0NmZiMjIxOTQwOTQ3NjI3ZGQzMzhlODp7ImxpZCI6OH0=','2024-11-26 15:28:24.541468'),
('w75wqu3uo5uytkeaovuivx7x1t8shxcy','ZTYzMTU5NDg2Nzg3NjdmNzM5ZWU4YjU0OTBkYjRlZGRmOTA4Y2ZmZjp7ImxpZCI6OX0=','2024-11-23 14:58:14.845634');

/*Table structure for table `myapp_category` */

DROP TABLE IF EXISTS `myapp_category`;

CREATE TABLE `myapp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `ORGANIZER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_category_ORGANIZER_id_3df9b6eb_fk_myapp_organizer_id` (`ORGANIZER_id`),
  CONSTRAINT `myapp_category_ORGANIZER_id_3df9b6eb_fk_myapp_organizer_id` FOREIGN KEY (`ORGANIZER_id`) REFERENCES `myapp_organizer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_category` */

insert  into `myapp_category`(`id`,`Name`,`ORGANIZER_id`) values 
(1,'amount',2),
(2,'DRESS',2),
(4,'HOUSE',2),
(6,'Paliative',2),
(7,'ppp',2),
(8,'fund',2);

/*Table structure for table `myapp_complaint` */

DROP TABLE IF EXISTS `myapp_complaint`;

CREATE TABLE `myapp_complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Complaint` varchar(30) NOT NULL,
  `Reply` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Status` varchar(30) NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_complaint_USER_id_21ed0b20_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_complaint_USER_id_21ed0b20_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_complaint` */

insert  into `myapp_complaint`(`id`,`Complaint`,`Reply`,`Date`,`Status`,`USER_id`) values 
(6,'not good','oky','2024-11-06','Replied',2),
(7,'oooo','lll','2024-11-06','Replied',2),
(9,'notgood','okeyyyy','2024-11-07','Replied',2),
(10,'very bad','sorry','2024-11-07','Replied',2),
(11,'qwerty','Pending','2024-11-12','Pending',2);

/*Table structure for table `myapp_donation` */

DROP TABLE IF EXISTS `myapp_donation`;

CREATE TABLE `myapp_donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` bigint(20) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `CATEGORY_id` int(11) NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_donation_CATEGORY_id_a5d76f63_fk_myapp_category_id` (`CATEGORY_id`),
  KEY `myapp_donation_USER_id_ca4c213b_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_donation_USER_id_ca4c213b_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`),
  CONSTRAINT `myapp_donation_CATEGORY_id_a5d76f63_fk_myapp_category_id` FOREIGN KEY (`CATEGORY_id`) REFERENCES `myapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_donation` */

insert  into `myapp_donation`(`id`,`Date`,`Amount`,`Status`,`CATEGORY_id`,`USER_id`) values 
(9,'2024-11-06',50000,'Paid',1,2),
(10,'2024-11-06',400000,'Paid',6,2),
(11,'2024-11-07',50000,'Paid',8,2);

/*Table structure for table `myapp_feedback` */

DROP TABLE IF EXISTS `myapp_feedback`;

CREATE TABLE `myapp_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Feedback` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_USER_id_fce7ccff_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_feedback_USER_id_fce7ccff_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_feedback` */

insert  into `myapp_feedback`(`id`,`Feedback`,`Date`,`USER_id`) values 
(4,'niceee','2024-11-07',2);

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(25) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`Username`,`Password`,`Type`) values 
(4,'aparna','1000','organizer'),
(6,'athika','5555','organizer'),
(8,'athira','3000','user'),
(9,'Eva','4613','admin'),
(10,'kathal','A123456b','organizer');

/*Table structure for table `myapp_organizer` */

DROP TABLE IF EXISTS `myapp_organizer`;

CREATE TABLE `myapp_organizer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Image` varchar(300) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Place` varchar(25) NOT NULL,
  `District` varchar(25) NOT NULL,
  `Post` varchar(25) NOT NULL,
  `Pin` int(11) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Status` varchar(25) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_organizer_LOGIN_id_f5805d13_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_organizer_LOGIN_id_f5805d13_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_organizer` */

insert  into `myapp_organizer`(`id`,`Image`,`Name`,`Place`,`District`,`Post`,`Pin`,`PhoneNumber`,`Status`,`LOGIN_id`) values 
(2,'/MEDIA/20241107210426.jpg','aparna','ryuiio','tytyuu','hjiu',54565,165465,'Approved',4),
(3,'/MEDIA/241101-120624.jpg','athika','tanur','malappuram','tanur',676103,2147483647,'Rejected',6),
(5,'/MEDIA/241111-121501.jpg','kathal','tirur','kozhikode','iringavoor',456311,2147483647,'',10);

/*Table structure for table `myapp_otherdonation` */

DROP TABLE IF EXISTS `myapp_otherdonation`;

CREATE TABLE `myapp_otherdonation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Other` varchar(30) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `CATEGORY_id` int(11) NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_otherdonation_CATEGORY_id_1d6304d9_fk_myapp_category_id` (`CATEGORY_id`),
  KEY `myapp_otherdonation_USER_id_60fa1670_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_otherdonation_USER_id_60fa1670_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`),
  CONSTRAINT `myapp_otherdonation_CATEGORY_id_1d6304d9_fk_myapp_category_id` FOREIGN KEY (`CATEGORY_id`) REFERENCES `myapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_otherdonation` */

insert  into `myapp_otherdonation`(`id`,`Date`,`Other`,`Status`,`CATEGORY_id`,`USER_id`) values 
(9,'2024-11-06','20000','Paid',2,2),
(10,'2024-11-06','','Paid',2,2),
(11,'2024-11-06','900000','Paid',2,2),
(12,'2024-11-07','400000','Paid',8,2);

/*Table structure for table `myapp_request` */

DROP TABLE IF EXISTS `myapp_request`;

CREATE TABLE `myapp_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Purpose` varchar(30) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `FileName` varchar(300) NOT NULL,
  `Donations` varchar(50) NOT NULL,
  `NeedDate` date NOT NULL,
  `Status` varchar(25) NOT NULL,
  `ORGANIZER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_request_ORGANIZER_id_18ba5242_fk_myapp_organizer_id` (`ORGANIZER_id`),
  CONSTRAINT `myapp_request_ORGANIZER_id_18ba5242_fk_myapp_organizer_id` FOREIGN KEY (`ORGANIZER_id`) REFERENCES `myapp_organizer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_request` */

insert  into `myapp_request`(`id`,`Date`,`Purpose`,`Description`,`FileName`,`Donations`,`NeedDate`,`Status`,`ORGANIZER_id`) values 
(3,'2024-10-02','erfg','ererer','aaaa','vvvv','2024-10-19','Rejected',2),
(5,'2024-11-06','rwtdyfu','okl','hi8','vhgi','2024-11-13','Approved',2),
(7,'2024-11-01','charity','donation','paliative care','Amount','2024-11-16','Rejected',2);

/*Table structure for table `myapp_review` */

DROP TABLE IF EXISTS `myapp_review`;

CREATE TABLE `myapp_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Review` varchar(25) NOT NULL,
  `Rating` varchar(25) NOT NULL,
  `Date` date NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_review_USER_id_0e923f15_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_review_USER_id_0e923f15_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_review` */

insert  into `myapp_review`(`id`,`Review`,`Rating`,`Date`,`USER_id`) values 
(2,'jgfchjgv','3','2024-11-07',2),
(3,'goog','3','2024-11-07',2),
(4,'good','4','2024-11-07',2),
(5,'nice','2','2024-11-12',2);

/*Table structure for table `myapp_user` */

DROP TABLE IF EXISTS `myapp_user`;

CREATE TABLE `myapp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Dob` date NOT NULL,
  `Place` varchar(30) NOT NULL,
  `District` varchar(30) NOT NULL,
  `Post` varchar(25) NOT NULL,
  `Pin` int(11) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Image` varchar(300) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_user` */

insert  into `myapp_user`(`id`,`Name`,`Dob`,`Place`,`District`,`Post`,`Pin`,`PhoneNumber`,`Image`,`LOGIN_id`) values 
(2,'athira','2024-11-22','tanur','malappuram','tanur',676103,2147483647,'/MEDIA/20241112203359.jpg',8);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
