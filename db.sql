/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - jiaxiaoyuyuexuexixitong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jiaxiaoyuyuexuexixitong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jiaxiaoyuyuexuexixitong`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','upload/config1.jpg'),(2,'轮播图2','upload/config2.jpg'),(3,'轮播图3','upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'sex_types','性别类型',1,'男',NULL,NULL,'2023-04-18 13:49:07'),(2,'sex_types','性别类型',2,'女',NULL,NULL,'2023-04-18 13:49:07'),(3,'gonggao_types','公告类型',1,'公告类型1',NULL,NULL,'2023-04-18 13:49:07'),(4,'gonggao_types','公告类型',2,'公告类型2',NULL,NULL,'2023-04-18 13:49:07'),(5,'ziliao_types','学习资料类型',1,'学习资料类型1',NULL,NULL,'2023-04-18 13:49:07'),(6,'ziliao_types','学习资料类型',2,'学习资料类型2',NULL,NULL,'2023-04-18 13:49:07'),(7,'ziliao_types','学习资料类型',3,'学习资料类型3',NULL,NULL,'2023-04-18 13:49:07'),(8,'ziliao_types','学习资料类型',4,'学习资料类型4',NULL,NULL,'2023-04-18 13:49:07'),(9,'ziliao_collection_types','收藏表类型',1,'收藏',NULL,NULL,'2023-04-18 13:49:07'),(10,'ziliao_collection_types','收藏表类型',2,'赞',NULL,NULL,'2023-04-18 13:49:07'),(11,'ziliao_collection_types','收藏表类型',3,'踩',NULL,NULL,'2023-04-18 13:49:07'),(12,'jiaolian_yuyue_yesno_types','报名状态',1,'待审核',NULL,NULL,'2023-04-18 13:49:08'),(13,'jiaolian_yuyue_yesno_types','报名状态',2,'同意',NULL,NULL,'2023-04-18 13:49:08'),(14,'jiaolian_yuyue_yesno_types','报名状态',3,'拒绝',NULL,NULL,'2023-04-18 13:49:08'),(15,'zujuan_types','组卷方式',1,'自动组卷',NULL,NULL,'2023-04-18 13:49:08'),(16,'zujuan_types','组卷方式',2,'手动组卷',NULL,NULL,'2023-04-18 13:49:08'),(17,'kemu_types','科目',1,'语文',NULL,NULL,'2023-04-18 13:49:08'),(18,'kemu_types','科目',2,'数学',NULL,NULL,'2023-04-18 13:49:08'),(19,'exampaper_types','试卷状态',1,'启用',NULL,NULL,'2023-04-18 13:49:08'),(20,'exampaper_types','试卷状态',2,'禁用',NULL,NULL,'2023-04-18 13:49:08'),(21,'examquestion_types','试题类型',1,'单选题',NULL,NULL,'2023-04-18 13:49:08'),(22,'examquestion_types','试题类型',2,'多选题',NULL,NULL,'2023-04-18 13:49:08'),(23,'examquestion_types','试题类型',3,'判断题',NULL,NULL,'2023-04-18 13:49:08'),(24,'examquestion_types','试题类型',4,'填空题',NULL,NULL,'2023-04-18 13:49:08');

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '试卷名称 Search111',
  `exampaper_date` int(11) DEFAULT NULL COMMENT '考试时长(分钟)',
  `exampaper_myscore` int(20) NOT NULL DEFAULT '0' COMMENT '试卷总分数',
  `kemu_types` int(11) DEFAULT NULL COMMENT '科目 Search111',
  `exampaper_types` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态 Search111',
  `zujuan_types` int(11) DEFAULT NULL COMMENT '组卷方式',
  `exampaper_delete` int(255) DEFAULT '0' COMMENT '逻辑删除（1代表未删除 2代表已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='试卷';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`exampaper_name`,`exampaper_date`,`exampaper_myscore`,`kemu_types`,`exampaper_types`,`zujuan_types`,`exampaper_delete`,`create_time`) values (1,'测试试卷1',60,100,2,1,2,1,'2023-04-18 13:49:08'),(2,'测试试卷2',180,100,2,1,1,1,'2023-04-18 13:49:08');

/*Table structure for table `exampapertopic` */

DROP TABLE IF EXISTS `exampapertopic`;

CREATE TABLE `exampapertopic` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int(20) NOT NULL COMMENT '试卷',
  `examquestion_id` int(20) NOT NULL COMMENT '试题',
  `exampapertopic_number` int(20) NOT NULL COMMENT '试题分数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='试卷选题';

/*Data for the table `exampapertopic` */

insert  into `exampapertopic`(`id`,`exampaper_id`,`examquestion_id`,`exampapertopic_number`,`create_time`) values (7,1,5,10,'2023-04-18 13:49:08'),(8,1,4,10,'2023-04-18 13:49:08'),(9,1,6,70,'2023-04-18 13:49:08'),(18,2,5,15,'2023-04-18 13:49:08'),(19,2,11,15,'2023-04-18 13:49:08'),(20,2,9,15,'2023-04-18 13:49:08'),(21,2,1,15,'2023-04-18 13:49:08'),(22,2,10,20,'2023-04-18 13:49:08'),(23,2,3,20,'2023-04-18 13:49:08'),(31,1,7,10,'2023-04-18 13:49:08'),(33,1,9,0,'2023-04-18 13:49:08'),(34,1,12,0,'2023-04-18 13:49:08');

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examquestion_name` varchar(200) DEFAULT NULL COMMENT '试题名称 Search111',
  `kemu_types` int(11) DEFAULT NULL COMMENT '科目 Search111',
  `examquestion_options` longtext COMMENT '选项，json字符串',
  `examquestion_answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `examquestion_analysis` longtext COMMENT '答案解析',
  `examquestion_types` int(20) DEFAULT '0' COMMENT '试题类型 Search111',
  `examquestion_sequence` int(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`examquestion_name`,`kemu_types`,`examquestion_options`,`examquestion_answer`,`examquestion_analysis`,`examquestion_types`,`examquestion_sequence`,`create_time`) values (1,'1-1=1',2,'[{\"text\":\"对\",\"code\":\"A\"},{\"text\":\"错\",\"code\":\"B\"}]','B','1-1=0',3,1,'2023-04-18 13:49:08'),(2,'1+1=？',2,'[{\"text\":\"1\",\"code\":\"A\"},{\"text\":\"2\",\"code\":\"B\"},{\"text\":\"3\",\"code\":\"C\"},{\"text\":\"4\",\"code\":\"D\"}]','B','1+1=2',1,2,'2023-04-18 13:49:08'),(3,'1+1-1=?',2,'[]','1','1+1-1=1',4,3,'2023-04-18 13:49:08'),(4,'2+2=?',2,'[]','4','2+2=4',4,4,'2023-04-18 13:49:08'),(5,'1-1-1+6=?',2,'[{\"text\":\"4\",\"code\":\"A\"},{\"text\":\"5\",\"code\":\"B\"},{\"text\":\"6\",\"code\":\"C\"},{\"text\":\"3\",\"code\":\"D\"}]','B','1-1-1+6=5',1,5,'2023-04-18 13:49:08'),(6,'3+3=9',2,'[{\"text\":\"对\",\"code\":\"A\"},{\"text\":\"错\",\"code\":\"B\"}]','B','3+3=6',3,6,'2023-04-18 13:49:08'),(7,'试题名称1',2,'[{\"text\":\"内容1\",\"code\":\"A\"},{\"text\":\"内容2\",\"code\":\"B\"},{\"text\":\"内容3\",\"code\":\"C\"},{\"text\":\"内容4\",\"code\":\"D\"}]','A,B,C','答案解析1',2,7,'2023-04-18 13:49:08'),(8,'试题名称2',2,'[]','正确答案2','答案解析2',4,8,'2023-04-18 13:49:08'),(9,'试题名称3',2,'[{\"text\":\"对\",\"code\":\"A\"},{\"text\":\"错\",\"code\":\"B\"}]','A','答案解析3',3,9,'2023-04-18 13:49:08'),(10,'试题名称4',2,'[]','正确答案4','答案解析4',4,10,'2023-04-18 13:49:08'),(11,'试题名称5',2,'[{\"text\":\"内容1\",\"code\":\"A\"},{\"text\":\"内容2\",\"code\":\"B\"},{\"text\":\"内容3\",\"code\":\"C\"},{\"text\":\"内容4\",\"code\":\"D\"}]','B','答案解析5',1,11,'2023-04-18 13:49:08'),(12,'试题名称6',2,'[{\"text\":\"内容1\",\"code\":\"A\"},{\"text\":\"内容2\",\"code\":\"B\"},{\"text\":\"内容3\",\"code\":\"C\"},{\"text\":\"内容4\",\"code\":\"D\"}]','A','答案解析6',1,12,'2023-04-18 13:49:08');

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '考试编号',
  `yonghu_id` int(20) NOT NULL COMMENT '考试用户',
  `exampaper_id` int(20) NOT NULL COMMENT '所属试卷id（外键）',
  `total_score` int(200) DEFAULT NULL COMMENT '所得总分',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '考试时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`examrecord_uuid_number`,`yonghu_id`,`exampaper_id`,`total_score`,`insert_time`,`create_time`) values (1,'1681798333937',1,2,35,'2023-04-18 14:12:14','2023-04-18 14:12:14');

/*Table structure for table `examredetails` */

DROP TABLE IF EXISTS `examredetails`;

CREATE TABLE `examredetails` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '试卷编号',
  `yonghu_id` int(20) NOT NULL COMMENT '用户id',
  `examquestion_id` int(20) NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  `examredetails_myscore` int(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='答题详情表';

/*Data for the table `examredetails` */

insert  into `examredetails`(`id`,`examredetails_uuid_number`,`yonghu_id`,`examquestion_id`,`examredetails_myanswer`,`examredetails_myscore`,`create_time`) values (1,'1681798333937',1,3,'1',20,'2023-04-18 14:12:14'),(2,'1681798333937',1,10,'2',0,'2023-04-18 14:12:14'),(3,'1681798333937',1,1,'A',0,'2023-04-18 14:12:14'),(4,'1681798333937',1,9,'A',15,'2023-04-18 14:12:14'),(5,'1681798333937',1,11,'A',0,'2023-04-18 14:12:14'),(6,'1681798333937',1,5,'A',0,'2023-04-18 14:12:14');

/*Table structure for table `examrewrongquestion` */

DROP TABLE IF EXISTS `examrewrongquestion`;

CREATE TABLE `examrewrongquestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(20) NOT NULL COMMENT '用户id',
  `exampaper_id` int(20) NOT NULL COMMENT '试卷（外键）',
  `examquestion_id` int(20) NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生作答',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='错题表';

/*Data for the table `examrewrongquestion` */

insert  into `examrewrongquestion`(`id`,`yonghu_id`,`exampaper_id`,`examquestion_id`,`examredetails_myanswer`,`insert_time`,`create_time`) values (1,1,2,10,'2','2023-04-18 14:12:14','2023-04-18 14:12:14'),(2,1,2,1,'A','2023-04-18 14:12:14','2023-04-18 14:12:14'),(3,1,2,11,'A','2023-04-18 14:12:14','2023-04-18 14:12:14'),(4,1,2,5,'A','2023-04-18 14:12:14','2023-04-18 14:12:14');

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '公告图片 ',
  `gonggao_types` int(11) NOT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `gonggao_content` longtext COMMENT '公告详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`gonggao_name`,`gonggao_photo`,`gonggao_types`,`insert_time`,`gonggao_content`,`create_time`) values (1,'公告名称1','upload/gonggao1.jpg',2,'2023-04-18 13:49:33','公告详情1','2023-04-18 13:49:33'),(2,'公告名称2','upload/gonggao2.jpg',1,'2023-04-18 13:49:33','公告详情2','2023-04-18 13:49:33'),(3,'公告名称3','upload/gonggao3.jpg',1,'2023-04-18 13:49:33','公告详情3','2023-04-18 13:49:33'),(4,'公告名称4','upload/gonggao4.jpg',2,'2023-04-18 13:49:33','公告详情4','2023-04-18 13:49:33'),(5,'公告名称5','upload/gonggao5.jpg',1,'2023-04-18 13:49:33','公告详情5','2023-04-18 13:49:33'),(6,'公告名称6','upload/gonggao6.jpg',2,'2023-04-18 13:49:33','公告详情6','2023-04-18 13:49:33'),(7,'公告名称7','upload/gonggao7.jpg',2,'2023-04-18 13:49:33','公告详情7','2023-04-18 13:49:33'),(8,'公告名称8','upload/gonggao8.jpg',2,'2023-04-18 13:49:33','公告详情8','2023-04-18 13:49:33'),(9,'公告名称9','upload/gonggao9.jpg',2,'2023-04-18 13:49:33','公告详情9','2023-04-18 13:49:33'),(10,'公告名称10','upload/gonggao10.jpg',2,'2023-04-18 13:49:33','公告详情10','2023-04-18 13:49:33'),(11,'公告名称11','upload/gonggao11.jpg',1,'2023-04-18 13:49:33','公告详情11','2023-04-18 13:49:33'),(12,'公告名称12','upload/gonggao12.jpg',1,'2023-04-18 13:49:33','公告详情12','2023-04-18 13:49:33'),(13,'公告名称13','upload/gonggao13.jpg',1,'2023-04-18 13:49:33','公告详情13','2023-04-18 13:49:33'),(14,'公告名称14','upload/gonggao14.jpg',2,'2023-04-18 13:49:33','公告详情14','2023-04-18 13:49:33');

/*Table structure for table `jiaolian` */

DROP TABLE IF EXISTS `jiaolian`;

CREATE TABLE `jiaolian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `jiaolian_name` varchar(200) DEFAULT NULL COMMENT '教练姓名 Search111 ',
  `jiaolian_phone` varchar(200) DEFAULT NULL COMMENT '教练手机号',
  `jiaolian_id_number` varchar(200) DEFAULT NULL COMMENT '教练身份证号',
  `jiaolian_photo` varchar(200) DEFAULT NULL COMMENT '教练头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `jiaolian_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='教练';

/*Data for the table `jiaolian` */

insert  into `jiaolian`(`id`,`username`,`password`,`jiaolian_name`,`jiaolian_phone`,`jiaolian_id_number`,`jiaolian_photo`,`sex_types`,`jiaolian_email`,`create_time`) values (1,'a1','123456','教练姓名1','17703786901','410224199010102001','upload/jiaolian1.jpg',1,'1@qq.com','2023-04-18 13:49:33'),(2,'a2','123456','教练姓名2','17703786902','410224199010102002','upload/jiaolian2.jpg',1,'2@qq.com','2023-04-18 13:49:33'),(3,'a3','123456','教练姓名3','17703786903','410224199010102003','upload/jiaolian3.jpg',2,'3@qq.com','2023-04-18 13:49:33');

/*Table structure for table `jiaolian_yuyue` */

DROP TABLE IF EXISTS `jiaolian_yuyue`;

CREATE TABLE `jiaolian_yuyue` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jiaolian_yuyue_uuid_number` varchar(200) DEFAULT NULL COMMENT '报名编号 Search111 ',
  `jiaolian_id` int(11) DEFAULT NULL COMMENT '教练',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `jiaolian_yuyue_text` longtext COMMENT '报名理由',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '教练预约时间',
  `jiaolian_yuyue_yesno_types` int(11) DEFAULT NULL COMMENT '报名状态 Search111 ',
  `jiaolian_yuyue_yesno_text` longtext COMMENT '审核回复',
  `jiaolian_yuyue_shenhe_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `jiaolian_yuyue_time` timestamp NULL DEFAULT NULL COMMENT '预约时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='教练预约';

/*Data for the table `jiaolian_yuyue` */

insert  into `jiaolian_yuyue`(`id`,`jiaolian_yuyue_uuid_number`,`jiaolian_id`,`yonghu_id`,`jiaolian_yuyue_text`,`insert_time`,`jiaolian_yuyue_yesno_types`,`jiaolian_yuyue_yesno_text`,`jiaolian_yuyue_shenhe_time`,`jiaolian_yuyue_time`,`create_time`) values (1,'1681796973990',1,2,'报名理由1','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(2,'1681796974017',1,2,'报名理由2','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(3,'1681796974037',1,3,'报名理由3','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(4,'1681796974081',1,2,'报名理由4','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(5,'1681796974039',1,1,'报名理由5','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(6,'1681796974061',2,1,'报名理由6','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(7,'1681796974005',2,1,'报名理由7','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(8,'1681796974033',1,2,'报名理由8','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(9,'1681796974047',2,3,'报名理由9','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(10,'1681796974036',1,2,'报名理由10','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(11,'1681796974009',2,1,'报名理由11','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(12,'1681796974042',3,3,'报名理由12','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(13,'1681796974029',3,2,'报名理由13','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(14,'1681796974057',2,1,'报名理由14','2023-04-18 13:49:33',1,NULL,NULL,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(15,'1681798425669',1,1,'我娿预约','2023-04-18 14:13:53',2,'had','2023-04-18 14:14:23','2023-04-18 00:00:00','2023-04-18 14:13:53');

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `liuyan_name` varchar(200) DEFAULT NULL COMMENT '留言标题  Search111 ',
  `liuyan_text` longtext COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` longtext COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='留言板';

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`yonghu_id`,`liuyan_name`,`liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,3,'留言标题1','留言内容1','2023-04-18 13:49:33','回复信息1','2023-04-18 13:49:33','2023-04-18 13:49:33'),(2,2,'留言标题2','留言内容2','2023-04-18 13:49:33','回复信息2','2023-04-18 13:49:33','2023-04-18 13:49:33'),(3,2,'留言标题3','留言内容3','2023-04-18 13:49:33','回复信息3','2023-04-18 13:49:33','2023-04-18 13:49:33'),(4,2,'留言标题4','留言内容4','2023-04-18 13:49:33','回复信息4','2023-04-18 13:49:33','2023-04-18 13:49:33'),(5,1,'留言标题5','留言内容5','2023-04-18 13:49:33','回复信息5','2023-04-18 13:49:33','2023-04-18 13:49:33'),(6,3,'留言标题6','留言内容6','2023-04-18 13:49:33','回复信息6','2023-04-18 13:49:33','2023-04-18 13:49:33'),(7,1,'留言标题7','留言内容7','2023-04-18 13:49:33','回复信息7','2023-04-18 13:49:33','2023-04-18 13:49:33'),(8,2,'留言标题8','留言内容8','2023-04-18 13:49:33','回复信息8','2023-04-18 13:49:33','2023-04-18 13:49:33'),(9,3,'留言标题9','留言内容9','2023-04-18 13:49:33','回复信息9','2023-04-18 13:49:33','2023-04-18 13:49:33'),(10,1,'留言标题10','留言内容10','2023-04-18 13:49:33','回复信息10','2023-04-18 13:49:33','2023-04-18 13:49:33'),(11,2,'留言标题11','留言内容11','2023-04-18 13:49:33','回复信息11','2023-04-18 13:49:33','2023-04-18 13:49:33'),(12,2,'留言标题12','留言内容12','2023-04-18 13:49:33','回复信息12','2023-04-18 13:49:33','2023-04-18 13:49:33'),(13,2,'留言标题13','留言内容13','2023-04-18 13:49:33','回复信息13','2023-04-18 13:49:33','2023-04-18 13:49:33'),(14,3,'留言标题14','留言内容14','2023-04-18 13:49:33','回复信息14','2023-04-18 13:49:33','2023-04-18 13:49:33'),(15,1,'留言','1111','2023-04-18 14:12:28','sad撒','2023-04-18 14:15:21','2023-04-18 14:12:28');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '儿童id',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','用户','ti9zncxywrnhx3cna54pq4n8djfprvsd','2023-04-18 13:52:49','2023-04-18 15:11:49'),(2,1,'a1','jiaolian','教练','nsf4q0835ppg9bbfu9l8kg0s25w0dim3','2023-04-18 14:02:27','2023-04-18 15:14:06'),(3,1,'admin','users','管理员','6r30szh8kgjwzx5dcvyn9xzkty5m1p31','2023-04-18 14:14:50','2023-04-18 15:14:50');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2023-04-18 13:49:07');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`yonghu_photo`,`sex_types`,`yonghu_email`,`create_time`) values (1,'a1','123456','用户姓名1','17703786901','410224199010102001','upload/yonghu1.jpg',2,'1@qq.com','2023-04-18 13:49:33'),(2,'a2','123456','用户姓名2','17703786902','410224199010102002','upload/yonghu2.jpg',1,'2@qq.com','2023-04-18 13:49:33'),(3,'a3','123456','用户姓名3','17703786903','410224199010102003','upload/yonghu3.jpg',2,'3@qq.com','2023-04-18 13:49:33');

/*Table structure for table `ziliao` */

DROP TABLE IF EXISTS `ziliao`;

CREATE TABLE `ziliao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `ziliao_name` varchar(200) DEFAULT NULL COMMENT '学习资料名称  Search111 ',
  `ziliao_uuid_number` varchar(200) DEFAULT NULL COMMENT '学习资料编号',
  `ziliao_photo` varchar(200) DEFAULT NULL COMMENT '学习资料照片',
  `zan_number` int(11) DEFAULT NULL COMMENT '赞',
  `cai_number` int(11) DEFAULT NULL COMMENT '踩',
  `ziliao_types` int(11) DEFAULT NULL COMMENT '学习资料类型 Search111',
  `ziliao_video` varchar(200) DEFAULT NULL COMMENT '学习资料视频',
  `ziliao_file` varchar(200) DEFAULT NULL COMMENT '学习资料下载',
  `ziliao_content` longtext COMMENT '学习资料介绍 ',
  `ziliao_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='学习资料';

/*Data for the table `ziliao` */

insert  into `ziliao`(`id`,`ziliao_name`,`ziliao_uuid_number`,`ziliao_photo`,`zan_number`,`cai_number`,`ziliao_types`,`ziliao_video`,`ziliao_file`,`ziliao_content`,`ziliao_delete`,`insert_time`,`create_time`) values (1,'学习资料名称1','1681796974023','upload/ziliao1.jpg',408,222,2,'upload/video.mp4','upload/file.rar','学习资料介绍1',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(2,'学习资料名称2','1681796974014','upload/ziliao2.jpg',343,135,2,'upload/video.mp4','upload/file.rar','学习资料介绍2',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(3,'学习资料名称3','1681796974079','upload/ziliao3.jpg',88,319,1,'upload/video.mp4','upload/file.rar','学习资料介绍3',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(4,'学习资料名称4','1681796974076','upload/ziliao4.jpg',47,393,1,'upload/video.mp4','upload/file.rar','学习资料介绍4',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(5,'学习资料名称5','1681796974030','upload/ziliao5.jpg',68,255,2,'upload/video.mp4','upload/file.rar','学习资料介绍5',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(6,'学习资料名称6','1681796974035','upload/ziliao6.jpg',370,69,3,'upload/video.mp4','upload/file.rar','学习资料介绍6',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(7,'学习资料名称7','1681796974065','upload/ziliao7.jpg',167,377,1,'upload/video.mp4','upload/file.rar','学习资料介绍7',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(8,'学习资料名称8','1681796973999','upload/ziliao8.jpg',116,62,2,'upload/video.mp4','upload/file.rar','学习资料介绍8',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(9,'学习资料名称9','1681796974019','upload/ziliao9.jpg',318,138,2,'upload/video.mp4','upload/file.rar','学习资料介绍9',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(10,'学习资料名称10','1681796974010','upload/ziliao10.jpg',475,314,1,'upload/video.mp4','upload/file.rar','学习资料介绍10',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(11,'学习资料名称11','1681796974066','upload/ziliao11.jpg',346,34,1,'upload/video.mp4','upload/file.rar','学习资料介绍11',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(12,'学习资料名称12','1681796974010','upload/ziliao12.jpg',93,296,1,'upload/video.mp4','upload/file.rar','学习资料介绍12',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(13,'学习资料名称13','1681796974024','upload/ziliao13.jpg',493,408,2,'upload/video.mp4','upload/file.rar','学习资料介绍13',1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(14,'学习资料名称14','1681796974058','upload/ziliao14.jpg',6,47,2,'upload/video.mp4','upload/file.rar','学习资料介绍14',1,'2023-04-18 13:49:33','2023-04-18 13:49:33');

/*Table structure for table `ziliao_collection` */

DROP TABLE IF EXISTS `ziliao_collection`;

CREATE TABLE `ziliao_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ziliao_id` int(11) DEFAULT NULL COMMENT '商品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `ziliao_collection_types` int(11) DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='学习资料收藏';

/*Data for the table `ziliao_collection` */

insert  into `ziliao_collection`(`id`,`ziliao_id`,`yonghu_id`,`ziliao_collection_types`,`insert_time`,`create_time`) values (1,1,3,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(2,2,1,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(3,3,1,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(4,4,2,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(5,5,1,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(6,6,1,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(7,7,1,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(8,8,2,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(9,9,1,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(10,10,1,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(11,11,2,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(12,12,1,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(13,13,1,1,'2023-04-18 13:49:33','2023-04-18 13:49:33'),(14,14,2,1,'2023-04-18 13:49:33','2023-04-18 13:49:33');

/*Table structure for table `ziliao_liuyan` */

DROP TABLE IF EXISTS `ziliao_liuyan`;

CREATE TABLE `ziliao_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ziliao_id` int(11) DEFAULT NULL COMMENT '商品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `ziliao_liuyan_text` longtext COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` longtext COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='学习资料留言';

/*Data for the table `ziliao_liuyan` */

insert  into `ziliao_liuyan`(`id`,`ziliao_id`,`yonghu_id`,`ziliao_liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,3,'留言内容1','2023-04-18 13:49:33','回复信息1','2023-04-18 13:49:33','2023-04-18 13:49:33'),(2,2,1,'留言内容2','2023-04-18 13:49:33','回复信息2','2023-04-18 13:49:33','2023-04-18 13:49:33'),(3,3,1,'留言内容3','2023-04-18 13:49:33','回复信息3','2023-04-18 13:49:33','2023-04-18 13:49:33'),(4,4,2,'留言内容4','2023-04-18 13:49:33','回复信息4','2023-04-18 13:49:33','2023-04-18 13:49:33'),(5,5,3,'留言内容5','2023-04-18 13:49:33','回复信息5','2023-04-18 13:49:33','2023-04-18 13:49:33'),(6,6,2,'留言内容6','2023-04-18 13:49:33','回复信息6','2023-04-18 13:49:33','2023-04-18 13:49:33'),(7,7,3,'留言内容7','2023-04-18 13:49:33','回复信息7','2023-04-18 13:49:33','2023-04-18 13:49:33'),(8,8,2,'留言内容8','2023-04-18 13:49:33','回复信息8','2023-04-18 13:49:33','2023-04-18 13:49:33'),(9,9,2,'留言内容9','2023-04-18 13:49:33','回复信息9','2023-04-18 13:49:33','2023-04-18 13:49:33'),(10,10,1,'留言内容10','2023-04-18 13:49:33','回复信息10','2023-04-18 13:49:33','2023-04-18 13:49:33'),(11,11,1,'留言内容11','2023-04-18 13:49:33','回复信息11','2023-04-18 13:49:33','2023-04-18 13:49:33'),(12,12,3,'留言内容12','2023-04-18 13:49:33','回复信息12','2023-04-18 13:49:33','2023-04-18 13:49:33'),(13,13,3,'留言内容13','2023-04-18 13:49:33','回复信息13','2023-04-18 13:49:33','2023-04-18 13:49:33'),(14,14,3,'留言内容14','2023-04-18 13:49:33','回复信息14','2023-04-18 13:49:33','2023-04-18 13:49:33'),(15,14,1,'呀呀呀','2023-04-18 14:12:59','23123','2023-04-18 14:15:34','2023-04-18 14:12:59');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
