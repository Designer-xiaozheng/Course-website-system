DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-03-31 18:21:49.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-03-31 17:35:13.0');
DROP TABLE IF EXISTS `employee_users`;
CREATE TABLE `employee_users`(employee_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '员工用户ID',
`employee_name` varchar(64) comment '员工姓名',
`employee_gender` varchar(64) comment '员工性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (employee_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '员工用户';

DROP TABLE IF EXISTS `service_information`;
CREATE TABLE `service_information`(service_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '维修信息ID',
`vehicle_name` varchar(64) comment '车辆名称',
`license_plate` varchar(64) comment '车牌号码',
`repair_date` date comment '维修日期',
`maintenance_staff` int(11) DEFAULT 0 comment '维修员工',
`employee_name` varchar(64) comment '员工姓名',
`maintenance_costs` int(11) DEFAULT 0 comment '维修费用',
`fault_cause` text comment '故障原因',
`maintenance_notes` text comment '维修笔记',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (service_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '维修信息';
insert into `service_information` values (1,'车辆名称1','车牌号码1','2023-03-27',0,'员工姓名1',1,'此处可上传文字、图片、视频、超链接、表格等内容区1','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `service_information` values (2,'车辆名称2','车牌号码2','2023-03-27',0,'员工姓名2',2,'此处可上传文字、图片、视频、超链接、表格等内容区2','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `service_information` values (3,'车辆名称3','车牌号码3','2023-03-27',0,'员工姓名3',3,'此处可上传文字、图片、视频、超链接、表格等内容区3','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `service_information` values (4,'车辆名称4','车牌号码4','2023-03-27',0,'员工姓名4',4,'此处可上传文字、图片、视频、超链接、表格等内容区4','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `service_information` values (5,'车辆名称5','车牌号码5','2023-03-27',0,'员工姓名5',5,'此处可上传文字、图片、视频、超链接、表格等内容区5','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `service_information` values (6,'车辆名称6','车牌号码6','2023-03-27',0,'员工姓名6',6,'此处可上传文字、图片、视频、超链接、表格等内容区6','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `service_information` values (7,'车辆名称7','车牌号码7','2023-03-27',0,'员工姓名7',7,'此处可上传文字、图片、视频、超链接、表格等内容区7','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `service_information` values (8,'车辆名称8','车牌号码8','2023-03-27',0,'员工姓名8',8,'此处可上传文字、图片、视频、超链接、表格等内容区8','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');

DROP TABLE IF EXISTS `sales_information`;
CREATE TABLE `sales_information`(sales_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '销售信息ID',
`sales_date` date comment '销售日期',
`vehicle_name` varchar(64) comment '车辆名称',
`vehicle_unit_price` int(11) DEFAULT 0 comment '车辆单价',
`sales_volumes` int(11) DEFAULT 0 comment '销售数量',
`sales_amount` varchar(64) comment '销售金额',
`sales_staff` int(11) DEFAULT 0 comment '销售员工',
`employee_name` varchar(64) comment '员工姓名',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (sales_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '销售信息';
insert into `sales_information` values (1,'2023-03-27','车辆名称1',1,1,'销售金额1',0,'员工姓名1',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `sales_information` values (2,'2023-03-27','车辆名称2',2,2,'销售金额2',0,'员工姓名2',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `sales_information` values (3,'2023-03-27','车辆名称3',3,3,'销售金额3',0,'员工姓名3',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `sales_information` values (4,'2023-03-27','车辆名称4',4,4,'销售金额4',0,'员工姓名4',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `sales_information` values (5,'2023-03-27','车辆名称5',5,5,'销售金额5',0,'员工姓名5',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `sales_information` values (6,'2023-03-27','车辆名称6',6,6,'销售金额6',0,'员工姓名6',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `sales_information` values (7,'2023-03-27','车辆名称7',7,7,'销售金额7',0,'员工姓名7',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `sales_information` values (8,'2023-03-27','车辆名称8',8,8,'销售金额8',0,'员工姓名8',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');

DROP TABLE IF EXISTS `warehouse_information`;
CREATE TABLE `warehouse_information`(warehouse_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库信息ID',
`item_name` varchar(64) comment '物品名称',
`serial_number` varchar(64) comment '物品编号',
`storage_location` varchar(64) comment '存放位置',
`item_quantity` int(11) DEFAULT 0 comment '物品数量',
`item_information` text comment '物品信息',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (warehouse_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '仓库信息';
insert into `warehouse_information` values (1,'物品名称1','物品编号1','存放位置1',1,'此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehouse_information` values (2,'物品名称2','物品编号2','存放位置2',2,'此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehouse_information` values (3,'物品名称3','物品编号3','存放位置3',3,'此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehouse_information` values (4,'物品名称4','物品编号4','存放位置4',4,'此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehouse_information` values (5,'物品名称5','物品编号5','存放位置5',5,'此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehouse_information` values (6,'物品名称6','物品编号6','存放位置6',6,'此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehouse_information` values (7,'物品名称7','物品编号7','存放位置7',7,'此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehouse_information` values (8,'物品名称8','物品编号8','存放位置8',8,'此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');

DROP TABLE IF EXISTS `outbound_information`;
CREATE TABLE `outbound_information`(outbound_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '出库信息ID',
`item_name` varchar(64) comment '物品名称',
`serial_number` varchar(64) comment '物品编号',
`delivery_date` date comment '出库日期',
`outbound_quantity` varchar(64) comment '出库数量',
`outbound_employee` int(11) DEFAULT 0 comment '出库员工',
`employee_name` varchar(64) comment '员工姓名',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (outbound_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '出库信息';
insert into `outbound_information` values (1,'物品名称1','物品编号1','2023-03-27','出库数量1',0,'员工姓名1',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `outbound_information` values (2,'物品名称2','物品编号2','2023-03-27','出库数量2',0,'员工姓名2',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `outbound_information` values (3,'物品名称3','物品编号3','2023-03-27','出库数量3',0,'员工姓名3',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `outbound_information` values (4,'物品名称4','物品编号4','2023-03-27','出库数量4',0,'员工姓名4',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `outbound_information` values (5,'物品名称5','物品编号5','2023-03-27','出库数量5',0,'员工姓名5',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `outbound_information` values (6,'物品名称6','物品编号6','2023-03-27','出库数量6',0,'员工姓名6',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `outbound_information` values (7,'物品名称7','物品编号7','2023-03-27','出库数量7',0,'员工姓名7',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `outbound_information` values (8,'物品名称8','物品编号8','2023-03-27','出库数量8',0,'员工姓名8',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');

DROP TABLE IF EXISTS `warehousing_information`;
CREATE TABLE `warehousing_information`(warehousing_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '入库信息ID',
`item_name` varchar(64) comment '物品名称',
`serial_number` varchar(64) comment '物品编号',
`warehousing_date` date comment '入库日期',
`receipt_quantity` varchar(64) comment '入库数量',
`warehousing_employee` int(11) DEFAULT 0 comment '入库员工',
`employee_name` varchar(64) comment '员工姓名',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (warehousing_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '入库信息';
insert into `warehousing_information` values (1,'物品名称1','物品编号1','2023-03-27','入库数量1',0,'员工姓名1',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehousing_information` values (2,'物品名称2','物品编号2','2023-03-27','入库数量2',0,'员工姓名2',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehousing_information` values (3,'物品名称3','物品编号3','2023-03-27','入库数量3',0,'员工姓名3',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehousing_information` values (4,'物品名称4','物品编号4','2023-03-27','入库数量4',0,'员工姓名4',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehousing_information` values (5,'物品名称5','物品编号5','2023-03-27','入库数量5',0,'员工姓名5',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehousing_information` values (6,'物品名称6','物品编号6','2023-03-27','入库数量6',0,'员工姓名6',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehousing_information` values (7,'物品名称7','物品编号7','2023-03-27','入库数量7',0,'员工姓名7',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `warehousing_information` values (8,'物品名称8','物品编号8','2023-03-27','入库数量8',0,'员工姓名8',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');

DROP TABLE IF EXISTS `customer_information`;
CREATE TABLE `customer_information`(customer_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '客户信息ID',
`customer_name` varchar(64) comment '客户姓名',
`customer_gender` varchar(64) comment '客户性别',
`customer_address` varchar(64) comment '客户住址',
`contact_number` varchar(64) comment '联系电话',
`customer_information` text comment '客户信息',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (customer_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '客户信息';
insert into `customer_information` values (1,'客户姓名1','客户性别1','客户住址1','联系电话1','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `customer_information` values (2,'客户姓名2','客户性别2','客户住址2','联系电话2','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `customer_information` values (3,'客户姓名3','客户性别3','客户住址3','联系电话3','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `customer_information` values (4,'客户姓名4','客户性别4','客户住址4','联系电话4','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `customer_information` values (5,'客户姓名5','客户性别5','客户住址5','联系电话5','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `customer_information` values (6,'客户姓名6','客户性别6','客户住址6','联系电话6','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `customer_information` values (7,'客户姓名7','客户性别7','客户住址7','联系电话7','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');
insert into `customer_information` values (8,'客户姓名8','客户性别8','客户住址8','联系电话8','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-27 15:30:54','2023-03-27 15:30:54');

DROP TABLE IF EXISTS `notice_announcement`;
CREATE TABLE `notice_announcement`(notice_announcement_id int(11) NOT NULL AUTO_INCREMENT COMMENT '通知公告ID',
`announcement_title` varchar(64) comment '公告标题',
`announcement_no` varchar(64) comment '公告编号',
`release_date` date comment '发布日期',
`publisher` varchar(64) comment '发布人员',
`announcement_content` text comment '公告内容',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (notice_announcement_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '通知公告';
insert into `notice_announcement` values (1,'公告标题1','公告编号1','2023-03-27','发布人员1','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-27 15:30:55','2023-03-27 15:30:55');
insert into `notice_announcement` values (2,'公告标题2','公告编号2','2023-03-27','发布人员2','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-27 15:30:55','2023-03-27 15:30:55');
insert into `notice_announcement` values (3,'公告标题3','公告编号3','2023-03-27','发布人员3','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-27 15:30:55','2023-03-27 15:30:55');
insert into `notice_announcement` values (4,'公告标题4','公告编号4','2023-03-27','发布人员4','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-27 15:30:55','2023-03-27 15:30:55');
insert into `notice_announcement` values (5,'公告标题5','公告编号5','2023-03-27','发布人员5','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-27 15:30:55','2023-03-27 15:30:55');
insert into `notice_announcement` values (6,'公告标题6','公告编号6','2023-03-27','发布人员6','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-27 15:30:55','2023-03-27 15:30:55');
insert into `notice_announcement` values (7,'公告标题7','公告编号7','2023-03-27','发布人员7','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-27 15:30:55','2023-03-27 15:30:55');
insert into `notice_announcement` values (8,'公告标题8','公告编号8','2023-03-27','发布人员8','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-27 15:30:55','2023-03-27 15:30:55');

insert into `auth` values ('1','管理员','员工用户','employee_users','员工用户','/employee_users/table','','_blank','1','1','1','1','employee_name,employee_gender','employee_name,employee_gender','employee_name,employee_gender',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('2','管理员','员工用户','employee_users','员工用户详情','/employee_users/view','','_blank','1','1','1','1','employee_name,employee_gender','employee_name,employee_gender','employee_name,employee_gender',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('3','管理员','维修信息','service_information','维修信息','/service_information/table','','_blank','1','1','1','1','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('4','管理员','维修信息','service_information','维修信息详情','/service_information/view','','_blank','1','1','1','1','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('5','管理员','销售信息','sales_information','销售信息','/sales_information/table','','_blank','1','1','1','1','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('6','管理员','销售信息','sales_information','销售信息详情','/sales_information/view','','_blank','1','1','1','1','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('7','管理员','仓库信息','warehouse_information','仓库信息','/warehouse_information/table','','_blank','1','1','1','1','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information',null,'0','{"figure":true}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('8','管理员','仓库信息','warehouse_information','仓库信息详情','/warehouse_information/view','','_blank','1','1','1','1','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('9','管理员','出库信息','outbound_information','出库信息','/outbound_information/table','','_blank','1','1','1','1','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('10','管理员','出库信息','outbound_information','出库信息详情','/outbound_information/view','','_blank','1','1','1','1','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('11','管理员','入库信息','warehousing_information','入库信息','/warehousing_information/table','','_blank','1','1','1','1','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('12','管理员','入库信息','warehousing_information','入库信息详情','/warehousing_information/view','','_blank','1','1','1','1','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('13','管理员','客户信息','customer_information','客户信息','/customer_information/table','','_blank','1','1','1','1','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('14','管理员','客户信息','customer_information','客户信息详情','/customer_information/view','','_blank','1','1','1','1','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('15','管理员','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','1','1','1','1','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('16','管理员','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','1','1','1','1','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('17','管理员','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('18','管理员','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('19','管理员','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('20','管理员','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('21','游客','员工用户','employee_users','员工用户','/employee_users/table','','_blank','0','0','0','0','employee_name,employee_gender','employee_name,employee_gender','employee_name,employee_gender',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('22','游客','员工用户','employee_users','员工用户详情','/employee_users/view','','_blank','0','0','0','0','employee_name,employee_gender','employee_name,employee_gender','employee_name,employee_gender',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('23','游客','维修信息','service_information','维修信息','/service_information/table','','_blank','0','0','0','0','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('24','游客','维修信息','service_information','维修信息详情','/service_information/view','','_blank','0','0','0','0','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('25','游客','销售信息','sales_information','销售信息','/sales_information/table','','_blank','0','0','0','0','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('26','游客','销售信息','sales_information','销售信息详情','/sales_information/view','','_blank','0','0','0','0','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('27','游客','仓库信息','warehouse_information','仓库信息','/warehouse_information/table','','_blank','0','0','0','0','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information',null,'0','{"figure":false}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('28','游客','仓库信息','warehouse_information','仓库信息详情','/warehouse_information/view','','_blank','0','0','0','0','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('29','游客','出库信息','outbound_information','出库信息','/outbound_information/table','','_blank','0','0','0','0','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('30','游客','出库信息','outbound_information','出库信息详情','/outbound_information/view','','_blank','0','0','0','0','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('31','游客','入库信息','warehousing_information','入库信息','/warehousing_information/table','','_blank','0','0','0','0','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('32','游客','入库信息','warehousing_information','入库信息详情','/warehousing_information/view','','_blank','0','0','0','0','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('33','游客','客户信息','customer_information','客户信息','/customer_information/table','','_blank','0','0','0','0','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('34','游客','客户信息','customer_information','客户信息详情','/customer_information/view','','_blank','0','0','0','0','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('35','游客','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','0','0','0','0','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('36','游客','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','0','0','0','0','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('37','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('38','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('39','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('40','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('41','员工用户','员工用户','employee_users','员工用户','/employee_users/table','','_blank','0','0','0','1','employee_name,employee_gender','employee_name,employee_gender','employee_name,employee_gender',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('42','员工用户','员工用户','employee_users','员工用户详情','/employee_users/view','','_blank','0','0','0','0','employee_name,employee_gender','employee_name,employee_gender','employee_name,employee_gender',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('43','员工用户','维修信息','service_information','维修信息','/service_information/table','','_blank','1','0','0','1','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('44','员工用户','维修信息','service_information','维修信息详情','/service_information/view','','_blank','1','0','0','1','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes','vehicle_name,license_plate,repair_date,maintenance_staff,employee_name,maintenance_costs,fault_cause,maintenance_notes',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('45','员工用户','销售信息','sales_information','销售信息','/sales_information/table','','_blank','1','0','0','1','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('46','员工用户','销售信息','sales_information','销售信息详情','/sales_information/view','','_blank','1','0','0','1','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name','sales_date,vehicle_name,vehicle_unit_price,sales_volumes,sales_amount,sales_staff,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('47','员工用户','仓库信息','warehouse_information','仓库信息','/warehouse_information/table','','_blank','0','0','0','1','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information',null,'0','{"figure":true}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('48','员工用户','仓库信息','warehouse_information','仓库信息详情','/warehouse_information/view','','_blank','0','0','0','1','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information','item_name,serial_number,storage_location,item_quantity,item_information',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('49','员工用户','出库信息','outbound_information','出库信息','/outbound_information/table','','_blank','1','0','0','1','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('50','员工用户','出库信息','outbound_information','出库信息详情','/outbound_information/view','','_blank','1','0','0','1','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name','item_name,serial_number,delivery_date,outbound_quantity,outbound_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('51','员工用户','入库信息','warehousing_information','入库信息','/warehousing_information/table','','_blank','1','0','0','1','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('52','员工用户','入库信息','warehousing_information','入库信息详情','/warehousing_information/view','','_blank','1','0','0','1','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name','item_name,serial_number,warehousing_date,receipt_quantity,warehousing_employee,employee_name',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('53','员工用户','客户信息','customer_information','客户信息','/customer_information/table','','_blank','1','0','0','1','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('54','员工用户','客户信息','customer_information','客户信息详情','/customer_information/view','','_blank','1','0','0','1','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information','customer_name,customer_gender,customer_address,contact_number,customer_information',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('55','员工用户','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','0','0','0','1','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('56','员工用户','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','0','0','0','1','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content','announcement_title,announcement_no,release_date,publisher,announcement_content',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('57','员工用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('58','员工用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('59','员工用户','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `auth` values ('60','员工用户','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
insert into `user_group` values ('3','100','员工用户',null,'employee_users','employee_users_id','0','0','2023-03-27 15:30:55.0','2023-03-27 15:30:55.0');
