USE `jiaxiaoyuyuexuexixitong`;

SET FOREIGN_KEY_CHECKS = 0;

RENAME TABLE `jiaolian` TO `coach`;
RENAME TABLE `jiaolian_yuyue` TO `coach_reservation`;
RENAME TABLE `yonghu` TO `user`;
RENAME TABLE `ziliao` TO `study_material`;
RENAME TABLE `ziliao_collection` TO `material_collection`;
RENAME TABLE `ziliao_liuyan` TO `material_comment`;
RENAME TABLE `liuyan` TO `message_board`;

ALTER TABLE `dictionary`
  CHANGE `dic_code` `dic_code` varchar(50) NOT NULL COMMENT '字段',
  CHANGE `dic_name` `dic_name` varchar(100) NOT NULL COMMENT '字段名',
  CHANGE `code_index` `code_index` int NOT NULL COMMENT '编码',
  CHANGE `index_name` `index_name` varchar(50) DEFAULT NULL COMMENT '编码名字',
  CHANGE `super_id` `super_id` int DEFAULT NULL COMMENT '父字段ID',
  CHANGE `beizhu` `beizhu` varchar(500) DEFAULT NULL COMMENT '备注',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `users`
  CHANGE `username` `username` varchar(50) NOT NULL COMMENT '用户名',
  CHANGE `password` `password` varchar(100) NOT NULL COMMENT '密码',
  CHANGE `role` `role` varchar(20) NOT NULL DEFAULT '管理员' COMMENT '角色',
  CHANGE `addtime` `addtime` datetime DEFAULT NULL COMMENT '新增时间';

ALTER TABLE `notice`
  CHANGE `gonggao_name` `title` varchar(100) NOT NULL COMMENT '公告名称',
  CHANGE `gonggao_photo` `image` varchar(255) DEFAULT NULL COMMENT '公告图片',
  CHANGE `gonggao_types` `types` int NOT NULL COMMENT '公告类型',
  CHANGE `insert_time` `insert_time` datetime DEFAULT NULL COMMENT '发布时间',
  CHANGE `gonggao_content` `content` longtext NOT NULL COMMENT '公告详情',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `coach`
  CHANGE `username` `username` varchar(50) NOT NULL COMMENT '登录账号',
  CHANGE `password` `password` varchar(100) NOT NULL COMMENT '登录密码',
  CHANGE `jiaolian_name` `name` varchar(50) NOT NULL COMMENT '教练姓名',
  CHANGE `jiaolian_phone` `phone` varchar(20) DEFAULT NULL COMMENT '教练手机号',
  CHANGE `jiaolian_id_number` `id_card` varchar(32) NOT NULL COMMENT '教练身份证号',
  CHANGE `jiaolian_photo` `photo` varchar(255) DEFAULT NULL COMMENT '教练头像',
  CHANGE `sex_types` `sex_type` int DEFAULT NULL COMMENT '性别',
  CHANGE `jiaolian_email` `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `coach_reservation`
  CHANGE `jiaolian_yuyue_uuid_number` `registration_number` varchar(32) DEFAULT NULL COMMENT '报名编号',
  CHANGE `jiaolian_id` `coach_id` int NOT NULL COMMENT '教练ID',
  CHANGE `yonghu_id` `user_id` int NOT NULL COMMENT '用户ID',
  CHANGE `jiaolian_yuyue_text` `reason_text` longtext NOT NULL COMMENT '报名理由',
  CHANGE `insert_time` `insert_time` datetime DEFAULT NULL COMMENT '教练预约时间',
  CHANGE `jiaolian_yuyue_yesno_types` `status` int DEFAULT NULL COMMENT '报名状态',
  CHANGE `jiaolian_yuyue_yesno_text` `reply_text` varchar(200) DEFAULT NULL COMMENT '审核回复',
  CHANGE `jiaolian_yuyue_shenhe_time` `review_time` datetime DEFAULT NULL COMMENT '审核时间',
  CHANGE `jiaolian_yuyue_time` `appointment_time` datetime DEFAULT NULL COMMENT '预约时间',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `user`
  CHANGE `username` `username` varchar(50) NOT NULL COMMENT '登录账号',
  CHANGE `password` `password` varchar(100) NOT NULL COMMENT '登录密码',
  CHANGE `yonghu_name` `user_name` varchar(50) NOT NULL COMMENT '用户姓名',
  CHANGE `yonghu_phone` `user_phone` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  CHANGE `yonghu_id_number` `user_id_number` varchar(32) NOT NULL COMMENT '用户身份证号',
  CHANGE `yonghu_photo` `user_photo` varchar(255) DEFAULT NULL COMMENT '用户头像',
  CHANGE `sex_types` `sex_type` int DEFAULT NULL COMMENT '性别',
  CHANGE `yonghu_email` `user_email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `study_material`
  CHANGE `ziliao_name` `material_name` varchar(100) NOT NULL COMMENT '学习资料名称',
  CHANGE `ziliao_uuid_number` `material_number` varchar(50) NOT NULL COMMENT '学习资料编号',
  CHANGE `ziliao_photo` `material_photo` varchar(255) NOT NULL COMMENT '学习资料照片',
  CHANGE `zan_number` `good_number` int DEFAULT 0 COMMENT '赞',
  CHANGE `cai_number` `bad_number` int DEFAULT 0 COMMENT '踩',
  CHANGE `ziliao_types` `material_types` int NOT NULL COMMENT '学习资料类型',
  CHANGE `ziliao_video` `material_video` varchar(255) DEFAULT NULL COMMENT '学习资料视频',
  CHANGE `ziliao_file` `file_url` varchar(255) DEFAULT NULL COMMENT '学习资料下载',
  CHANGE `ziliao_content` `material_content` longtext NOT NULL COMMENT '学习资料介绍',
  CHANGE `ziliao_delete` `material_delete` int DEFAULT 1 COMMENT '逻辑删除',
  CHANGE `insert_time` `insert_time` datetime DEFAULT NULL COMMENT '录入时间',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `material_collection`
  CHANGE `ziliao_id` `material_id` int NOT NULL COMMENT '资料ID',
  CHANGE `yonghu_id` `user_id` int NOT NULL COMMENT '用户ID',
  CHANGE `ziliao_collection_types` `material_types` int NOT NULL COMMENT '类型',
  CHANGE `insert_time` `insert_time` datetime DEFAULT NULL COMMENT '收藏时间',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `material_comment`
  CHANGE `ziliao_id` `material_id` int NOT NULL COMMENT '资料ID',
  CHANGE `yonghu_id` `user_id` int NOT NULL COMMENT '用户ID',
  CHANGE `ziliao_liuyan_text` `content` text NOT NULL COMMENT '留言内容',
  CHANGE `insert_time` `insert_time` datetime DEFAULT NULL COMMENT '留言时间',
  CHANGE `reply_text` `reply_text` text DEFAULT NULL COMMENT '回复内容',
  CHANGE `update_time` `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `message_board`
  CHANGE `yonghu_id` `user_id` int NOT NULL COMMENT '用户ID',
  CHANGE `liuyan_name` `title` varchar(100) DEFAULT NULL COMMENT '留言标题',
  CHANGE `liuyan_text` `content` text NOT NULL COMMENT '留言内容',
  CHANGE `insert_time` `insert_time` datetime DEFAULT NULL COMMENT '留言时间',
  CHANGE `reply_text` `reply_text` text DEFAULT NULL COMMENT '回复内容',
  CHANGE `update_time` `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `exam_record`
  CHANGE `examrecord_uuid_number` `examrecord_uuid_number` varchar(32) DEFAULT NULL COMMENT '考试编号',
  CHANGE `yonghu_id` `user_id` int NOT NULL COMMENT '考试用户',
  CHANGE `exampaper_id` `paper_id` int NOT NULL COMMENT '所属试卷ID',
  CHANGE `total_score` `total_score` int DEFAULT NULL COMMENT '所得总分',
  CHANGE `insert_time` `insert_time` datetime DEFAULT NULL COMMENT '考试时间',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `exam_details`
  CHANGE `examredetails_uuid_number` `examredetails_uuid_number` varchar(32) DEFAULT NULL COMMENT '试卷编号',
  CHANGE `yonghu_id` `user_id` int NOT NULL COMMENT '用户ID',
  CHANGE `examquestion_id` `question_id` int NOT NULL COMMENT '试题ID',
  CHANGE `examredetails_myanswer` `user_answer` varchar(255) DEFAULT NULL COMMENT '考生答案',
  CHANGE `examredetails_myscore` `score` int NOT NULL DEFAULT 0 COMMENT '试题得分',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `wrong_question`
  CHANGE `yonghu_id` `user_id` int NOT NULL COMMENT '用户ID',
  CHANGE `exampaper_id` `paper_id` int NOT NULL COMMENT '试卷ID',
  CHANGE `examquestion_id` `question_id` int NOT NULL COMMENT '试题ID',
  CHANGE `examredetails_myanswer` `user_answer` varchar(255) DEFAULT NULL COMMENT '考生作答',
  CHANGE `insert_time` `insert_time` datetime DEFAULT NULL COMMENT '记录时间',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `exam_paper`
  CHANGE `exampaper_name` `exam_paper_name` varchar(100) NOT NULL COMMENT '试卷名称',
  CHANGE `exampaper_date` `duration` int NOT NULL COMMENT '考试时长(分钟)',
  CHANGE `exampaper_myscore` `total_score` int NOT NULL DEFAULT 0 COMMENT '试卷总分数',
  CHANGE `kemu_types` `subject_type` int NOT NULL COMMENT '科目分类',
  CHANGE `exampaper_types` `status` int NOT NULL DEFAULT 1 COMMENT '试卷状态',
  CHANGE `zujuan_types` `method` int NOT NULL COMMENT '组卷方式',
  CHANGE `exampaper_delete` `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '逻辑删除',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `exam_paper_question`
  CHANGE `exampaper_id` `exam_paper_id` int NOT NULL COMMENT '试卷ID',
  CHANGE `examquestion_id` `question_id` int NOT NULL COMMENT '试题ID',
  CHANGE `exampapertopic_number` `question_score` int NOT NULL COMMENT '试题分数',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

ALTER TABLE `exam_question`
  CHANGE `examquestion_name` `paper_name` varchar(500) NOT NULL COMMENT '试题名称',
  CHANGE `kemu_types` `subject_type` int NOT NULL COMMENT '科目',
  CHANGE `examquestion_options` `question_options` text COMMENT '选项，json字符串',
  CHANGE `examquestion_answer` `question_answer` varchar(255) NOT NULL COMMENT '正确答案',
  CHANGE `examquestion_analysis` `question_analysis` text COMMENT '答案解析',
  CHANGE `examquestion_types` `question_type` int NOT NULL DEFAULT 1 COMMENT '试题类型',
  CHANGE `examquestion_sequence` `sort` int DEFAULT 100 COMMENT '试题排序，值越大排越前面',
  CHANGE `create_time` `create_time` datetime DEFAULT NULL COMMENT '创建时间';

DROP VIEW IF EXISTS `gonggao`;
CREATE VIEW `gonggao` AS
SELECT `id`,`title` AS `gonggao_name`,`image` AS `gonggao_photo`,`types` AS `gonggao_types`,`insert_time`,`content` AS `gonggao_content`,`create_time`
FROM `notice`;

DROP VIEW IF EXISTS `jiaolian`;
CREATE VIEW `jiaolian` AS
SELECT `id`,`username`,`password`,`name` AS `jiaolian_name`,`phone` AS `jiaolian_phone`,`id_card` AS `jiaolian_id_number`,`photo` AS `jiaolian_photo`,`sex_type` AS `sex_types`,`email` AS `jiaolian_email`,`create_time`
FROM `coach`;

DROP VIEW IF EXISTS `jiaolian_yuyue`;
CREATE VIEW `jiaolian_yuyue` AS
SELECT `id`,`registration_number` AS `jiaolian_yuyue_uuid_number`,`coach_id` AS `jiaolian_id`,`user_id` AS `yonghu_id`,`reason_text` AS `jiaolian_yuyue_text`,`insert_time`,`status` AS `jiaolian_yuyue_yesno_types`,`reply_text` AS `jiaolian_yuyue_yesno_text`,`review_time` AS `jiaolian_yuyue_shenhe_time`,`appointment_time` AS `jiaolian_yuyue_time`,`create_time`
FROM `coach_reservation`;

DROP VIEW IF EXISTS `yonghu`;
CREATE VIEW `yonghu` AS
SELECT `id`,`username`,`password`,`user_name` AS `yonghu_name`,`user_phone` AS `yonghu_phone`,`user_id_number` AS `yonghu_id_number`,`user_photo` AS `yonghu_photo`,`sex_type` AS `sex_types`,`user_email` AS `yonghu_email`,`create_time`
FROM `user`;

DROP VIEW IF EXISTS `ziliao`;
CREATE VIEW `ziliao` AS
SELECT `id`,`material_name` AS `ziliao_name`,`material_number` AS `ziliao_uuid_number`,`material_photo` AS `ziliao_photo`,`good_number` AS `zan_number`,`bad_number` AS `cai_number`,`material_types` AS `ziliao_types`,`material_video` AS `ziliao_video`,`file_url` AS `ziliao_file`,`material_content` AS `ziliao_content`,`material_delete` AS `ziliao_delete`,`insert_time`,`create_time`
FROM `study_material`;

DROP VIEW IF EXISTS `ziliao_collection`;
CREATE VIEW `ziliao_collection` AS
SELECT `id`,`material_id` AS `ziliao_id`,`user_id` AS `yonghu_id`,`material_types` AS `ziliao_collection_types`,`insert_time`,`create_time`
FROM `material_collection`;

DROP VIEW IF EXISTS `ziliao_liuyan`;
CREATE VIEW `ziliao_liuyan` AS
SELECT `id`,`material_id` AS `ziliao_id`,`user_id` AS `yonghu_id`,`content` AS `ziliao_liuyan_text`,`insert_time`,`reply_text`,`reply_time` AS `update_time`,`create_time`
FROM `material_comment`;

DROP VIEW IF EXISTS `liuyan`;
CREATE VIEW `liuyan` AS
SELECT `id`,`user_id` AS `yonghu_id`,`title` AS `liuyan_name`,`content` AS `liuyan_text`,`insert_time`,`reply_text`,`reply_time` AS `update_time`,`create_time`
FROM `message_board`;

DROP VIEW IF EXISTS `examrecord`;
CREATE VIEW `examrecord` AS
SELECT `id`,`examrecord_uuid_number`,`user_id` AS `yonghu_id`,`paper_id` AS `exampaper_id`,`total_score`,`insert_time`,`create_time`
FROM `exam_record`;

DROP VIEW IF EXISTS `examredetails`;
CREATE VIEW `examredetails` AS
SELECT `id`,`examredetails_uuid_number`,`user_id` AS `yonghu_id`,`question_id` AS `examquestion_id`,`user_answer` AS `examredetails_myanswer`,`score` AS `examredetails_myscore`,`create_time`
FROM `exam_details`;

DROP VIEW IF EXISTS `examrewrongquestion`;
CREATE VIEW `examrewrongquestion` AS
SELECT `id`,`user_id` AS `yonghu_id`,`paper_id` AS `exampaper_id`,`question_id` AS `examquestion_id`,`user_answer` AS `examredetails_myanswer`,`insert_time`,`create_time`
FROM `wrong_question`;

DROP VIEW IF EXISTS `exampaper`;
CREATE VIEW `exampaper` AS
SELECT `id`,`exam_paper_name` AS `exampaper_name`,`duration` AS `exampaper_date`,`total_score` AS `exampaper_myscore`,`subject_type` AS `kemu_types`,`status` AS `exampaper_types`,`method` AS `zujuan_types`,`is_delete` AS `exampaper_delete`,`create_time`
FROM `exam_paper`;

DROP VIEW IF EXISTS `exampapertopic`;
CREATE VIEW `exampapertopic` AS
SELECT `id`,`exam_paper_id` AS `exampaper_id`,`question_id` AS `examquestion_id`,`question_score` AS `exampapertopic_number`,`create_time`
FROM `exam_paper_question`;

DROP VIEW IF EXISTS `examquestion`;
CREATE VIEW `examquestion` AS
SELECT `id`,`paper_name` AS `examquestion_name`,`subject_type` AS `kemu_types`,`question_options` AS `examquestion_options`,`question_answer` AS `examquestion_answer`,`question_analysis` AS `examquestion_analysis`,`question_type` AS `examquestion_types`,`sort` AS `examquestion_sequence`,`create_time`
FROM `exam_question`;

SET FOREIGN_KEY_CHECKS = 1;