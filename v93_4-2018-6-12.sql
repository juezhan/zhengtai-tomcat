/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : v93_4

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-06-12 23:36:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jc_account_draw
-- ----------------------------
DROP TABLE IF EXISTS `jc_account_draw`;
CREATE TABLE `jc_account_draw` (
  `account_draw_id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '提现申请者',
  `apply_account` varchar(100) DEFAULT '' COMMENT '申请账户（微信号或支付宝账户）',
  `apply_amount` double NOT NULL DEFAULT '0' COMMENT '提现申请金额',
  `apply_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '处理状态(0申请中 1申请成功待支付 2申请失败 3提现成功)',
  `account_pay_id` int(11) DEFAULT NULL COMMENT '申请成功后支付ID',
  `apply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`account_draw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户提现申请';

-- ----------------------------
-- Records of jc_account_draw
-- ----------------------------

-- ----------------------------
-- Table structure for jc_account_pay
-- ----------------------------
DROP TABLE IF EXISTS `jc_account_pay`;
CREATE TABLE `jc_account_pay` (
  `account_pay_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `draw_num` varchar(50) NOT NULL DEFAULT '' COMMENT '内部流水号',
  `pay_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '支付者',
  `draw_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '提现者',
  `pay_account` varchar(100) NOT NULL DEFAULT '' COMMENT '支出账户',
  `draw_account` varchar(100) NOT NULL DEFAULT '' COMMENT '收入账户(微信账户名)',
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付时间',
  `weixin_num` varchar(100) DEFAULT NULL COMMENT '微信流水号',
  `alipay_num` varchar(100) DEFAULT NULL COMMENT '支付宝流水号',
  PRIMARY KEY (`account_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户提现支付';

-- ----------------------------
-- Records of jc_account_pay
-- ----------------------------

-- ----------------------------
-- Table structure for jc_acquisition
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition`;
CREATE TABLE `jc_acquisition` (
  `acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) NOT NULL COMMENT '采集名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) NOT NULL DEFAULT '0' COMMENT '当前号码',
  `curr_item` int(11) NOT NULL DEFAULT '0' COMMENT '当前条数',
  `total_item` int(11) NOT NULL DEFAULT '0' COMMENT '每页总条数',
  `pause_time` int(11) NOT NULL DEFAULT '0' COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) NOT NULL DEFAULT 'GBK' COMMENT '页面编码',
  `plan_list` longtext COMMENT '采集列表',
  `dynamic_addr` varchar(255) DEFAULT NULL COMMENT '动态地址',
  `dynamic_start` int(11) DEFAULT NULL COMMENT '页码开始',
  `dynamic_end` int(11) DEFAULT NULL COMMENT '页码结束',
  `linkset_start` varchar(255) DEFAULT NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) DEFAULT NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) DEFAULT NULL COMMENT '内容链接开始',
  `link_end` varchar(255) DEFAULT NULL COMMENT '内容链接结束',
  `title_start` varchar(255) DEFAULT NULL COMMENT '标题开始',
  `title_end` varchar(255) DEFAULT NULL COMMENT '标题结束',
  `keywords_start` varchar(255) DEFAULT NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) DEFAULT NULL COMMENT '关键字结束',
  `description_start` varchar(255) DEFAULT NULL COMMENT '描述开始',
  `description_end` varchar(255) DEFAULT NULL COMMENT '描述结束',
  `content_start` varchar(255) DEFAULT NULL COMMENT '内容开始',
  `content_end` varchar(255) DEFAULT NULL COMMENT '内容结束',
  `pagination_start` varchar(255) DEFAULT NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) DEFAULT NULL COMMENT '内容分页结束',
  `queue` int(11) NOT NULL DEFAULT '0' COMMENT '队列',
  `repeat_check_type` varchar(20) NOT NULL DEFAULT 'NONE' COMMENT '重复类型',
  `img_acqu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否采集图片',
  `content_prefix` varchar(255) DEFAULT NULL COMMENT '内容地址补全url',
  `img_prefix` varchar(255) DEFAULT NULL COMMENT '图片地址补全url',
  `view_start` varchar(255) DEFAULT NULL COMMENT '浏览量开始',
  `view_end` varchar(255) DEFAULT NULL COMMENT '浏览量结束',
  `view_id_start` varchar(255) DEFAULT NULL COMMENT 'id前缀',
  `view_id_end` varchar(255) DEFAULT NULL COMMENT 'id后缀',
  `view_link` varchar(255) DEFAULT NULL COMMENT '浏览量动态访问地址',
  `releaseTime_start` varchar(255) DEFAULT NULL COMMENT '发布时间开始',
  `releaseTime_end` varchar(255) DEFAULT NULL COMMENT '发布时间结束',
  `author_start` varchar(255) DEFAULT NULL COMMENT '作者开始',
  `author_end` varchar(255) DEFAULT NULL COMMENT '作者结束',
  `origin_start` varchar(255) DEFAULT NULL COMMENT '来源开始',
  `origin_end` varchar(255) DEFAULT NULL COMMENT '来源结束',
  `releaseTime_format` varchar(255) DEFAULT NULL COMMENT '发布时间格式',
  `origin_appoint` varchar(255) DEFAULT NULL COMMENT '指定来源',
  `def_type_img` tinyint(1) NOT NULL COMMENT '是否默认类型图0：否1：是',
  `type_img_start` varchar(255) DEFAULT NULL COMMENT '类型图开始',
  `type_img_end` varchar(255) DEFAULT NULL COMMENT '类型图结束',
  `content_page_prefix` varchar(255) DEFAULT NULL COMMENT '内容分页地址补全',
  `content_page_start` varchar(255) DEFAULT NULL COMMENT '内容分页开始',
  `content_page_end` varchar(255) DEFAULT NULL COMMENT '内容分页结束',
  `page_link_start` varchar(255) DEFAULT NULL COMMENT '内容分页链接开始',
  `page_link_end` varchar(255) DEFAULT NULL COMMENT '内容分页链接结束',
  PRIMARY KEY (`acquisition_id`),
  KEY `fk_jc_acquisition_channel` (`channel_id`),
  KEY `fk_jc_acquisition_contenttype` (`type_id`),
  KEY `fk_jc_acquisition_site` (`site_id`),
  KEY `fk_jc_acquisition_user` (`user_id`),
  CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS采集表';

-- ----------------------------
-- Records of jc_acquisition
-- ----------------------------
INSERT INTO `jc_acquisition` VALUES ('1', '1', '75', '1', '1', '测试采集', null, null, '0', '0', '0', '0', '500', 'UTF-8', 'http://roll.news.sina.com.cn/s/channel.php?ch=01#col=91&spec=&type=&ch=01&k=&offset_page=0&offset_num=0&num=60&asc=&page=3', '', '2', '10', '<div class=\"d_list_txt\" id=\"d_list\">', '<div class=\"pagebox\">', '<span class=\"c_tit\"><a href=\"', '\" target=\"_blank\">', '<meta property=\"og:title\" content=\"', '\" />', null, null, '', '', '<div class=\"article article_16\" id=\"artibody\">', '<p class=\"article-editor\">', null, null, '0', 'NONE', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yyyy-MM-dd HH:mm:ss', '', '0', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for jc_acquisition_history
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_history`;
CREATE TABLE `jc_acquisition_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `acquisition_id` int(11) DEFAULT NULL COMMENT '采集源',
  `content_id` int(11) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`history_id`),
  KEY `fk_acquisition_history_acquisition` (`acquisition_id`),
  CONSTRAINT `fk_jc_history_acquisition` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集历史记录表';

-- ----------------------------
-- Records of jc_acquisition_history
-- ----------------------------

-- ----------------------------
-- Table structure for jc_acquisition_replace
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_replace`;
CREATE TABLE `jc_acquisition_replace` (
  `replace_id` int(11) NOT NULL AUTO_INCREMENT,
  `acquisition_id` int(11) NOT NULL,
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `replace_word` varchar(255) DEFAULT NULL COMMENT '替换词',
  PRIMARY KEY (`replace_id`),
  KEY `fk_jc_acquisition_replace` (`acquisition_id`),
  CONSTRAINT `fk_jc_acquisition_replace` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集内容替换';

-- ----------------------------
-- Records of jc_acquisition_replace
-- ----------------------------

-- ----------------------------
-- Table structure for jc_acquisition_shield
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_shield`;
CREATE TABLE `jc_acquisition_shield` (
  `shield_id` int(11) NOT NULL AUTO_INCREMENT,
  `acquisition_id` int(11) NOT NULL,
  `shield_start` varchar(255) DEFAULT NULL COMMENT '屏蔽开始',
  `shield_end` varchar(255) DEFAULT NULL COMMENT '屏蔽结束',
  PRIMARY KEY (`shield_id`),
  KEY `fk_jc_acquisition_shield` (`acquisition_id`),
  CONSTRAINT `fk_jc_acquisition_shield` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集内容屏蔽';

-- ----------------------------
-- Records of jc_acquisition_shield
-- ----------------------------

-- ----------------------------
-- Table structure for jc_acquisition_temp
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_temp`;
CREATE TABLE `jc_acquisition_temp` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `finish_percent` int(3) NOT NULL DEFAULT '0' COMMENT '百分比',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `seq` int(3) NOT NULL DEFAULT '0' COMMENT '顺序',
  PRIMARY KEY (`temp_id`),
  KEY `fk_jc_temp_site` (`site_id`),
  CONSTRAINT `fk_jc_temp_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集进度临时表';

-- ----------------------------
-- Records of jc_acquisition_temp
-- ----------------------------

-- ----------------------------
-- Table structure for jc_advertising
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising`;
CREATE TABLE `jc_advertising` (
  `advertising_id` int(11) NOT NULL AUTO_INCREMENT,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '广告名称',
  `category` varchar(50) NOT NULL COMMENT '广告类型',
  `ad_code` longtext COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL DEFAULT '1' COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`advertising_id`),
  KEY `fk_jc_advertising_site` (`site_id`),
  KEY `fk_jc_space_advertising` (`adspace_id`),
  CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `jc_advertising_space` (`adspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS广告表';

-- ----------------------------
-- Records of jc_advertising
-- ----------------------------
INSERT INTO `jc_advertising` VALUES ('1', '1', '1', 'www.jeecms.com', 'text', null, '1', '0', '0', null, null, '1');

-- ----------------------------
-- Table structure for jc_advertising_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_attr`;
CREATE TABLE `jc_advertising_attr` (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_params_advertising` (`advertising_id`),
  CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `jc_advertising` (`advertising_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS广告属性表';

-- ----------------------------
-- Records of jc_advertising_attr
-- ----------------------------
INSERT INTO `jc_advertising_attr` VALUES ('1', 'text_title', 'www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'text_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'text_link', 'http://www.jeecms.com');

-- ----------------------------
-- Table structure for jc_advertising_space
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_space`;
CREATE TABLE `jc_advertising_space` (
  `adspace_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_enabled` char(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`adspace_id`),
  KEY `fk_jc_adspace_site` (`site_id`),
  CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS广告版位表';

-- ----------------------------
-- Records of jc_advertising_space
-- ----------------------------
INSERT INTO `jc_advertising_space` VALUES ('1', '1', '1', '111', '1');

-- ----------------------------
-- Table structure for jc_api_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_account`;
CREATE TABLE `jc_api_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'appId',
  `app_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'appKey',
  `aes_key` varchar(100) NOT NULL DEFAULT '' COMMENT 'AES加解密密钥',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `iv_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'AES iv key',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认管理后台API账户',
  `limit_single_device` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制单设备同时登陆',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='API应用账户';

-- ----------------------------
-- Records of jc_api_account
-- ----------------------------
INSERT INTO `jc_api_account` VALUES ('1', '1580387213331704', 'Sd6qkHm9o4LaVluYRX5pUFyNuiu2a8oi', 'S9u978Q31NGPGc5H', '0', 'X83yESM9iShLxfwS', '1', '0');

-- ----------------------------
-- Table structure for jc_api_info
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_info`;
CREATE TABLE `jc_api_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) NOT NULL DEFAULT '' COMMENT '接口名称',
  `api_url` varchar(255) NOT NULL DEFAULT '' COMMENT '接口URL',
  `api_code` varchar(50) NOT NULL DEFAULT '' COMMENT '接口代码',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `limit_call_day` int(11) NOT NULL DEFAULT '0' COMMENT '每日限制调用次数(0无限制)',
  `call_total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总调用次数',
  `call_month_count` int(11) NOT NULL DEFAULT '0' COMMENT '月调用次数',
  `call_week_count` int(11) NOT NULL DEFAULT '0' COMMENT '周调用次数',
  `call_day_count` int(11) NOT NULL DEFAULT '0' COMMENT '日调用次数',
  `last_call_time` timestamp NULL DEFAULT NULL COMMENT '最后一次调用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='API接口信息';

-- ----------------------------
-- Records of jc_api_info
-- ----------------------------
INSERT INTO `jc_api_info` VALUES ('1', '栏目列表', '/api/channel/list.jspx', '010101', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('2', '单个栏目', '/api/channel/get.jspx', '010102', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('3', '新增栏目', '/api/channel/save.jspx', '010103', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('4', '修改栏目', '/api/channel/update.jspx', '010104', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('5', '内容列表', '/api/content/list.jspx', '010201', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('6', '内容获取', '/api/content/get.jspx', '010202', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('7', '我的内容', '/api/content/mycontents.jspx', '010203', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('8', '新增内容', '/api/content/save.jspx', '010204', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('9', '修改内容', '/api/content/update.jspx', '010205', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('10', '删除内容到回收站', '/api/content/del.jspx', '010206', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('11', '还原内容', '/api/content/recycle.jspx', '010207', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('12', '审核内容', '/api/content/check.jspx', '010208', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('13', '退回内容', '/api/content/reject.jspx', '010209', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('14', '顶内容', '/api/content/up.jspx', '010210', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('15', '踩内容', '/api/content/down.jspx', '010211', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('16', '内容购买', '/api/content/buy.jspx', '010212', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('17', '内容打赏', '/api/content/reward.jspx', '010213', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('18', '内容收藏', '/api/content/collect.jspx', '010301', '0', '0', '1', '1', '1', '1', '2017-10-27 14:46:10');
INSERT INTO `jc_api_info` VALUES ('19', '我的收藏', '/api/content/mycollect.jspx', '010302', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('20', '专题列表', '/api/topic/list.jspx', '010401', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('21', '专题获取', '/api/topic/get.jspx', '010402', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('22', '专题保存', '/api/topic/save.jspx', '010403', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('23', '专题修改', '/api/topic/update.jspx', '040404', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('24', '全文检索', '/api/content/search.jspx', '010501', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('25', 'Tag列表', '/api/contenttag/list.jspx', '010601', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('26', '热词列表', '/api/searchword/list.jspx', '010701', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('27', '友情链接列表', '/api/friendlink/list.jspx', '010801', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('28', '友情链接分类列表', '/api/friendlinkctg/list.jspx', '010802', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('29', '广告列表', '/api/ad/list.jspx', '010901', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('30', '广告分类列表', '/api/adctg/list.jspx', '010902', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('31', '单广告获取', '/api/ad/get.jspx', '010903', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('32', '评论列表', '/api/comment/list.jspx', '011001', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('33', '单评论获取', '/api/comment/get.jspx', '011002', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('34', '发布评论', '/api/comment/save.jspx', '011003', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('35', '评论顶', '/comment_up.jspx', '011004', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('36', '评论踩', '/comment_down.jspx', '011005', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('37', '我的评论', '/api/comment/mylist.jspx', '011006', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('38', '留言列表', '/api/guestbook/list.jspx', '011101', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('39', '我的留言', '/api/guestbook/mylist.jspx', '011102', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('40', '留言分类列表', '/api/guestbookctg/list.jspx', '011103', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('41', '单留言获取', '/api/guestbook/get.jspx', '011104', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('42', '发布留言', '/api/guestbook/save.jspx', '011105', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('43', '投票列表', '/api/vote/list.jspx', '011201', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('44', '单个投票', '/api/vote/get.jspx', '011202', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('45', '投票', '/api/vote/save.jspx', '011203', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('46', '新增会员', '/api/user/add.jspx', '011301', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('47', '会员修改资料', '/api/user/edit.jspx', '011302', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('48', '用户修改密码', '/api/user/pwd.jspx', '011303', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('49', '读取用户信息', '/api/user/get.jspx', '011304', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('50', '用户名唯一性检查', '/username_unique.jspx', '011305', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('51', '字典列表', '/api/dictionary/list.jspx', '011401', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('52', '我的职位申请', '/api/resume/myapplys.jspx', '011501', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('53', '申请职位', '/api/resume/apply.jspx', '011502', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('54', '撤销申请', '/api/resume/cancelApply.jspx', '011503', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('55', '查看我的简历', '/api/resume/get.jspx', '011601', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('56', '修改简历', '/api/resume/update.jspx', '011602', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('57', '站内信列表', '/api/message/list.jspx', '011701', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('58', '站内信单信息获取', '/api/message/get.jspx', '011702', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('59', '站内信息发送', '/api/message/send.jspx', '011703', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('60', '站内信草稿修改', '/api/message/draftUpdate.jspx', '011703', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('61', '站内信草稿发送', '/api/message/draftToSend.jspx', '011704', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('62', '删除站内信到回收站', '/api/message/trash.jspx', '011705', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('63', '还原站内信息', '/api/message/revert.jspx', '011706', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('64', '删除站内信', '/api/message/delete.jspx', '011707', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('65', '上传文件', '/api/upload/o_upload.jspx', '011801', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('66', '上传文库文档', '/api/upload/o_upload_doc.jspx', '011802', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('67', '内容打赏记录', '/api/order/getByContent.jspx', '011901', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('68', '我的消费记录和我的订单', '/api/order/myorders.jspx', '011902', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('69', '收益统计', '/api/order/chargelist.jspx', '011903', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('70', '提现申请', '/api/draw/apply.jspx', '011904', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('71', '删除提现申请', '/api/draw/delete.jspx', '011905', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('72', '提现申请列表', '/api/draw/list.jspx', '011906', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('73', '个人账户信息获取', '/api/account/get.jspx', '011907', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('74', '登陆', '/api/user/login.jspx', '012001', '0', '0', '2', '2', '2', '2', '2017-10-27 14:46:01');
INSERT INTO `jc_api_info` VALUES ('75', '退出', '/api/user/logout.jspx', '012002', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('76', '用户状态检查', '/api/user/getStatus.jspx', '012003', '0', '0', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for jc_api_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_record`;
CREATE TABLE `jc_api_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_account` int(11) NOT NULL DEFAULT '0' COMMENT '调用的账户',
  `call_ip` varchar(255) DEFAULT '' COMMENT '调用的IP',
  `api_info_id` int(11) DEFAULT '0' COMMENT '接口',
  `api_call_time` datetime NOT NULL COMMENT '调用时间',
  `call_time_stamp` bigint(20) NOT NULL DEFAULT '0' COMMENT '调用的时间戳',
  `sign` varchar(100) NOT NULL DEFAULT '' COMMENT '签名数据(不允许重复调用)',
  PRIMARY KEY (`id`),
  KEY `fk_api_record_account` (`api_account`),
  KEY `fk_api_info` (`api_info_id`),
  KEY `index_jc_api_record_sign` (`sign`),
  CONSTRAINT `fk_api_info` FOREIGN KEY (`api_info_id`) REFERENCES `jc_api_info` (`id`),
  CONSTRAINT `fk_api_record_account` FOREIGN KEY (`api_account`) REFERENCES `jc_api_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=935 DEFAULT CHARSET=utf8 COMMENT='API调用记录';

-- ----------------------------
-- Records of jc_api_record
-- ----------------------------
INSERT INTO `jc_api_record` VALUES ('100', '1', '127.0.0.1', null, '2018-03-24 21:59:41', '1521899980863', '1846D90124F43DE40EC86F6E77F7FC0F');
INSERT INTO `jc_api_record` VALUES ('101', '1', '127.0.0.1', null, '2018-03-24 22:04:04', '1521900243541', '55ECE370D5122961590F358731CC256A');
INSERT INTO `jc_api_record` VALUES ('102', '1', '127.0.0.1', null, '2018-03-24 22:08:21', '1521900501077', '665B225F4A4E14C698F5D2641C8B04C5');
INSERT INTO `jc_api_record` VALUES ('103', '1', '127.0.0.1', null, '2018-03-24 22:10:50', '1521900649899', 'AD5E75464637F57B75EF47C92642724B');
INSERT INTO `jc_api_record` VALUES ('104', '1', '127.0.0.1', null, '2018-03-24 22:10:59', '1521900659489', '4557564366F6A0CE8E7F880D1372AB8C');
INSERT INTO `jc_api_record` VALUES ('105', '1', '127.0.0.1', null, '2018-03-24 22:12:34', '1521900753863', '14B4A61FA8E73FCB6C7C140A8ED6A7A8');
INSERT INTO `jc_api_record` VALUES ('106', '1', '127.0.0.1', null, '2018-03-24 22:18:19', '1521901099130', 'A5A19393C05085549CBDF6AB3794B79E');
INSERT INTO `jc_api_record` VALUES ('107', '1', '127.0.0.1', null, '2018-03-24 22:20:04', '1521901204128', '85EEF5312C0E9DD8B119ED87B001A24B');
INSERT INTO `jc_api_record` VALUES ('108', '1', '127.0.0.1', null, '2018-03-24 22:21:35', '1521901294766', '45CCC0A0C3E9FE3C26CD6CBD01F0B8D9');
INSERT INTO `jc_api_record` VALUES ('109', '1', '127.0.0.1', null, '2018-03-24 22:29:24', '1521901763820', '80D503A26995A543AAF714EA27DEDFED');
INSERT INTO `jc_api_record` VALUES ('110', '1', '127.0.0.1', null, '2018-03-24 22:31:53', '1521901913413', '369A884C135628199BEC142A9DED9888');
INSERT INTO `jc_api_record` VALUES ('111', '1', '127.0.0.1', null, '2018-03-24 22:33:04', '1521901983918', 'DD4545B9579E9A8832155C800C304703');
INSERT INTO `jc_api_record` VALUES ('112', '1', '127.0.0.1', null, '2018-03-24 22:33:34', '1521902013928', 'CEA0FEF3964CEDAA5701EE2E7AF114CD');
INSERT INTO `jc_api_record` VALUES ('113', '1', '127.0.0.1', null, '2018-03-24 22:36:02', '1521902161999', 'E4455FBC82B0768AF9A3FB3342845F95');
INSERT INTO `jc_api_record` VALUES ('114', '1', '127.0.0.1', null, '2018-03-24 22:36:29', '1521902189038', '13E05B2FC4A5C7177466C19FB60BF67B');
INSERT INTO `jc_api_record` VALUES ('115', '1', '127.0.0.1', null, '2018-03-24 22:38:25', '1521902305049', 'CE26A60F3E24311A7EA39A47431CE15D');
INSERT INTO `jc_api_record` VALUES ('116', '1', '127.0.0.1', null, '2018-03-24 22:38:39', '1521902318683', '6F6C42F1239129455DA1B7E5AA141E82');
INSERT INTO `jc_api_record` VALUES ('117', '1', '127.0.0.1', null, '2018-03-24 22:38:47', '1521902327443', '2914D306C753976F16C6A01709BD27CF');
INSERT INTO `jc_api_record` VALUES ('118', '1', '127.0.0.1', null, '2018-03-24 22:38:57', '1521902336738', '409DE73D929ED6814D46BCAB8C265E1C');
INSERT INTO `jc_api_record` VALUES ('119', '1', '127.0.0.1', null, '2018-03-24 22:39:06', '1521902346044', '5B7847797D645C5BD0FD3FB747FF5671');
INSERT INTO `jc_api_record` VALUES ('120', '1', '127.0.0.1', null, '2018-03-24 22:39:12', '1521902352092', '3B18E91A1946D9F8768793E2CD789C5B');
INSERT INTO `jc_api_record` VALUES ('121', '1', '127.0.0.1', null, '2018-03-24 22:39:48', '1521902387937', '9BD411E5CEB7EFA5E0B3DC14B9634176');
INSERT INTO `jc_api_record` VALUES ('122', '1', '127.0.0.1', null, '2018-03-24 22:40:04', '1521902403692', 'B53C6564845D90D3B594215476C1A15D');
INSERT INTO `jc_api_record` VALUES ('123', '1', '127.0.0.1', null, '2018-03-24 22:40:14', '1521902414350', 'D6F95BD7A9A07FB7886E84CE3F5DA9D2');
INSERT INTO `jc_api_record` VALUES ('124', '1', '127.0.0.1', null, '2018-03-24 22:40:21', '1521902420585', '3FA60263E444924AAC1650AA0ACF4043');
INSERT INTO `jc_api_record` VALUES ('125', '1', '127.0.0.1', null, '2018-03-24 22:40:34', '1521902434278', 'D4FFB2C778EE8359D49BB30142F1D726');
INSERT INTO `jc_api_record` VALUES ('126', '1', '127.0.0.1', null, '2018-03-24 22:40:41', '1521902441492', '0683DA819219DC14210914E9B09645E0');
INSERT INTO `jc_api_record` VALUES ('127', '1', '127.0.0.1', null, '2018-03-24 22:40:49', '1521902448758', '00C1962E1247467CF3C76A1143F2B142');
INSERT INTO `jc_api_record` VALUES ('128', '1', '127.0.0.1', null, '2018-03-24 22:40:55', '1521902455051', 'FD53D92438EAB80B59EED93DD08E97DE');
INSERT INTO `jc_api_record` VALUES ('129', '1', '127.0.0.1', null, '2018-03-24 22:41:17', '1521902476580', '1A01C71EFE4A648C46AE1586369F6484');
INSERT INTO `jc_api_record` VALUES ('130', '1', '127.0.0.1', null, '2018-03-24 22:42:29', '1521902548871', 'DBD7970A9A7F5B54BA17D9417B67BF22');
INSERT INTO `jc_api_record` VALUES ('131', '1', '127.0.0.1', null, '2018-03-24 22:43:54', '1521902634091', 'B7D13E84F918A3538BD93BBEEF1F9357');
INSERT INTO `jc_api_record` VALUES ('132', '1', '127.0.0.1', null, '2018-03-24 22:44:20', '1521902659920', '6A22C0BE8B01F9A0A4EAF452D200E2D8');
INSERT INTO `jc_api_record` VALUES ('133', '1', '127.0.0.1', null, '2018-03-24 22:45:22', '1521902721700', '1A24D00019AB63008AEAC8180211E723');
INSERT INTO `jc_api_record` VALUES ('134', '1', '127.0.0.1', null, '2018-03-24 22:46:46', '1521902805948', '219942A3924CC800F0BDCA283A6206E3');
INSERT INTO `jc_api_record` VALUES ('135', '1', '127.0.0.1', null, '2018-03-24 22:47:08', '1521902827605', 'A897CA0E57BA0A41BEE276852ED58D0E');
INSERT INTO `jc_api_record` VALUES ('136', '1', '127.0.0.1', null, '2018-03-24 22:49:09', '1521902949126', 'A275B527BB303851BFD92903BE04159A');
INSERT INTO `jc_api_record` VALUES ('137', '1', '127.0.0.1', null, '2018-03-24 22:50:57', '1521903057059', '15E98813D1E1FCB9C132FCFF147FCBAF');
INSERT INTO `jc_api_record` VALUES ('138', '1', '127.0.0.1', null, '2018-03-24 22:52:31', '1521903150692', 'E72FFF8F44BA3029630360D1C05F35E1');
INSERT INTO `jc_api_record` VALUES ('139', '1', '127.0.0.1', null, '2018-03-24 22:53:33', '1521903213013', '4B222FE2194364BD44AC4F43B1E70A7D');
INSERT INTO `jc_api_record` VALUES ('140', '1', '127.0.0.1', null, '2018-03-24 22:53:46', '1521903225946', '048B944D43A50D43BDDE53BADAE2E710');
INSERT INTO `jc_api_record` VALUES ('141', '1', '127.0.0.1', null, '2018-03-24 22:55:28', '1521903328138', '2F704BA0EB60B9C10800EB6F86B1596E');
INSERT INTO `jc_api_record` VALUES ('142', '1', '127.0.0.1', null, '2018-03-24 22:55:55', '1521903355141', '0BDF6F8072D1F1F1BF55BB51E6F2E7AD');
INSERT INTO `jc_api_record` VALUES ('143', '1', '127.0.0.1', null, '2018-03-24 22:57:22', '1521903441962', 'DDD3E5F8BF2C7CBD20461BEEAC50C6E8');
INSERT INTO `jc_api_record` VALUES ('144', '1', '127.0.0.1', null, '2018-03-24 22:58:55', '1521903535190', '4714746E7B42241C653DCBF3FAFC476D');
INSERT INTO `jc_api_record` VALUES ('145', '1', '127.0.0.1', null, '2018-03-24 22:59:20', '1521903559878', '2E2FB5C1A386A537DE9823A55AD37036');
INSERT INTO `jc_api_record` VALUES ('146', '1', '127.0.0.1', null, '2018-03-24 23:00:41', '1521903641399', 'BEC1FC55C96027DBBFFECD52CAF4D308');
INSERT INTO `jc_api_record` VALUES ('147', '1', '127.0.0.1', null, '2018-03-24 23:02:14', '1521903733521', 'CFC673C43847F956C4CBF4BD588D0094');
INSERT INTO `jc_api_record` VALUES ('148', '1', '127.0.0.1', null, '2018-03-24 23:03:09', '1521903788686', 'FD39A51578D67A85614C2947C0A44E71');
INSERT INTO `jc_api_record` VALUES ('149', '1', '127.0.0.1', null, '2018-03-24 23:03:32', '1521903811639', 'AE5EF912BE1C025854B8518519071D96');
INSERT INTO `jc_api_record` VALUES ('150', '1', '127.0.0.1', null, '2018-03-24 23:04:58', '1521903898422', '0B7A408A5DBA71A7EE1D6ACFC9D90270');
INSERT INTO `jc_api_record` VALUES ('151', '1', '127.0.0.1', null, '2018-03-24 23:05:46', '1521903946038', '92D175B727EDFECE4853D3C3177CBA98');
INSERT INTO `jc_api_record` VALUES ('152', '1', '127.0.0.1', null, '2018-03-24 23:06:42', '1521904001724', 'BE5E8DCB989D0BCE0F5408B53882808A');
INSERT INTO `jc_api_record` VALUES ('153', '1', '127.0.0.1', null, '2018-03-24 23:10:06', '1521904206037', '84C1780BCE46026F02A5C22AD409C333');
INSERT INTO `jc_api_record` VALUES ('154', '1', '127.0.0.1', null, '2018-03-24 23:12:15', '1521904335382', '07E8E8E804D178CDD11A4BDF65C7FD5F');
INSERT INTO `jc_api_record` VALUES ('155', '1', '127.0.0.1', null, '2018-03-24 23:13:19', '1521904398854', 'BAADB47FD6702B48AF5FE248BB3822B6');
INSERT INTO `jc_api_record` VALUES ('156', '1', '127.0.0.1', null, '2018-03-24 23:14:50', '1521904490098', '7DB5E6C89E33D193BD6017E535DB6B1C');
INSERT INTO `jc_api_record` VALUES ('157', '1', '127.0.0.1', null, '2018-03-24 23:16:30', '1521904590300', '0DC35046C7303C02CDD87CC2D83439E6');
INSERT INTO `jc_api_record` VALUES ('158', '1', '127.0.0.1', null, '2018-03-24 23:17:36', '1521904656072', 'EB7D0430187E382608FC4F0F74305EB2');
INSERT INTO `jc_api_record` VALUES ('159', '1', '127.0.0.1', null, '2018-03-24 23:18:47', '1521904726802', 'E5DAF1ADC321E9A3534C03AB8BE492D3');
INSERT INTO `jc_api_record` VALUES ('160', '1', '127.0.0.1', null, '2018-03-24 23:20:26', '1521904825606', '8F66D6FB3B36762D66EB2097164DBA28');
INSERT INTO `jc_api_record` VALUES ('161', '1', '127.0.0.1', null, '2018-03-24 23:21:20', '1521904879854', '7C460B24DA3D9B95460D0790427B3F43');
INSERT INTO `jc_api_record` VALUES ('162', '1', '127.0.0.1', null, '2018-03-24 23:23:44', '1521905023564', '7E0ED1B1AB8AB504BA82067024097A87');
INSERT INTO `jc_api_record` VALUES ('163', '1', '127.0.0.1', null, '2018-03-24 23:24:54', '1521905093914', '867106A436DB3EF180F315AB2D66DDE9');
INSERT INTO `jc_api_record` VALUES ('164', '1', '127.0.0.1', null, '2018-03-24 23:26:57', '1521905217145', '8A62B9BA79E31415C36311F4E591EBD7');
INSERT INTO `jc_api_record` VALUES ('165', '1', '127.0.0.1', null, '2018-03-24 23:32:27', '1521905547120', '3912EF5C1B41CCB1FFA393D8110D5765');
INSERT INTO `jc_api_record` VALUES ('166', '1', '127.0.0.1', null, '2018-03-24 23:33:25', '1521905605062', '9702528F16F9376F7921F92EEA139329');
INSERT INTO `jc_api_record` VALUES ('167', '1', '127.0.0.1', null, '2018-03-24 23:34:09', '1521905648638', 'BDDB1B7F7E11058D31E1A07C2E78198F');
INSERT INTO `jc_api_record` VALUES ('168', '1', '127.0.0.1', null, '2018-03-24 23:34:59', '1521905699356', 'CAFB379D5621333915C00EA12AA7FE3A');
INSERT INTO `jc_api_record` VALUES ('169', '1', '127.0.0.1', null, '2018-03-24 23:36:35', '1521905794713', '0523042979E59C73FD6F1B47119BB7CF');
INSERT INTO `jc_api_record` VALUES ('170', '1', '127.0.0.1', null, '2018-03-24 23:38:38', '1521905917786', '513870233726C5CEA1127F411EB98424');
INSERT INTO `jc_api_record` VALUES ('171', '1', '127.0.0.1', null, '2018-03-24 23:39:57', '1521905996854', '2802B861503E402D8BDAD80B19EC58F1');
INSERT INTO `jc_api_record` VALUES ('172', '1', '127.0.0.1', null, '2018-03-24 23:40:07', '1521906006769', '745B1540D2DC854D096E4515B387D2E8');
INSERT INTO `jc_api_record` VALUES ('173', '1', '127.0.0.1', null, '2018-03-25 00:23:49', '1521908629475', '434B09577AB32E5259182C677C73E40A');
INSERT INTO `jc_api_record` VALUES ('174', '1', '127.0.0.1', null, '2018-03-25 00:25:45', '1521908744742', '89903CC997EDF8B7A61D20EF859646FE');
INSERT INTO `jc_api_record` VALUES ('175', '1', '127.0.0.1', null, '2018-03-25 01:09:49', '1521911388996', 'F7D0BB6A5CAD8AE7BC978CCE3E7D83C5');
INSERT INTO `jc_api_record` VALUES ('176', '1', '127.0.0.1', null, '2018-03-25 01:10:07', '1521911407289', '9A6B387693BC509C6447794284D67552');
INSERT INTO `jc_api_record` VALUES ('177', '1', '127.0.0.1', null, '2018-03-25 01:14:00', '1521911639598', '43CCF76B76604845AEA6004BD4B5F3B3');
INSERT INTO `jc_api_record` VALUES ('178', '1', '127.0.0.1', null, '2018-03-25 01:14:24', '1521911664069', '523CA47E85D9CB7AFB40697C3480E595');
INSERT INTO `jc_api_record` VALUES ('179', '1', '127.0.0.1', null, '2018-03-25 01:14:48', '1521911687896', '65C2D1B8D9F9EE96C6252F517FFB3E00');
INSERT INTO `jc_api_record` VALUES ('180', '1', '127.0.0.1', null, '2018-03-25 09:02:49', '1521939769320', '4A76B530358AE613EC8107B862872ABD');
INSERT INTO `jc_api_record` VALUES ('181', '1', '127.0.0.1', null, '2018-03-26 20:20:18', '1522066817841', 'D0429035D9C7B9A665A84DC7CB6DE006');
INSERT INTO `jc_api_record` VALUES ('182', '1', '127.0.0.1', null, '2018-03-26 20:26:56', '1522067215827', 'AF05E8C4AEAD4384BC7CFB3FD73CE427');
INSERT INTO `jc_api_record` VALUES ('183', '1', '127.0.0.1', null, '2018-03-26 20:28:03', '1522067283464', '57CB5169DE65540A5030521B975B24EE');
INSERT INTO `jc_api_record` VALUES ('184', '1', '127.0.0.1', null, '2018-03-26 20:39:03', '1522067942704', '2D0A48EA995854E37E61D9E4AE7A21E9');
INSERT INTO `jc_api_record` VALUES ('185', '1', '127.0.0.1', null, '2018-03-26 20:40:06', '1522068006009', 'AD8F3130A2C6CD6B16B4336ABAEF7A51');
INSERT INTO `jc_api_record` VALUES ('186', '1', '127.0.0.1', null, '2018-03-26 20:49:06', '1522068545997', 'F2A2F526A0B1E9EDBBABBAD8A9724275');
INSERT INTO `jc_api_record` VALUES ('187', '1', '127.0.0.1', null, '2018-03-27 20:05:29', '1522152328683', 'F038D8DC30DA603B9911AD124E9FC960');
INSERT INTO `jc_api_record` VALUES ('188', '1', '127.0.0.1', null, '2018-03-27 20:05:48', '1522152348490', '457E22F9F0F1ACBB50A39FD18310B3B5');
INSERT INTO `jc_api_record` VALUES ('189', '1', '127.0.0.1', null, '2018-03-27 20:22:31', '1522153351245', '45BE834D6CDE8F0DFFE5B4EB5D86002B');
INSERT INTO `jc_api_record` VALUES ('190', '1', '127.0.0.1', null, '2018-03-27 20:24:18', '1522153458032', '834CBCEE7ABD353C249597BE40AF251A');
INSERT INTO `jc_api_record` VALUES ('191', '1', '127.0.0.1', null, '2018-03-27 20:25:09', '1522153508601', '101F77D5326D9B2F84FE2812AF56DC8B');
INSERT INTO `jc_api_record` VALUES ('192', '1', '127.0.0.1', null, '2018-03-27 20:28:51', '1522153730702', 'AB30D74EE1039F7B30D9A6CE26561BC9');
INSERT INTO `jc_api_record` VALUES ('193', '1', '127.0.0.1', null, '2018-03-27 20:29:48', '1522153787945', '0CE62228D9483C1BE1A54FA4A96DDA26');
INSERT INTO `jc_api_record` VALUES ('194', '1', '127.0.0.1', null, '2018-03-27 20:30:24', '1522153824484', '70DB086A17EA2F66807DA4CB8D071DF3');
INSERT INTO `jc_api_record` VALUES ('195', '1', '127.0.0.1', null, '2018-03-27 20:31:29', '1522153888518', 'F6C076B9A6FEAC8285090C1B55515023');
INSERT INTO `jc_api_record` VALUES ('196', '1', '127.0.0.1', null, '2018-03-27 20:31:57', '1522153916524', '5FDC8C38E610404828C35EBE9D8F22D2');
INSERT INTO `jc_api_record` VALUES ('197', '1', '127.0.0.1', null, '2018-03-27 20:32:24', '1522153943851', '0E0734F132A4CB237F37DC386BC8122C');
INSERT INTO `jc_api_record` VALUES ('198', '1', '127.0.0.1', null, '2018-03-27 20:33:26', '1522154006316', '62F7A9D18682B62F1F4E40375D30809D');
INSERT INTO `jc_api_record` VALUES ('199', '1', '127.0.0.1', null, '2018-03-27 20:33:52', '1522154032117', 'C030F79945C01C2E66A9F00B020FE2F6');
INSERT INTO `jc_api_record` VALUES ('200', '1', '127.0.0.1', null, '2018-03-27 20:34:28', '1522154068138', '05B586C2452FA6B9A34499407BF04ED9');
INSERT INTO `jc_api_record` VALUES ('201', '1', '127.0.0.1', null, '2018-03-27 20:44:56', '1522154695544', 'E1DD5B18067EB5CCE65DDC6E9D2D6497');
INSERT INTO `jc_api_record` VALUES ('202', '1', '127.0.0.1', null, '2018-03-27 20:48:40', '1522154920333', '5DE55A13AA0F35D8508F2838B8B402F4');
INSERT INTO `jc_api_record` VALUES ('203', '1', '127.0.0.1', null, '2018-03-27 20:51:10', '1522155070247', '62DA9FAA9FE18040F50971B984ED110D');
INSERT INTO `jc_api_record` VALUES ('204', '1', '127.0.0.1', null, '2018-03-27 20:51:33', '1522155093081', '3B8B8441BD7C62C6BA242CDCA1216DCA');
INSERT INTO `jc_api_record` VALUES ('205', '1', '127.0.0.1', null, '2018-03-27 20:52:00', '1522155119946', 'E6002A41C0745D85458B8D6D8C33695B');
INSERT INTO `jc_api_record` VALUES ('206', '1', '127.0.0.1', null, '2018-03-27 20:52:34', '1522155153823', '2298C871289530F892D9CD3F6A2A74A9');
INSERT INTO `jc_api_record` VALUES ('207', '1', '127.0.0.1', null, '2018-03-27 20:53:15', '1522155195384', '78C330773C649D8D4FF3EB6BA678802D');
INSERT INTO `jc_api_record` VALUES ('208', '1', '127.0.0.1', null, '2018-03-27 20:57:25', '1522155444529', 'B96DECB1C7B6C81BC4F3E473A47F7006');
INSERT INTO `jc_api_record` VALUES ('209', '1', '127.0.0.1', null, '2018-03-27 20:59:40', '1522155580230', '7E8597B24E30D45668366C70DFB1B9B3');
INSERT INTO `jc_api_record` VALUES ('210', '1', '127.0.0.1', null, '2018-03-27 21:00:02', '1522155601642', '2B8078619954E13511347B2A440A625C');
INSERT INTO `jc_api_record` VALUES ('211', '1', '127.0.0.1', null, '2018-03-27 21:00:26', '1522155625856', '04B10302924135F4FFA4755A2ADCE612');
INSERT INTO `jc_api_record` VALUES ('212', '1', '127.0.0.1', null, '2018-03-27 21:00:47', '1522155647369', '30EFB2E72FADF7523CCD4CF852C4A1B8');
INSERT INTO `jc_api_record` VALUES ('213', '1', '127.0.0.1', null, '2018-03-27 21:01:03', '1522155662585', '8CCDF4E9D40ADC0D830E3AAF417ED266');
INSERT INTO `jc_api_record` VALUES ('214', '1', '127.0.0.1', null, '2018-03-27 21:01:16', '1522155675710', '7A9E7361E994F37723A5143BC4703EA0');
INSERT INTO `jc_api_record` VALUES ('215', '1', '127.0.0.1', null, '2018-03-27 21:01:44', '1522155704496', '3F675023430037FD3CDCEB74A838397A');
INSERT INTO `jc_api_record` VALUES ('216', '1', '127.0.0.1', null, '2018-03-27 21:09:10', '1522156150246', '4067FDC7BE02FD0EB4215996B8714C3C');
INSERT INTO `jc_api_record` VALUES ('217', '1', '127.0.0.1', null, '2018-03-27 21:09:27', '1522156166538', 'AFAEFBA33447BF046ABDCE66772C6A8A');
INSERT INTO `jc_api_record` VALUES ('218', '1', '127.0.0.1', null, '2018-03-27 21:09:40', '1522156179744', 'C9872963B05DC81390910F175D8F2D93');
INSERT INTO `jc_api_record` VALUES ('219', '1', '127.0.0.1', null, '2018-03-27 21:10:13', '1522156212613', '337D771A97ED974DDB905312BB77E0DB');
INSERT INTO `jc_api_record` VALUES ('220', '1', '127.0.0.1', null, '2018-03-27 21:10:50', '1522156250269', '1BF5AE93CFA737D3D20F192D711DB368');
INSERT INTO `jc_api_record` VALUES ('221', '1', '127.0.0.1', null, '2018-03-27 21:10:58', '1522156258493', '3BEAD9387D0CB5581D07EA13163CD2D6');
INSERT INTO `jc_api_record` VALUES ('222', '1', '127.0.0.1', null, '2018-03-27 21:11:21', '1522156280510', 'B51EEE858B890B0508CDF12B96EFD105');
INSERT INTO `jc_api_record` VALUES ('223', '1', '127.0.0.1', null, '2018-03-27 21:11:38', '1522156297853', '7DA65F74C6E855422E1B6864F237EE8B');
INSERT INTO `jc_api_record` VALUES ('224', '1', '127.0.0.1', null, '2018-03-27 21:11:57', '1522156316898', '402E1660E901768A48F97333374FFB58');
INSERT INTO `jc_api_record` VALUES ('225', '1', '127.0.0.1', null, '2018-03-27 21:12:08', '1522156328364', 'ADA29CB918AAD2A5700D6E7E37AF07BD');
INSERT INTO `jc_api_record` VALUES ('226', '1', '127.0.0.1', null, '2018-03-27 21:13:30', '1522156409549', '29F9F0011758B861D0DF124B43768B69');
INSERT INTO `jc_api_record` VALUES ('227', '1', '127.0.0.1', null, '2018-03-27 21:13:47', '1522156427090', '8C9E5986E144C1ECC11F8FE2984DB96A');
INSERT INTO `jc_api_record` VALUES ('228', '1', '127.0.0.1', null, '2018-03-27 21:14:01', '1522156441015', 'CA4312BA679D33557874DD6EBC32E26D');
INSERT INTO `jc_api_record` VALUES ('229', '1', '127.0.0.1', null, '2018-03-27 21:17:31', '1522156650580', 'A8EB4271D0F45287BC0EDF25B993473B');
INSERT INTO `jc_api_record` VALUES ('230', '1', '127.0.0.1', null, '2018-03-27 21:18:22', '1522156701581', 'AF6906D691E64BC32C9F5D8D3096CABC');
INSERT INTO `jc_api_record` VALUES ('231', '1', '127.0.0.1', null, '2018-03-27 21:18:40', '1522156719640', 'BE593333103211B12F404C15A9EAF2AB');
INSERT INTO `jc_api_record` VALUES ('232', '1', '127.0.0.1', null, '2018-03-27 21:18:59', '1522156738581', 'AA5C4F066DA6837F60730051F0A15C87');
INSERT INTO `jc_api_record` VALUES ('233', '1', '127.0.0.1', null, '2018-03-27 21:19:26', '1522156765757', 'F2CB9EFC9F14453EA0C594A91489C54D');
INSERT INTO `jc_api_record` VALUES ('234', '1', '127.0.0.1', null, '2018-03-27 21:28:39', '1522157319089', '677AC7B0081BA1E4CB3102884A95B517');
INSERT INTO `jc_api_record` VALUES ('235', '1', '127.0.0.1', null, '2018-03-27 21:43:56', '1522158236247', 'D7174742268A684DF536BF5C7983AB75');
INSERT INTO `jc_api_record` VALUES ('236', '1', '127.0.0.1', null, '2018-03-27 21:44:06', '1522158245991', 'B6164C65BF8654F77EF699B6B4C61CF9');
INSERT INTO `jc_api_record` VALUES ('237', '1', '127.0.0.1', null, '2018-03-27 21:44:15', '1522158254721', '365B2E2A2B9897C289181EB76941F3AC');
INSERT INTO `jc_api_record` VALUES ('238', '1', '127.0.0.1', null, '2018-03-27 21:47:57', '1522158476861', '94E63B18BCB6BC8AA4ADE413D72D6FC7');
INSERT INTO `jc_api_record` VALUES ('239', '1', '127.0.0.1', null, '2018-04-03 21:00:19', '1522760419508', 'EDB4E56FD03D90E46723B5B62A5F1CFD');
INSERT INTO `jc_api_record` VALUES ('240', '1', '127.0.0.1', null, '2018-04-03 22:05:58', '1522764358835', 'ADBD1E389805DF1CAE8B8185C2AB3624');
INSERT INTO `jc_api_record` VALUES ('241', '1', '127.0.0.1', null, '2018-04-03 22:06:43', '1522764403362', '2BA2C95CAFD34C50C614213627897D91');
INSERT INTO `jc_api_record` VALUES ('242', '1', '127.0.0.1', null, '2018-04-03 22:07:03', '1522764423189', '07CD7CCC4A7A2F2ECDA90CC86AC3B82E');
INSERT INTO `jc_api_record` VALUES ('243', '1', '127.0.0.1', null, '2018-04-03 22:07:32', '1522764452833', 'C31B7EB9BC5419B94CC0FCB5FBF9BBA5');
INSERT INTO `jc_api_record` VALUES ('244', '1', '127.0.0.1', null, '2018-04-03 22:08:31', '1522764511177', 'C5540B6A3813C7871AE0A2AEC68E5578');
INSERT INTO `jc_api_record` VALUES ('245', '1', '127.0.0.1', null, '2018-04-03 22:09:06', '1522764546797', 'EF397D14ABD6AA1A6CA895E0282B4856');
INSERT INTO `jc_api_record` VALUES ('246', '1', '127.0.0.1', null, '2018-04-03 22:09:36', '1522764576769', '671C0C44D90FB0228EC4CD7571D3DE3F');
INSERT INTO `jc_api_record` VALUES ('247', '1', '127.0.0.1', null, '2018-04-03 22:10:04', '1522764604257', 'A74BB87A754DC1A0D0FAB6D8C3438D78');
INSERT INTO `jc_api_record` VALUES ('248', '1', '127.0.0.1', null, '2018-04-03 22:10:34', '1522764634855', '29047C6FCDF5297224A17FD32EE34DD1');
INSERT INTO `jc_api_record` VALUES ('249', '1', '127.0.0.1', null, '2018-04-03 22:11:00', '1522764660316', '8CE7B67CBED8DBFF5F4E8831179EEA77');
INSERT INTO `jc_api_record` VALUES ('250', '1', '127.0.0.1', null, '2018-04-03 22:11:31', '1522764691438', '81BB7E5B15B131A0D3CF7830B9975B3C');
INSERT INTO `jc_api_record` VALUES ('251', '1', '127.0.0.1', null, '2018-04-03 22:21:19', '1522765279888', 'C512EFA5A594D97F1C1430ACF0856FDD');
INSERT INTO `jc_api_record` VALUES ('252', '1', '127.0.0.1', null, '2018-04-06 22:56:59', '1523026619789', 'C0467F5ED6580CF10906CF6867DABD64');
INSERT INTO `jc_api_record` VALUES ('253', '1', '127.0.0.1', null, '2018-04-06 23:19:19', '1523027959598', '943D7BBDBD86AA17F8689CAD39256C27');
INSERT INTO `jc_api_record` VALUES ('254', '1', '127.0.0.1', null, '2018-04-06 23:19:45', '1523027985647', '198A338C4BC7FBFAE923D3B54F75D6A6');
INSERT INTO `jc_api_record` VALUES ('255', '1', '127.0.0.1', null, '2018-04-06 23:20:01', '1523028001385', '9A9E86E2C5302B43A89CDDDF2FF6FCAC');
INSERT INTO `jc_api_record` VALUES ('256', '1', '127.0.0.1', null, '2018-04-06 23:20:17', '1523028017637', '41ABCEEA095CC2CF4C660609DCEC7D46');
INSERT INTO `jc_api_record` VALUES ('257', '1', '127.0.0.1', null, '2018-04-06 23:20:51', '1523028051986', 'EFE44BDF76E81E5417E57884CB36CBE0');
INSERT INTO `jc_api_record` VALUES ('258', '1', '127.0.0.1', null, '2018-04-06 23:20:53', '1523028053380', 'C5D0057A0D955F1A9D279404B54C9D67');
INSERT INTO `jc_api_record` VALUES ('259', '1', '127.0.0.1', null, '2018-04-06 23:21:45', '1523028105671', 'D5666F8A32ED572A22910F02832D410E');
INSERT INTO `jc_api_record` VALUES ('260', '1', '127.0.0.1', null, '2018-04-06 23:22:02', '1523028122767', '7B57CE2CD73DA827CC7FB2F49F437058');
INSERT INTO `jc_api_record` VALUES ('261', '1', '127.0.0.1', null, '2018-04-07 09:01:58', '1523062918256', '33410E4765D578F96DD8F88C98DB987B');
INSERT INTO `jc_api_record` VALUES ('262', '1', '127.0.0.1', null, '2018-04-07 09:04:24', '1523063064944', 'AB281A275CE4EBE76BD7941E6A6307E1');
INSERT INTO `jc_api_record` VALUES ('263', '1', '127.0.0.1', null, '2018-04-07 10:26:07', '1523067967734', 'DD4A60E90C8EF345FE1830C730B7E00A');
INSERT INTO `jc_api_record` VALUES ('264', '1', '127.0.0.1', null, '2018-04-08 19:32:58', '1523187178533', 'C914524833A401F1DE3728985E0A9084');
INSERT INTO `jc_api_record` VALUES ('265', '1', '127.0.0.1', null, '2018-04-08 19:35:17', '1523187317217', '5E7CE9FB9FCBDF9CAAD81E659D6CEC09');
INSERT INTO `jc_api_record` VALUES ('266', '1', '127.0.0.1', null, '2018-04-08 19:36:34', '1523187394763', 'A68C1784038D1A42FCACCEF2B4E210E0');
INSERT INTO `jc_api_record` VALUES ('267', '1', '127.0.0.1', null, '2018-04-08 19:38:11', '1523187491088', 'FE9847E20D68EBCEEF28B5E1AD06ED0B');
INSERT INTO `jc_api_record` VALUES ('268', '1', '127.0.0.1', null, '2018-04-08 19:38:26', '1523187506390', '5FFED33270631488029F9D23E54D6679');
INSERT INTO `jc_api_record` VALUES ('269', '1', '127.0.0.1', null, '2018-04-08 19:39:17', '1523187557748', 'E9BA037330884AEE4390F82EC7B7384C');
INSERT INTO `jc_api_record` VALUES ('270', '1', '127.0.0.1', null, '2018-04-08 19:41:42', '1523187702768', 'F20B71C6290C72FB4AEA3DA0BF5C804B');
INSERT INTO `jc_api_record` VALUES ('271', '1', '127.0.0.1', null, '2018-04-08 19:42:22', '1523187742567', 'B2929910AE9BA56A6DE3E2D7916E2118');
INSERT INTO `jc_api_record` VALUES ('272', '1', '127.0.0.1', null, '2018-04-08 20:06:25', '1523189185264', '510FFE055E183241689B0E78F3A38EEE');
INSERT INTO `jc_api_record` VALUES ('273', '1', '127.0.0.1', null, '2018-04-08 20:11:37', '1523189497453', 'F8282EFCEA3D67F53BB2B1207D93D40E');
INSERT INTO `jc_api_record` VALUES ('274', '1', '127.0.0.1', null, '2018-04-08 20:17:14', '1523189834552', '40D59ED15D5ED2F27D4AE54C3950469C');
INSERT INTO `jc_api_record` VALUES ('275', '1', '127.0.0.1', null, '2018-04-08 20:39:15', '1523191155027', '292774B29F0D9C8DFD243633718140D6');
INSERT INTO `jc_api_record` VALUES ('276', '1', '127.0.0.1', null, '2018-04-08 20:46:59', '1523191619064', 'F588CD0247D51EDE4C69FD7543586EAA');
INSERT INTO `jc_api_record` VALUES ('277', '1', '127.0.0.1', null, '2018-04-08 20:47:10', '1523191630175', '7D79A10DA80C0D3F431CEA502E59FDC7');
INSERT INTO `jc_api_record` VALUES ('278', '1', '127.0.0.1', null, '2018-04-08 20:47:20', '1523191640250', '8F54C67A5949EC905CE292B54BD51E94');
INSERT INTO `jc_api_record` VALUES ('279', '1', '127.0.0.1', null, '2018-04-08 20:47:40', '1523191660957', '849438D8B80C2503BC00620FAFFCFBCC');
INSERT INTO `jc_api_record` VALUES ('280', '1', '127.0.0.1', null, '2018-04-08 20:47:52', '1523191672948', '41B1438BBAC71EC498BC9A3E1E683696');
INSERT INTO `jc_api_record` VALUES ('281', '1', '127.0.0.1', null, '2018-04-08 20:48:17', '1523191697860', 'B9E6A26E3E28CD9DDB94CBF010CB79A9');
INSERT INTO `jc_api_record` VALUES ('282', '1', '127.0.0.1', null, '2018-04-08 20:52:41', '1523191961648', '28DE7964485C975DB699701D16E36E9E');
INSERT INTO `jc_api_record` VALUES ('283', '1', '127.0.0.1', null, '2018-04-08 20:52:54', '1523191974856', '7F80FC161B042E26A4FD21DAD37595CE');
INSERT INTO `jc_api_record` VALUES ('284', '1', '127.0.0.1', null, '2018-04-08 20:53:24', '1523192004612', 'DCA22F2AE0715BF22816C7D9E609361E');
INSERT INTO `jc_api_record` VALUES ('285', '1', '127.0.0.1', null, '2018-04-08 20:53:52', '1523192032018', '300A762C3DB41A0218B83F1DE68A16C5');
INSERT INTO `jc_api_record` VALUES ('286', '1', '127.0.0.1', null, '2018-04-08 20:54:00', '1523192040994', '35DA0B7896CE6F872DDB2D9C2B123103');
INSERT INTO `jc_api_record` VALUES ('287', '1', '127.0.0.1', null, '2018-04-08 20:54:08', '1523192048905', 'E424495706DEDABA699443F39FDC283A');
INSERT INTO `jc_api_record` VALUES ('288', '1', '127.0.0.1', null, '2018-04-08 20:54:23', '1523192063213', '4A014242F7D8CD919CC89B2FD6C1081B');
INSERT INTO `jc_api_record` VALUES ('289', '1', '127.0.0.1', null, '2018-04-08 20:54:35', '1523192075765', 'D13CC0BEFBAEE95FCA91FB6ACC5AFD7A');
INSERT INTO `jc_api_record` VALUES ('290', '1', '127.0.0.1', null, '2018-04-08 23:14:36', '1523200476497', '5DD3CDCF3DDE501A4C41CF440E8171B4');
INSERT INTO `jc_api_record` VALUES ('291', '1', '127.0.0.1', null, '2018-04-09 19:44:25', '1523274265937', '457C87CAC2E8908A719C24D3B904120B');
INSERT INTO `jc_api_record` VALUES ('292', '1', '127.0.0.1', null, '2018-04-09 19:47:55', '1523274475702', 'F49258D07404ECE48ED3388977D66204');
INSERT INTO `jc_api_record` VALUES ('293', '1', '127.0.0.1', null, '2018-04-09 19:49:59', '1523274599675', 'B79518CCC23AB1BCB328F653ADF0DC1E');
INSERT INTO `jc_api_record` VALUES ('294', '1', '127.0.0.1', null, '2018-04-09 19:51:04', '1523274664036', 'F08E7F6C765F9101074915B69A13729E');
INSERT INTO `jc_api_record` VALUES ('295', '1', '127.0.0.1', null, '2018-04-09 19:53:27', '1523274807500', 'D0F6F08F0BFB2A2945D502CE0744F221');
INSERT INTO `jc_api_record` VALUES ('296', '1', '127.0.0.1', null, '2018-04-09 19:54:04', '1523274844830', '1896DE33B574A4DDC39F43D6D36F2E97');
INSERT INTO `jc_api_record` VALUES ('297', '1', '127.0.0.1', null, '2018-04-09 19:54:51', '1523274891803', 'CA02F464820A3C771C2D63BEF89C4E91');
INSERT INTO `jc_api_record` VALUES ('298', '1', '127.0.0.1', null, '2018-04-09 19:55:05', '1523274905001', '1840C0D5EE614FFF814E6DFF38191156');
INSERT INTO `jc_api_record` VALUES ('299', '1', '127.0.0.1', null, '2018-04-09 19:55:13', '1523274913213', '0A70EF1DC744ADACE11F9CE0E9C5252C');
INSERT INTO `jc_api_record` VALUES ('300', '1', '127.0.0.1', null, '2018-04-09 19:55:19', '1523274919757', '691ECFBBCD056C1ADD3D110F90895CC8');
INSERT INTO `jc_api_record` VALUES ('301', '1', '127.0.0.1', null, '2018-04-09 19:55:26', '1523274926080', 'BDCFF9E8BB695A2E9F3F6E75A03446B3');
INSERT INTO `jc_api_record` VALUES ('302', '1', '127.0.0.1', null, '2018-04-09 19:56:18', '1523274978248', '0DF82029B30A6DB171DE498165CA0EF5');
INSERT INTO `jc_api_record` VALUES ('303', '1', '127.0.0.1', null, '2018-04-09 20:00:55', '1523275255969', '80D3AF99E3DE645F97DF8B81E7FD0C44');
INSERT INTO `jc_api_record` VALUES ('304', '1', '127.0.0.1', null, '2018-04-09 20:01:30', '1523275290798', '52FAA329617ABCDDDF85FD59B3116874');
INSERT INTO `jc_api_record` VALUES ('305', '1', '127.0.0.1', null, '2018-04-09 20:03:11', '1523275391544', '256BF78B76E8AC61D6BD9F9D5B0339D7');
INSERT INTO `jc_api_record` VALUES ('306', '1', '127.0.0.1', null, '2018-04-09 20:03:38', '1523275418066', '7A245614FAEC3264B7EEF4F996FE871C');
INSERT INTO `jc_api_record` VALUES ('307', '1', '127.0.0.1', null, '2018-04-09 20:07:00', '1523275620149', 'DA345BEF32FDB6C7F03DEB3C3D741BC5');
INSERT INTO `jc_api_record` VALUES ('308', '1', '127.0.0.1', null, '2018-04-09 20:07:10', '1523275630260', '5DB8673A7523E8C8C0C8D4B73EAD9F28');
INSERT INTO `jc_api_record` VALUES ('309', '1', '127.0.0.1', null, '2018-04-09 20:07:13', '1523275633743', '1EF6BBCA9CB8E5EF480B948DD890E184');
INSERT INTO `jc_api_record` VALUES ('310', '1', '127.0.0.1', null, '2018-04-09 20:07:17', '1523275637380', 'D2E2AE9C1925EA74448EA6689DD65F6E');
INSERT INTO `jc_api_record` VALUES ('311', '1', '127.0.0.1', null, '2018-04-09 20:09:58', '1523275798003', '7F76A4A825E2D6C3AE486ED5B29D6090');
INSERT INTO `jc_api_record` VALUES ('312', '1', '127.0.0.1', null, '2018-04-09 20:10:59', '1523275859006', '092DBF07425189C59AA2026F3EA3EB74');
INSERT INTO `jc_api_record` VALUES ('313', '1', '127.0.0.1', null, '2018-04-09 20:11:40', '1523275900630', '3EF072266E76C01598B0DF89970EAC9B');
INSERT INTO `jc_api_record` VALUES ('314', '1', '127.0.0.1', null, '2018-04-09 20:17:25', '1523276245600', '33A03EA2930CDB879A27C0D951FA1E14');
INSERT INTO `jc_api_record` VALUES ('315', '1', '127.0.0.1', null, '2018-04-09 20:17:37', '1523276257888', 'C6803B5667DBDFE1B62ABD12049C3F1F');
INSERT INTO `jc_api_record` VALUES ('316', '1', '127.0.0.1', null, '2018-04-09 20:17:56', '1523276276973', '554D0E2D9009A1956EB2F22F10285E93');
INSERT INTO `jc_api_record` VALUES ('317', '1', '127.0.0.1', null, '2018-04-09 20:18:06', '1523276286947', '57115CFC1E98C9A88B9EF50953441339');
INSERT INTO `jc_api_record` VALUES ('318', '1', '127.0.0.1', null, '2018-04-09 20:19:16', '1523276356016', '50088AE5229953293BEFC96BE3EC9E83');
INSERT INTO `jc_api_record` VALUES ('319', '1', '127.0.0.1', null, '2018-04-09 20:25:15', '1523276715379', 'EA8FB49DCE6086C72246389ABCB2DA98');
INSERT INTO `jc_api_record` VALUES ('320', '1', '127.0.0.1', null, '2018-04-09 20:40:02', '1523277602726', '522E36024CA1C67A6DC39252FAEB2B1B');
INSERT INTO `jc_api_record` VALUES ('321', '1', '127.0.0.1', null, '2018-04-09 20:40:16', '1523277616500', '788DE06749B08875FD6758337A9749F5');
INSERT INTO `jc_api_record` VALUES ('322', '1', '127.0.0.1', null, '2018-04-09 20:41:50', '1523277710317', '0FCE0D5E9E8E1FBAA0E994C8CCABF972');
INSERT INTO `jc_api_record` VALUES ('323', '1', '127.0.0.1', null, '2018-04-09 20:41:59', '1523277719481', 'A69FE093A6D5D7FDF2C9A2D485D3D58B');
INSERT INTO `jc_api_record` VALUES ('324', '1', '127.0.0.1', null, '2018-04-09 20:42:24', '1523277744734', '9144FB99AEF824778938C8570A8D1F5A');
INSERT INTO `jc_api_record` VALUES ('325', '1', '127.0.0.1', null, '2018-04-09 20:42:38', '1523277758489', '1B88106F86E7BFCC575E78993BB90CE7');
INSERT INTO `jc_api_record` VALUES ('326', '1', '127.0.0.1', null, '2018-04-09 20:42:45', '1523277765572', '5164A0A486FDD12A6F56B5CADAC04114');
INSERT INTO `jc_api_record` VALUES ('327', '1', '127.0.0.1', null, '2018-04-09 20:43:13', '1523277793018', '72370A4650E9CD71B8551658970D8ACF');
INSERT INTO `jc_api_record` VALUES ('328', '1', '127.0.0.1', null, '2018-04-09 20:44:40', '1523277880658', 'DE1721DC333B6458F900DF52B45DD98C');
INSERT INTO `jc_api_record` VALUES ('329', '1', '127.0.0.1', null, '2018-04-09 20:45:02', '1523277902722', 'C87544E7DA6A7D9D1AE8B7EA41E73247');
INSERT INTO `jc_api_record` VALUES ('330', '1', '127.0.0.1', null, '2018-04-09 20:46:50', '1523278010098', 'B2B7302FA0BDD66085BA61EC2D046916');
INSERT INTO `jc_api_record` VALUES ('331', '1', '127.0.0.1', null, '2018-04-09 21:07:36', '1523279256239', '8CF9C5F93ED84C8B1F53D61E59463BAD');
INSERT INTO `jc_api_record` VALUES ('332', '1', '127.0.0.1', null, '2018-04-09 21:08:06', '1523279286348', '9310E67BF0257C5A7894D4BA2CB7451F');
INSERT INTO `jc_api_record` VALUES ('333', '1', '127.0.0.1', null, '2018-04-09 21:09:02', '1523279342000', '1E99B77080F862BD63746663434E087F');
INSERT INTO `jc_api_record` VALUES ('334', '1', '127.0.0.1', null, '2018-04-09 21:10:10', '1523279410909', '30CF0C980B1ADC0F34C9EA444FA6C404');
INSERT INTO `jc_api_record` VALUES ('335', '1', '127.0.0.1', null, '2018-04-09 22:38:19', '1523284699195', '048C1B206DDF31108950A13162B56DBE');
INSERT INTO `jc_api_record` VALUES ('336', '1', '127.0.0.1', null, '2018-04-10 21:10:47', '1523365847030', '33ECEA779220893CE35588E12EBC9516');
INSERT INTO `jc_api_record` VALUES ('337', '1', '127.0.0.1', null, '2018-04-10 21:12:52', '1523365971859', '22E33FDA960A313B4611543254244E4C');
INSERT INTO `jc_api_record` VALUES ('338', '1', '127.0.0.1', null, '2018-04-10 21:14:30', '1523366070279', '0F07994D61E4CF32B6E0A91326BAE9A5');
INSERT INTO `jc_api_record` VALUES ('339', '1', '127.0.0.1', null, '2018-04-10 21:24:39', '1523366678923', '13E720197A249B6E824DAE73561AE072');
INSERT INTO `jc_api_record` VALUES ('340', '1', '127.0.0.1', null, '2018-04-10 21:37:34', '1523367454462', '57DB54DB95027EB7265C7A55CA444654');
INSERT INTO `jc_api_record` VALUES ('341', '1', '127.0.0.1', null, '2018-04-10 21:38:33', '1523367513030', '6264C0A38A6B5FE6635B29603EFCB249');
INSERT INTO `jc_api_record` VALUES ('342', '1', '127.0.0.1', null, '2018-04-10 21:39:29', '1523367568724', 'D40FB8092630BCC26975889039558BB6');
INSERT INTO `jc_api_record` VALUES ('343', '1', '127.0.0.1', null, '2018-04-10 21:40:03', '1523367603466', 'D5F0AE72CF649857B37142230B72F782');
INSERT INTO `jc_api_record` VALUES ('344', '1', '127.0.0.1', null, '2018-04-10 21:51:49', '1523368308644', 'A3B16780AE2176116330D2BDDB8940DF');
INSERT INTO `jc_api_record` VALUES ('345', '1', '127.0.0.1', null, '2018-04-10 21:54:04', '1523368443990', '6DE3834625C308C3BFD5F15F73059A83');
INSERT INTO `jc_api_record` VALUES ('346', '1', '127.0.0.1', null, '2018-04-10 21:55:30', '1523368530245', '55C70839F074A41ADDA6C61208F821EE');
INSERT INTO `jc_api_record` VALUES ('347', '1', '127.0.0.1', null, '2018-04-10 21:56:54', '1523368614270', 'ED0FFB317756799030CE746073C000EC');
INSERT INTO `jc_api_record` VALUES ('348', '1', '127.0.0.1', null, '2018-04-10 21:57:44', '1523368664009', '8CD62001176C389F361B1A70630C1FFC');
INSERT INTO `jc_api_record` VALUES ('349', '1', '127.0.0.1', null, '2018-04-10 22:00:01', '1523368800885', '2A3A46FF206FF7F8B151CF556357CA01');
INSERT INTO `jc_api_record` VALUES ('350', '1', '127.0.0.1', null, '2018-04-10 22:00:04', '1523368803792', '1825C9903ECCF4F2D97A4CAA24199C83');
INSERT INTO `jc_api_record` VALUES ('351', '1', '127.0.0.1', null, '2018-04-10 22:00:18', '1523368818154', '6DA9B388A42B12BCB68CA1FD5C4323DB');
INSERT INTO `jc_api_record` VALUES ('352', '1', '127.0.0.1', null, '2018-04-10 22:02:45', '1523368964911', 'D571EB86302C5CAC53013809A7EAD0B4');
INSERT INTO `jc_api_record` VALUES ('353', '1', '127.0.0.1', null, '2018-04-10 22:03:27', '1523369006929', 'E98822AB7601D1803F20A311215D8044');
INSERT INTO `jc_api_record` VALUES ('354', '1', '127.0.0.1', null, '2018-04-10 22:03:47', '1523369026826', '04455DF0B8E4901A44E77858160654F0');
INSERT INTO `jc_api_record` VALUES ('355', '1', '127.0.0.1', null, '2018-04-10 22:04:16', '1523369056012', '5DD8D3FAA3F811E69ADE90892D8C0320');
INSERT INTO `jc_api_record` VALUES ('356', '1', '127.0.0.1', null, '2018-04-10 22:04:19', '1523369058665', '15760C4E28D8510E9F382341BAF6005A');
INSERT INTO `jc_api_record` VALUES ('357', '1', '127.0.0.1', null, '2018-04-10 22:04:40', '1523369079672', 'F922359CFD5EBC8C7FFBE4FFC9677D00');
INSERT INTO `jc_api_record` VALUES ('358', '1', '127.0.0.1', null, '2018-04-10 22:05:01', '1523369100596', 'C31E3B9FFA7C8F21CB06733F567E08BF');
INSERT INTO `jc_api_record` VALUES ('359', '1', '127.0.0.1', null, '2018-04-10 22:09:36', '1523369375720', '98531B1E2842B47DDCC98D39D80749C6');
INSERT INTO `jc_api_record` VALUES ('360', '1', '127.0.0.1', null, '2018-04-10 22:14:33', '1523369673138', '9B7048F4ACAD74597761BB1B696A633E');
INSERT INTO `jc_api_record` VALUES ('361', '1', '127.0.0.1', null, '2018-04-10 22:14:56', '1523369695563', '42C7835BF56617732307102E309CEE68');
INSERT INTO `jc_api_record` VALUES ('362', '1', '127.0.0.1', null, '2018-04-10 22:18:02', '1523369882473', 'B81AFDB7BA483AE2C79397D59035B036');
INSERT INTO `jc_api_record` VALUES ('363', '1', '127.0.0.1', null, '2018-04-10 22:18:38', '1523369918369', '45CC438BC15D4A3E255C0A1AF7187808');
INSERT INTO `jc_api_record` VALUES ('364', '1', '127.0.0.1', null, '2018-04-10 22:18:54', '1523369933967', '7BEC5EE7C7645E89FC4778709673AD21');
INSERT INTO `jc_api_record` VALUES ('365', '1', '127.0.0.1', null, '2018-04-10 22:21:44', '1523370104267', '4A55D8829BA8E3E807D29AC31A9349B1');
INSERT INTO `jc_api_record` VALUES ('366', '1', '127.0.0.1', null, '2018-04-10 22:26:11', '1523370370873', 'CFFE18E40FA2823E04C049973A5B1C3F');
INSERT INTO `jc_api_record` VALUES ('367', '1', '127.0.0.1', null, '2018-04-10 22:26:35', '1523370394528', '09C1B571F53E05095C59C2916178CFC0');
INSERT INTO `jc_api_record` VALUES ('368', '1', '127.0.0.1', null, '2018-04-10 22:28:23', '1523370503070', '21C7EDC55E616101F847AF0F63B35F56');
INSERT INTO `jc_api_record` VALUES ('369', '1', '127.0.0.1', null, '2018-04-10 22:29:19', '1523370559094', 'F42DBA548A7323658A746A25C9956201');
INSERT INTO `jc_api_record` VALUES ('370', '1', '127.0.0.1', null, '2018-04-10 22:29:42', '1523370582028', 'C349EB834797C89F42223F4A5BFFCDB5');
INSERT INTO `jc_api_record` VALUES ('371', '1', '127.0.0.1', null, '2018-04-10 22:30:36', '1523370636125', '02C1085EC3A1220AD610D8113E735C3C');
INSERT INTO `jc_api_record` VALUES ('372', '1', '127.0.0.1', null, '2018-04-10 22:31:12', '1523370672409', 'E70176873270512D6B53C962CADAFCC5');
INSERT INTO `jc_api_record` VALUES ('373', '1', '127.0.0.1', null, '2018-04-10 22:32:08', '1523370728019', '1449271E3D6717A56C83312DCE3B1E38');
INSERT INTO `jc_api_record` VALUES ('374', '1', '127.0.0.1', null, '2018-04-10 22:33:03', '1523370782806', '57CD3D87C4210F34D509C543E5D54115');
INSERT INTO `jc_api_record` VALUES ('375', '1', '127.0.0.1', null, '2018-04-11 20:13:18', '1523448797806', '3E53F9EFCE4CB744D3FAE71FE9A078A7');
INSERT INTO `jc_api_record` VALUES ('376', '1', '127.0.0.1', null, '2018-04-11 21:10:24', '1523452223775', 'C5F41508C5143F6EBF47A217A3EC5386');
INSERT INTO `jc_api_record` VALUES ('377', '1', '127.0.0.1', null, '2018-04-11 21:12:37', '1523452357282', 'F158A2D8B685820D2989A52BDDB352AB');
INSERT INTO `jc_api_record` VALUES ('378', '1', '127.0.0.1', null, '2018-04-11 21:15:35', '1523452534727', '07443BCFED81D18ABE6A8291C2766D4A');
INSERT INTO `jc_api_record` VALUES ('379', '1', '127.0.0.1', null, '2018-04-11 21:17:21', '1523452640752', '3CAB371F7F11FC75D2D145178F885BCE');
INSERT INTO `jc_api_record` VALUES ('380', '1', '127.0.0.1', null, '2018-04-11 21:17:44', '1523452663916', '4534903E5A81CA8C0D31DB5BD44584DF');
INSERT INTO `jc_api_record` VALUES ('381', '1', '127.0.0.1', null, '2018-04-11 21:19:08', '1523452747826', '5DFC194FD6392CB822B5FFED94AE69D9');
INSERT INTO `jc_api_record` VALUES ('382', '1', '127.0.0.1', null, '2018-04-11 21:20:19', '1523452818622', 'EC6C720E15CAF44665BE4327755CD085');
INSERT INTO `jc_api_record` VALUES ('383', '1', '127.0.0.1', null, '2018-04-11 21:20:38', '1523452838076', 'B6BA93BA04A82761D7AAF7A95E5DED44');
INSERT INTO `jc_api_record` VALUES ('384', '1', '127.0.0.1', null, '2018-04-11 21:22:25', '1523452944599', 'EC49B94EDDB13C475D8FC7507A8C17D0');
INSERT INTO `jc_api_record` VALUES ('385', '1', '127.0.0.1', null, '2018-04-11 21:39:54', '1523453994408', 'A5D0E598098E83B58816AA9336ED7650');
INSERT INTO `jc_api_record` VALUES ('386', '1', '127.0.0.1', null, '2018-04-14 10:19:33', '1523672372953', '1BBE3084AE74C2304B94401CF71EC20B');
INSERT INTO `jc_api_record` VALUES ('387', '1', '127.0.0.1', null, '2018-04-14 11:10:28', '1523675428403', '1DCA4162F0440EFA6F436287BDEEBE1F');
INSERT INTO `jc_api_record` VALUES ('388', '1', '127.0.0.1', null, '2018-04-14 11:10:45', '1523675444688', '163AACE0070DCE73DBA0A5BEC7D7C986');
INSERT INTO `jc_api_record` VALUES ('389', '1', '127.0.0.1', null, '2018-04-14 11:56:19', '1523678179324', '9BE40225B2A289590824AC500A3B2EC1');
INSERT INTO `jc_api_record` VALUES ('390', '1', '127.0.0.1', null, '2018-04-14 11:56:58', '1523678217842', 'F47D1BF4CDC14C0161440222818F617C');
INSERT INTO `jc_api_record` VALUES ('391', '1', '127.0.0.1', null, '2018-04-14 11:59:14', '1523678353696', '57E3A4A17E2094C8DE5729EA596C2B76');
INSERT INTO `jc_api_record` VALUES ('392', '1', '127.0.0.1', null, '2018-04-14 12:00:18', '1523678418115', 'F00A86E0C45DD3F7F854969AC4ADA71A');
INSERT INTO `jc_api_record` VALUES ('393', '1', '127.0.0.1', null, '2018-04-14 12:00:56', '1523678455589', 'F045539AFC4B5E31287984ED91368401');
INSERT INTO `jc_api_record` VALUES ('394', '1', '127.0.0.1', null, '2018-04-14 12:01:32', '1523678492202', '707E3F0188E9B3C23E160A2382D782AC');
INSERT INTO `jc_api_record` VALUES ('395', '1', '127.0.0.1', null, '2018-04-14 12:02:45', '1523678564990', '9A8F73E9DC6C9D6E82A0774A1B9B9FAD');
INSERT INTO `jc_api_record` VALUES ('396', '1', '127.0.0.1', null, '2018-04-14 12:04:01', '1523678640960', 'C629A00A57433015F5245251302C602C');
INSERT INTO `jc_api_record` VALUES ('397', '1', '127.0.0.1', null, '2018-04-14 12:04:59', '1523678698999', '54E19854AE2D576296CA866D939EE047');
INSERT INTO `jc_api_record` VALUES ('398', '1', '127.0.0.1', null, '2018-04-14 12:05:37', '1523678736766', 'E231DB1568DDA3BB80FC1FD849B0A256');
INSERT INTO `jc_api_record` VALUES ('399', '1', '127.0.0.1', null, '2018-04-14 12:06:11', '1523678770938', '2B695F6F7592070BBC7F82C869899D51');
INSERT INTO `jc_api_record` VALUES ('400', '1', '127.0.0.1', null, '2018-04-14 12:06:23', '1523678782555', '8C6C43B4E93B17BC2A320829854879D7');
INSERT INTO `jc_api_record` VALUES ('401', '1', '127.0.0.1', null, '2018-04-14 13:40:12', '1523684411935', '52BD820806CFAC07635DA41B5BB35173');
INSERT INTO `jc_api_record` VALUES ('402', '1', '127.0.0.1', null, '2018-04-14 13:43:29', '1523684609109', 'BEE10505E52442C76A2F80D637D15F78');
INSERT INTO `jc_api_record` VALUES ('403', '1', '127.0.0.1', null, '2018-04-14 13:44:19', '1523684658694', 'E97E2A9702E5516C0AF0C60AE7E36BB9');
INSERT INTO `jc_api_record` VALUES ('404', '1', '127.0.0.1', null, '2018-04-14 13:45:21', '1523684720989', 'E04FF8B02D7B64F7EC26C03CDCD2122B');
INSERT INTO `jc_api_record` VALUES ('405', '1', '127.0.0.1', null, '2018-04-14 13:45:54', '1523684754445', '1F5D95DE51DFCA2AEE3F408AEAF0C726');
INSERT INTO `jc_api_record` VALUES ('406', '1', '127.0.0.1', null, '2018-04-14 13:48:05', '1523684884883', '46929F8681C3DE51C4017DE71985328D');
INSERT INTO `jc_api_record` VALUES ('407', '1', '127.0.0.1', null, '2018-04-14 13:49:27', '1523684967010', '6BA5226D5755F82A0437E0909BA4F228');
INSERT INTO `jc_api_record` VALUES ('408', '1', '127.0.0.1', null, '2018-04-14 13:50:19', '1523685018788', 'BFAEE75D4935B0A1C263022DC5C1ABE6');
INSERT INTO `jc_api_record` VALUES ('409', '1', '127.0.0.1', null, '2018-04-14 13:50:50', '1523685050214', 'CE7264B671B9DF25CB9E4DF71D9A7809');
INSERT INTO `jc_api_record` VALUES ('410', '1', '127.0.0.1', null, '2018-04-14 13:51:57', '1523685117211', '5DCAB5A274AF40F88C7BE33CE59FBDB5');
INSERT INTO `jc_api_record` VALUES ('411', '1', '127.0.0.1', null, '2018-04-14 13:52:40', '1523685160322', '1F997E8170F9238C775CDB881B978B34');
INSERT INTO `jc_api_record` VALUES ('412', '1', '127.0.0.1', null, '2018-04-14 13:53:48', '1523685228456', '47CC5663716A3578F1C3EAB00AF6855F');
INSERT INTO `jc_api_record` VALUES ('413', '1', '127.0.0.1', null, '2018-04-14 13:54:10', '1523685249847', 'E644B05B559F88BE2A4F1D1FEACAFE4D');
INSERT INTO `jc_api_record` VALUES ('414', '1', '127.0.0.1', null, '2018-04-14 14:20:49', '1523686849377', '88486B83278775063C8E8DC3FC929FAD');
INSERT INTO `jc_api_record` VALUES ('415', '1', '127.0.0.1', null, '2018-04-14 14:31:32', '1523687492656', '92F0FB9089A954CB0A066132EA483FCE');
INSERT INTO `jc_api_record` VALUES ('416', '1', '127.0.0.1', null, '2018-04-14 14:32:08', '1523687528679', '6EB80314E4513213741661526B90337A');
INSERT INTO `jc_api_record` VALUES ('417', '1', '127.0.0.1', null, '2018-04-14 14:33:00', '1523687580099', 'B50B239FA47732C6E9B0EBE3FAA8BD90');
INSERT INTO `jc_api_record` VALUES ('418', '1', '127.0.0.1', null, '2018-04-14 14:35:44', '1523687744186', 'A133750282E685840ABA4F51410656CA');
INSERT INTO `jc_api_record` VALUES ('419', '1', '127.0.0.1', null, '2018-04-14 14:36:12', '1523687772144', 'E434F739B3222AAD1F778335D9A96D76');
INSERT INTO `jc_api_record` VALUES ('420', '1', '127.0.0.1', null, '2018-04-14 14:39:37', '1523687977018', 'C36DEF7E671C8B188D6801B1243905A5');
INSERT INTO `jc_api_record` VALUES ('421', '1', '127.0.0.1', null, '2018-04-14 14:39:41', '1523687981320', '2C6277D9B105447FD50B82C4D8F51C5E');
INSERT INTO `jc_api_record` VALUES ('422', '1', '127.0.0.1', null, '2018-04-14 14:40:02', '1523688002850', 'B044F20FC5A37EFB72FC09D594A9A5A8');
INSERT INTO `jc_api_record` VALUES ('423', '1', '127.0.0.1', null, '2018-04-14 14:40:36', '1523688036723', 'C884AE616542E388801F83C57095EED9');
INSERT INTO `jc_api_record` VALUES ('424', '1', '127.0.0.1', null, '2018-04-14 14:41:55', '1523688115220', '912B246A060B836DD6EA14344AB1B540');
INSERT INTO `jc_api_record` VALUES ('425', '1', '127.0.0.1', null, '2018-04-14 14:45:53', '1523688353677', '8AA0AE778FC6B5D5ACA4465F939D1197');
INSERT INTO `jc_api_record` VALUES ('426', '1', '127.0.0.1', null, '2018-04-14 14:46:18', '1523688378292', '5C6A634101E79780EECA63D475A8BEBD');
INSERT INTO `jc_api_record` VALUES ('427', '1', '127.0.0.1', null, '2018-04-14 14:48:15', '1523688495353', '3A6B3CA75558D18DFCBF549135D0756C');
INSERT INTO `jc_api_record` VALUES ('428', '1', '127.0.0.1', null, '2018-04-14 14:48:59', '1523688539950', '882033779AAE2E0F6323CF7999525D10');
INSERT INTO `jc_api_record` VALUES ('429', '1', '127.0.0.1', null, '2018-04-14 14:49:49', '1523688589162', 'DE7484760C553C5B96329216CF7DA409');
INSERT INTO `jc_api_record` VALUES ('430', '1', '127.0.0.1', null, '2018-04-14 14:50:34', '1523688634896', '9D2881481BCCFBDC2BB2DE6C140DE893');
INSERT INTO `jc_api_record` VALUES ('431', '1', '127.0.0.1', null, '2018-04-14 14:51:10', '1523688670617', '1327CF4915C70701C39D0A4DBD59A410');
INSERT INTO `jc_api_record` VALUES ('432', '1', '127.0.0.1', null, '2018-04-14 14:53:10', '1523688790086', 'CA0A63E426B0861CA624AD6BE1E570C1');
INSERT INTO `jc_api_record` VALUES ('433', '1', '127.0.0.1', null, '2018-04-14 14:53:46', '1523688826773', '5512DF096C8AA2749193423160C705A4');
INSERT INTO `jc_api_record` VALUES ('434', '1', '127.0.0.1', null, '2018-04-14 14:54:50', '1523688890577', '4D02485355DD095FFAD6C654AFD49DF6');
INSERT INTO `jc_api_record` VALUES ('435', '1', '127.0.0.1', null, '2018-04-14 14:55:30', '1523688930492', 'F1D315F73B3AC0EC26B31657A854933E');
INSERT INTO `jc_api_record` VALUES ('436', '1', '127.0.0.1', null, '2018-04-14 14:55:55', '1523688955841', 'FBADC2E16A30F4862B16FE4C14D8916F');
INSERT INTO `jc_api_record` VALUES ('437', '1', '127.0.0.1', null, '2018-04-14 14:56:54', '1523689014193', 'B5CB8CC9B07F3ED54E9ADBBA3589A664');
INSERT INTO `jc_api_record` VALUES ('438', '1', '127.0.0.1', null, '2018-04-14 14:57:14', '1523689034585', 'CEA349F3E3F037EAC2E0CF8A9803171D');
INSERT INTO `jc_api_record` VALUES ('439', '1', '127.0.0.1', null, '2018-04-14 14:59:00', '1523689140369', 'F097412A300D7D3C066ED8C4D82347FB');
INSERT INTO `jc_api_record` VALUES ('440', '1', '127.0.0.1', null, '2018-04-14 15:00:06', '1523689206533', 'F93C6AE4D0C0B1D4F5174AFA7456E304');
INSERT INTO `jc_api_record` VALUES ('441', '1', '127.0.0.1', null, '2018-04-14 15:00:28', '1523689228203', '0F249EEFE349AAB24CBAD2B1E20B8101');
INSERT INTO `jc_api_record` VALUES ('442', '1', '127.0.0.1', null, '2018-04-14 15:00:46', '1523689246113', '4746F6ADD96F34EDBE6B8719502DE013');
INSERT INTO `jc_api_record` VALUES ('443', '1', '127.0.0.1', null, '2018-04-14 15:01:12', '1523689272895', '0AEE26CC429F01D05ED8450BDB4D7200');
INSERT INTO `jc_api_record` VALUES ('444', '1', '127.0.0.1', null, '2018-04-14 15:01:34', '1523689294357', '404BCA4A811EFC7D6F4D7EEE946BA273');
INSERT INTO `jc_api_record` VALUES ('445', '1', '127.0.0.1', null, '2018-04-14 15:05:23', '1523689523529', 'D51DE3EFA7EF73A94434ECFC257D1A74');
INSERT INTO `jc_api_record` VALUES ('446', '1', '127.0.0.1', null, '2018-04-14 15:05:41', '1523689541949', '936197BC98B1EC02D9209CD52C02FA61');
INSERT INTO `jc_api_record` VALUES ('447', '1', '127.0.0.1', null, '2018-04-14 15:06:06', '1523689566483', '2F52E78F9BD66124E4796C4919079C8B');
INSERT INTO `jc_api_record` VALUES ('448', '1', '127.0.0.1', null, '2018-04-14 15:06:32', '1523689592789', 'C27803F38F2F3F31BBA4A91815006074');
INSERT INTO `jc_api_record` VALUES ('449', '1', '127.0.0.1', null, '2018-04-14 15:06:50', '1523689610557', '52CA7E6BCD252FC2869AFA84B5C052CA');
INSERT INTO `jc_api_record` VALUES ('450', '1', '127.0.0.1', null, '2018-04-14 15:07:13', '1523689633688', '02F7F0ECD950BA7A42DE20F6F99E3244');
INSERT INTO `jc_api_record` VALUES ('451', '1', '127.0.0.1', null, '2018-04-14 15:08:11', '1523689691450', 'AEAD6F930E841D169A5CE5A9FB7968E8');
INSERT INTO `jc_api_record` VALUES ('452', '1', '127.0.0.1', null, '2018-04-14 15:08:40', '1523689720317', 'DD501227DD0E2B48EF02733F5C94D6C7');
INSERT INTO `jc_api_record` VALUES ('453', '1', '127.0.0.1', null, '2018-04-14 15:09:00', '1523689740189', 'B82E522C6197BF1E111F5A64DED7FCB2');
INSERT INTO `jc_api_record` VALUES ('454', '1', '127.0.0.1', null, '2018-04-14 15:09:17', '1523689757315', '188E9B5D01F257F99E5DFF00F8F2435A');
INSERT INTO `jc_api_record` VALUES ('455', '1', '127.0.0.1', null, '2018-04-14 15:10:36', '1523689836433', 'C495C393D6C5B9B1F5E530D7322FF5A3');
INSERT INTO `jc_api_record` VALUES ('456', '1', '127.0.0.1', null, '2018-04-14 15:10:51', '1523689851955', '59C756123B8A307726707A2BA996F735');
INSERT INTO `jc_api_record` VALUES ('457', '1', '127.0.0.1', null, '2018-04-14 15:12:32', '1523689952499', '83A7D4C4D95D704C89C8E811944C3AAE');
INSERT INTO `jc_api_record` VALUES ('458', '1', '127.0.0.1', null, '2018-04-14 15:39:32', '1523691572721', '60D37FBA879875A85B44F86118CF013F');
INSERT INTO `jc_api_record` VALUES ('459', '1', '127.0.0.1', null, '2018-04-14 15:40:02', '1523691602028', 'A5142D9D4D19F07A31A6E5435DD8BAE7');
INSERT INTO `jc_api_record` VALUES ('460', '1', '127.0.0.1', null, '2018-04-14 15:41:08', '1523691668045', 'D0D229AB7B119D244E03D63FDA448390');
INSERT INTO `jc_api_record` VALUES ('461', '1', '127.0.0.1', null, '2018-04-14 15:41:15', '1523691675363', 'D0D229AB7B119D244E03D63FDA448390');
INSERT INTO `jc_api_record` VALUES ('462', '1', '127.0.0.1', null, '2018-04-14 15:42:47', '1523691767356', 'D0D229AB7B119D244E03D63FDA448390');
INSERT INTO `jc_api_record` VALUES ('463', '1', '127.0.0.1', null, '2018-04-14 16:05:08', '1523693108251', '91AEE02EF8F60DA8DBC5DCF469FF6AD2');
INSERT INTO `jc_api_record` VALUES ('464', '1', '127.0.0.1', null, '2018-04-14 16:05:21', '1523693121858', 'E57DA1E5C7B3D6927FE2B763470FE756');
INSERT INTO `jc_api_record` VALUES ('465', '1', '127.0.0.1', null, '2018-04-14 16:05:27', '1523693127411', 'DC8C6DB7504AEAC7DAB910B03DB452A2');
INSERT INTO `jc_api_record` VALUES ('466', '1', '127.0.0.1', null, '2018-04-14 16:16:15', '1523693775622', 'E57DA1E5C7B3D6927FE2B763470FE756');
INSERT INTO `jc_api_record` VALUES ('467', '1', '127.0.0.1', null, '2018-04-14 16:16:20', '1523693780066', 'E57DA1E5C7B3D6927FE2B763470FE756');
INSERT INTO `jc_api_record` VALUES ('468', '1', '127.0.0.1', null, '2018-04-14 16:24:18', '1523694258906', '020FE5E73516C6F3791BA47852295149');
INSERT INTO `jc_api_record` VALUES ('469', '1', '127.0.0.1', null, '2018-04-14 16:27:50', '1523694470114', '0BF1CE5F99151BDCECEBFE60004B198F');
INSERT INTO `jc_api_record` VALUES ('470', '1', '127.0.0.1', null, '2018-04-14 16:29:23', '1523694563139', '211E3A251B6EB19807A936F6937D7FFB');
INSERT INTO `jc_api_record` VALUES ('471', '1', '127.0.0.1', null, '2018-04-14 16:30:23', '1523694623392', '7625A90B0CFDBC9E9A8B33F1D31C0755');
INSERT INTO `jc_api_record` VALUES ('472', '1', '127.0.0.1', null, '2018-04-14 16:31:14', '1523694674570', 'DC319B7402AAF37FC807EA8EF97154C6');
INSERT INTO `jc_api_record` VALUES ('473', '1', '127.0.0.1', null, '2018-04-14 16:46:16', '1523695576581', 'FFD92D5E5B7522304A3F2F7B4E0CD022');
INSERT INTO `jc_api_record` VALUES ('474', '1', '127.0.0.1', null, '2018-04-14 16:46:42', '1523695602486', 'AA370B072F48118E3FA8D977436EFE23');
INSERT INTO `jc_api_record` VALUES ('475', '1', '127.0.0.1', null, '2018-04-14 16:54:26', '1523696066895', '65DFED42A64AF48607D28D5D685DD7C9');
INSERT INTO `jc_api_record` VALUES ('476', '1', '127.0.0.1', null, '2018-04-14 17:03:47', '1523696627801', '6914A55AF687E93CF2172624FDEFE70A');
INSERT INTO `jc_api_record` VALUES ('477', '1', '127.0.0.1', null, '2018-04-14 17:10:52', '1523697052948', 'A305D0A246154B16D7658EC38B01BCB9');
INSERT INTO `jc_api_record` VALUES ('478', '1', '127.0.0.1', null, '2018-04-14 17:16:40', '1523697400292', '9555E0FF9926AAA52B390A70F2279B95');
INSERT INTO `jc_api_record` VALUES ('479', '1', '127.0.0.1', null, '2018-04-14 17:19:06', '1523697546513', 'E205BEB2E602B671FDAA0BD4602CF612');
INSERT INTO `jc_api_record` VALUES ('480', '1', '127.0.0.1', null, '2018-04-14 17:36:01', '1523698561558', 'EC3E47C8F709CB6820E897AD76E4D308');
INSERT INTO `jc_api_record` VALUES ('481', '1', '127.0.0.1', null, '2018-04-14 17:36:50', '1523698610679', '6CC848C561CC6F32492DA0200DAF9A01');
INSERT INTO `jc_api_record` VALUES ('482', '1', '127.0.0.1', null, '2018-04-14 17:40:20', '1523698820878', '1CD1411C7F0B98DD2C399A591D826FA5');
INSERT INTO `jc_api_record` VALUES ('483', '1', '127.0.0.1', null, '2018-04-14 17:40:37', '1523698837029', '9009104A31201A2629654B63519701E5');
INSERT INTO `jc_api_record` VALUES ('484', '1', '127.0.0.1', null, '2018-04-14 17:51:57', '1523699517002', '99854B9450A8CDFC1D089CB1403937F1');
INSERT INTO `jc_api_record` VALUES ('485', '1', '127.0.0.1', null, '2018-04-14 17:54:11', '1523699651109', 'F0B51A5C1A866DF18150B838BC0ED2D9');
INSERT INTO `jc_api_record` VALUES ('486', '1', '127.0.0.1', null, '2018-04-14 17:55:23', '1523699723847', '5DC77DA3825962B08F49D261A4C0CAE1');
INSERT INTO `jc_api_record` VALUES ('487', '1', '127.0.0.1', null, '2018-04-14 17:56:51', '1523699811346', '815A462BF21295E395A263F29FA0DC2B');
INSERT INTO `jc_api_record` VALUES ('488', '1', '127.0.0.1', null, '2018-04-14 17:57:42', '1523699862570', '2C50DD9C72F34ACC59ACC75A517F63D5');
INSERT INTO `jc_api_record` VALUES ('489', '1', '127.0.0.1', null, '2018-04-14 17:58:44', '1523699924405', 'A93DA2BA4D475EB6A4CDA5B01E9C3AA8');
INSERT INTO `jc_api_record` VALUES ('490', '1', '127.0.0.1', null, '2018-04-14 17:58:58', '1523699938677', '69162852C2A3004E4214D43BD2F14DAF');
INSERT INTO `jc_api_record` VALUES ('491', '1', '127.0.0.1', null, '2018-04-15 23:20:41', '1523805641261', '345241BBD0A0B43FB561664027876F23');
INSERT INTO `jc_api_record` VALUES ('492', '1', '127.0.0.1', null, '2018-04-15 23:43:48', '1523807028031', 'AF4B10C3C06CB93DD05E8BCBC3D14813');
INSERT INTO `jc_api_record` VALUES ('493', '1', '127.0.0.1', null, '2018-04-15 23:44:53', '1523807093349', '46BCBC78794E9F513623BDDBB36F359B');
INSERT INTO `jc_api_record` VALUES ('494', '1', '127.0.0.1', null, '2018-04-15 23:45:04', '1523807104794', '009D38E32BF732473F4BEE2DBFCBBC7D');
INSERT INTO `jc_api_record` VALUES ('495', '1', '127.0.0.1', null, '2018-04-16 19:42:38', '1523878958784', '7849157D9F2530CB5AE34DEB876C444B');
INSERT INTO `jc_api_record` VALUES ('496', '1', '127.0.0.1', null, '2018-04-17 19:28:39', '1523964519962', 'B74D05967E8242179DD7B3C99B838D8F');
INSERT INTO `jc_api_record` VALUES ('497', '1', '127.0.0.1', null, '2018-04-17 20:31:57', '1523968316813', 'B836BFA70C701A2BF63B30475978E3C5');
INSERT INTO `jc_api_record` VALUES ('498', '1', '127.0.0.1', null, '2018-04-17 20:32:07', '1523968327127', '04F327C40A3575BA2B917F991AFC099A');
INSERT INTO `jc_api_record` VALUES ('499', '1', '127.0.0.1', null, '2018-04-17 20:32:59', '1523968379412', 'E87AFBE1172D5582960F6DCF5DC62B8E');
INSERT INTO `jc_api_record` VALUES ('500', '1', '127.0.0.1', null, '2018-04-17 20:33:55', '1523968435103', '8CC5B2D0DED03C2C88982DAA351BE9D7');
INSERT INTO `jc_api_record` VALUES ('501', '1', '127.0.0.1', null, '2018-04-17 20:34:01', '1523968441403', '81A7072F52395320198EC5A18F040C08');
INSERT INTO `jc_api_record` VALUES ('502', '1', '127.0.0.1', null, '2018-04-17 20:34:28', '1523968467612', '8C1C7F55A696042682D866F87962BCCC');
INSERT INTO `jc_api_record` VALUES ('503', '1', '127.0.0.1', null, '2018-04-17 20:34:55', '1523968494904', 'D96DD608E5E6A0FC544783B5C634FCDA');
INSERT INTO `jc_api_record` VALUES ('504', '1', '127.0.0.1', null, '2018-04-17 20:35:27', '1523968526693', '6BC248F81B5115C44F851CB2EDFAFB1D');
INSERT INTO `jc_api_record` VALUES ('505', '1', '127.0.0.1', null, '2018-04-17 20:36:01', '1523968560509', 'D9E6B46DE43D0E38137E2FCFA293F2D9');
INSERT INTO `jc_api_record` VALUES ('506', '1', '127.0.0.1', null, '2018-04-17 20:37:09', '1523968629118', 'FC5EDDD22191DDC86D208F69A626E938');
INSERT INTO `jc_api_record` VALUES ('507', '1', '127.0.0.1', null, '2018-04-17 20:37:52', '1523968672289', '6A86CAF91C4882531AE7731B7607B661');
INSERT INTO `jc_api_record` VALUES ('508', '1', '127.0.0.1', null, '2018-04-17 20:39:06', '1523968746012', 'D1C746C5CBAE0AB10A5EC89B201D995C');
INSERT INTO `jc_api_record` VALUES ('509', '1', '127.0.0.1', null, '2018-04-17 20:39:28', '1523968767655', '6B9CB5A4076DBD3E4552D09453EF9791');
INSERT INTO `jc_api_record` VALUES ('510', '1', '127.0.0.1', null, '2018-04-17 20:39:46', '1523968786252', 'D879A2101CEB2D9E7FF3879BFCB64C07');
INSERT INTO `jc_api_record` VALUES ('511', '1', '127.0.0.1', null, '2018-04-17 20:39:53', '1523968792761', '666F68687CB19038D4844B46F5117CAD');
INSERT INTO `jc_api_record` VALUES ('512', '1', '127.0.0.1', null, '2018-04-17 20:39:59', '1523968798878', 'D0F439CA3ED17BCC90255298837EF12D');
INSERT INTO `jc_api_record` VALUES ('513', '1', '127.0.0.1', null, '2018-04-17 20:40:07', '1523968807252', '5DF8CDA6F3F5AD17B1A7F556B0AB4B4B');
INSERT INTO `jc_api_record` VALUES ('514', '1', '127.0.0.1', null, '2018-04-17 20:40:43', '1523968842797', 'A9D00E6032F9A44C193C0ED7B52C9513');
INSERT INTO `jc_api_record` VALUES ('515', '1', '127.0.0.1', null, '2018-04-17 20:41:14', '1523968873595', 'D89C1E9D93832BABC30311DFD6A5E946');
INSERT INTO `jc_api_record` VALUES ('516', '1', '127.0.0.1', null, '2018-04-17 20:41:58', '1523968917691', 'B2370C3B9414739B72B830C9439DC8B6');
INSERT INTO `jc_api_record` VALUES ('517', '1', '127.0.0.1', null, '2018-04-17 22:19:06', '1523974746459', 'D842BBF6BA70EEF4A137D5DF795BD9A2');
INSERT INTO `jc_api_record` VALUES ('518', '1', '127.0.0.1', null, '2018-04-17 22:30:14', '1523975414109', 'B3B6F342A470E0E3E003E88A642498FC');
INSERT INTO `jc_api_record` VALUES ('519', '1', '127.0.0.1', null, '2018-04-18 20:35:14', '1524054914036', '9CE37E1BEA6F3DC10F7F572605BA17F7');
INSERT INTO `jc_api_record` VALUES ('520', '1', '127.0.0.1', null, '2018-04-18 20:38:12', '1524055092928', '97AD3FE2125E881FC1E6BAE54F79BAA3');
INSERT INTO `jc_api_record` VALUES ('521', '1', '127.0.0.1', null, '2018-04-18 20:41:24', '1524055284809', '5C4C0F6944C04DC63BEBC2B3A348DF5A');
INSERT INTO `jc_api_record` VALUES ('522', '1', '127.0.0.1', null, '2018-04-18 20:41:40', '1524055300183', 'EC01319B153B7D442A646762201F3372');
INSERT INTO `jc_api_record` VALUES ('523', '1', '127.0.0.1', null, '2018-04-18 20:41:54', '1524055314774', 'ED177A9241A8B6907C0FBDFAC1F2A128');
INSERT INTO `jc_api_record` VALUES ('524', '1', '127.0.0.1', null, '2018-04-18 20:44:52', '1524055492739', 'C44152980BE45CF262934368132B5091');
INSERT INTO `jc_api_record` VALUES ('525', '1', '127.0.0.1', null, '2018-04-18 20:47:49', '1524055669782', 'AC3D10BF24611DE59FB50C78CE4D5DD0');
INSERT INTO `jc_api_record` VALUES ('526', '1', '127.0.0.1', null, '2018-04-18 20:50:46', '1524055846387', 'CFCDEEECB24A38F74A7F4FA414932D5E');
INSERT INTO `jc_api_record` VALUES ('527', '1', '127.0.0.1', null, '2018-04-18 20:52:47', '1524055967326', 'A44516127F9E9FC01F1D23BE0335B5C8');
INSERT INTO `jc_api_record` VALUES ('528', '1', '127.0.0.1', null, '2018-04-18 20:53:20', '1524056000545', 'A44516127F9E9FC01F1D23BE0335B5C8');
INSERT INTO `jc_api_record` VALUES ('529', '1', '127.0.0.1', null, '2018-04-18 20:53:33', '1524056013932', 'A44516127F9E9FC01F1D23BE0335B5C8');
INSERT INTO `jc_api_record` VALUES ('530', '1', '127.0.0.1', null, '2018-04-18 20:53:42', '1524056022280', 'A44516127F9E9FC01F1D23BE0335B5C8');
INSERT INTO `jc_api_record` VALUES ('531', '1', '127.0.0.1', null, '2018-04-18 20:54:47', '1524056087935', '2AB0BDB260D1323D09084F39FEC5DC49');
INSERT INTO `jc_api_record` VALUES ('532', '1', '127.0.0.1', null, '2018-04-18 20:54:58', '1524056098103', 'A44516127F9E9FC01F1D23BE0335B5C8');
INSERT INTO `jc_api_record` VALUES ('533', '1', '127.0.0.1', null, '2018-04-18 20:55:52', '1524056152524', 'A44516127F9E9FC01F1D23BE0335B5C8');
INSERT INTO `jc_api_record` VALUES ('534', '1', '127.0.0.1', null, '2018-04-18 20:56:06', '1524056166990', 'A44516127F9E9FC01F1D23BE0335B5C8');
INSERT INTO `jc_api_record` VALUES ('535', '1', '127.0.0.1', null, '2018-04-18 20:56:18', '1524056178369', 'A44516127F9E9FC01F1D23BE0335B5C8');
INSERT INTO `jc_api_record` VALUES ('536', '1', '127.0.0.1', null, '2018-04-18 20:56:20', '1524056180865', 'A44516127F9E9FC01F1D23BE0335B5C8');
INSERT INTO `jc_api_record` VALUES ('537', '1', '127.0.0.1', null, '2018-04-18 21:52:18', '1524059538292', 'C6BCD5804BAD9AD0267E17F1CAFBA186');
INSERT INTO `jc_api_record` VALUES ('538', '1', '127.0.0.1', null, '2018-04-18 21:52:27', '1524059547985', 'B49AED64E77B8658527E657C5A737B1B');
INSERT INTO `jc_api_record` VALUES ('539', '1', '127.0.0.1', null, '2018-04-18 22:13:56', '1524060836198', '850B3DBCEE0182183EFBE09EAF4F11EA');
INSERT INTO `jc_api_record` VALUES ('540', '1', '127.0.0.1', null, '2018-04-18 22:58:20', '1524063500225', '0C2C01369D7248F062C332B9E53738CB');
INSERT INTO `jc_api_record` VALUES ('541', '1', '127.0.0.1', null, '2018-04-18 22:58:30', '1524063510264', '12A7E71905DDC92FEA1F300764235B0E');
INSERT INTO `jc_api_record` VALUES ('542', '1', '127.0.0.1', null, '2018-04-18 23:28:26', '1524065306532', 'AC0FC199CDA6E1982BF73C2F72B062E6');
INSERT INTO `jc_api_record` VALUES ('543', '1', '127.0.0.1', null, '2018-04-18 23:38:30', '1524065910257', 'AF53AF511A1FBEFF0AAD121D2816BE59');
INSERT INTO `jc_api_record` VALUES ('544', '1', '127.0.0.1', null, '2018-04-18 23:38:45', '1524065925853', 'AF53AF511A1FBEFF0AAD121D2816BE59');
INSERT INTO `jc_api_record` VALUES ('545', '1', '127.0.0.1', null, '2018-04-18 23:39:00', '1524065940687', '25D0C6ADFF03AB132BC4FFF0E18D1C3B');
INSERT INTO `jc_api_record` VALUES ('546', '1', '127.0.0.1', null, '2018-04-18 23:40:08', '1524066008131', 'AF53AF511A1FBEFF0AAD121D2816BE59');
INSERT INTO `jc_api_record` VALUES ('547', '1', '127.0.0.1', null, '2018-04-18 23:40:17', '1524066017177', 'AF53AF511A1FBEFF0AAD121D2816BE59');
INSERT INTO `jc_api_record` VALUES ('548', '1', '127.0.0.1', null, '2018-04-18 23:40:19', '1524066019524', '1B000FB32A52587BE718E8F641BEA197');
INSERT INTO `jc_api_record` VALUES ('549', '1', '127.0.0.1', null, '2018-04-18 23:40:45', '1524066045008', 'AF53AF511A1FBEFF0AAD121D2816BE59');
INSERT INTO `jc_api_record` VALUES ('550', '1', '127.0.0.1', null, '2018-04-18 23:40:50', '1524066050073', 'AF53AF511A1FBEFF0AAD121D2816BE59');
INSERT INTO `jc_api_record` VALUES ('551', '1', '127.0.0.1', null, '2018-04-18 23:40:51', '1524066051915', 'BB35FA6185389DFC0301F034E7D2F935');
INSERT INTO `jc_api_record` VALUES ('552', '1', '127.0.0.1', null, '2018-04-18 23:41:10', '1524066070676', 'AF53AF511A1FBEFF0AAD121D2816BE59');
INSERT INTO `jc_api_record` VALUES ('553', '1', '127.0.0.1', null, '2018-04-18 23:41:24', '1524066084705', 'AF53AF511A1FBEFF0AAD121D2816BE59');
INSERT INTO `jc_api_record` VALUES ('554', '1', '127.0.0.1', null, '2018-04-18 23:41:29', '1524066089313', '103D2C3B83D7171FDEEA10D68175DE44');
INSERT INTO `jc_api_record` VALUES ('555', '1', '127.0.0.1', null, '2018-04-19 22:43:13', '1524148993742', '3C91E0055C615F23D09B03CCB463BE77');
INSERT INTO `jc_api_record` VALUES ('556', '1', '127.0.0.1', null, '2018-04-19 22:56:23', '1524149783488', '7E4A719A2E09BCE55977C56F96C60C7E');
INSERT INTO `jc_api_record` VALUES ('557', '1', '127.0.0.1', null, '2018-04-19 23:25:34', '1524151534559', '6870C4F1B893E6E3D60DB73F796D8453');
INSERT INTO `jc_api_record` VALUES ('558', '1', '127.0.0.1', null, '2018-04-19 23:26:06', '1524151566026', 'AE076DE709DD442A1A16CAA06252436C');
INSERT INTO `jc_api_record` VALUES ('559', '1', '127.0.0.1', null, '2018-04-19 23:26:28', '1524151588351', '6E27895055CCBC5A38E1F6468946E8B6');
INSERT INTO `jc_api_record` VALUES ('560', '1', '127.0.0.1', null, '2018-04-19 23:29:29', '1524151769290', '9C2F64EC8690AB8F46B8E78037E56917');
INSERT INTO `jc_api_record` VALUES ('561', '1', '127.0.0.1', null, '2018-04-19 23:29:51', '1524151791818', '2130933D56E84178E75D078ECEBF67CD');
INSERT INTO `jc_api_record` VALUES ('562', '1', '127.0.0.1', null, '2018-04-19 23:30:06', '1524151806436', '32AE91CFF5F909D1B2E841F9343D0BB4');
INSERT INTO `jc_api_record` VALUES ('563', '1', '127.0.0.1', null, '2018-04-19 23:30:19', '1524151819831', '8C0EA3571CB6B933863A45FD52E0BCD1');
INSERT INTO `jc_api_record` VALUES ('564', '1', '127.0.0.1', null, '2018-04-19 23:30:32', '1524151832207', '2F5F8C4B0AB956F55D79A4A857650A1E');
INSERT INTO `jc_api_record` VALUES ('565', '1', '127.0.0.1', null, '2018-04-19 23:30:48', '1524151848352', 'ACE4273B7E413C4A626ED3D0C4551B59');
INSERT INTO `jc_api_record` VALUES ('566', '1', '127.0.0.1', null, '2018-04-19 23:31:13', '1524151873756', '44D4A12090B1946B5B6C7D0FFFD0CE55');
INSERT INTO `jc_api_record` VALUES ('567', '1', '127.0.0.1', null, '2018-04-19 23:32:20', '1524151940492', '0FF2EF65959882A7AEC58EC1747DD587');
INSERT INTO `jc_api_record` VALUES ('568', '1', '127.0.0.1', null, '2018-04-19 23:34:29', '1524152069962', 'C9E04579F765150F5F25F14E8656E44C');
INSERT INTO `jc_api_record` VALUES ('569', '1', '127.0.0.1', null, '2018-04-19 23:40:20', '1524152420905', 'B398DDC055252530256C76D7EDCED408');
INSERT INTO `jc_api_record` VALUES ('570', '1', '127.0.0.1', null, '2018-04-19 23:45:28', '1524152728186', '0C791BC4FAAD8B3C5A26F5BB9090C9EF');
INSERT INTO `jc_api_record` VALUES ('571', '1', '127.0.0.1', null, '2018-04-19 23:45:42', '1524152742648', '25E0AAD9985D72EE984374D304726821');
INSERT INTO `jc_api_record` VALUES ('572', '1', '127.0.0.1', null, '2018-04-21 08:33:40', '1524270820015', '91C8E386F9FB3DED131794EE030662C1');
INSERT INTO `jc_api_record` VALUES ('573', '1', '127.0.0.1', null, '2018-04-21 08:36:06', '1524270966145', '1593E9163D54298525A636E634FF19C8');
INSERT INTO `jc_api_record` VALUES ('574', '1', '127.0.0.1', null, '2018-04-21 08:44:45', '1524271485511', '023428403B2195142A936F5BDE4EAA5F');
INSERT INTO `jc_api_record` VALUES ('575', '1', '127.0.0.1', null, '2018-04-21 08:46:18', '1524271578733', '58F353830D960F0C35796B4F5567CE16');
INSERT INTO `jc_api_record` VALUES ('576', '1', '127.0.0.1', null, '2018-04-21 08:52:59', '1524271979098', 'C84F9297C6D780886452E6673FF6907E');
INSERT INTO `jc_api_record` VALUES ('577', '1', '127.0.0.1', null, '2018-04-21 08:54:00', '1524272040569', 'C0DBF41636A23F078652E82829708923');
INSERT INTO `jc_api_record` VALUES ('578', '1', '127.0.0.1', null, '2018-04-21 08:54:13', '1524272053351', '9FC683783E55766722DD5AC1D49918B5');
INSERT INTO `jc_api_record` VALUES ('579', '1', '127.0.0.1', null, '2018-04-21 08:54:41', '1524272081769', 'DD1E8DBEB2DA16DACADC683AB3B4D64F');
INSERT INTO `jc_api_record` VALUES ('580', '1', '127.0.0.1', null, '2018-04-21 08:57:53', '1524272273107', 'EBF7398B6C232143316BB1A8D8638039');
INSERT INTO `jc_api_record` VALUES ('581', '1', '127.0.0.1', null, '2018-04-21 08:58:22', '1524272302463', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('582', '1', '127.0.0.1', null, '2018-04-21 08:58:26', '1524272306144', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('583', '1', '127.0.0.1', null, '2018-04-21 08:58:56', '1524272336320', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('584', '1', '127.0.0.1', null, '2018-04-21 08:58:59', '1524272339532', '8A3393A36EF3D366DF876FED62D51211');
INSERT INTO `jc_api_record` VALUES ('585', '1', '127.0.0.1', null, '2018-04-21 08:59:07', '1524272347304', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('586', '1', '127.0.0.1', null, '2018-04-21 08:59:09', '1524272349058', '1DD5605FEC0EA70445AFD31515D97B1C');
INSERT INTO `jc_api_record` VALUES ('587', '1', '127.0.0.1', null, '2018-04-21 09:05:20', '1524272720780', '7D6CE1D6A69170473442296C76F974D8');
INSERT INTO `jc_api_record` VALUES ('588', '1', '127.0.0.1', null, '2018-04-21 09:06:42', '1524272802559', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('589', '1', '127.0.0.1', null, '2018-04-21 09:07:13', '1524272833578', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('590', '1', '127.0.0.1', null, '2018-04-21 09:07:27', '1524272847057', '6B3D36D63D5379602AE88B9CA7444678');
INSERT INTO `jc_api_record` VALUES ('591', '1', '127.0.0.1', null, '2018-04-21 09:08:23', '1524272903350', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('592', '1', '127.0.0.1', null, '2018-04-21 09:08:25', '1524272905879', '5CD525D0327737816EFC61FCB5AEBDF5');
INSERT INTO `jc_api_record` VALUES ('593', '1', '127.0.0.1', null, '2018-04-21 09:12:06', '1524273126279', '5C27FF000E8A37239050BA45B879B026');
INSERT INTO `jc_api_record` VALUES ('594', '1', '127.0.0.1', null, '2018-04-21 09:12:35', '1524273155825', '60C8A449E2A69042FDF4626CA3D3E5E5');
INSERT INTO `jc_api_record` VALUES ('595', '1', '127.0.0.1', null, '2018-04-21 09:18:57', '1524273537164', 'D1739EC398923F6094C587E29A182564');
INSERT INTO `jc_api_record` VALUES ('596', '1', '127.0.0.1', null, '2018-04-21 09:24:47', '1524273887903', '87FC7A2B32B8DFB18BB61D7FC9FEC000');
INSERT INTO `jc_api_record` VALUES ('597', '1', '127.0.0.1', null, '2018-04-21 09:25:51', '1524273951759', 'FCBA89C59A540733E96E8E246959D91A');
INSERT INTO `jc_api_record` VALUES ('598', '1', '127.0.0.1', null, '2018-04-21 09:26:06', '1524273966353', '0852646481B8DBCA1719F5BA7CF69999');
INSERT INTO `jc_api_record` VALUES ('599', '1', '127.0.0.1', null, '2018-04-21 09:27:35', '1524274055736', '8B57B037F8E9244D2D1830B6E3EFE2DF');
INSERT INTO `jc_api_record` VALUES ('600', '1', '127.0.0.1', null, '2018-04-21 09:27:56', '1524274076044', '07F682CF4DFEB317865B73530CA80583');
INSERT INTO `jc_api_record` VALUES ('601', '1', '127.0.0.1', null, '2018-04-21 09:28:07', '1524274087514', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('602', '1', '127.0.0.1', null, '2018-04-21 09:28:26', '1524274106145', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('603', '1', '127.0.0.1', null, '2018-04-21 09:28:27', '1524274107946', '251104A1F31DC13B2B76A939DFF43A90');
INSERT INTO `jc_api_record` VALUES ('604', '1', '127.0.0.1', null, '2018-04-21 09:28:35', '1524274115008', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('605', '1', '127.0.0.1', null, '2018-04-21 09:28:36', '1524274116676', '534958CA4714F83C55038D303627B43C');
INSERT INTO `jc_api_record` VALUES ('606', '1', '127.0.0.1', null, '2018-04-21 09:28:50', '1524274130887', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('607', '1', '127.0.0.1', null, '2018-04-21 09:29:10', '1524274150011', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('608', '1', '127.0.0.1', null, '2018-04-21 09:29:11', '1524274151602', '13252E098063AFB4612494DCECC04C63');
INSERT INTO `jc_api_record` VALUES ('609', '1', '127.0.0.1', null, '2018-04-21 09:29:26', '1524274166577', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('610', '1', '127.0.0.1', null, '2018-04-21 09:29:31', '1524274171169', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('611', '1', '127.0.0.1', null, '2018-04-21 09:29:31', '1524274171965', '7734D423B70481B10F03EB272F7C9554');
INSERT INTO `jc_api_record` VALUES ('612', '1', '127.0.0.1', null, '2018-04-21 09:29:43', '1524274183760', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('613', '1', '127.0.0.1', null, '2018-04-21 09:29:52', '1524274192129', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('614', '1', '127.0.0.1', null, '2018-04-21 09:29:53', '1524274193074', '06146C10450A05B8FFC199B26CC79825');
INSERT INTO `jc_api_record` VALUES ('615', '1', '127.0.0.1', null, '2018-04-21 09:38:02', '1524274682870', 'A913A1A93BE4BFDFF5C09D6FDB4681BF');
INSERT INTO `jc_api_record` VALUES ('616', '1', '127.0.0.1', null, '2018-04-21 09:38:50', '1524274730091', '09CAA6A691B745710FD4DAAA29E15ECD');
INSERT INTO `jc_api_record` VALUES ('617', '1', '127.0.0.1', null, '2018-04-21 09:39:41', '1524274781708', '7B07D3E27EDAACACF6BE2FB20000BB86');
INSERT INTO `jc_api_record` VALUES ('618', '1', '127.0.0.1', null, '2018-04-21 09:40:38', '1524274838084', '9034C1305517C9CCDFDA57910B457450');
INSERT INTO `jc_api_record` VALUES ('619', '1', '127.0.0.1', null, '2018-04-21 09:43:57', '1524275037508', '1F8ED0B2375EF9E8AB1DB51952D66641');
INSERT INTO `jc_api_record` VALUES ('620', '1', '127.0.0.1', null, '2018-04-21 09:43:59', '1524275039754', 'FCB451B917D2A1245FC7915585774639');
INSERT INTO `jc_api_record` VALUES ('621', '1', '127.0.0.1', null, '2018-04-21 09:44:15', '1524275055514', '591ACEA3C6AE2FD09642821CC7362FA8');
INSERT INTO `jc_api_record` VALUES ('622', '1', '127.0.0.1', null, '2018-04-21 09:44:24', '1524275064179', '5D55AC80DC56FCEB3C1AD233C5FF7F15');
INSERT INTO `jc_api_record` VALUES ('623', '1', '127.0.0.1', null, '2018-04-21 09:50:02', '1524275402877', '4D888FCBECBBFE582988355735EA7A9D');
INSERT INTO `jc_api_record` VALUES ('624', '1', '127.0.0.1', null, '2018-04-21 09:51:28', '1524275488947', '7D1ECD8F0B4201B61251276C6B6E4386');
INSERT INTO `jc_api_record` VALUES ('625', '1', '127.0.0.1', null, '2018-04-21 09:52:29', '1524275549077', '99F3EF0E74002BE2B27CCFFD26FF78E7');
INSERT INTO `jc_api_record` VALUES ('626', '1', '127.0.0.1', null, '2018-04-21 09:53:12', '1524275592633', 'BEC16011915F381917FECCB09373BCE6');
INSERT INTO `jc_api_record` VALUES ('627', '1', '127.0.0.1', null, '2018-04-21 09:53:54', '1524275634311', '7942BBC7FF7A10FBDCA86BB7C1A5832D');
INSERT INTO `jc_api_record` VALUES ('628', '1', '127.0.0.1', null, '2018-04-21 09:54:21', '1524275661472', '0CD60EF43EB3FA3B2693ADFC791A5C2D');
INSERT INTO `jc_api_record` VALUES ('629', '1', '127.0.0.1', null, '2018-04-21 09:54:49', '1524275689370', '8E358A5025BF84E5F023EB8A050346D6');
INSERT INTO `jc_api_record` VALUES ('630', '1', '127.0.0.1', null, '2018-04-21 09:55:15', '1524275715978', '5C2E81E3CE28FA2E0FA02C9B758448A2');
INSERT INTO `jc_api_record` VALUES ('631', '1', '127.0.0.1', null, '2018-04-21 10:01:15', '1524276075180', 'D3A3E89D7AF643CFBE0171995CDF01B3');
INSERT INTO `jc_api_record` VALUES ('632', '1', '127.0.0.1', null, '2018-04-21 10:03:21', '1524276201722', '6F8907A691EAA32E2E7882D83576953C');
INSERT INTO `jc_api_record` VALUES ('633', '1', '127.0.0.1', null, '2018-04-21 10:04:33', '1524276273224', '8F1CC36100169C965844FAC5B7D2466E');
INSERT INTO `jc_api_record` VALUES ('634', '1', '127.0.0.1', null, '2018-04-21 10:05:23', '1524276323187', '4DC60B6869DBA27997203FD97ED3925B');
INSERT INTO `jc_api_record` VALUES ('635', '1', '127.0.0.1', null, '2018-04-21 10:06:17', '1524276377158', '57BD471F2812880E553F096F8A97E5E5');
INSERT INTO `jc_api_record` VALUES ('636', '1', '127.0.0.1', null, '2018-04-21 10:07:24', '1524276444444', '33699C46E473C1BEED645B144AB06F68');
INSERT INTO `jc_api_record` VALUES ('637', '1', '127.0.0.1', null, '2018-04-21 10:07:42', '1524276462482', '11D3FDC6DEC195A9A55616E75DD7602E');
INSERT INTO `jc_api_record` VALUES ('638', '1', '127.0.0.1', null, '2018-04-21 10:08:04', '1524276484496', '016146D76D8F5C834AB15DE4C01170EB');
INSERT INTO `jc_api_record` VALUES ('639', '1', '127.0.0.1', null, '2018-04-21 10:08:27', '1524276507248', 'DC5F75D0B247941E2F8A68E22798A3F9');
INSERT INTO `jc_api_record` VALUES ('640', '1', '127.0.0.1', null, '2018-04-21 10:08:55', '1524276535498', '29CA6372FE746CEFE53686569037452A');
INSERT INTO `jc_api_record` VALUES ('641', '1', '127.0.0.1', null, '2018-04-21 10:09:56', '1524276596628', 'F16C614669394645D0668950C5920984');
INSERT INTO `jc_api_record` VALUES ('642', '1', '127.0.0.1', null, '2018-04-21 10:10:42', '1524276642930', '59B0021E2B1FD7FA5302581885D46EFF');
INSERT INTO `jc_api_record` VALUES ('643', '1', '127.0.0.1', null, '2018-04-21 10:10:53', '1524276653485', 'B8CB4D0C03F8236BC414819CB3D1ECD9');
INSERT INTO `jc_api_record` VALUES ('644', '1', '127.0.0.1', null, '2018-04-21 10:12:42', '1524276762558', '31D6E30E5E32EB5FE342B7CA6E19304A');
INSERT INTO `jc_api_record` VALUES ('645', '1', '127.0.0.1', null, '2018-04-21 10:13:41', '1524276821489', '0ECCA45AF719279F6FE24AE61C47659E');
INSERT INTO `jc_api_record` VALUES ('646', '1', '127.0.0.1', null, '2018-04-21 10:14:21', '1524276861134', '0B8BC441136510EE8AB8453C696CA92F');
INSERT INTO `jc_api_record` VALUES ('647', '1', '127.0.0.1', null, '2018-04-21 10:15:45', '1524276945271', 'B8CB4D0C03F8236BC414819CB3D1ECD9');
INSERT INTO `jc_api_record` VALUES ('648', '1', '127.0.0.1', null, '2018-04-21 10:16:16', '1524276976368', 'B8CB4D0C03F8236BC414819CB3D1ECD9');
INSERT INTO `jc_api_record` VALUES ('649', '1', '127.0.0.1', null, '2018-04-21 10:16:17', '1524276977673', '5056AF90625FBC415496E62A358FF6AE');
INSERT INTO `jc_api_record` VALUES ('650', '1', '127.0.0.1', null, '2018-04-21 10:16:45', '1524277005796', 'B8CB4D0C03F8236BC414819CB3D1ECD9');
INSERT INTO `jc_api_record` VALUES ('651', '1', '127.0.0.1', null, '2018-04-21 10:16:52', '1524277012980', 'B8CB4D0C03F8236BC414819CB3D1ECD9');
INSERT INTO `jc_api_record` VALUES ('652', '1', '127.0.0.1', null, '2018-04-21 10:16:55', '1524277015113', 'F4A735A6E46D6649EDAEA4887E21CFE4');
INSERT INTO `jc_api_record` VALUES ('653', '1', '127.0.0.1', null, '2018-04-21 10:19:07', '1524277147840', '9B97991E57499AB5D0CE988DCC7B9103');
INSERT INTO `jc_api_record` VALUES ('654', '1', '127.0.0.1', null, '2018-04-21 10:39:29', '1524278369373', '75B88B0396B0D9350EB50F5ACB4C5F99');
INSERT INTO `jc_api_record` VALUES ('655', '1', '127.0.0.1', null, '2018-04-21 10:39:58', '1524278398647', '81EC2F2534A7CE296FAF5EA5D14F9B7F');
INSERT INTO `jc_api_record` VALUES ('656', '1', '127.0.0.1', null, '2018-04-21 10:40:00', '1524278400832', '0FADABB0FCC1EB73C48B4B5BC9820FE8');
INSERT INTO `jc_api_record` VALUES ('657', '1', '127.0.0.1', null, '2018-04-21 11:38:04', '1524281884545', 'ECF55C7AE73B446746EB2C0F66114688');
INSERT INTO `jc_api_record` VALUES ('658', '1', '127.0.0.1', null, '2018-04-21 11:38:18', '1524281898872', '6E26BBE79531D306D96F5CF218D9B633');
INSERT INTO `jc_api_record` VALUES ('659', '1', '127.0.0.1', null, '2018-04-21 11:38:21', '1524281901335', 'C6E0E82CF909905E059001DF9CD4823C');
INSERT INTO `jc_api_record` VALUES ('660', '1', '127.0.0.1', null, '2018-04-21 11:38:29', '1524281909735', '6E26BBE79531D306D96F5CF218D9B633');
INSERT INTO `jc_api_record` VALUES ('661', '1', '127.0.0.1', null, '2018-04-21 11:38:31', '1524281911782', '8A2B0E531663FC9C0745FFF40558CB5E');
INSERT INTO `jc_api_record` VALUES ('662', '1', '127.0.0.1', null, '2018-04-21 11:43:43', '1524282223305', '1F42696EF974F9D68E1585BB41C103B3');
INSERT INTO `jc_api_record` VALUES ('663', '1', '127.0.0.1', null, '2018-04-21 15:43:07', '1524296587127', '9130D8CE492854A42FCBB9C64A4013F7');
INSERT INTO `jc_api_record` VALUES ('664', '1', '127.0.0.1', null, '2018-04-21 15:56:28', '1524297388831', '2EE3DF7B0069F1A7C0BE8F170DEBF6CB');
INSERT INTO `jc_api_record` VALUES ('665', '1', '127.0.0.1', null, '2018-04-21 15:57:01', '1524297421832', '96EE3672D69E2C629EDE85B846932E2F');
INSERT INTO `jc_api_record` VALUES ('666', '1', '127.0.0.1', null, '2018-04-21 15:57:34', '1524297454368', 'E88DBA5093D6D7F66649929939C19963');
INSERT INTO `jc_api_record` VALUES ('667', '1', '127.0.0.1', null, '2018-04-21 15:57:46', '1524297466670', 'BF659D9320514C144778ACEC40549D83');
INSERT INTO `jc_api_record` VALUES ('668', '1', '127.0.0.1', null, '2018-04-21 15:57:57', '1524297477814', '0E5A1A1C35331E7500D0D0B7415CC07D');
INSERT INTO `jc_api_record` VALUES ('669', '1', '127.0.0.1', null, '2018-04-21 15:58:08', '1524297488781', '291A2A576545AC1142ECDD1F944C7AD6');
INSERT INTO `jc_api_record` VALUES ('670', '1', '127.0.0.1', null, '2018-04-21 17:20:26', '1524302426375', '0A98EE3AAB8090DE7AF43A343737803C');
INSERT INTO `jc_api_record` VALUES ('671', '1', '127.0.0.1', null, '2018-04-21 17:21:50', '1524302510641', '950B8F12355BF63DBD6CB968404BFEAC');
INSERT INTO `jc_api_record` VALUES ('672', '1', '127.0.0.1', null, '2018-04-21 17:22:10', '1524302530089', '2B3D915C27A9570F75F87E94870EACED');
INSERT INTO `jc_api_record` VALUES ('673', '1', '127.0.0.1', null, '2018-04-21 22:15:56', '1524320156568', '69FC95C8553B81E45D06385F070EFAA3');
INSERT INTO `jc_api_record` VALUES ('674', '1', '127.0.0.1', null, '2018-04-21 22:17:32', '1524320252688', 'BFCB8E9F163017B20EF638FA2112C90C');
INSERT INTO `jc_api_record` VALUES ('675', '1', '127.0.0.1', null, '2018-04-21 23:37:53', '1524325073877', 'D1497B53B47F02D51B9E546417039B0B');
INSERT INTO `jc_api_record` VALUES ('676', '1', '127.0.0.1', null, '2018-04-21 23:39:24', '1524325164915', '384576ECCA36260310762FB5CD5A7C4E');
INSERT INTO `jc_api_record` VALUES ('677', '1', '127.0.0.1', null, '2018-04-22 00:08:27', '1524326907150', '4BDEEFE88B6F24ABF1266035A8C5B2E7');
INSERT INTO `jc_api_record` VALUES ('678', '1', '127.0.0.1', null, '2018-04-22 00:08:48', '1524326928682', '45F2EB2296C505001F478757D58A8A65');
INSERT INTO `jc_api_record` VALUES ('679', '1', '127.0.0.1', null, '2018-04-22 00:09:27', '1524326967807', 'A16F126EBF51930F564BD5F533D56633');
INSERT INTO `jc_api_record` VALUES ('680', '1', '127.0.0.1', null, '2018-04-22 09:27:00', '1524360420416', 'E4DC30B47DEEE4D83B7E2D0E21F29F12');
INSERT INTO `jc_api_record` VALUES ('681', '1', '127.0.0.1', null, '2018-04-22 09:30:00', '1524360600417', 'CEC88EFD82A393B6E721C615EAFE8670');
INSERT INTO `jc_api_record` VALUES ('682', '1', '127.0.0.1', null, '2018-04-22 09:54:53', '1524362093789', 'C03BA6D626DEC2915F1D8B5EE2651089');
INSERT INTO `jc_api_record` VALUES ('683', '1', '127.0.0.1', null, '2018-04-22 09:55:11', '1524362111299', '9D18CEBFA66681FE3304559AC6D56268');
INSERT INTO `jc_api_record` VALUES ('684', '1', '127.0.0.1', null, '2018-04-22 09:55:36', '1524362136363', 'DE63839D02E1028C3E59FCB8CD54C83D');
INSERT INTO `jc_api_record` VALUES ('685', '1', '127.0.0.1', null, '2018-04-22 09:55:46', '1524362146669', 'D9BDFA90F7D0008F8934D82C6C00559C');
INSERT INTO `jc_api_record` VALUES ('686', '1', '127.0.0.1', null, '2018-04-22 09:56:40', '1524362200529', '81806E3E0E47D5DE8ED8F616B39283AC');
INSERT INTO `jc_api_record` VALUES ('687', '1', '127.0.0.1', null, '2018-04-22 09:57:20', '1524362240333', '9E0BC06CB0366AB34F595E31B4BAB4EA');
INSERT INTO `jc_api_record` VALUES ('688', '1', '127.0.0.1', null, '2018-04-22 10:08:03', '1524362883909', '2BC7C6AD7C8BFA2CA6830CA05AEF6B63');
INSERT INTO `jc_api_record` VALUES ('689', '1', '127.0.0.1', null, '2018-04-22 10:38:03', '1524364683011', 'FA50156A05FEDE104743C800A8291C96');
INSERT INTO `jc_api_record` VALUES ('690', '1', '127.0.0.1', null, '2018-04-22 12:01:54', '1524369714517', 'EC88DD29BA4201F323D0C182A7E00B38');
INSERT INTO `jc_api_record` VALUES ('691', '1', '127.0.0.1', null, '2018-04-22 12:02:23', '1524369743672', 'E8428F93775CD1E98A8D497DF41F2263');
INSERT INTO `jc_api_record` VALUES ('692', '1', '127.0.0.1', null, '2018-04-22 12:02:38', '1524369758200', '2E4CAE946540D499C975051A8EBE5EC2');
INSERT INTO `jc_api_record` VALUES ('693', '1', '127.0.0.1', null, '2018-04-22 12:02:58', '1524369778309', '6A43D320B5ECA446F486F234E1D68707');
INSERT INTO `jc_api_record` VALUES ('694', '1', '127.0.0.1', null, '2018-04-22 12:03:10', '1524369790248', 'E01524BD05C02A0A70A3F8DFDACF9C77');
INSERT INTO `jc_api_record` VALUES ('695', '1', '127.0.0.1', null, '2018-04-22 12:03:20', '1524369800114', '97B484EF813ADA83A19836E5F34A9011');
INSERT INTO `jc_api_record` VALUES ('696', '1', '127.0.0.1', null, '2018-04-22 13:56:23', '1524376583553', '6DC002D5ACE3956C19F76D5BC09539DD');
INSERT INTO `jc_api_record` VALUES ('697', '1', '127.0.0.1', null, '2018-04-24 18:57:50', '1524567470654', 'E65D96EE2F8A51B1F086F22F135BF633');
INSERT INTO `jc_api_record` VALUES ('698', '1', '127.0.0.1', null, '2018-04-24 20:19:37', '1524572377116', '9F3BAA5DE1691DC0913079586FACF418');
INSERT INTO `jc_api_record` VALUES ('699', '1', '127.0.0.1', null, '2018-04-24 20:21:09', '1524572469964', 'A27E1B054D1FE70B87CD2BF1F182F116');
INSERT INTO `jc_api_record` VALUES ('700', '1', '127.0.0.1', null, '2018-04-24 20:21:22', '1524572482133', '90BA122BD05D87C54D69C9C7CF761DFA');
INSERT INTO `jc_api_record` VALUES ('701', '1', '127.0.0.1', null, '2018-04-24 22:04:43', '1524578683514', '8D5B62B170030D96CA6459895F76443D');
INSERT INTO `jc_api_record` VALUES ('702', '1', '127.0.0.1', null, '2018-04-24 22:08:09', '1524578889323', '5A441B8790EAE2A58A22D6265C234141');
INSERT INTO `jc_api_record` VALUES ('703', '1', '127.0.0.1', null, '2018-04-24 22:08:20', '1524578900189', 'BD05D1B3B252B19D04443D34D05CDE3A');
INSERT INTO `jc_api_record` VALUES ('704', '1', '127.0.0.1', null, '2018-05-15 20:23:50', '1526387030992', '1F3B4463E72020601A4BB06BFFC798FA');
INSERT INTO `jc_api_record` VALUES ('705', '1', '127.0.0.1', null, '2018-05-15 21:13:38', '1526390017981', '74AD5E1409EFAE08E003B546AEEE8953');
INSERT INTO `jc_api_record` VALUES ('706', '1', '127.0.0.1', null, '2018-05-15 21:37:06', '1526391425971', '650587F486A0FFC0971FB424C9E581C3');
INSERT INTO `jc_api_record` VALUES ('707', '1', '127.0.0.1', null, '2018-05-15 21:42:55', '1526391775490', 'AA6694F42D78D9D91A09AFB3AF27BDE1');
INSERT INTO `jc_api_record` VALUES ('708', '1', '127.0.0.1', null, '2018-05-15 21:45:06', '1526391906235', '55ED890D8CF667574F01F187B13CBF78');
INSERT INTO `jc_api_record` VALUES ('709', '1', '127.0.0.1', null, '2018-05-15 21:48:26', '1526392105639', '785C4A56FD83106E2D6865F170AFC8B1');
INSERT INTO `jc_api_record` VALUES ('710', '1', '127.0.0.1', null, '2018-05-15 21:51:48', '1526392307634', 'A7A6404C9688E6EE251B1CD542C5F8F7');
INSERT INTO `jc_api_record` VALUES ('711', '1', '127.0.0.1', null, '2018-05-15 21:52:43', '1526392363317', 'DF8554845CCE79D625A29102E2D6F7BC');
INSERT INTO `jc_api_record` VALUES ('712', '1', '127.0.0.1', null, '2018-05-15 21:53:54', '1526392434361', 'BA5E983A6A638FAC5154F51FFF82F11D');
INSERT INTO `jc_api_record` VALUES ('713', '1', '127.0.0.1', null, '2018-05-15 22:01:00', '1526392859547', 'BDE2805A9DED041220FB25399D3AFE21');
INSERT INTO `jc_api_record` VALUES ('714', '1', '127.0.0.1', null, '2018-05-15 22:04:59', '1526393099340', '9FC624C5ED235D8FC0BD67F6EE6F144A');
INSERT INTO `jc_api_record` VALUES ('715', '1', '127.0.0.1', null, '2018-05-15 22:07:16', '1526393236433', '2DE7895F78C04AAB93BC6B6C325AEC70');
INSERT INTO `jc_api_record` VALUES ('716', '1', '127.0.0.1', null, '2018-05-15 22:08:22', '1526393302424', '988491C250585B053E21B9CCCC43840D');
INSERT INTO `jc_api_record` VALUES ('717', '1', '127.0.0.1', null, '2018-05-15 22:10:18', '1526393418285', '8E42645262444DD571B541059133633C');
INSERT INTO `jc_api_record` VALUES ('718', '1', '127.0.0.1', null, '2018-05-15 22:10:57', '1526393456909', '9640BD6DD5CE306992C8C332F6EC730A');
INSERT INTO `jc_api_record` VALUES ('719', '1', '127.0.0.1', null, '2018-05-15 22:16:46', '1526393805693', 'BC3C8F14EC3692F12A1D817653F3EB92');
INSERT INTO `jc_api_record` VALUES ('720', '1', '127.0.0.1', null, '2018-05-15 22:19:31', '1526393970692', '06087D6532627743980AD5E12C45259A');
INSERT INTO `jc_api_record` VALUES ('721', '1', '127.0.0.1', null, '2018-05-15 22:22:02', '1526394122380', '59B747629F270C916108CB6F77F24819');
INSERT INTO `jc_api_record` VALUES ('722', '1', '127.0.0.1', null, '2018-05-15 22:22:47', '1526394167257', '007759C7FB7F4D347F0DE4E50037B838');
INSERT INTO `jc_api_record` VALUES ('723', '1', '127.0.0.1', null, '2018-05-15 22:23:20', '1526394200282', 'A65B5E8D9ED1046D653F551B313C1FD9');
INSERT INTO `jc_api_record` VALUES ('724', '1', '127.0.0.1', null, '2018-05-15 22:23:54', '1526394234221', 'A107DAA5B9D47B24747ABA0736119626');
INSERT INTO `jc_api_record` VALUES ('725', '1', '127.0.0.1', null, '2018-05-15 22:26:27', '1526394386750', '44CFB364AA5B32D17C24C4C6DECDD5D6');
INSERT INTO `jc_api_record` VALUES ('726', '1', '127.0.0.1', null, '2018-05-15 22:30:14', '1526394614322', 'B5BD654D7F086ADCD9F8F2B70F1ACDB4');
INSERT INTO `jc_api_record` VALUES ('727', '1', '127.0.0.1', null, '2018-05-15 22:30:49', '1526394648949', '79173893089CB3AAACCB64992BF590E7');
INSERT INTO `jc_api_record` VALUES ('728', '1', '127.0.0.1', null, '2018-05-15 22:31:24', '1526394683708', 'DA253EBC88989A708F6EBFA5F17D769D');
INSERT INTO `jc_api_record` VALUES ('729', '1', '127.0.0.1', null, '2018-05-15 22:31:51', '1526394710781', '37EC4321F228D76376DCD652426F182A');
INSERT INTO `jc_api_record` VALUES ('730', '1', '127.0.0.1', null, '2018-05-15 22:32:44', '1526394764033', 'F6EDD334ED647924648221278CF8C973');
INSERT INTO `jc_api_record` VALUES ('731', '1', '127.0.0.1', null, '2018-05-15 22:33:16', '1526394795604', 'A18A9E675056F23456EBFE6F73424E49');
INSERT INTO `jc_api_record` VALUES ('732', '1', '127.0.0.1', null, '2018-05-15 22:33:48', '1526394828024', '90226A4B84EE3686CB854A5C98126CF4');
INSERT INTO `jc_api_record` VALUES ('733', '1', '127.0.0.1', null, '2018-05-15 22:41:42', '1526395302455', '268A90F230F9008DDD61E3E91411F617');
INSERT INTO `jc_api_record` VALUES ('734', '1', '127.0.0.1', null, '2018-05-15 22:45:00', '1526395500446', '918FD503934736E4C160EF8A6EDA8659');
INSERT INTO `jc_api_record` VALUES ('735', '1', '127.0.0.1', null, '2018-05-15 22:45:34', '1526395534057', 'F55F6F90E0A9E140C75F5C0C9F11725F');
INSERT INTO `jc_api_record` VALUES ('736', '1', '127.0.0.1', null, '2018-05-15 22:46:15', '1526395575021', '21776A80C3B9406C40E6B0C9D479CB68');
INSERT INTO `jc_api_record` VALUES ('737', '1', '127.0.0.1', null, '2018-05-15 22:46:59', '1526395618928', '4BBD01697C228F94D98A79EAF40348BB');
INSERT INTO `jc_api_record` VALUES ('738', '1', '127.0.0.1', null, '2018-05-15 22:47:22', '1526395641919', '83150BBC31C0E9577CA3111EC5189FF6');
INSERT INTO `jc_api_record` VALUES ('739', '1', '127.0.0.1', null, '2018-05-15 22:48:04', '1526395684140', 'B7EC8E88EFDF601287FF1C3F5903F32A');
INSERT INTO `jc_api_record` VALUES ('740', '1', '127.0.0.1', null, '2018-05-15 22:48:30', '1526395710323', '07381889DDB05BD083EE0AE9C1B15ED0');
INSERT INTO `jc_api_record` VALUES ('741', '1', '127.0.0.1', null, '2018-05-15 22:48:56', '1526395735772', '71E6EBDD33FF76985B6FF1A212F1FEA6');
INSERT INTO `jc_api_record` VALUES ('742', '1', '127.0.0.1', null, '2018-05-15 22:49:34', '1526395773631', 'C0ADCCC8251704969F83F1EC55E79FC7');
INSERT INTO `jc_api_record` VALUES ('743', '1', '127.0.0.1', null, '2018-05-15 22:50:00', '1526395800366', 'BE5EC55DE2CFD342B79D8848CEE40CFE');
INSERT INTO `jc_api_record` VALUES ('744', '1', '127.0.0.1', null, '2018-06-02 10:10:38', '1527905437507', 'ADA83C47335406EBE19086AF61252D19');
INSERT INTO `jc_api_record` VALUES ('745', '1', '127.0.0.1', null, '2018-06-02 10:15:49', '1527905749320', '84DC239184B5B44FE9BA05594B75B5E0');
INSERT INTO `jc_api_record` VALUES ('746', '1', '127.0.0.1', null, '2018-06-02 10:16:23', '1527905782636', '894EB08741D6D238740A6AB6D4AFD352');
INSERT INTO `jc_api_record` VALUES ('747', '1', '127.0.0.1', null, '2018-06-02 10:16:34', '1527905793846', 'BF8DE1EF987971685A185CC3ED1BFEB6');
INSERT INTO `jc_api_record` VALUES ('748', '1', '127.0.0.1', null, '2018-06-02 10:16:39', '1527905798930', '809CB7AB566D67EEB6652EF8B4DE07FF');
INSERT INTO `jc_api_record` VALUES ('749', '1', '127.0.0.1', null, '2018-06-02 10:16:53', '1527905812535', 'D248F985A8D729FA310E265457B872E7');
INSERT INTO `jc_api_record` VALUES ('750', '1', '127.0.0.1', null, '2018-06-02 10:17:14', '1527905834225', 'CC1C0BFA444CEE60F9B2A99571E77849');
INSERT INTO `jc_api_record` VALUES ('751', '1', '127.0.0.1', null, '2018-06-02 10:18:27', '1527905906888', 'B4695C09D41EDFEF48289A08C5829DCD');
INSERT INTO `jc_api_record` VALUES ('752', '1', '127.0.0.1', null, '2018-06-02 10:18:30', '1527905909806', '7C49C2B2A75795E37D6C332159A28BA0');
INSERT INTO `jc_api_record` VALUES ('753', '1', '127.0.0.1', null, '2018-06-02 10:18:32', '1527905912487', '1FB3A6005C2F34A6C9B9ED119CD8B17E');
INSERT INTO `jc_api_record` VALUES ('754', '1', '127.0.0.1', null, '2018-06-02 10:19:00', '1527905940461', '317C4E2B71E474DBA7718927548D60E7');
INSERT INTO `jc_api_record` VALUES ('755', '1', '127.0.0.1', null, '2018-06-02 10:19:19', '1527905958658', '9324A2A591AF9A187D3518168E0E3BC4');
INSERT INTO `jc_api_record` VALUES ('756', '1', '127.0.0.1', null, '2018-06-02 10:19:23', '1527905962540', '8433CC731A40A30ADBBF57D7C01FBA80');
INSERT INTO `jc_api_record` VALUES ('757', '1', '127.0.0.1', null, '2018-06-02 10:19:39', '1527905979193', 'F1461EAF207BE433C0CFDF9D53F85501');
INSERT INTO `jc_api_record` VALUES ('758', '1', '127.0.0.1', null, '2018-06-02 10:20:35', '1527906034777', '221F687A999D71FA0FEA42267490E3AD');
INSERT INTO `jc_api_record` VALUES ('759', '1', '127.0.0.1', null, '2018-06-02 10:21:37', '1527906096544', '6FE2BE960342E7C2386EEDC39B1F0C9C');
INSERT INTO `jc_api_record` VALUES ('760', '1', '127.0.0.1', null, '2018-06-02 10:22:05', '1527906125447', '50E44D9FBADD2FD89478D869BC6644A4');
INSERT INTO `jc_api_record` VALUES ('761', '1', '127.0.0.1', null, '2018-06-02 10:22:29', '1527906149375', 'F581C6C22F8791978ABF0FC55EDBED65');
INSERT INTO `jc_api_record` VALUES ('762', '1', '127.0.0.1', null, '2018-06-02 10:22:37', '1527906157002', 'B2C44292ACC4ACBAD6D394C1EB13920A');
INSERT INTO `jc_api_record` VALUES ('763', '1', '127.0.0.1', null, '2018-06-02 10:23:09', '1527906188997', '340FEC791DBFF43FE78AF77354EE02DC');
INSERT INTO `jc_api_record` VALUES ('764', '1', '127.0.0.1', null, '2018-06-02 10:23:26', '1527906206338', '4F55991F4055A2A06D55D56DB7D81B27');
INSERT INTO `jc_api_record` VALUES ('765', '1', '127.0.0.1', null, '2018-06-02 10:23:34', '1527906213691', '214C80252C6F5E60E9112206689396DC');
INSERT INTO `jc_api_record` VALUES ('766', '1', '127.0.0.1', null, '2018-06-02 14:02:19', '1527919339025', '9579C31F614FEEFC8348F314DECBAF36');
INSERT INTO `jc_api_record` VALUES ('767', '1', '127.0.0.1', null, '2018-06-03 08:52:17', '1527987137551', '7B82A9F68CC3CF60D292FC5B03FFB3BE');
INSERT INTO `jc_api_record` VALUES ('768', '1', '127.0.0.1', null, '2018-06-03 10:25:56', '1527992756062', '746729BA5569F7E479448F8A4F67E67B');
INSERT INTO `jc_api_record` VALUES ('769', '1', '127.0.0.1', null, '2018-06-03 11:07:12', '1527995232197', '04F266043C0151FFA0E238F01C404D0B');
INSERT INTO `jc_api_record` VALUES ('770', '1', '127.0.0.1', null, '2018-06-03 11:15:27', '1527995727151', 'E65858A195610EE43C1A95856CD2B161');
INSERT INTO `jc_api_record` VALUES ('771', '1', '127.0.0.1', null, '2018-06-03 11:23:44', '1527996224257', '9DD1B70CCA3D747933F56D8BCCBE592A');
INSERT INTO `jc_api_record` VALUES ('772', '1', '127.0.0.1', null, '2018-06-03 11:24:11', '1527996251896', '528CA5024709FCC736BB99E1EE12523C');
INSERT INTO `jc_api_record` VALUES ('773', '1', '127.0.0.1', null, '2018-06-03 14:00:50', '1528005650250', 'C6A2339A8FF4AD444250C8E4CEE2A7D6');
INSERT INTO `jc_api_record` VALUES ('774', '1', '127.0.0.1', null, '2018-06-03 14:13:33', '1528006413071', '5A47D6BAD185459DDED873AD0EA3BAB4');
INSERT INTO `jc_api_record` VALUES ('775', '1', '127.0.0.1', null, '2018-06-03 14:24:44', '1528007084578', 'D460355F08734DA1CD8A7DDB9DDB7189');
INSERT INTO `jc_api_record` VALUES ('776', '1', '127.0.0.1', null, '2018-06-03 14:25:12', '1528007112601', 'B61920DCAD6EB7FBEF023F6C9897B761');
INSERT INTO `jc_api_record` VALUES ('777', '1', '127.0.0.1', null, '2018-06-03 14:52:57', '1528008777822', '3D311A1455EC11259F750D22B30F6304');
INSERT INTO `jc_api_record` VALUES ('778', '1', '127.0.0.1', null, '2018-06-03 14:53:43', '1528008823499', '7B32E984D30F55ABA2A6C60EA23FEA6D');
INSERT INTO `jc_api_record` VALUES ('779', '1', '127.0.0.1', null, '2018-06-03 15:38:56', '1528011536575', '479E5F66FB758505211ABD81CE5F2BD6');
INSERT INTO `jc_api_record` VALUES ('780', '1', '127.0.0.1', null, '2018-06-03 15:56:15', '1528012575267', '0D003E7EC957D4ECCA017453739C6F3E');
INSERT INTO `jc_api_record` VALUES ('781', '1', '127.0.0.1', null, '2018-06-03 15:57:14', '1528012634641', '60DD46B5D00D48075010DE150C19A60E');
INSERT INTO `jc_api_record` VALUES ('782', '1', '127.0.0.1', null, '2018-06-03 17:26:16', '1528017976019', '9270467532B298AEF76AFD02DA904BA5');
INSERT INTO `jc_api_record` VALUES ('783', '1', '127.0.0.1', null, '2018-06-04 09:30:09', '1528075809963', '3959A1C726DC2E5AC23FAC282164D250');
INSERT INTO `jc_api_record` VALUES ('784', '1', '127.0.0.1', null, '2018-06-04 10:06:59', '1528078019681', 'CFD711525DCAD30FFF26C8E2FD3CB463');
INSERT INTO `jc_api_record` VALUES ('785', '1', '127.0.0.1', null, '2018-06-04 10:07:47', '1528078067147', 'FE8B4F070DAC64048CC6283F2DA58BB0');
INSERT INTO `jc_api_record` VALUES ('786', '1', '127.0.0.1', null, '2018-06-04 10:35:13', '1528079713231', 'EA27F35E11D3CF7B448CF8D2E37A8518');
INSERT INTO `jc_api_record` VALUES ('787', '1', '127.0.0.1', null, '2018-06-04 11:14:19', '1528082059369', '580676E5D7AF17E4FC32A9AE228073B8');
INSERT INTO `jc_api_record` VALUES ('788', '1', '127.0.0.1', null, '2018-06-04 11:30:45', '1528083045591', 'AF8516F2E0E8A31A64AABBC6B65797BA');
INSERT INTO `jc_api_record` VALUES ('789', '1', '127.0.0.1', null, '2018-06-04 11:31:08', '1528083068804', 'CC6C228392B968A5D2E94B1011216930');
INSERT INTO `jc_api_record` VALUES ('790', '1', '127.0.0.1', null, '2018-06-04 13:44:53', '1528091093548', '775D6AC41C18A29CACF5C638E15F1CDE');
INSERT INTO `jc_api_record` VALUES ('791', '1', '127.0.0.1', null, '2018-06-04 14:15:50', '1528092950171', 'DBCDB7987D0437CBEDC7F32A445392F3');
INSERT INTO `jc_api_record` VALUES ('792', '1', '127.0.0.1', null, '2018-06-04 16:01:49', '1528099309433', '44232F3F1666B733E8D7DD9799D2A7F1');
INSERT INTO `jc_api_record` VALUES ('793', '1', '127.0.0.1', null, '2018-06-04 17:49:42', '1528105782632', '532793201019F56A65F72BD7F99AF674');
INSERT INTO `jc_api_record` VALUES ('794', '1', '127.0.0.1', null, '2018-06-05 08:59:28', '1528160368029', 'E6D1C5898C63A0DF7BBA8F6E8B587A78');
INSERT INTO `jc_api_record` VALUES ('795', '1', '127.0.0.1', null, '2018-06-05 09:29:43', '1528162183719', '7DA39B31F8901CBDFACC431383FB6249');
INSERT INTO `jc_api_record` VALUES ('796', '1', '127.0.0.1', null, '2018-06-05 09:32:56', '1528162376220', '8B55DB6CA3FAED0AF5A7E4B4FDF5A5A5');
INSERT INTO `jc_api_record` VALUES ('797', '1', '127.0.0.1', null, '2018-06-05 10:00:06', '1528164006054', '3DBD2FFB82D17EFB66BE6501A68ABD9F');
INSERT INTO `jc_api_record` VALUES ('798', '1', '127.0.0.1', null, '2018-06-05 10:03:19', '1528164199309', '0F7762B9FA27C29E54878788B12F9336');
INSERT INTO `jc_api_record` VALUES ('799', '1', '127.0.0.1', null, '2018-06-05 10:56:44', '1528167404569', '42143BCD9D65DDDD91A38DD54854293F');
INSERT INTO `jc_api_record` VALUES ('800', '1', '127.0.0.1', null, '2018-06-05 11:03:59', '1528167839469', '9B56B86E6EDFC700AEA615B3482F8735');
INSERT INTO `jc_api_record` VALUES ('801', '1', '127.0.0.1', null, '2018-06-05 11:05:49', '1528167949173', '13DFA2C9A74A4C5F14DD4FF3102CE6B8');
INSERT INTO `jc_api_record` VALUES ('802', '1', '127.0.0.1', null, '2018-06-05 11:47:05', '1528170425423', '1D70FB4A2C5318D6747BFD75C6FCFFC7');
INSERT INTO `jc_api_record` VALUES ('803', '1', '127.0.0.1', null, '2018-06-05 11:47:25', '1528170445149', '0D15D50A5769C4B5E901D234B9746133');
INSERT INTO `jc_api_record` VALUES ('804', '1', '127.0.0.1', null, '2018-06-05 13:57:15', '1528178235207', 'C028D583FB7914A86E8B2F04B68BC4E6');
INSERT INTO `jc_api_record` VALUES ('805', '1', '127.0.0.1', null, '2018-06-05 15:47:01', '1528184821662', '825B515B326DE307315B7F12315755D9');
INSERT INTO `jc_api_record` VALUES ('806', '1', '127.0.0.1', null, '2018-06-05 15:53:28', '1528185208875', '6FBAEACC699D0D8661FD5B0DB18FC6CE');
INSERT INTO `jc_api_record` VALUES ('807', '1', '127.0.0.1', null, '2018-06-05 16:28:58', '1528187338830', '53B28F59F74A097D5BE264D1E20F98D4');
INSERT INTO `jc_api_record` VALUES ('808', '1', '127.0.0.1', null, '2018-06-05 18:07:23', '1528193243857', '18C3EA62793C19C6317D0E558EF10C86');
INSERT INTO `jc_api_record` VALUES ('809', '1', '127.0.0.1', null, '2018-06-05 18:08:18', '1528193298284', 'B4BBB863CF92941AA929959F71A6C5DD');
INSERT INTO `jc_api_record` VALUES ('810', '1', '127.0.0.1', null, '2018-06-06 08:41:51', '1528245711926', 'CFDB60971F7DD9F7CC937F9977777959');
INSERT INTO `jc_api_record` VALUES ('811', '1', '127.0.0.1', null, '2018-06-06 09:04:18', '1528247058589', 'CF3EDAEBF1BA49EAF1877A0A35FDEADC');
INSERT INTO `jc_api_record` VALUES ('812', '1', '127.0.0.1', null, '2018-06-06 10:08:03', '1528250883993', '388DE01EE15B1B59E74C563DED6B9A7C');
INSERT INTO `jc_api_record` VALUES ('813', '1', '127.0.0.1', null, '2018-06-06 17:22:10', '1528276930475', '807BE4502D29E4D5AB55D0D12C7662F2');
INSERT INTO `jc_api_record` VALUES ('814', '1', '127.0.0.1', null, '2018-06-06 17:23:11', '1528276991928', '64A7098D7CBE48BB4AF0AABBD375527C');
INSERT INTO `jc_api_record` VALUES ('815', '1', '127.0.0.1', null, '2018-06-06 17:44:38', '1528278278344', 'EF1901F21AB3D41043547830CEB4899D');
INSERT INTO `jc_api_record` VALUES ('816', '1', '127.0.0.1', null, '2018-06-07 08:39:21', '1528331961803', 'AC6980B5C4B41335541598E43B71E1CD');
INSERT INTO `jc_api_record` VALUES ('817', '1', '127.0.0.1', null, '2018-06-07 09:47:35', '1528336055893', '005E7862741BE5E310AFBB3F654F60C1');
INSERT INTO `jc_api_record` VALUES ('818', '1', '127.0.0.1', null, '2018-06-07 10:31:43', '1528338703431', 'C89A13EC9B3F9638E941C32FF410A47A');
INSERT INTO `jc_api_record` VALUES ('819', '1', '127.0.0.1', null, '2018-06-07 11:56:10', '1528343770167', '41545E194BA1FCBA3E0E89A4F1FBEB78');
INSERT INTO `jc_api_record` VALUES ('820', '1', '127.0.0.1', null, '2018-06-07 11:58:29', '1528343909987', '29F9D34845200EE83168BC81D488F1E4');
INSERT INTO `jc_api_record` VALUES ('821', '1', '127.0.0.1', null, '2018-06-07 14:58:05', '1528354685619', 'C53E6AB6642A1793DD24A8F6B47E72C0');
INSERT INTO `jc_api_record` VALUES ('822', '1', '127.0.0.1', null, '2018-06-07 15:21:11', '1528356071225', '505D7792DF9C15414BD25593EC61C403');
INSERT INTO `jc_api_record` VALUES ('823', '1', '127.0.0.1', null, '2018-06-07 15:22:08', '1528356128842', 'F9DD6C293576CFA26A8AA51EC76EE78F');
INSERT INTO `jc_api_record` VALUES ('824', '1', '127.0.0.1', null, '2018-06-08 09:14:21', '1528420461326', 'CBADA1F7E97E1EAA40E43A367FBF2CB3');
INSERT INTO `jc_api_record` VALUES ('825', '1', '127.0.0.1', null, '2018-06-08 09:45:57', '1528422357057', 'C594F8BFCA9C32D7F289B37B2F12E7A9');
INSERT INTO `jc_api_record` VALUES ('826', '1', '127.0.0.1', null, '2018-06-08 16:42:29', '1528447349788', '05F66CFC53EFFF3858DFCCAF16898525');
INSERT INTO `jc_api_record` VALUES ('827', '1', '127.0.0.1', null, '2018-06-08 16:46:59', '1528447619088', '56286D96F209E93E80D264069E5B9323');
INSERT INTO `jc_api_record` VALUES ('828', '1', '127.0.0.1', null, '2018-06-09 09:19:52', '1528507192761', '03B220AAE7422C4F5519539083D2FB35');
INSERT INTO `jc_api_record` VALUES ('829', '1', '127.0.0.1', null, '2018-06-09 09:32:59', '1528507979305', 'E700721512FD2E93B55D313844C4C628');
INSERT INTO `jc_api_record` VALUES ('830', '1', '127.0.0.1', null, '2018-06-09 09:33:59', '1528508039339', '575C8E5AC379DF1A32454BDB327FA537');
INSERT INTO `jc_api_record` VALUES ('831', '1', '127.0.0.1', null, '2018-06-09 09:34:25', '1528508065719', '138E575A21B367E8BF0A00DBC219041C');
INSERT INTO `jc_api_record` VALUES ('832', '1', '127.0.0.1', null, '2018-06-09 09:35:36', '1528508136750', 'F85BE30759D7551A92DA065274F47D63');
INSERT INTO `jc_api_record` VALUES ('833', '1', '127.0.0.1', null, '2018-06-09 09:36:34', '1528508194728', '64C3CCA9D5676897DAE2673FF8E92BC6');
INSERT INTO `jc_api_record` VALUES ('834', '1', '127.0.0.1', null, '2018-06-09 09:37:47', '1528508267757', 'CB7858F65F3FB1BACDC5D2701E2AC2C6');
INSERT INTO `jc_api_record` VALUES ('835', '1', '127.0.0.1', null, '2018-06-09 09:41:46', '1528508506274', '252C990E057C6260123EC69089D58F8A');
INSERT INTO `jc_api_record` VALUES ('836', '1', '127.0.0.1', null, '2018-06-09 09:42:29', '1528508549159', '7B81702FD9AEB9F087BC4F86BCCBDB45');
INSERT INTO `jc_api_record` VALUES ('837', '1', '127.0.0.1', null, '2018-06-09 09:42:43', '1528508563976', '2EC96B4720F2546E272FE1866391998D');
INSERT INTO `jc_api_record` VALUES ('838', '1', '127.0.0.1', null, '2018-06-09 09:49:04', '1528508944890', '21DA5FE4DA995D8B8C45A82F7E6BE7C2');
INSERT INTO `jc_api_record` VALUES ('839', '1', '127.0.0.1', null, '2018-06-09 09:50:02', '1528509002386', 'D15631ECCFCDAE765CA27A154EB8E538');
INSERT INTO `jc_api_record` VALUES ('840', '1', '127.0.0.1', null, '2018-06-09 09:50:17', '1528509017078', 'DE6659F588B09001447E5D3B50F3B495');
INSERT INTO `jc_api_record` VALUES ('841', '1', '127.0.0.1', null, '2018-06-09 09:50:44', '1528509044005', 'F779357114C65855A7E530354F1CB3E3');
INSERT INTO `jc_api_record` VALUES ('842', '1', '127.0.0.1', null, '2018-06-09 09:51:13', '1528509073434', '0741E101C923292C75875162678F9321');
INSERT INTO `jc_api_record` VALUES ('843', '1', '127.0.0.1', null, '2018-06-09 09:51:42', '1528509102872', '19EE913F6E1E623AC4723DC250985658');
INSERT INTO `jc_api_record` VALUES ('844', '1', '127.0.0.1', null, '2018-06-09 09:51:57', '1528509117396', 'B747D35916EB1A9AFEAC6AF087E9AA08');
INSERT INTO `jc_api_record` VALUES ('845', '1', '127.0.0.1', null, '2018-06-09 09:52:21', '1528509141336', '23ED2F0F64A2BA2224289B9007697C3D');
INSERT INTO `jc_api_record` VALUES ('846', '1', '127.0.0.1', null, '2018-06-09 09:53:17', '1528509197219', 'D34EE42AF5DC8E6CC904F3527528A6EF');
INSERT INTO `jc_api_record` VALUES ('847', '1', '127.0.0.1', null, '2018-06-09 09:53:28', '1528509208658', '759C7A28841EB987D6B6D4B79D97148C');
INSERT INTO `jc_api_record` VALUES ('848', '1', '127.0.0.1', null, '2018-06-09 09:53:38', '1528509218145', '040BE95122323DEFE9BAC5AB14718255');
INSERT INTO `jc_api_record` VALUES ('849', '1', '127.0.0.1', null, '2018-06-09 09:54:40', '1528509280191', '45294C197483A3821053814119708AAE');
INSERT INTO `jc_api_record` VALUES ('850', '1', '127.0.0.1', null, '2018-06-09 09:54:53', '1528509293033', '28C2A6C8702D231E86D973F8A10089BB');
INSERT INTO `jc_api_record` VALUES ('851', '1', '127.0.0.1', null, '2018-06-09 09:55:38', '1528509338780', '224B62C1814B88D1AACFDF89F91CE02D');
INSERT INTO `jc_api_record` VALUES ('852', '1', '127.0.0.1', null, '2018-06-09 09:56:05', '1528509365565', 'BAE055901AD155DD788EA7EB7A33D046');
INSERT INTO `jc_api_record` VALUES ('853', '1', '127.0.0.1', null, '2018-06-09 09:56:26', '1528509386012', 'F60A01EF00DAF777EE13D531884DAC90');
INSERT INTO `jc_api_record` VALUES ('854', '1', '127.0.0.1', null, '2018-06-09 09:56:40', '1528509400798', '80B95D6F8798736305397DB2BEBD1F8E');
INSERT INTO `jc_api_record` VALUES ('855', '1', '127.0.0.1', null, '2018-06-09 09:57:01', '1528509421763', '6D804B02775D916C1E8485F5D23268AB');
INSERT INTO `jc_api_record` VALUES ('856', '1', '127.0.0.1', null, '2018-06-09 09:57:16', '1528509436045', '4242B41E8324CBE87D074EDAA8250328');
INSERT INTO `jc_api_record` VALUES ('857', '1', '127.0.0.1', null, '2018-06-09 09:57:29', '1528509449323', '0419132C2CBB68425DB6C09E92C6C4FB');
INSERT INTO `jc_api_record` VALUES ('858', '1', '127.0.0.1', null, '2018-06-09 09:57:46', '1528509466046', '89DBC05EC3930B84A408C1FC3EBB9A23');
INSERT INTO `jc_api_record` VALUES ('859', '1', '127.0.0.1', null, '2018-06-09 10:01:58', '1528509718240', '73AC3AEDEF00AE41E8F6AA5D9E248FCA');
INSERT INTO `jc_api_record` VALUES ('860', '1', '127.0.0.1', null, '2018-06-09 10:02:24', '1528509744762', 'ED795E852C07962BA3454361F8966042');
INSERT INTO `jc_api_record` VALUES ('861', '1', '127.0.0.1', null, '2018-06-09 10:02:39', '1528509759875', '91696073E7D8D141BE098EC1DE7622DB');
INSERT INTO `jc_api_record` VALUES ('862', '1', '127.0.0.1', null, '2018-06-09 10:44:43', '1528512283895', '46B09931485B661C0BDF80225C619D07');
INSERT INTO `jc_api_record` VALUES ('863', '1', '127.0.0.1', null, '2018-06-09 10:52:27', '1528512747226', '21613A8CE806BE1C9FAB730AED713234');
INSERT INTO `jc_api_record` VALUES ('864', '1', '127.0.0.1', null, '2018-06-09 10:52:46', '1528512766124', '5A416FD375F863D3BED3D871039AF733');
INSERT INTO `jc_api_record` VALUES ('865', '1', '127.0.0.1', null, '2018-06-09 10:53:06', '1528512786911', '82E9555436088D7AB0AFEE37B1D04E8D');
INSERT INTO `jc_api_record` VALUES ('866', '1', '127.0.0.1', null, '2018-06-09 10:53:15', '1528512795143', '1EEA531E99A9509C781276CC405D8E4C');
INSERT INTO `jc_api_record` VALUES ('867', '1', '127.0.0.1', null, '2018-06-09 10:55:36', '1528512936921', '3090E999BA873149DAAEB844351CAB95');
INSERT INTO `jc_api_record` VALUES ('868', '1', '127.0.0.1', null, '2018-06-09 10:56:03', '1528512963929', '9DC6D8109BB44FB2518DD5AAA445CDA2');
INSERT INTO `jc_api_record` VALUES ('869', '1', '127.0.0.1', null, '2018-06-09 10:56:41', '1528513001664', 'E148B3DA96BEE80DC81D801059BD504E');
INSERT INTO `jc_api_record` VALUES ('870', '1', '127.0.0.1', null, '2018-06-09 10:57:01', '1528513021442', 'A136011A06EFB70401844CBA73DF63CD');
INSERT INTO `jc_api_record` VALUES ('871', '1', '127.0.0.1', null, '2018-06-09 10:57:16', '1528513036099', '44EB21DA44AA2A3CD28AC5DB45B90039');
INSERT INTO `jc_api_record` VALUES ('872', '1', '127.0.0.1', null, '2018-06-09 10:57:27', '1528513047271', '6FF1B961EE192D587C5EF10D727FE491');
INSERT INTO `jc_api_record` VALUES ('873', '1', '127.0.0.1', null, '2018-06-09 10:57:46', '1528513066389', 'B4CB372B148DD91FD5B1DA2103BCD0F3');
INSERT INTO `jc_api_record` VALUES ('874', '1', '127.0.0.1', null, '2018-06-09 10:58:11', '1528513091544', '92191EBE1E0ABF1FF482300FBB152B14');
INSERT INTO `jc_api_record` VALUES ('875', '1', '127.0.0.1', null, '2018-06-09 11:00:08', '1528513208194', '12EC5C2C213D918CDABCFA7A60A54B12');
INSERT INTO `jc_api_record` VALUES ('876', '1', '127.0.0.1', null, '2018-06-09 11:01:19', '1528513279492', 'DC5E2984B4016F83955140F421206538');
INSERT INTO `jc_api_record` VALUES ('877', '1', '127.0.0.1', null, '2018-06-09 11:01:38', '1528513298390', 'D3E06F7715271C777B61F81FD273E858');
INSERT INTO `jc_api_record` VALUES ('878', '1', '127.0.0.1', null, '2018-06-09 11:17:45', '1528514265285', 'A84F2A08C90493E7BB8A101A7C4F24B3');
INSERT INTO `jc_api_record` VALUES ('879', '1', '127.0.0.1', null, '2018-06-09 11:23:29', '1528514609358', '504ADC569D85CA2F9D2C0E9B40CB3F93');
INSERT INTO `jc_api_record` VALUES ('880', '1', '127.0.0.1', null, '2018-06-09 11:26:30', '1528514790115', '2F6A105A9C05A1BD87EDC00FFD93E96C');
INSERT INTO `jc_api_record` VALUES ('881', '1', '127.0.0.1', null, '2018-06-09 11:28:01', '1528514881409', '8620250264321DF33B0AD42604DBAA51');
INSERT INTO `jc_api_record` VALUES ('882', '1', '127.0.0.1', null, '2018-06-09 11:29:50', '1528514990746', '7EAF705619E6C6CD7F09DB4EE99C2ACD');
INSERT INTO `jc_api_record` VALUES ('883', '1', '127.0.0.1', null, '2018-06-09 11:31:01', '1528515061256', 'EADF1B0C38A87D4309B3A44C1A67DF59');
INSERT INTO `jc_api_record` VALUES ('884', '1', '127.0.0.1', null, '2018-06-09 11:42:52', '1528515772444', 'E284295842D826E4093986123EB0BBF8');
INSERT INTO `jc_api_record` VALUES ('885', '1', '127.0.0.1', null, '2018-06-09 11:44:50', '1528515890867', '3288CF8F5C97300950A1EFC2B7D8D68D');
INSERT INTO `jc_api_record` VALUES ('886', '1', '127.0.0.1', null, '2018-06-09 11:45:14', '1528515914745', '67BEA67604CD4111126124417FB0591D');
INSERT INTO `jc_api_record` VALUES ('887', '1', '127.0.0.1', null, '2018-06-09 13:10:21', '1528521021474', '9D800461960D983BF34569CC69CEEC75');
INSERT INTO `jc_api_record` VALUES ('888', '1', '127.0.0.1', null, '2018-06-09 13:33:20', '1528522400552', 'FC49C794AC254656D58DB4961319D744');
INSERT INTO `jc_api_record` VALUES ('889', '1', '127.0.0.1', null, '2018-06-09 13:34:08', '1528522448799', 'EA02E3532197855CE94CC392619ADC38');
INSERT INTO `jc_api_record` VALUES ('890', '1', '127.0.0.1', null, '2018-06-09 15:05:58', '1528527958078', '889CFBBB51B361277277CE78C93660FE');
INSERT INTO `jc_api_record` VALUES ('891', '1', '127.0.0.1', null, '2018-06-09 15:08:01', '1528528081817', '91BEFC0608B1CF4AA19625A53D25EDE1');
INSERT INTO `jc_api_record` VALUES ('892', '1', '127.0.0.1', null, '2018-06-09 15:08:18', '1528528098247', '97AAAB18578650496EFE7BC903E17F09');
INSERT INTO `jc_api_record` VALUES ('893', '1', '127.0.0.1', null, '2018-06-09 15:08:30', '1528528110824', '80CFEE2A13A78D7FCCF9FB5D8BD750D1');
INSERT INTO `jc_api_record` VALUES ('894', '1', '127.0.0.1', null, '2018-06-09 15:09:18', '1528528158320', 'B40892078C9814D17762FFB7A7A8AFC5');
INSERT INTO `jc_api_record` VALUES ('895', '1', '127.0.0.1', null, '2018-06-09 15:09:56', '1528528196051', '486D5E0CDFD772BC932F480AB0FA5D08');
INSERT INTO `jc_api_record` VALUES ('896', '1', '127.0.0.1', null, '2018-06-09 15:11:19', '1528528279062', 'DE37E22F2C07ED1F6B6C1E151E6708AA');
INSERT INTO `jc_api_record` VALUES ('897', '1', '127.0.0.1', null, '2018-06-09 15:35:01', '1528529701758', 'D2212D7CC639D7BFB48F6C41A00FA779');
INSERT INTO `jc_api_record` VALUES ('898', '1', '127.0.0.1', null, '2018-06-09 15:35:11', '1528529711835', 'F5D5892EB87D4E227EA2C9220834768A');
INSERT INTO `jc_api_record` VALUES ('899', '1', '127.0.0.1', null, '2018-06-09 15:56:42', '1528531002183', 'C572A842EC70E9BE1DC81F550CD1CD52');
INSERT INTO `jc_api_record` VALUES ('900', '1', '127.0.0.1', null, '2018-06-09 16:35:58', '1528533358356', '97D35C5D49294301F381BEC39615853E');
INSERT INTO `jc_api_record` VALUES ('901', '1', '127.0.0.1', null, '2018-06-09 16:36:42', '1528533402900', '395E4207D447C541A185B26CC4BEE890');
INSERT INTO `jc_api_record` VALUES ('902', '1', '127.0.0.1', null, '2018-06-09 16:37:33', '1528533453588', 'BCE4564FA5E2D60EB83FDB7C4230F1E9');
INSERT INTO `jc_api_record` VALUES ('903', '1', '127.0.0.1', null, '2018-06-09 16:38:03', '1528533483082', 'E6A3476E5414162775CBDF5242E4C1D2');
INSERT INTO `jc_api_record` VALUES ('904', '1', '127.0.0.1', null, '2018-06-09 16:39:41', '1528533581243', '02208ED158E3A15C3646A70CDBC271E8');
INSERT INTO `jc_api_record` VALUES ('905', '1', '127.0.0.1', null, '2018-06-11 20:09:25', '1528718965596', 'ECA6451436EBAD0180320B1C808903CC');
INSERT INTO `jc_api_record` VALUES ('906', '1', '127.0.0.1', null, '2018-06-11 20:12:00', '1528719120856', '3833F734D8EF1CBFB5C212223D5D499B');
INSERT INTO `jc_api_record` VALUES ('907', '1', '127.0.0.1', null, '2018-06-11 20:13:11', '1528719191149', 'E31A49AD2C8FACE3F4E9C18840329664');
INSERT INTO `jc_api_record` VALUES ('908', '1', '127.0.0.1', null, '2018-06-11 20:27:03', '1528720023691', '58098AF1996D4176580F3606FE94D065');
INSERT INTO `jc_api_record` VALUES ('909', '1', '127.0.0.1', null, '2018-06-11 20:27:19', '1528720039495', '538EB9A92FDACB484AC523360F310F22');
INSERT INTO `jc_api_record` VALUES ('910', '1', '127.0.0.1', null, '2018-06-11 20:27:34', '1528720054556', '88C3FCC1E385BAF75AA702E3B9455E74');
INSERT INTO `jc_api_record` VALUES ('911', '1', '127.0.0.1', null, '2018-06-11 20:27:42', '1528720062805', '6A156B2B30A43A015BD94A1342072E2F');
INSERT INTO `jc_api_record` VALUES ('912', '1', '127.0.0.1', null, '2018-06-11 20:28:03', '1528720083051', '9FF83D62804578EB93BEDE5DDEE8B11A');
INSERT INTO `jc_api_record` VALUES ('913', '1', '127.0.0.1', null, '2018-06-11 20:39:58', '1528720798250', 'B7E4E8EE1674AD3EEC773664B175848D');
INSERT INTO `jc_api_record` VALUES ('914', '1', '127.0.0.1', null, '2018-06-11 20:40:38', '1528720838566', '009E3742F5682A1ECCDB63D0673ED4F3');
INSERT INTO `jc_api_record` VALUES ('915', '1', '127.0.0.1', null, '2018-06-11 20:44:35', '1528721075391', 'EA16CEA9F34C9D8E572F05690EAFF460');
INSERT INTO `jc_api_record` VALUES ('916', '1', '127.0.0.1', null, '2018-06-11 20:45:29', '1528721129404', '9DC58496A87FD9330276C77B8322584C');
INSERT INTO `jc_api_record` VALUES ('917', '1', '127.0.0.1', null, '2018-06-11 21:07:18', '1528722438097', '58FB606582EF3527DC58D88FE802E116');
INSERT INTO `jc_api_record` VALUES ('918', '1', '127.0.0.1', null, '2018-06-11 22:11:17', '1528726277537', '040E88AE561296E004E86B0C77ED15D7');
INSERT INTO `jc_api_record` VALUES ('919', '1', '127.0.0.1', null, '2018-06-11 22:12:39', '1528726359787', '20469CE1F94089645521E75FFD240BD1');
INSERT INTO `jc_api_record` VALUES ('920', '1', '127.0.0.1', null, '2018-06-11 22:14:07', '1528726447554', 'B1D184A18E0D545E74D433E4A73F5ACB');
INSERT INTO `jc_api_record` VALUES ('921', '1', '127.0.0.1', null, '2018-06-11 22:18:00', '1528726680972', '3A98D11450FF14938ADCFF8A2DAAFB43');
INSERT INTO `jc_api_record` VALUES ('922', '1', '127.0.0.1', null, '2018-06-11 22:25:22', '1528727122415', '5A36D3D939591541489AC3FC27464204');
INSERT INTO `jc_api_record` VALUES ('923', '1', '127.0.0.1', null, '2018-06-11 22:25:50', '1528727150588', '797773CD0A24748F11C9AA0157CCE280');
INSERT INTO `jc_api_record` VALUES ('924', '1', '127.0.0.1', null, '2018-06-11 22:25:56', '1528727156362', '7E9005A4B76DDC2D729BCBAA7BE53EB1');
INSERT INTO `jc_api_record` VALUES ('925', '1', '127.0.0.1', null, '2018-06-11 22:26:14', '1528727174046', '62671D6C44DD9C6AC3D5E95A883D4818');
INSERT INTO `jc_api_record` VALUES ('926', '1', '127.0.0.1', null, '2018-06-11 22:31:00', '1528727460019', 'E32B4F4B4115359BAB65053B26F65729');
INSERT INTO `jc_api_record` VALUES ('927', '1', '127.0.0.1', null, '2018-06-11 22:34:27', '1528727667782', '420FFAA7E94FE48CC0B1A4DE24F37A16');
INSERT INTO `jc_api_record` VALUES ('928', '1', '127.0.0.1', null, '2018-06-11 22:38:11', '1528727891638', 'F97CF74CDAD3DE229DB1E6FB47C640CB');
INSERT INTO `jc_api_record` VALUES ('929', '1', '127.0.0.1', null, '2018-06-11 22:39:05', '1528727945753', 'B2ED805C2A5EEC23582B92A29DF22D2E');
INSERT INTO `jc_api_record` VALUES ('930', '1', '127.0.0.1', null, '2018-06-11 22:41:16', '1528728076134', 'BE310013141F0E9FE1E2424653C25290');
INSERT INTO `jc_api_record` VALUES ('931', '1', '127.0.0.1', null, '2018-06-12 20:59:38', '1528808378220', 'EB1CEC903B878BA4E4C83B6003E6B8DC');
INSERT INTO `jc_api_record` VALUES ('932', '1', '127.0.0.1', null, '2018-06-12 21:45:04', '1528811104203', 'CF0766D025CCB36D100D5BFB528D93D9');
INSERT INTO `jc_api_record` VALUES ('933', '1', '127.0.0.1', null, '2018-06-12 22:12:06', '1528812726779', '47F3E8FBBEA859A1CC45528B0491521B');
INSERT INTO `jc_api_record` VALUES ('934', '1', '127.0.0.1', null, '2018-06-12 23:18:05', '1528816685319', '6CFCC31675739DD421C4D6C97D69B524');

-- ----------------------------
-- Table structure for jc_api_user_login
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_user_login`;
CREATE TABLE `jc_api_user_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` varchar(100) DEFAULT '' COMMENT 'sesssionKey',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登陆时间',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `active_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后活跃时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='API用户登录表';

-- ----------------------------
-- Records of jc_api_user_login
-- ----------------------------
INSERT INTO `jc_api_user_login` VALUES ('1', '1531646FC9FBB2D21037569DDF913485', 'admin', '2018-05-15 20:23:50', '1', '2018-05-15 20:24:46');
INSERT INTO `jc_api_user_login` VALUES ('2', 'D2A45A1D2B3A924EE16DC8F95579B0B4', 'admin', '2018-05-15 21:13:38', '1', '2018-05-15 21:14:11');
INSERT INTO `jc_api_user_login` VALUES ('5', '394625572D17C590F52D48C4A2DB7C71', 'admin', '2018-05-15 21:53:54', '1', '2018-05-15 22:50:08');
INSERT INTO `jc_api_user_login` VALUES ('8', '9D6AE4848DA563FCD1D6FBF3E3B3E684', 'admin', '2018-06-02 10:16:52', '1', '2018-06-02 10:26:38');
INSERT INTO `jc_api_user_login` VALUES ('9', 'F99C1DA3A8274C913908B24FDD9E4665', 'admin', '2018-06-02 14:02:18', '1', '2018-06-02 14:03:50');
INSERT INTO `jc_api_user_login` VALUES ('10', 'A3E1288BB1F485DB227908067ED91071', 'admin', '2018-06-03 08:52:17', '1', '2018-06-03 09:01:13');
INSERT INTO `jc_api_user_login` VALUES ('11', 'EF3518E7EDAF58F88F6A1A480629AEFA', 'admin', '2018-06-03 10:25:56', '1', '2018-06-03 10:36:15');
INSERT INTO `jc_api_user_login` VALUES ('12', '02919AF2D78EB4F0A60C92A0B091AF38', 'admin', '2018-06-03 11:07:12', '1', '2018-06-03 11:13:51');
INSERT INTO `jc_api_user_login` VALUES ('14', '6A16CB84C849BC80E3971F47C84B341D', 'admin', '2018-06-03 11:23:44', '1', '2018-06-03 11:23:44');
INSERT INTO `jc_api_user_login` VALUES ('15', '21295AF7CE2613A7F0353348E19BB72F', 'admin', '2018-06-03 11:24:11', '1', '2018-06-03 12:02:54');
INSERT INTO `jc_api_user_login` VALUES ('18', 'AB1FFE496A242F4D29F3CA60F660BCA3', 'admin', '2018-06-03 14:24:44', '1', '2018-06-03 14:24:45');
INSERT INTO `jc_api_user_login` VALUES ('19', '4F9F5997DAE4DD0A59F012E9FBE4D695', 'admin', '2018-06-03 14:25:12', '1', '2018-06-03 14:25:17');
INSERT INTO `jc_api_user_login` VALUES ('20', '00C12345F345244514FC23E3F4D84470', 'admin', '2018-06-03 14:52:57', '1', '2018-06-03 14:53:01');
INSERT INTO `jc_api_user_login` VALUES ('21', 'B62DD6ED41D52A9EE2CAC11A95DBEEDA', 'admin', '2018-06-03 14:53:43', '1', '2018-06-03 15:09:52');
INSERT INTO `jc_api_user_login` VALUES ('22', '3E5CBB7D5346C62ADA4248010D418EE2', 'admin', '2018-06-03 15:38:56', '1', '2018-06-03 15:38:57');
INSERT INTO `jc_api_user_login` VALUES ('23', 'AA08012B55190AE998B9D5CE9B5BB383', 'admin', '2018-06-03 15:56:15', '1', '2018-06-03 15:56:15');
INSERT INTO `jc_api_user_login` VALUES ('24', '46AA480FC7669CA61AC998E207BFB7F7', 'admin', '2018-06-03 15:57:14', '1', '2018-06-03 16:03:01');
INSERT INTO `jc_api_user_login` VALUES ('25', 'E70DE2F117C36E786EDDD1E93B56D60A', 'admin', '2018-06-03 17:26:15', '1', '2018-06-03 17:26:16');
INSERT INTO `jc_api_user_login` VALUES ('26', '7CEA8E217DB7DD46B4E766742B8B11B2', 'admin', '2018-06-04 09:30:09', '1', '2018-06-04 09:34:48');
INSERT INTO `jc_api_user_login` VALUES ('27', 'A72564BF1974B04DD728B914072C5C70', 'admin', '2018-06-04 10:06:59', '1', '2018-06-04 10:07:00');
INSERT INTO `jc_api_user_login` VALUES ('28', '6B3113513F6C36622073D3CB62D135E3', 'admin', '2018-06-04 10:07:47', '1', '2018-06-04 10:07:51');
INSERT INTO `jc_api_user_login` VALUES ('29', '9661BDD833C27C64C46C9994FE9F86A1', 'admin', '2018-06-04 10:35:13', '1', '2018-06-04 10:50:13');
INSERT INTO `jc_api_user_login` VALUES ('30', 'DFC2B131BFE6E752B0AB8F0D3C6F053F', 'admin', '2018-06-04 11:14:19', '1', '2018-06-04 11:40:33');
INSERT INTO `jc_api_user_login` VALUES ('31', '8931CE8B3192745F2E0E50FC5599BFDD', 'admin', '2018-06-04 13:44:53', '1', '2018-06-04 13:44:54');
INSERT INTO `jc_api_user_login` VALUES ('32', 'DC30DBD9F73761890DBBCE01E6DFF45D', 'admin', '2018-06-04 14:15:50', '1', '2018-06-04 14:32:18');
INSERT INTO `jc_api_user_login` VALUES ('33', '570B14425A9AA263E98BC6E956D3EA80', 'admin', '2018-06-04 16:01:49', '1', '2018-06-04 16:01:55');
INSERT INTO `jc_api_user_login` VALUES ('34', '6B8952D7A73CAB0072BFF5D0B5469F2A', 'admin', '2018-06-04 17:49:42', '1', '2018-06-04 17:49:43');
INSERT INTO `jc_api_user_login` VALUES ('37', 'D5E14713BB1E7F007F5A0803D0BE44DE', 'admin', '2018-06-05 09:32:56', '1', '2018-06-05 10:24:32');
INSERT INTO `jc_api_user_login` VALUES ('39', '02811E08EA6135101785674E321213A4', 'admin', '2018-06-05 11:05:48', '1', '2018-06-05 11:05:50');
INSERT INTO `jc_api_user_login` VALUES ('40', '4FCACD4619A60B2E656B33B148850B6A', 'admin', '2018-06-05 11:47:05', '1', '2018-06-05 11:47:26');
INSERT INTO `jc_api_user_login` VALUES ('41', '2CDF2BAD4327A8F3C976945BB9AFC3F0', 'admin', '2018-06-05 13:57:15', '1', '2018-06-05 14:28:25');
INSERT INTO `jc_api_user_login` VALUES ('42', '46EA53551445409A3670432EEE071CEB', 'admin', '2018-06-05 15:47:01', '1', '2018-06-05 15:53:43');
INSERT INTO `jc_api_user_login` VALUES ('43', '3A07A5D55A883385B23A275125C692DF', 'admin', '2018-06-05 16:28:58', '1', '2018-06-05 16:37:24');
INSERT INTO `jc_api_user_login` VALUES ('44', '0DDBF5428AD165E9CE1B15A54B91E08F', 'admin', '2018-06-05 18:07:23', '1', '2018-06-05 18:12:05');
INSERT INTO `jc_api_user_login` VALUES ('45', '34F9FC7CECFA11F74420B4EDDEB234FD', 'admin', '2018-06-06 08:41:51', '1', '2018-06-06 08:41:53');
INSERT INTO `jc_api_user_login` VALUES ('46', '8068AE81DC2839005BACEBDC3A0497F3', 'admin', '2018-06-06 09:04:18', '1', '2018-06-06 09:06:22');
INSERT INTO `jc_api_user_login` VALUES ('47', '0C751B94D95AE8ECBCA7E1AD3F0E291C', 'admin', '2018-06-06 10:08:03', '1', '2018-06-06 10:08:04');
INSERT INTO `jc_api_user_login` VALUES ('48', '62D38DD2D8580E4023F149C19E31B1CF', 'admin', '2018-06-06 17:22:10', '1', '2018-06-06 17:23:13');
INSERT INTO `jc_api_user_login` VALUES ('49', '67645A5C769CFF5686AB4FFE71ADEC77', 'admin', '2018-06-06 17:44:38', '1', '2018-06-06 17:44:57');
INSERT INTO `jc_api_user_login` VALUES ('50', 'D36FAD4C8777497006AD60302B538750', 'admin', '2018-06-07 08:39:21', '1', '2018-06-07 08:45:55');
INSERT INTO `jc_api_user_login` VALUES ('51', '85B3923A8708F04BC6C6755090441E41', 'admin', '2018-06-07 09:47:35', '1', '2018-06-07 09:52:46');
INSERT INTO `jc_api_user_login` VALUES ('52', 'D9CFB47E0AB0BA8148B036737DDB66F1', 'admin', '2018-06-07 10:31:43', '1', '2018-06-07 10:31:44');
INSERT INTO `jc_api_user_login` VALUES ('53', '8F5BD2B62B9908BF052A1E80951D5493', 'admin', '2018-06-07 11:56:10', '1', '2018-06-07 11:59:31');
INSERT INTO `jc_api_user_login` VALUES ('54', 'AE6344AF3EC8DEC7F932252A5EDD331A', 'admin', '2018-06-07 14:58:05', '1', '2018-06-07 14:58:25');
INSERT INTO `jc_api_user_login` VALUES ('55', '9EE61F4634CC77508A17DFDEF45DB684', 'admin', '2018-06-07 15:21:11', '1', '2018-06-07 15:29:52');
INSERT INTO `jc_api_user_login` VALUES ('56', '4D071940C8920B4C70BE87AB87B1D323', 'admin', '2018-06-08 09:14:21', '1', '2018-06-08 09:14:22');
INSERT INTO `jc_api_user_login` VALUES ('57', 'CC43458A027712B08E325BCD3744E2AE', 'admin', '2018-06-08 09:45:57', '1', '2018-06-08 09:56:26');
INSERT INTO `jc_api_user_login` VALUES ('58', 'F80D02BDE4E24CEB3C2F03BC44C4035E', 'admin', '2018-06-08 16:42:29', '1', '2018-06-08 17:04:55');
INSERT INTO `jc_api_user_login` VALUES ('59', '7EF5145D0651DFCFD174D2C5C2E42294', 'admin', '2018-06-09 09:19:52', '1', '2018-06-09 11:08:58');
INSERT INTO `jc_api_user_login` VALUES ('60', '1FA29E759F872258C37F23B28104EF7C', 'admin', '2018-06-09 11:17:45', '1', '2018-06-09 12:00:57');
INSERT INTO `jc_api_user_login` VALUES ('61', 'B0D58AF7F962393AE90A66C4E02BF777', 'admin', '2018-06-09 13:10:21', '1', '2018-06-09 13:36:00');
INSERT INTO `jc_api_user_login` VALUES ('62', 'AABEC0D247B5894D91627B46B467B0B7', 'admin', '2018-06-09 15:05:57', '1', '2018-06-09 15:36:23');
INSERT INTO `jc_api_user_login` VALUES ('63', '751989DE5BD7C31892C33756F3A0B741', 'admin', '2018-06-09 15:56:42', '1', '2018-06-09 16:33:43');
INSERT INTO `jc_api_user_login` VALUES ('66', 'AE1DE8032480B79B83222EE7126DC48F', 'admin', '2018-06-09 16:37:33', '1', '2018-06-09 16:40:15');
INSERT INTO `jc_api_user_login` VALUES ('67', '375F2500CDF1EC5599DCB4C309FBFA43', 'admin', '2018-06-11 20:09:24', '1', '2018-06-11 21:07:20');
INSERT INTO `jc_api_user_login` VALUES ('68', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', 'admin', '2018-06-11 22:11:17', '1', '2018-06-11 22:46:58');
INSERT INTO `jc_api_user_login` VALUES ('69', '049F5DD14A6106D6ED0E9CACDBDE684E', 'admin', '2018-06-12 20:59:38', '1', '2018-06-12 20:59:39');
INSERT INTO `jc_api_user_login` VALUES ('71', 'ADE3E7B018BC6BF150A621B3F5F967A6', 'admin', '2018-06-12 22:12:06', '1', '2018-06-12 22:12:41');
INSERT INTO `jc_api_user_login` VALUES ('72', '7DDF52532660235E37EBDB0AFCF54A82', 'admin', '2018-06-12 23:18:05', '1', '2018-06-12 23:27:56');

-- ----------------------------
-- Table structure for jc_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel`;
CREATE TABLE `jc_channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(30) DEFAULT NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL DEFAULT '1' COMMENT '树左边',
  `rgt` int(11) NOT NULL DEFAULT '2' COMMENT '树右边',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `workflow_id` int(11) DEFAULT NULL COMMENT '工作流id',
  PRIMARY KEY (`channel_id`),
  KEY `fk_jc_channel_model` (`model_id`),
  KEY `fk_jc_channel_parent` (`parent_id`),
  KEY `fk_jc_channel_site` (`site_id`),
  KEY `index_jc_channel_lft` (`lft`),
  KEY `index_jc_channel_rgt` (`rgt`),
  CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_channel_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COMMENT='CMS栏目表';

-- ----------------------------
-- Records of jc_channel
-- ----------------------------
INSERT INTO `jc_channel` VALUES ('75', '1', '1', null, 'xw', '1', '8', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('76', '5', '1', null, 'pic', '9', '10', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('77', '6', '1', null, 'video', '11', '12', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('78', '4', '1', null, 'download', '13', '22', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('79', '8', '1', null, 'job', '23', '24', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('80', '2', '1', null, 'survey', '25', '26', '11', '0', '1', null);
INSERT INTO `jc_channel` VALUES ('81', '9', '1', null, 'doc', '27', '28', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('82', '2', '1', null, 'message', '29', '30', '10', '0', '1', null);
INSERT INTO `jc_channel` VALUES ('90', '4', '1', '78', 'xtrj', '14', '15', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('91', '4', '1', '78', 'mtzs', '16', '17', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('92', '4', '1', '78', 'jptj', '18', '19', '9', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('93', '4', '1', '78', 'yxyl', '20', '21', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('95', '1', '1', '75', 'gn', '2', '3', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('96', '1', '1', '75', 'gj', '4', '5', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('107', '1', '1', '75', 'jx', '6', '7', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('123', '13', '4', null, 'ptjj', '1', '8', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('131', '13', '4', '123', 'gywm', '2', '3', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('132', '13', '4', '123', 'lxfs', '4', '5', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('133', '13', '4', '123', 'zxjl', '6', '7', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('154', '12', '14', null, 'zxfw', '1', '10', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('155', '12', '14', null, 'sbfw', '11', '16', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('156', '11', '14', null, 'pgpj', '17', '24', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('157', '13', '14', null, 'gywm', '25', '26', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('158', '12', '16', null, 'dt', '1', '2', '1', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('159', '12', '16', null, 'zx', '3', '4', '2', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('160', '12', '16', null, 'yj', '5', '6', '10', '1', '0', null);
INSERT INTO `jc_channel` VALUES ('161', '12', '16', null, 'qk', '7', '8', '10', '1', '0', null);
INSERT INTO `jc_channel` VALUES ('162', '12', '16', null, 'yx', '9', '10', '10', '1', '0', null);
INSERT INTO `jc_channel` VALUES ('163', '12', '16', null, 'ls', '11', '12', '10', '1', '0', null);
INSERT INTO `jc_channel` VALUES ('164', '13', '16', null, 'gy', '13', '14', '4', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('168', '1', '1', null, 'test1', '31', '32', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('169', '1', '4', null, 'ptxw', '9', '10', '9', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('170', '1', '4', null, 'zczx', '11', '12', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('171', '1', '4', null, 'zxfw', '13', '28', '11', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('172', '1', '14', '154', 'zlyj', '2', '3', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('173', '1', '14', '154', 'gczj', '4', '5', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('174', '1', '14', '154', 'sdfa', '6', '7', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('175', '1', '14', '154', 'kxxyj', '8', '9', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('176', '1', '4', '171', 'lpls', '14', '15', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('177', '1', '4', '171', 'kjcgpj', '16', '17', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('178', '1', '4', '171', 'ysnzjjxpj', '18', '19', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('179', '1', '4', '171', 'shwdfxpg', '20', '21', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('180', '1', '4', '171', 'fpcxpg', '22', '23', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('181', '1', '4', '171', 'sjsfzpg', '24', '25', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('182', '1', '4', '171', 'qtpg', '26', '27', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('183', '1', '14', null, 'zxal', '27', '28', '10', '1', '0', null);
INSERT INTO `jc_channel` VALUES ('184', '11', '14', '156', 'jnpg', '18', '19', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('185', '11', '14', '156', 'shwdfxpg', '20', '21', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('186', '11', '14', '156', 'zdzxps', '22', '23', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('187', '12', '14', '155', 'zjsq', '12', '13', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('188', '12', '14', '155', 'xmsb', '14', '15', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('189', '12', '16', null, 'zj', '15', '16', '3', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('198', '13', '17', null, 'gywm', '1', '2', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('199', '1', '17', null, 'xwzx', '3', '4', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('200', '11', '17', null, 'zyyw', '5', '6', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('201', '1', '17', null, 'yjzs', '7', '8', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('202', '13', '17', null, 'lxwm', '9', '14', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('203', '13', '18', null, 'gywm', '1', '2', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('204', '1', '18', null, 'xwzx', '3', '4', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('205', '1', '18', null, 'zyyw', '5', '6', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('206', '1', '18', null, 'yjzs', '7', '8', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('207', '13', '18', null, 'lxwm', '9', '14', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('208', '13', '19', null, 'gywm', '1', '2', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('209', '1', '19', null, 'xwzx', '3', '14', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('210', '1', '19', null, 'zyyw', '15', '20', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('211', '1', '19', null, 'yjzs', '21', '22', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('212', '13', '19', null, 'lxwm', '23', '28', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('213', '13', '19', '212', 'lxwm', '24', '25', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('214', '13', '19', '212', 'jrwm', '26', '27', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('215', '13', '20', null, 'gywm', '1', '2', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('216', '1', '20', null, 'xwzx', '3', '10', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('217', '1', '20', null, 'zyyw', '11', '12', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('218', '1', '20', null, 'yjzs', '13', '14', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('219', '13', '20', null, 'lxwm', '15', '20', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('221', '13', '20', '219', 'lxwm', '16', '17', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('222', '13', '20', '219', 'jrwm', '18', '19', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('223', '1', '19', '210', 'kjtxgh', '16', '17', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('224', '1', '19', '209', 'gsyw', '4', '7', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('225', '1', '19', '224', 'xwxq', '5', '6', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('226', '13', '18', '207', 'lxwm', '10', '11', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('227', '13', '18', '207', 'jrwm', '12', '13', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('228', '13', '17', '202', 'lxwm', '10', '11', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('229', '13', '17', '202', 'jrwm', '12', '13', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('230', '11', '15', null, 'gywm', '1', '2', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('231', '11', '15', null, 'xwzx', '3', '10', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('232', '11', '15', null, 'zyyw', '11', '12', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('233', '11', '15', null, 'yjzs', '13', '14', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('234', '11', '15', null, 'lxwm', '15', '18', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('235', '11', '15', '234', 'jrwm', '16', '17', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('236', '1', '15', '231', 'jtxw', '4', '5', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('237', '1', '15', '231', 'dfdt', '6', '7', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('238', '1', '15', '231', 'mtbd', '8', '9', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('239', '1', '20', '216', 'jtyw', '4', '5', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('240', '1', '20', '216', 'cyxw', '6', '7', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('241', '1', '20', '216', 'mtgz', '8', '9', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('242', '1', '19', '210', 'ch', '18', '19', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('243', '1', '19', '209', 'xydc', '8', '9', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('244', '1', '19', '209', 'mtjj', '10', '11', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('245', '1', '19', '209', 'spzx', '12', '13', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('246', '1', '9', null, 'js', '1', '10', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('247', '1', '9', null, 'zk', '11', '18', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('248', '1', '9', null, 'hd', '19', '20', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('249', '1', '9', null, 'zx', '21', '24', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('250', '1', '9', null, 'zc', '25', '28', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('251', '1', '9', '246', 'syjs', '2', '7', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('252', '1', '9', '246', 'jxzt', '8', '9', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('253', '1', '9', '247', 'xyzj', '12', '15', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('254', '1', '9', '247', 'hzjg', '16', '17', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('255', '103', '9', '253', 'yykx', '13', '14', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('256', '1', '9', '251', 'wsclzgymxgjs', '3', '4', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('257', '1', '9', '251', 'xclzwsmxxgjs', '5', '6', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('258', '1', '9', '249', 'qyal', '22', '23', '10', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('259', '1', '9', '250', 'zzjx', '26', '27', '10', '1', '1', null);

-- ----------------------------
-- Table structure for jc_channel_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_attr`;
CREATE TABLE `jc_channel_attr` (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_channel` (`channel_id`),
  CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目扩展属性表';

-- ----------------------------
-- Records of jc_channel_attr
-- ----------------------------
INSERT INTO `jc_channel_attr` VALUES ('75', 'cusField', 'aaa22,aaa22,aaa22,aaa22,aaa22,aaa22,aaa22,aaa2');
INSERT INTO `jc_channel_attr` VALUES ('95', 'cusField', ',,,');
INSERT INTO `jc_channel_attr` VALUES ('96', 'cusField', ',');
INSERT INTO `jc_channel_attr` VALUES ('107', 'cusField', '1');
INSERT INTO `jc_channel_attr` VALUES ('107', 'cusField2', '2');
INSERT INTO `jc_channel_attr` VALUES ('75', 'cusField2', '1,2');

-- ----------------------------
-- Table structure for jc_channel_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_count`;
CREATE TABLE `jc_channel_count` (
  `channel_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `content_count_total` int(11) NOT NULL DEFAULT '0' COMMENT '内容发布数',
  `content_count_day` int(11) NOT NULL DEFAULT '0' COMMENT '内容今日发布数',
  `content_count_week` int(11) NOT NULL DEFAULT '0' COMMENT '内容本周发布数',
  `content_count_month` int(11) NOT NULL DEFAULT '0' COMMENT '内容本月发布数',
  `content_count_year` int(11) NOT NULL DEFAULT '0' COMMENT '内容今年发布数',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_count_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目访问量计数表';

-- ----------------------------
-- Records of jc_channel_count
-- ----------------------------
INSERT INTO `jc_channel_count` VALUES ('75', '679', '0', '0', '0', '23', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('76', '260', '0', '0', '0', '11', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('77', '51', '0', '0', '0', '15', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('78', '29', '0', '0', '0', '14', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('79', '60', '0', '0', '0', '10', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('80', '36', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('81', '88', '0', '0', '0', '10', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('82', '6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('90', '12', '0', '0', '0', '4', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('91', '4', '0', '0', '0', '8', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('92', '12', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('93', '2', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('95', '22', '3', '3', '3', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('96', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('107', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('123', '11', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('131', '4', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('132', '4', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('133', '4', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('154', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('155', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('156', '2', '0', '0', '0', '6', '0', '0', '0', '6');
INSERT INTO `jc_channel_count` VALUES ('157', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('158', '9', '2', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('159', '20', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('160', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('161', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('162', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('163', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('164', '8', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('168', '0', '0', '0', '0', '1', '0', '0', '0', '1');
INSERT INTO `jc_channel_count` VALUES ('169', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('170', '16', '0', '0', '0', '1', '0', '0', '0', '1');
INSERT INTO `jc_channel_count` VALUES ('171', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('172', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('173', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('174', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('175', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('176', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('177', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('178', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('179', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('180', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('181', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('182', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('183', '1', '0', '0', '0', '2', '0', '0', '0', '2');
INSERT INTO `jc_channel_count` VALUES ('184', '0', '0', '0', '0', '2', '0', '0', '0', '2');
INSERT INTO `jc_channel_count` VALUES ('185', '1', '0', '0', '0', '2', '0', '0', '0', '2');
INSERT INTO `jc_channel_count` VALUES ('186', '0', '0', '0', '0', '2', '0', '0', '0', '2');
INSERT INTO `jc_channel_count` VALUES ('187', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('188', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('189', '2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('198', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('199', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('200', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('201', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('202', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('203', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('204', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('205', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('206', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('207', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('208', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('209', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('210', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('211', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('212', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('213', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('214', '22', '22', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('215', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('216', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('217', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('218', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('219', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('221', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('222', '1', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('223', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('224', '27', '27', '27', '1', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('225', '8', '8', '8', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('226', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('227', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('228', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('229', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('230', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('231', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('232', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('233', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('234', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('235', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('236', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('237', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('238', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('239', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('240', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('241', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('242', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('243', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('244', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('245', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('246', '0', '0', '0', '0', '2', '2', '2', '2', '2');
INSERT INTO `jc_channel_count` VALUES ('247', '0', '0', '0', '0', '2', '1', '1', '2', '2');
INSERT INTO `jc_channel_count` VALUES ('248', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('249', '0', '0', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `jc_channel_count` VALUES ('250', '0', '0', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `jc_channel_count` VALUES ('251', '0', '0', '0', '0', '2', '2', '2', '2', '2');
INSERT INTO `jc_channel_count` VALUES ('252', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('253', '0', '0', '0', '0', '1', '0', '0', '1', '1');
INSERT INTO `jc_channel_count` VALUES ('254', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `jc_channel_count` VALUES ('255', '7', '7', '7', '7', '1', '0', '0', '1', '1');
INSERT INTO `jc_channel_count` VALUES ('256', '0', '0', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `jc_channel_count` VALUES ('257', '0', '0', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `jc_channel_count` VALUES ('258', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `jc_channel_count` VALUES ('259', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for jc_channel_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_department`;
CREATE TABLE `jc_channel_department` (
  `channel_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`department_id`),
  KEY `fk_jc_channel_department` (`department_id`),
  CONSTRAINT `fk_jc_channel_department` FOREIGN KEY (`department_id`) REFERENCES `jc_department` (`depart_id`),
  CONSTRAINT `fk_jc_department_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目部门关联表';

-- ----------------------------
-- Records of jc_channel_department
-- ----------------------------

-- ----------------------------
-- Table structure for jc_channel_depart_control
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_depart_control`;
CREATE TABLE `jc_channel_depart_control` (
  `channel_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`department_id`),
  KEY `fk_jc_channel_department` (`department_id`),
  CONSTRAINT `fk_jc_channel_depart_control` FOREIGN KEY (`department_id`) REFERENCES `jc_department` (`depart_id`),
  CONSTRAINT `fk_jc_depart_control_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS部门栏目数据权限关联表';

-- ----------------------------
-- Records of jc_channel_depart_control
-- ----------------------------

-- ----------------------------
-- Table structure for jc_channel_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_ext`;
CREATE TABLE `jc_channel_ext` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '名称',
  `final_step` tinyint(4) DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) DEFAULT NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) NOT NULL DEFAULT '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) NOT NULL DEFAULT '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL DEFAULT '20' COMMENT '每页多少条记录',
  `channel_rule` varchar(150) DEFAULT NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) DEFAULT NULL COMMENT '内容页生成规则',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) DEFAULT NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容页模板',
  `title_img` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL DEFAULT '0' COMMENT '评论(0:匿名;1:会员一次;2:关闭,3会员多次)',
  `allow_updown` tinyint(1) NOT NULL DEFAULT '1' COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  `title` varchar(255) DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) DEFAULT NULL COMMENT 'DESCRIPTION',
  `allow_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分享(true:开放;false:关闭)',
  `allow_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评分(true:开放;false:关闭)',
  `tpl_mobile_channel` varchar(100) DEFAULT NULL COMMENT '手机栏目页模板',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目内容表';

-- ----------------------------
-- Records of jc_channel_ext
-- ----------------------------
INSERT INTO `jc_channel_ext` VALUES ('75', '新闻', null, null, '0', '0', '0', '0', '30', null, null, null, '/WEB-INF/t/cms/www/default/channel/news.html', null, null, null, '1', '1', '510', '288', '310', '310', '0', '1', '0', null, null, null, '1', '1', '/WEB-INF/t/cms/www/mobile/channel/news.html');
INSERT INTO `jc_channel_ext` VALUES ('76', '图库', null, null, '0', '0', '0', '0', '10', null, null, null, null, null, null, null, '0', '0', '510', '288', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('77', '视频', null, null, '0', '0', '0', '0', '10', null, null, null, null, null, null, null, '1', '0', '510', '288', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('78', '下载', null, null, '0', '0', '0', '0', '10', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('79', '招聘', null, null, '0', '0', '0', '0', '10', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('80', '网络调查', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/alone/alone_survey.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '/WEB-INF/t/cms/www/mobile/alone/alone_survey.html.html');
INSERT INTO `jc_channel_ext` VALUES ('81', '文库', null, null, '0', '0', '0', '0', '10', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('82', '留言板', null, null, '0', '0', '0', '0', '10', null, null, '/guestbook.jspx', null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('90', '系统软件', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/download_child.html', null, null, null, '1', '1', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('91', '媒体助手', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/download_child.html', null, null, null, '1', '1', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('92', '精品推荐', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/download_recommend.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('93', '游戏娱乐', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/download_child.html', null, null, null, '1', '1', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('95', '国内', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/news.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', null, null, null, '0', '0', '/WEB-INF/t/cms/www/mobile/channel/news_child.html');
INSERT INTO `jc_channel_ext` VALUES ('96', '国际', null, null, '0', '0', '0', '0', '10', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('107', '江西', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/news_child.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '/WEB-INF/t/cms/www/mobile/channel/news.html');
INSERT INTO `jc_channel_ext` VALUES ('123', '平台简介', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/about.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '平台简介', null, '平台简介', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('131', '关于我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/about_child.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '关于我们', '成果展示', '关于我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('132', '联系方式', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/about_child.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联系方式', null, '联系方式', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('133', '在线交流', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/about_child.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '在线交流', null, '在线交流', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('154', '咨询服务', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/gczx/gczx/channel/column_item1.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '咨询服务', '咨询服务', '咨询服务', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('155', '申报服务', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/gczx/gczx/channel/column_item_sbfw.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '申报服务', '申报服务', '申报服务', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('156', '评估评价', null, null, '0', '0', '1', '0', '20', null, null, '/gczx/jnpg/index.jhtml', '/WEB-INF/t/cms/gczx/gczx/channel/column_menu_pgpj.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '评估评价', '评估评价', '评估评价', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('157', '关于我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/gczx/gczx/channel/about.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '关于我们', null, '关于我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('158', '动态', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/jwzk/jwzk/channel/column_item_dt.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '动态', '动态', '动态', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('159', '咨询', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/jwzk/jwzk/channel/column_item_zx.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '咨询', null, '咨询', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('160', '研究', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '研究', '研究', '研究', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('161', '期刊', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '期刊', '期刊', '期刊', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('162', '影响', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '影响', '影响', '影响', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('163', '理事', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '理事', '理事', '理事', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('164', '关于', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/jwzk/jwzk/channel/about.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '关于', null, '关于。。。', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('168', 'test1', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', 'test1', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('169', '平台新闻', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '平台新闻', '平台新闻', '平台新闻', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('170', '政策咨询', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '政策咨询', '政策咨询', '政策咨询', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('171', '在线服务', null, null, '0', '0', '1', '0', '20', null, null, '/main/lpls/index.jhtml', '/WEB-INF/t/cms/main/main/channel/news_zxfw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '在线服务', '在线服务', '在线服务', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('172', '战略研究', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/gczx/gczx/channel/news_zlyj.html', null, '/u/cms/gczx/201804/18233830o7x1.png', '/u/cms/gczx/201804/18233845smu5.png', '0', '0', '139', '139', '310', '310', '3', '1', '0', '战略研究', '战略研究', '战略研究', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('173', '工程造价', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, '/u/cms/gczx/201804/18234017o67e.png', '/u/cms/gczx/201804/18234008prgf.png', '0', '0', '139', '139', '310', '310', '3', '1', '0', '工程造价', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('174', '试点方案', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, '/u/cms/gczx/201804/18234045adoy.png', '/u/cms/gczx/201804/18234050nbtn.png', '0', '0', '139', '139', '310', '310', '3', '1', '0', '试点方案', null, '试点方案', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('175', '可行性研究', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, '/u/cms/gczx/201804/18234125p8aq.png', '/u/cms/gczx/201804/18234110o6jz.png', '0', '0', '139', '139', '310', '310', '3', '1', '0', '可行性研究', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('176', '联评联审', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/news_zxfw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联评联审', null, '联评联审', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('177', '科技成果评价', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/news_zxfw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '科技成果评价', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('178', '预算内资金绩效评价', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/news_zxfw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '预算内资金绩效评价', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('179', '社会稳定风险评估', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/news_zxfw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '社会稳定风险评估', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('180', '扶贫成效评估', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/news_zxfw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '扶贫成效评估', null, '扶贫成效评估', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('181', '省级示范镇评估', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/news_zxfw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '省级示范镇评估', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('182', '其他评估', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/main/main/channel/news_zxfw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '其他评估', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('183', '最新案例', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '最新案例', null, '最新案例', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('184', '节能评估', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/gczx/gczx/channel/column_menu_pgpj.html', null, '/u/cms/gczx/201804/21103958sfmd.png', '/u/cms/gczx/201804/21092943zkua.png', '0', '0', '139', '139', '310', '310', '3', '1', '0', '节能评估', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('185', '社会稳定风险评估', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/gczx/gczx/channel/column_menu_pgpj.html', null, '/u/cms/gczx/201804/21092926hv0b.png', '/u/cms/gczx/201804/21094357aqwl.png', '0', '0', '139', '139', '310', '310', '3', '1', '0', '社会稳定风险评估', null, '社会稳定风险评估', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('186', '重大专项评审', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/gczx/gczx/channel/column_menu_pgpj.html', null, '/u/cms/gczx/201804/21092910vwe9.png', '/u/cms/gczx/201804/21092850rmm7.png', '0', '0', '139', '139', '310', '310', '3', '1', '0', '重大专项评审', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('187', '资金申请', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/gczx/gczx/channel/column_item_sbfw.html', null, '/u/cms/gczx/201804/21101616aitd.png', '/u/cms/gczx/201804/2110154542c6.png', '0', '0', '139', '139', '310', '310', '3', '1', '0', '资金申请', null, '央视网消息（新闻联播）：4月19日，中共中央总书记、国家主席习近平分别致电古共中央第一书记劳尔·卡斯特罗和古巴新任国务委员会主席兼部长会议主席迪亚斯·卡内尔，祝贺古巴第九届全国人民政权代表大会选举产生新一届国家领导人。', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('188', ' 项目申报', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/gczx/gczx/channel/column_item_sbfw.html', null, '/u/cms/gczx/201804/211016450lyy.png', '/u/cms/gczx/201804/21101653exw2.png', '0', '0', '139', '139', '310', '310', '3', '1', '0', ' 项目申报', null, '\n项目申报\n据日本防卫省统合幕僚监部网站4月20日消息，4月20日上午10点半左右，海上自卫队第13护卫队所属“泽雾”驱逐舰，第5护卫队所属的“秋月”号驱逐舰以及第5航空群的P-3C反潜巡逻机在与那国岛(冲绳县)南约350公里发现向东行进的中国海军辽宁号航空母舰以及护航的052D级导弹驱逐舰1艘,052C级驱逐舰3艘，054A护卫舰2艘。', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('189', '专家', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/jwzk/jwzk/channel/column_item_zj.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '专家', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('198', '关于我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/sjzx/sjzx/channel/about.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '关于我们', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('199', '新闻中心', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/sjzx/sjzx/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '新闻中心', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('200', '主营业务', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/sjzx/sjzx/channel/column_menu.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '主营业务', null, '主营业务', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('201', '业绩展示', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/sjzx/sjzx/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '业绩展示', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('202', '联系我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/sjzx/sjzx/channel/about_lxwm.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联系我们', null, '联系我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('203', '关于我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/pgpj/pgpj/channel/about.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '关于我们', null, '关于我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('204', '新闻中心', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/pgpj/pgpj/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '新闻中心', null, '新闻中心', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('205', '主营业务', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/pgpj/pgpj/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '主营业务', null, '主营业务', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('206', '业绩展示', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '业绩展示', null, '业绩展示', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('207', '联系我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/pgpj/pgpj/channel/about_child.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联系我们', null, '联系我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('208', '关于我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/about_item.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '关于我们', null, '关于我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('209', '新闻中心', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '新闻中心', null, '新闻中心', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('210', '主营业务', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/news_zyyw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '主营业务', null, '主营业务', '1', '1', '/WEB-INF/t/cms/kjgh/kjgh/channel/news_zyyw.html');
INSERT INTO `jc_channel_ext` VALUES ('211', '业绩展示', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/news_yjzs.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '业绩展示', null, '业绩展示', '1', '1', '/WEB-INF/t/cms/kjgh/kjgh/channel/news_yjzs.html');
INSERT INTO `jc_channel_ext` VALUES ('212', '联系我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/about.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联系我们', null, '联系我们', '1', '0', null);
INSERT INTO `jc_channel_ext` VALUES ('213', '联系我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/about.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联系我们', null, '联系我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('214', '加入我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/about_child.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '加入我们', null, '加入我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('215', '关于我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/about.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '关于我们', null, '关于我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('216', '新闻中心', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/news_xwzx.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '新闻中心', null, '新闻中心', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('217', '主营业务', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/news_zyyw.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '主营业务', null, '主营业务', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('218', '业绩展示', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/news_yjzs.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '业绩展示', null, '业绩展示', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('219', '联系我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/about_lxwm.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联系我们', null, '联系我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('221', '联系我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/about_child.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联系我们', null, '联系我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('222', '加入我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/about_jrwm.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '加入我们', null, '加入我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('223', '空间体系规划', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/news-kjtigh.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '空间体系规划', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('224', '公司要闻', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/news_child.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '公司要闻', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('225', '新闻详情', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/news-child1.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '新闻详情', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('226', '联系我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/pgpj/pgpj/channel/about.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联系我们', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('227', '加入我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/pgpj/pgpj/channel/about_jrwm.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '加入我们', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('228', '联系我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/sjzx/sjzx/channel/about_lxwm.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '联系我们', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('229', '加入我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/sjzx/sjzx/channel/about_jrwm.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '加入我们', null, '加入我们', '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('230', '关于我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjzx/kjzx/channel/column_menu_gywm.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '关于我们', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('231', '新闻中心', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjzx/kjzx/channel/column_menu_xwzx.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '新闻中心', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('232', '主营业务', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjzx/kjzx/channel/column_menu_zyyw.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '主营业务', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('233', '业绩展示', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjzx/kjzx/channel/column_menu_yjzs.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '业绩展示', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('234', '联系我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjzx/kjzx/channel/column_menu_lxwm.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '联系我们', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('235', '加入我们', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjzx/kjzx/channel/column_menu_jrwm.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '加入我们', null, null, '1', '1', null);
INSERT INTO `jc_channel_ext` VALUES ('236', '集团新闻', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjzx/kjzx/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '集团新闻', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('237', '地方动态', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjzx/kjzx/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '地方动态', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('238', '媒体报道', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '媒体报道', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('239', '集团要闻', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/news_xwzx_2.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '集团要闻', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('240', '产业新闻', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/news_xwzx_2.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '产业新闻', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('241', '媒体关注', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zcpg/zcpg/channel/news_xwzx_2.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '媒体关注', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('242', '测绘', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '测绘', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('243', '行业洞察', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/news_child.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '行业洞察', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('244', '媒体聚焦', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/kjgh/kjgh/channel/news_child.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '媒体聚焦', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('245', '视频中心', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '视频中心', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('246', '技术', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_js.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '技术', null, '技术', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('247', '智库', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_zk.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '智库', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('248', '活动', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_hd.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '活动', null, '活动', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('249', '咨询', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_zx.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '咨询', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('250', '政策', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_zc.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '政策', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('251', '所有技术', null, null, '0', '0', '1', '0', '20', null, null, '/zckj/js/index.jhtml', '/WEB-INF/t/cms/zckj/zckj/channel/news_js.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '所有技术', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('252', '精选专题', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_syjs.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '精选专题', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('253', '行业专家', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_xyzj.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '行业专家', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('254', '合作机构', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_hzjg.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '合作机构', null, '合作机构', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('255', '医药科学', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/zj.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '医药科学', null, null, '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('256', '污水处理之工业膜相关技术123', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_jszt.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '污水处理之工业膜相关技术123', null, '污水处理的工艺和方法繁多，本专题围绕工业膜介绍了污水处理的相关技术，比如陶瓷膜分离、液膜法...', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('257', '新材料之王石墨烯相关技术456', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_jszt.html', null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '新材料之王石墨烯相关技术', null, '围绕改性塑料产业应用这一专题，集中介绍了改性塑料的相关技术，比如阻燃塑料类，各种塑料（AB...', '1', '1', '');
INSERT INTO `jc_channel_ext` VALUES ('258', '我的企业案例', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/zckj/zckj/channel/news_zx-list.html', null, null, null, '0', '0', '139', '139', '310', '310', '3', '1', '0', '企业案例', null, '企业案例', '1', '1', '/WEB-INF/t/cms/zckj/zckj/channel/news_zx-list.html');
INSERT INTO `jc_channel_ext` VALUES ('259', '正在进行111', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '1', '1', '139', '139', '310', '310', '3', '1', '0', '正在进行111', null, '正在进行111', '1', '1', '');

-- ----------------------------
-- Table structure for jc_channel_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_model`;
CREATE TABLE `jc_channel_model` (
  `channel_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL COMMENT '模型id',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `tpl_mobile_content` varchar(100) DEFAULT NULL COMMENT '手机内容页模板',
  PRIMARY KEY (`channel_id`,`priority`),
  KEY `fk_jc_model_channel_m` (`model_id`),
  CONSTRAINT `fk_jc_channel_model_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_model_channel_m` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目可选内容模型表';

-- ----------------------------
-- Records of jc_channel_model
-- ----------------------------
INSERT INTO `jc_channel_model` VALUES ('75', '1', '/WEB-INF/t/cms/www/default/content/news.html', '0', '/WEB-INF/t/cms/www/mobile/content/news.html');
INSERT INTO `jc_channel_model` VALUES ('76', '5', '', '0', '');
INSERT INTO `jc_channel_model` VALUES ('77', '6', '', '0', '');
INSERT INTO `jc_channel_model` VALUES ('79', '8', '', '0', '');
INSERT INTO `jc_channel_model` VALUES ('81', '9', '/WEB-INF/t/cms/www/default/content/doc_pdfjs.html', '0', '');
INSERT INTO `jc_channel_model` VALUES ('90', '4', '', '0', '');
INSERT INTO `jc_channel_model` VALUES ('91', '4', '', '0', '');
INSERT INTO `jc_channel_model` VALUES ('92', '4', '', '0', '');
INSERT INTO `jc_channel_model` VALUES ('93', '4', '', '0', '');
INSERT INTO `jc_channel_model` VALUES ('95', '1', '/WEB-INF/t/cms/www/default/content/news2.html', '0', '/WEB-INF/t/cms/www/mobile/content/news.html');
INSERT INTO `jc_channel_model` VALUES ('168', '1', '', '0', '');

-- ----------------------------
-- Table structure for jc_channel_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_txt`;
CREATE TABLE `jc_channel_txt` (
  `channel_id` int(11) NOT NULL,
  `txt` longtext COMMENT '栏目内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目文本表';

-- ----------------------------
-- Records of jc_channel_txt
-- ----------------------------
INSERT INTO `jc_channel_txt` VALUES ('107', '&lt;p&gt;内容的去啊&lt;/p&gt;', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('123', '<p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal;\"><span style=\"font-size: 10.5pt;\">　　吉林正泰第三方公共服务平台，是根据国家转变政府职能、创新服务管理方式、加快现代服务业发展、促进服务资源集聚等一系列精神，为了更好地服务于政府和企业，服务于社会发展和经济建设，创新咨询服务业态，完善公共服务功能，提升综合服务水平，由吉林正泰工程咨询有限公司建设和运营的咨询服务平台，包括线下服务和线上服务（网络平台）。</span><br/></p><p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal;\"><span style=\"font-size: 10.5pt;\"><br/></span></p><p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal;\"><span style=\"font-size: 10.5pt;\">　　吉林正泰第三方公共服务平台（网络平台），包括综合信息系统、咨询服务系统、评估评价系统、众创空间系统和智能帮助系统五大模块，包括：为各级政府和企业提供的线上工程咨询、科技咨询、审计咨询咨询服务；已经开展的省级示范城镇评估、财政资金绩效评价、社会稳定风险评估、精准扶贫脱贫评估和未来将开展的科技成果评价等各类专项评估评价服务；为科技型企业提供众创共享信息和企业成长咨询服务，为科研机构和众创服务机构提供网上服务窗口。</span></p><p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal;\"><span style=\"font-size: 10.5pt;\"><br/></span></p><p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal;\"><span style=\"font-size: 10.5pt;\">　　吉林正泰第三方公共服务平台（网络平台），是吉林正泰工程咨询有限公司在传统咨询服务（线下服务）基础上，围绕服务业务拓展、服务链条延伸、服务业态创新而打造的“互联网+咨询”和“众创网络空间”平台，旨在更好地为各级政府和企业提供咨询服务。</span></p><p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"font-size: 10.5pt;\"></span><span style=\"font-size: 10.5pt;\"></span><span style=\"font-size: 10.5pt;\"></span><span style=\"font-size: 10.5pt;\"></span><span style=\"font-size: 10.5pt;\"></span><span style=\"font-size: 10.5pt;\"></span></p><p><span style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 10.5pt;\"></span><span style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 10.5pt;\"></span><span style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 10.5pt;\"></span><span style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 10.5pt;\"></span><span style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 10.5pt;\"></span><span style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 10.5pt;\"></span></p><p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal; text-align: center;\"><span style=\"font-size: 10.5pt;\"><br/><br/></span></p><p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal; text-align: center;\"><img src=\"http://localhost:8080/u/cms/main/201804/19233827kukk.jpg\" border=\"0\" style=\"width: 700px; height: 247px;\"/><br/></p><p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal; text-align: center;\"><img src=\"http://localhost:8080/u/cms/main/201804/19233827ux9x.jpg\" border=\"0\" style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 12px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: normal; widows: 1; width: 700px; height: 304px; background-color: rgb(255, 255, 255);\"/><br/></p><p><br/></p><p><img src=\"/u/cms/main/201804/1923394645wz.png\" style=\"\" title=\"联系方式.png\"/></p><p><br/></p><p><img src=\"http://localhost:8080/u/cms/main/201804/19233946liwx.png\" title=\"在线交流.png\" style=\"white-space: normal;\"/></p><p style=\"color: rgb(114, 113, 113); font-family: &quot;Microsoft Yahei&quot;; font-size: 14px; white-space: normal; text-align: center;\"><br/></p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('131', '<p>关于我们...........</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('132', '<p>联系方式......</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('133', '<p>在线交流-------------</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('154', '<p>Consulting service</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('155', '<p>Declaration service</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('156', '<p>Evaluation and evaluation</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('157', '<p>About us</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('158', '<p>动态。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('159', '<p>咨询。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('160', '<p>研究。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('161', '<p>期刊。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('162', '<p>影响。。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('163', '<p>理事。。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('164', '<p>关于。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('169', '<p>平台新闻。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('170', '<p>政策咨询.。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('171', '<p>在线服务.。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('176', '<p>联评联审联评联审联评联审</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('177', '<p><img src=\"/r/cms/main/main/imgs/123123.png\" title=\"工程造价.png\" alt=\"工程造价.png\"/></p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('178', '<p>预算内资金绩效评价</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('181', '<p>省级示范镇评估</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('198', '<p>关于我们。。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('199', '<p>新闻中心。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('200', '<p>主营业务。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('201', '<p>业绩展示。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('202', '<p>联系我们。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('203', '<p>关于我们。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('204', '<p>新闻中心。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('205', '<p>主营业务。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('206', '<p>业绩展示。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('207', '<p>联系我们。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('208', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 远东智慧能源股份有限公司为远东控股集团有限公司控股子公司，股票名称“智慧能源”，股票代码“600869”。公司致力于成为全球领先的智慧能源、智慧城市服务商，主营智慧能源和智慧城市技术、产品与服务及其互联网、物联网应用的研发、制造与销售；智慧能源和智慧城市项目规划设计、投资建设及能效管理与服务；智慧能源和智慧城市工程总承包；包括智能分布式电源技术和产品、数码电芯、高性能动力锂电池组、新能源汽车等。拥有博士后科研工作站、院士专家工作站、江苏省企业研究生工作站、国家级企业技术中心、国家级认可实验室、江西省锂电池工程研究中心等科研基地。<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 智慧能源目前下属子公司有远东电缆有限公司、新远东电缆有限公司、远东复合技术有限公司、远东买卖宝网络科技有限公司、远东材料交易中心有限公司、远东新材料有限公司、安徽电缆股份有限公司、圣达电气有限公司、北京水木源华电气有限公司、上海艾能电力工程有限公司、远东福斯特新能源有限公司、北京京航安机场工程有限公司、远东集成科技有限公司等。其中，远东电缆有限公司产销连续多年位居行业前茅，荣获“全国质量奖”；远东买卖宝网络科技有限公司为全球电工电气电商平台；北京水木源华电气有限公司是国内领先的输配电自动化系统服务商；上海艾能电力工程有限公司具有电力行业（送电工程、变电工程）工程设计专业甲级、电力行业工程设计行业乙级、火电与其他（新能源）专业工程咨询乙级资质，是国内领先的专业从事电力勘察设计、电力工程总承包、项目管理、工程技术咨询、服务和能源投资的系统服务商；远东福斯特新能源有限公司是国内第一大18650锂离子电池生产商；北京京航安机场工程有限公司是国内民航机场工程和军用机场工程专业安装施工的知名企业。<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 智慧能源以“创造价值，服务社会”为使命，秉持“诚信务实、创新创优、和灵共赢”的价值理念，致力成为备受员工热爱、备受社会尊敬的全球领先的智慧能源、智慧城市服务商。<br/></p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('209', '<p>新闻中心。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('210', '<p>主营业务。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('211', '<p>业绩展示。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('212', '<p>联系我们。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('213', '<p>联系我们。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('214', '<p>加入我们。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('215', '<p>关于我们。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('216', '<p>新闻中心。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('217', '<p>主营业务。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('218', '<p>业绩展示。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('219', '<p>联系我们。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('221', '<p>联系我们。。。</p>', null, null, null);
INSERT INTO `jc_channel_txt` VALUES ('222', '<p>加入我们。。。</p>', null, null, null);

-- ----------------------------
-- Table structure for jc_channel_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_user`;
CREATE TABLE `jc_channel_user` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`user_id`),
  KEY `fk_jc_channel_user` (`user_id`),
  CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目用户关联表';

-- ----------------------------
-- Records of jc_channel_user
-- ----------------------------

-- ----------------------------
-- Table structure for jc_chnl_group_contri
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_contri`;
CREATE TABLE `jc_chnl_group_contri` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_c` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目投稿会员组关联表';

-- ----------------------------
-- Records of jc_chnl_group_contri
-- ----------------------------
INSERT INTO `jc_chnl_group_contri` VALUES ('75', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('79', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('81', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('95', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('96', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('107', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('79', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('81', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('75', '3');
INSERT INTO `jc_chnl_group_contri` VALUES ('79', '3');
INSERT INTO `jc_chnl_group_contri` VALUES ('81', '3');
INSERT INTO `jc_chnl_group_contri` VALUES ('95', '3');
INSERT INTO `jc_chnl_group_contri` VALUES ('96', '3');
INSERT INTO `jc_chnl_group_contri` VALUES ('107', '3');

-- ----------------------------
-- Table structure for jc_chnl_group_view
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_view`;
CREATE TABLE `jc_chnl_group_view` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_v` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目浏览会员组关联表';

-- ----------------------------
-- Records of jc_chnl_group_view
-- ----------------------------
INSERT INTO `jc_chnl_group_view` VALUES ('75', '2');
INSERT INTO `jc_chnl_group_view` VALUES ('107', '2');
INSERT INTO `jc_chnl_group_view` VALUES ('107', '3');

-- ----------------------------
-- Table structure for jc_comment
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment`;
CREATE TABLE `jc_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) DEFAULT NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL DEFAULT '0' COMMENT '支持数',
  `downs` smallint(6) NOT NULL DEFAULT '0' COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级评论',
  `reply_count` int(11) DEFAULT '0' COMMENT '回复数',
  PRIMARY KEY (`comment_id`),
  KEY `fk_jc_comment_content` (`content_id`),
  KEY `fk_jc_comment_reply` (`reply_user_id`),
  KEY `fk_jc_comment_site` (`site_id`),
  KEY `fk_jc_comment_user` (`comment_user_id`),
  CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='CMS评论表';

-- ----------------------------
-- Records of jc_comment
-- ----------------------------
INSERT INTO `jc_comment` VALUES ('11', null, null, '30', '1', '2016-10-10 08:50:25', null, '0', '0', '1', '1', null, null, '0');
INSERT INTO `jc_comment` VALUES ('13', null, null, '39', '1', '2016-10-10 08:56:21', null, '0', '0', '1', '1', null, null, '0');
INSERT INTO `jc_comment` VALUES ('14', null, null, '130', '1', '2016-10-10 14:00:12', null, '0', '0', '1', '1', null, null, '0');
INSERT INTO `jc_comment` VALUES ('15', null, null, '132', '1', '2016-10-10 14:01:13', null, '0', '0', '1', '1', null, null, '0');
INSERT INTO `jc_comment` VALUES ('16', '1', null, '113', '1', '2018-06-09 10:23:41', null, '0', '0', '0', '0', null, null, '0');

-- ----------------------------
-- Table structure for jc_comment_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment_ext`;
CREATE TABLE `jc_comment_ext` (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `text` longtext COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  KEY `fk_jc_ext_comment` (`comment_id`),
  CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `jc_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论扩展表';

-- ----------------------------
-- Records of jc_comment_ext
-- ----------------------------
INSERT INTO `jc_comment_ext` VALUES ('11', '117.41.152.66', '早就该这样了，不知道多少不法分子利用不实名手机号进行诈骗。', '');
INSERT INTO `jc_comment_ext` VALUES ('13', '117.41.152.66', '四川人民伤不起，忘国家加紧开展救援以及灾后重建工作。', '');
INSERT INTO `jc_comment_ext` VALUES ('14', '117.41.152.66', '保持定力：坚持走中国特色解决民族问题的正确道路', '');
INSERT INTO `jc_comment_ext` VALUES ('15', '117.41.152.66', '燃烧吧小宇宙，中国大妈征服世界，哈哈哈哈...', '');
INSERT INTO `jc_comment_ext` VALUES ('16', '127.0.0.1', '2222', null);

-- ----------------------------
-- Table structure for jc_config
-- ----------------------------
DROP TABLE IF EXISTS `jc_config`;
CREATE TABLE `jc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) DEFAULT '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL DEFAULT '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL DEFAULT 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL DEFAULT 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) DEFAULT NULL COMMENT '邮箱发件人',
  `validate_type` int(2) DEFAULT '0' COMMENT '验证类型：0:无  1：邮件验证  2：SMS验证',
  `office_home` varchar(255) NOT NULL COMMENT 'openoffice安装目录',
  `office_port` varchar(10) NOT NULL DEFAULT '8810' COMMENT 'openoffice端口',
  `swftools_home` varchar(255) NOT NULL COMMENT 'swftoos安装目录',
  `view_only_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '只有终审才能浏览内容页',
  `inside_site` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内网（通过站点路径区分站点）',
  `flow_clear_time` date NOT NULL COMMENT '流量统计清除时间',
  `channel_count_clear_time` date NOT NULL COMMENT '栏目发布内容计数器清除时间',
  `day_count` int(10) DEFAULT '0' COMMENT '短信验证 每日验证次数限制',
  `smsid` bigint(20) DEFAULT NULL COMMENT '配置了的短信运营商',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';

-- ----------------------------
-- Records of jc_config
-- ----------------------------
INSERT INTO `jc_config` VALUES ('1', null, null, '8080', '/dbfile.svl?n=', '0', '/r/cms/www/no_picture.gif', '/login.jspx', null, '0', '120', '120', '/r/cms/www/watermark.png', 'www.jeecms.com', '40', '＃FF0000', '100', '1', '0', '0', '2018-06-11', '2018-06-11 22:16:08', 'jeecms', '12', null, null, null, null, null, '0', 'D:＼OpenOffice4', '8820', 'D:/SWFTools/pdf2swf.exe', '0', '1', '2018-06-12', '2018-06-11', '0', null);

-- ----------------------------
-- Table structure for jc_config_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_attr`;
CREATE TABLE `jc_config_attr` (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_config` (`config_id`),
  CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置属性表';

-- ----------------------------
-- Records of jc_config_attr
-- ----------------------------
INSERT INTO `jc_config_attr` VALUES ('1', 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'username_reserved', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'username_min_len', '5');
INSERT INTO `jc_config_attr` VALUES ('1', 'version', 'jeecms-v8');
INSERT INTO `jc_config_attr` VALUES ('1', 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES ('1', 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES ('1', 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES ('1', 'day', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaKey', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqID', '101139646');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqKey', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaID', '2510334929');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboKey', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboID', '801526383');
INSERT INTO `jc_config_attr` VALUES ('1', 'ssoEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'flowSwitch', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'contentFreshMinute', '0');
INSERT INTO `jc_config_attr` VALUES ('1', 'codeImgWidth', '160');
INSERT INTO `jc_config_attr` VALUES ('1', 'codeImgHeight', '160');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_4', '4');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_1', '1');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_3', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_2', '2');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_5', '5');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_6', '6');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinAppId', '1212');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinAppSecret', '121212');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinLoginId', '1212');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinLoginSecret', '121212');
INSERT INTO `jc_config_attr` VALUES ('1', 'commentOpen', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'guestbookOpen', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'guestbookNeedLogin', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'guestbookDayLimit', '10');
INSERT INTO `jc_config_attr` VALUES ('1', 'commentDayLimit', '1');
INSERT INTO `jc_config_attr` VALUES ('1', 'apiAccountMngPassword', '5f4dcc3b5aa765d61d8327deb882cf99');

-- ----------------------------
-- Table structure for jc_config_content_charge
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_content_charge`;
CREATE TABLE `jc_config_content_charge` (
  `config_content_id` int(11) NOT NULL DEFAULT '1',
  `weixin_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信服务号APPID',
  `weixin_secret` varchar(50) NOT NULL DEFAULT '' COMMENT '微信公众号secret',
  `weixin_account` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付商户号',
  `weixin_password` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付商户密钥',
  `alipay_partner_id` varchar(255) DEFAULT NULL COMMENT '支付宝合作者ID',
  `alipay_account` varchar(255) DEFAULT NULL COMMENT '支付宝签约账户',
  `alipay_key` varchar(1000) DEFAULT NULL COMMENT '支付宝公钥',
  `alipay_appid` varchar(255) DEFAULT NULL COMMENT '支付宝应用ID',
  `alipay_public_key` varchar(255) DEFAULT '' COMMENT '支付宝RSA公钥',
  `alipay_private_key` varchar(1000) DEFAULT NULL COMMENT '支付宝RSA私钥',
  `charge_ratio` double(5,2) NOT NULL DEFAULT '0.00' COMMENT '抽成比例',
  `min_draw_amount` double(11,2) NOT NULL DEFAULT '1.00' COMMENT '最小提现额',
  `commission_total` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成总金额',
  `commission_year` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成年金额',
  `commission_month` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成月金额',
  `commission_day` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成日金额',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '最后购买时间',
  `pay_transfer_password` varchar(100) NOT NULL DEFAULT '5f4dcc3b5aa765d61d8327deb882cf99' COMMENT '转账支付密码（管理后台验证）',
  `transfer_api_password` varchar(100) NOT NULL DEFAULT '' COMMENT '企业转账接口API密钥',
  `reward_min` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '打赏随机数最小值',
  `reward_max` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '打赏随机数最小值',
  `reward_pattern` tinyint(1) NOT NULL DEFAULT '0' COMMENT '打赏模式(0随机 1固定)',
  PRIMARY KEY (`config_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容收费配置';

-- ----------------------------
-- Records of jc_config_content_charge
-- ----------------------------
INSERT INTO `jc_config_content_charge` VALUES ('1', '1', '2', '3', '4', '1', '1', '1', '1', '1', '1', '0.10', '1.00', '0.0000', '0.0000', '0.0000', '0.0000', '2016-10-11 11:40:48', '5f4dcc3b5aa765d61d8327deb882cf99', '4', '0.01', '1.00', '0');

-- ----------------------------
-- Table structure for jc_config_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_item`;
CREATE TABLE `jc_config_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '70' COMMENT '排列顺序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型 "1":"字符串文本","2":"整型文本","3":"浮点型文本","4":"文本区","5":"日期","6":"下拉列表","7":"复选框","8":"单选框"',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `category` int(11) NOT NULL DEFAULT '1' COMMENT '模型项目所属分类（1注册模型）',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_config` (`config_id`),
  CONSTRAINT `fk_jc_item_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置模型项表';

-- ----------------------------
-- Records of jc_config_item
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content
-- ----------------------------
DROP TABLE IF EXISTS `jc_content`;
CREATE TABLE `jc_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站;4:投稿;5:归档)',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  `recommend_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐级别',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_site` (`site_id`),
  KEY `fk_jc_content_type` (`type_id`),
  KEY `fk_jc_content_user` (`user_id`),
  KEY `fk_jc_contentchannel` (`channel_id`),
  KEY `fk_jc_content_model` (`model_id`),
  KEY `index_jc_content_top_level_sort` (`top_level`,`sort_date`),
  KEY `index_jc_content_status` (`status`),
  KEY `index_jc_content_sort_date` (`sort_date`),
  KEY `index_jc_content_is_recommend` (`is_recommend`),
  KEY `index_jc_content_recommend_level` (`recommend_level`),
  CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_content_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COMMENT='CMS内容表';

-- ----------------------------
-- Records of jc_content
-- ----------------------------
INSERT INTO `jc_content` VALUES ('2', '76', '1', '2', '5', '1', '2016-07-15 14:47:24', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('7', '76', '1', '2', '5', '1', '2016-07-15 15:33:26', '0', '0', '1', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('11', '96', '1', '1', '1', '1', '2016-07-15 16:23:32', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('12', '96', '1', '1', '1', '1', '2016-07-15 17:22:47', '0', '0', '0', '2', '0', '0', '0', '0', '1', '0');
INSERT INTO `jc_content` VALUES ('13', '76', '1', '2', '5', '1', '2016-07-19 14:12:48', '1', '0', '1', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('14', '96', '1', '2', '1', '1', '2016-07-19 14:26:30', '0', '0', '0', '2', '0', '0', '0', '0', '15', '0');
INSERT INTO `jc_content` VALUES ('23', '96', '1', '1', '1', '1', '2016-09-13 17:16:04', '0', '0', '0', '2', '0', '0', '0', '0', '11', '1');
INSERT INTO `jc_content` VALUES ('27', '96', '1', '2', '1', '1', '2016-09-22 16:30:13', '0', '0', '0', '2', '0', '0', '0', '0', '2', '1');
INSERT INTO `jc_content` VALUES ('28', '96', '1', '2', '1', '1', '2016-09-22 16:56:46', '0', '0', '0', '2', '0', '0', '0', '0', '2', '1');
INSERT INTO `jc_content` VALUES ('29', '95', '1', '1', '1', '1', '2016-09-23 09:07:33', '0', '0', '0', '2', '0', '0', '0', '0', '1', '1');
INSERT INTO `jc_content` VALUES ('30', '95', '1', '1', '1', '1', '2016-09-23 09:09:41', '0', '0', '0', '2', '0', '0', '0', '0', '41', '1');
INSERT INTO `jc_content` VALUES ('32', '95', '1', '2', '1', '1', '2016-09-23 09:19:38', '0', '0', '0', '2', '0', '0', '0', '0', '2', '1');
INSERT INTO `jc_content` VALUES ('33', '95', '1', '2', '1', '1', '2016-09-23 09:23:39', '0', '0', '0', '2', '0', '0', '0', '0', '18', '1');
INSERT INTO `jc_content` VALUES ('36', '95', '1', '2', '1', '1', '2016-09-23 09:40:21', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('37', '95', '1', '2', '1', '1', '2016-09-23 09:43:34', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('39', '95', '1', '2', '1', '1', '2016-09-23 09:54:17', '0', '0', '0', '2', '0', '0', '0', '0', '18', '1');
INSERT INTO `jc_content` VALUES ('43', '79', '1', '1', '8', '1', '2016-09-26 09:33:15', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('44', '79', '1', '1', '8', '1', '2016-09-26 09:34:35', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('45', '79', '1', '1', '8', '1', '2016-09-26 09:38:39', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('46', '79', '1', '1', '8', '1', '2016-09-26 09:45:02', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('47', '79', '1', '1', '8', '1', '2016-09-26 09:47:54', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('48', '79', '1', '1', '8', '1', '2016-09-26 09:50:04', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('49', '79', '1', '1', '8', '1', '2016-09-26 09:51:13', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('50', '79', '1', '1', '8', '1', '2016-09-26 09:54:56', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('51', '79', '1', '1', '8', '1', '2016-09-26 09:56:01', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('53', '77', '1', '2', '6', '1', '2016-09-26 10:19:13', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('55', '77', '1', '2', '6', '1', '2016-09-26 10:20:11', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('57', '77', '1', '2', '6', '1', '2016-09-26 10:21:19', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('59', '77', '1', '2', '6', '1', '2016-09-26 10:22:24', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('61', '77', '1', '2', '6', '1', '2016-09-26 10:29:06', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('63', '77', '1', '2', '6', '1', '2016-09-26 10:30:05', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('67', '81', '1', '2', '9', '1', '2016-09-26 14:08:56', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('68', '81', '1', '2', '9', '1', '2016-09-26 14:34:34', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('69', '90', '1', '1', '4', '1', '2016-09-26 16:37:28', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('71', '91', '1', '1', '4', '1', '2016-09-27 09:47:27', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('72', '90', '1', '2', '4', '1', '2016-09-27 10:18:46', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('74', '81', '1', '2', '9', '1', '2016-09-29 09:28:56', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('100', '93', '1', '2', '4', '1', '2016-10-10 11:09:06', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('101', '91', '1', '2', '4', '1', '2016-10-10 11:16:31', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('102', '90', '1', '1', '4', '1', '2016-10-10 11:19:18', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('103', '90', '1', '1', '4', '1', '2016-10-10 11:21:37', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('104', '93', '1', '1', '4', '1', '2016-10-10 11:27:17', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('105', '91', '1', '1', '4', '1', '2016-10-10 11:28:52', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('106', '91', '1', '1', '4', '1', '2016-10-10 11:30:54', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('107', '91', '1', '1', '4', '1', '2016-10-10 11:32:35', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('108', '91', '1', '1', '4', '1', '2016-10-10 11:34:05', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('109', '91', '1', '1', '4', '1', '2016-10-10 11:35:26', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('110', '91', '1', '1', '4', '1', '2016-10-10 11:36:32', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('111', '95', '1', '2', '1', '1', '2016-10-10 11:45:47', '0', '0', '0', '2', '0', '0', '0', '0', '12', '1');
INSERT INTO `jc_content` VALUES ('112', '95', '1', '2', '1', '1', '2016-10-10 11:48:08', '0', '0', '0', '2', '0', '0', '0', '0', '18', '1');
INSERT INTO `jc_content` VALUES ('113', '95', '1', '4', '1', '1', '2016-10-10 11:50:03', '0', '0', '0', '2', '0', '0', '0', '0', '11', '1');
INSERT INTO `jc_content` VALUES ('114', '76', '1', '2', '5', '1', '2016-10-10 13:11:12', '0', '0', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('115', '76', '1', '2', '5', '1', '2016-10-10 13:15:37', '0', '0', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('116', '76', '1', '2', '5', '1', '2016-10-10 13:19:22', '0', '0', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('117', '76', '1', '2', '5', '1', '2016-10-10 13:22:07', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('118', '76', '1', '2', '5', '1', '2016-10-10 13:23:50', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('119', '76', '1', '2', '5', '1', '2016-10-10 13:26:38', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('120', '76', '1', '2', '5', '1', '2016-10-10 13:35:17', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('121', '77', '1', '2', '6', '1', '2016-10-10 13:38:11', '1', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('122', '77', '1', '2', '6', '1', '2016-10-10 13:40:05', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('123', '77', '1', '2', '6', '1', '2016-10-10 13:41:03', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('124', '77', '1', '2', '6', '1', '2016-10-10 13:42:48', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('125', '77', '1', '2', '6', '1', '2016-10-10 13:44:47', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('126', '77', '1', '2', '6', '1', '2016-10-10 13:46:01', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('127', '77', '1', '2', '6', '1', '2016-10-10 13:46:26', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('128', '77', '1', '2', '6', '1', '2016-10-10 13:46:52', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('129', '77', '1', '2', '6', '1', '2016-10-10 13:47:24', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('130', '95', '1', '1', '1', '1', '2016-10-10 13:51:07', '1', '0', '0', '2', '0', '0', '0', '0', '12', '1');
INSERT INTO `jc_content` VALUES ('131', '95', '1', '1', '1', '1', '2016-10-10 13:54:05', '0', '0', '0', '2', '0', '0', '0', '0', '13', '1');
INSERT INTO `jc_content` VALUES ('132', '95', '1', '1', '1', '1', '2016-10-10 13:55:46', '0', '0', '0', '2', '0', '0', '0', '0', '1', '1');
INSERT INTO `jc_content` VALUES ('133', '81', '1', '2', '9', '1', '2016-10-10 14:08:28', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('134', '81', '1', '2', '9', '1', '2016-10-10 14:11:44', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('135', '81', '1', '2', '9', '1', '2016-10-10 14:13:55', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('136', '81', '1', '2', '9', '1', '2016-10-10 14:14:59', '1', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('137', '81', '1', '2', '9', '1', '2016-10-10 14:17:16', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('138', '81', '1', '2', '9', '1', '2016-10-10 14:19:56', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('139', '81', '1', '2', '9', '1', '2016-10-10 14:24:49', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('140', '79', '1', '1', '8', '1', '2016-10-10 14:27:44', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('141', '76', '1', '2', '5', '1', '2016-10-11 09:44:23', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('143', '95', '1', '1', '1', '1', '2017-04-12 09:09:57', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('199', '168', '1', '1', '1', '1', '2018-04-14 17:36:50', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('200', '170', '2', '1', '1', '4', '2018-04-19 22:56:23', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('203', '183', '9', '1', '1', '14', '2018-04-21 09:07:27', '0', '1', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('204', '183', '9', '1', '1', '14', '2018-04-21 09:08:26', '0', '1', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('205', '184', '9', '1', '1', '14', '2018-04-21 09:51:29', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('206', '184', '9', '1', '1', '14', '2018-04-21 09:53:12', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('207', '185', '9', '1', '1', '14', '2018-04-21 09:53:54', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('208', '185', '9', '1', '1', '14', '2018-04-21 09:54:21', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('209', '186', '9', '1', '1', '14', '2018-04-21 09:54:49', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('210', '186', '9', '1', '1', '14', '2018-04-21 09:55:16', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('211', '255', '1', '1', '103', '9', '2018-06-09 15:09:56', '0', '0', '0', '2', '38', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('212', '256', '1', '1', '1', '9', '2018-06-11 20:39:58', '0', '0', '0', '2', '4', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('213', '257', '1', '1', '1', '9', '2018-06-11 20:40:38', '0', '0', '0', '2', '1', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('214', '254', '1', '1', '1', '9', '2018-06-11 22:12:39', '0', '0', '0', '2', '1', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('215', '258', '1', '1', '1', '9', '2018-06-11 22:31:00', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('216', '259', '1', '1', '1', '9', '2018-06-11 22:39:05', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for jc_contenttag
-- ----------------------------
DROP TABLE IF EXISTS `jc_contenttag`;
CREATE TABLE `jc_contenttag` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  KEY `fk_jc_content_tag` (`tag_id`),
  KEY `fk_jc_tag_content` (`content_id`),
  CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `jc_content_tag` (`tag_id`),
  CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容标签关联表';

-- ----------------------------
-- Records of jc_contenttag
-- ----------------------------
INSERT INTO `jc_contenttag` VALUES ('143', '1', '0');
INSERT INTO `jc_contenttag` VALUES ('143', '3', '1');
INSERT INTO `jc_contenttag` VALUES ('143', '4', '2');
INSERT INTO `jc_contenttag` VALUES ('213', '5', '0');
INSERT INTO `jc_contenttag` VALUES ('213', '6', '1');
INSERT INTO `jc_contenttag` VALUES ('213', '7', '2');
INSERT INTO `jc_contenttag` VALUES ('213', '8', '3');
INSERT INTO `jc_contenttag` VALUES ('213', '9', '4');
INSERT INTO `jc_contenttag` VALUES ('212', '6', '0');
INSERT INTO `jc_contenttag` VALUES ('212', '8', '1');
INSERT INTO `jc_contenttag` VALUES ('212', '5', '2');
INSERT INTO `jc_contenttag` VALUES ('212', '7', '3');
INSERT INTO `jc_contenttag` VALUES ('212', '9', '4');

-- ----------------------------
-- Table structure for jc_content_attachment
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attachment`;
CREATE TABLE `jc_content_attachment` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) NOT NULL COMMENT '附件名称',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  KEY `fk_jc_attachment_content` (`content_id`),
  CONSTRAINT `fk_jc_attachment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容附件表';

-- ----------------------------
-- Records of jc_content_attachment
-- ----------------------------
INSERT INTO `jc_content_attachment` VALUES ('69', '0', '/u/cms/www/201609/261635496465.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('71', '0', '/u/cms/www/201609/271002022fag.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('72', '0', '/u/cms/www/201609/27102743993k.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('100', '0', '/u/cms/www/201610/10110756cg7o.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('101', '0', '/u/cms/www/201610/10111518cqda.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('102', '0', '/u/cms/www/201610/10111758q1kj.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('103', '0', '/u/cms/www/201610/101120397iez.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('104', '0', '/u/cms/www/201610/10112554wirt.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('105', '0', '/u/cms/www/201610/10112814u17l.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('106', '0', '/u/cms/www/201610/101130257966.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('107', '0', '/u/cms/www/201610/101131571wkz.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('108', '0', '/u/cms/www/201610/101133341nc3.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('109', '0', '/u/cms/www/201610/10113459gvbx.zip', '演示.zip', null, '0');
INSERT INTO `jc_content_attachment` VALUES ('110', '0', '/u/cms/www/201610/101136270k36.zip', '演示.zip', null, '0');

-- ----------------------------
-- Table structure for jc_content_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attr`;
CREATE TABLE `jc_content_attr` (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_content` (`content_id`),
  CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展属性表';

-- ----------------------------
-- Records of jc_content_attr
-- ----------------------------
INSERT INTO `jc_content_attr` VALUES ('14', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('14', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('11', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('11', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('12', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('12', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('23', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('23', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('27', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('27', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('28', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('28', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('29', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('29', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('30', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('30', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('32', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('32', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('43', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('43', 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES ('43', 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES ('43', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('43', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('43', 'salary', '5000-8000');
INSERT INTO `jc_content_attr` VALUES ('43', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('43', 'workplace', '南昌');
INSERT INTO `jc_content_attr` VALUES ('43', 'nums', '1-3人');
INSERT INTO `jc_content_attr` VALUES ('44', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('44', 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES ('44', 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES ('44', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('44', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('44', 'salary', '3000-5000');
INSERT INTO `jc_content_attr` VALUES ('44', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('44', 'workplace', '上海');
INSERT INTO `jc_content_attr` VALUES ('44', 'nums', '3-5人');
INSERT INTO `jc_content_attr` VALUES ('45', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('45', 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES ('45', 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES ('45', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('45', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('45', 'salary', '1500-2000');
INSERT INTO `jc_content_attr` VALUES ('45', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('45', 'workplace', '北京');
INSERT INTO `jc_content_attr` VALUES ('45', 'nums', '5-10人');
INSERT INTO `jc_content_attr` VALUES ('46', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('46', 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES ('46', 'hasmanage', '要求');
INSERT INTO `jc_content_attr` VALUES ('46', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('46', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('46', 'salary', '面议');
INSERT INTO `jc_content_attr` VALUES ('46', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('46', 'workplace', '广州');
INSERT INTO `jc_content_attr` VALUES ('46', 'nums', '1-3人');
INSERT INTO `jc_content_attr` VALUES ('47', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('47', 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES ('47', 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES ('47', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('47', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('47', 'salary', '1500-2000');
INSERT INTO `jc_content_attr` VALUES ('47', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('47', 'workplace', '重庆');
INSERT INTO `jc_content_attr` VALUES ('47', 'nums', '1-3人');
INSERT INTO `jc_content_attr` VALUES ('48', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('48', 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES ('48', 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES ('48', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('48', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('48', 'salary', '5000-8000');
INSERT INTO `jc_content_attr` VALUES ('48', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('48', 'workplace', '杭州');
INSERT INTO `jc_content_attr` VALUES ('48', 'nums', '1-3人');
INSERT INTO `jc_content_attr` VALUES ('49', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('49', 'nature', '兼职');
INSERT INTO `jc_content_attr` VALUES ('49', 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES ('49', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('49', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('49', 'salary', '1500-2000');
INSERT INTO `jc_content_attr` VALUES ('49', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('49', 'workplace', '重庆');
INSERT INTO `jc_content_attr` VALUES ('49', 'nums', '1-3人');
INSERT INTO `jc_content_attr` VALUES ('50', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('50', 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES ('50', 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES ('50', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('50', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('50', 'salary', '1500-2000');
INSERT INTO `jc_content_attr` VALUES ('50', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('50', 'workplace', '南京');
INSERT INTO `jc_content_attr` VALUES ('50', 'nums', '1-3人');
INSERT INTO `jc_content_attr` VALUES ('51', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('51', 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES ('51', 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES ('51', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('51', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('51', 'salary', '2000-3000');
INSERT INTO `jc_content_attr` VALUES ('51', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('51', 'workplace', '西安');
INSERT INTO `jc_content_attr` VALUES ('51', 'nums', '1-3人');
INSERT INTO `jc_content_attr` VALUES ('53', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('53', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('53', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('55', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('55', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('55', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('57', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('57', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('57', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('59', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('59', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('59', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('61', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('61', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('61', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('63', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('63', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('63', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('67', 'em', '经管营销');
INSERT INTO `jc_content_attr` VALUES ('68', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('68', 'em', '人文社科');
INSERT INTO `jc_content_attr` VALUES ('69', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('69', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('69', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('69', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('69', 'edition', '8.3.18038.0');
INSERT INTO `jc_content_attr` VALUES ('69', 'system', 'WinXP/Win2003/Vista/Win7/Win8');
INSERT INTO `jc_content_attr` VALUES ('69', 'size', '54.3M');
INSERT INTO `jc_content_attr` VALUES ('69', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('71', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('71', 'system', 'win8/win7/vista/win2003/winxp');
INSERT INTO `jc_content_attr` VALUES ('71', 'size', '10.9 MB');
INSERT INTO `jc_content_attr` VALUES ('71', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('71', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('71', 'edition', 'V5.2.7');
INSERT INTO `jc_content_attr` VALUES ('71', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('71', 'bit', '32位');
INSERT INTO `jc_content_attr` VALUES ('72', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('72', 'system', 'WinXP(SP2以上) / Vista / Win7 / Win8 / Win8.1');
INSERT INTO `jc_content_attr` VALUES ('72', 'size', '112M');
INSERT INTO `jc_content_attr` VALUES ('72', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('72', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('72', 'edition', '360杀毒V5.0.0.7092');
INSERT INTO `jc_content_attr` VALUES ('72', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('72', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('67', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('74', 'hy', 'PPT');
INSERT INTO `jc_content_attr` VALUES ('74', 'em', '教育');
INSERT INTO `jc_content_attr` VALUES ('100', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('100', 'system', 'win8/win7/vista/win2003/winxp');
INSERT INTO `jc_content_attr` VALUES ('100', 'size', '298.68 MB');
INSERT INTO `jc_content_attr` VALUES ('100', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('100', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('100', 'edition', '3.00.401');
INSERT INTO `jc_content_attr` VALUES ('100', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('100', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('101', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('101', 'system', 'WinXP/Win2003/Vista/Win7/Win8/Win10');
INSERT INTO `jc_content_attr` VALUES ('101', 'size', '40.4M');
INSERT INTO `jc_content_attr` VALUES ('101', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('101', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('101', 'edition', '9.0.16.408');
INSERT INTO `jc_content_attr` VALUES ('101', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('101', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('102', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('102', 'system', 'Win2000 WinXP Win2003 Vista Win8 Win7 Win10');
INSERT INTO `jc_content_attr` VALUES ('102', 'size', '1.29MB');
INSERT INTO `jc_content_attr` VALUES ('102', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('102', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('102', 'edition', '10.3.0.2009 官方正式版');
INSERT INTO `jc_content_attr` VALUES ('102', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('102', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('103', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('103', 'system', 'WinXP/Win2003/Vista/Win7/Win8/Win10');
INSERT INTO `jc_content_attr` VALUES ('103', 'size', '37.5M');
INSERT INTO `jc_content_attr` VALUES ('103', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('103', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('103', 'edition', '8.0.0.8381');
INSERT INTO `jc_content_attr` VALUES ('103', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('103', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('104', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('104', 'system', 'WinXP/Win2003/Vista/Win7/Win8');
INSERT INTO `jc_content_attr` VALUES ('104', 'size', '22.6M');
INSERT INTO `jc_content_attr` VALUES ('104', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('104', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('104', 'edition', '8.13.0.0');
INSERT INTO `jc_content_attr` VALUES ('104', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('104', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('105', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('105', 'system', 'WinXP/Win2003/Vista/Win7/Win8');
INSERT INTO `jc_content_attr` VALUES ('105', 'size', '61.4M');
INSERT INTO `jc_content_attr` VALUES ('105', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('105', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('105', 'edition', '2.0.0.1');
INSERT INTO `jc_content_attr` VALUES ('105', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('105', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('106', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('106', 'system', 'WinXP/Win2003/Vista/Win7/Win8/Win10');
INSERT INTO `jc_content_attr` VALUES ('106', 'size', '33.3M');
INSERT INTO `jc_content_attr` VALUES ('106', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('106', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('106', 'edition', '4.3.3.27');
INSERT INTO `jc_content_attr` VALUES ('106', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('106', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('107', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('107', 'system', 'Win7/Win8/Win10');
INSERT INTO `jc_content_attr` VALUES ('107', 'size', '46.5M');
INSERT INTO `jc_content_attr` VALUES ('107', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('107', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('107', 'edition', '53.0.2785.143');
INSERT INTO `jc_content_attr` VALUES ('107', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('107', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('108', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('108', 'system', 'Win7/WinVista/WinXP/Win8兼容软件');
INSERT INTO `jc_content_attr` VALUES ('108', 'size', '9.7M');
INSERT INTO `jc_content_attr` VALUES ('108', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('108', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('108', 'edition', '8.1');
INSERT INTO `jc_content_attr` VALUES ('108', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('108', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('109', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('109', 'system', 'Win2000/WinXP/Win2003/Vista/Win7/Win8/Win10');
INSERT INTO `jc_content_attr` VALUES ('109', 'size', '32.7M');
INSERT INTO `jc_content_attr` VALUES ('109', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('109', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('109', 'edition', '版本：3.7.0.0011');
INSERT INTO `jc_content_attr` VALUES ('109', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('109', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('110', 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES ('110', 'system', 'WinXP/Win2003/Vista/Win7/Win8/Win10');
INSERT INTO `jc_content_attr` VALUES ('110', 'size', '32.5M');
INSERT INTO `jc_content_attr` VALUES ('110', 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES ('110', 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES ('110', 'edition', '9.15.1596.0');
INSERT INTO `jc_content_attr` VALUES ('110', 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES ('110', 'bit', '32/64');
INSERT INTO `jc_content_attr` VALUES ('114', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('114', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('114', 'pic3', '');
INSERT INTO `jc_content_attr` VALUES ('13', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('13', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('13', 'pic3', '');
INSERT INTO `jc_content_attr` VALUES ('7', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('7', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('7', 'pic3', '');
INSERT INTO `jc_content_attr` VALUES ('115', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('115', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('115', 'pic3', '');
INSERT INTO `jc_content_attr` VALUES ('121', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('121', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('121', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('122', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('122', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('122', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('123', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('123', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('123', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('124', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('124', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('124', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('125', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('125', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('125', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('126', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('126', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('126', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('127', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('127', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('127', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('128', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('128', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('128', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('129', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('129', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('129', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('133', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('133', 'em', '教育');
INSERT INTO `jc_content_attr` VALUES ('134', 'hy', 'PDF');
INSERT INTO `jc_content_attr` VALUES ('134', 'em', '办公应用');
INSERT INTO `jc_content_attr` VALUES ('135', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('135', 'em', '人文社科');
INSERT INTO `jc_content_attr` VALUES ('136', 'hy', 'PDF');
INSERT INTO `jc_content_attr` VALUES ('136', 'em', '人文社科');
INSERT INTO `jc_content_attr` VALUES ('137', 'hy', 'PPT');
INSERT INTO `jc_content_attr` VALUES ('137', 'em', '科技');
INSERT INTO `jc_content_attr` VALUES ('138', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('138', 'em', '经管营销');
INSERT INTO `jc_content_attr` VALUES ('139', 'hy', 'PDF');
INSERT INTO `jc_content_attr` VALUES ('139', 'em', '教育');
INSERT INTO `jc_content_attr` VALUES ('140', 'education', '专科');
INSERT INTO `jc_content_attr` VALUES ('140', 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES ('140', 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES ('140', 'deadline', '');
INSERT INTO `jc_content_attr` VALUES ('140', 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES ('140', 'salary', '1500-2000');
INSERT INTO `jc_content_attr` VALUES ('140', 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES ('140', 'workplace', '重庆');
INSERT INTO `jc_content_attr` VALUES ('140', 'nums', '1-3人');

-- ----------------------------
-- Table structure for jc_content_buy
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_buy`;
CREATE TABLE `jc_content_buy` (
  `content_buy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `buy_user_id` int(11) DEFAULT NULL COMMENT '购买用户ID',
  `author_user_id` int(11) NOT NULL COMMENT '笔者ID',
  `charge_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '成交金额',
  `author_amount` double(11,4) NOT NULL DEFAULT '0.0000' COMMENT '笔者所得',
  `plat_amount` double(11,4) NOT NULL DEFAULT '0.0000' COMMENT '平台所得',
  `buy_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '成交时间',
  `has_paid_author` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经结算给作者(0未结算 1已经结算)',
  `order_num_weixin` varchar(255) DEFAULT NULL COMMENT '微信支付订单号',
  `order_num_alipay` varchar(100) DEFAULT NULL COMMENT '支付宝订单号',
  `charge_reward` tinyint(1) NOT NULL DEFAULT '1' COMMENT '模式 1收费 2打赏',
  PRIMARY KEY (`content_buy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费文章购买记录';

-- ----------------------------
-- Records of jc_content_buy
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_channel`;
CREATE TABLE `jc_content_channel` (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`content_id`),
  KEY `fk_jc_channel_content` (`content_id`),
  CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容栏目关联表';

-- ----------------------------
-- Records of jc_content_channel
-- ----------------------------
INSERT INTO `jc_content_channel` VALUES ('76', '2');
INSERT INTO `jc_content_channel` VALUES ('76', '7');
INSERT INTO `jc_content_channel` VALUES ('96', '11');
INSERT INTO `jc_content_channel` VALUES ('96', '12');
INSERT INTO `jc_content_channel` VALUES ('76', '13');
INSERT INTO `jc_content_channel` VALUES ('96', '14');
INSERT INTO `jc_content_channel` VALUES ('96', '23');
INSERT INTO `jc_content_channel` VALUES ('96', '27');
INSERT INTO `jc_content_channel` VALUES ('96', '28');
INSERT INTO `jc_content_channel` VALUES ('95', '29');
INSERT INTO `jc_content_channel` VALUES ('95', '30');
INSERT INTO `jc_content_channel` VALUES ('95', '32');
INSERT INTO `jc_content_channel` VALUES ('95', '33');
INSERT INTO `jc_content_channel` VALUES ('95', '36');
INSERT INTO `jc_content_channel` VALUES ('95', '37');
INSERT INTO `jc_content_channel` VALUES ('95', '39');
INSERT INTO `jc_content_channel` VALUES ('79', '43');
INSERT INTO `jc_content_channel` VALUES ('79', '44');
INSERT INTO `jc_content_channel` VALUES ('79', '45');
INSERT INTO `jc_content_channel` VALUES ('79', '46');
INSERT INTO `jc_content_channel` VALUES ('79', '47');
INSERT INTO `jc_content_channel` VALUES ('79', '48');
INSERT INTO `jc_content_channel` VALUES ('79', '49');
INSERT INTO `jc_content_channel` VALUES ('79', '50');
INSERT INTO `jc_content_channel` VALUES ('79', '51');
INSERT INTO `jc_content_channel` VALUES ('77', '53');
INSERT INTO `jc_content_channel` VALUES ('77', '55');
INSERT INTO `jc_content_channel` VALUES ('77', '57');
INSERT INTO `jc_content_channel` VALUES ('77', '59');
INSERT INTO `jc_content_channel` VALUES ('77', '61');
INSERT INTO `jc_content_channel` VALUES ('77', '63');
INSERT INTO `jc_content_channel` VALUES ('81', '67');
INSERT INTO `jc_content_channel` VALUES ('81', '68');
INSERT INTO `jc_content_channel` VALUES ('90', '69');
INSERT INTO `jc_content_channel` VALUES ('91', '71');
INSERT INTO `jc_content_channel` VALUES ('90', '72');
INSERT INTO `jc_content_channel` VALUES ('81', '74');
INSERT INTO `jc_content_channel` VALUES ('93', '100');
INSERT INTO `jc_content_channel` VALUES ('91', '101');
INSERT INTO `jc_content_channel` VALUES ('90', '102');
INSERT INTO `jc_content_channel` VALUES ('90', '103');
INSERT INTO `jc_content_channel` VALUES ('93', '104');
INSERT INTO `jc_content_channel` VALUES ('91', '105');
INSERT INTO `jc_content_channel` VALUES ('91', '106');
INSERT INTO `jc_content_channel` VALUES ('91', '107');
INSERT INTO `jc_content_channel` VALUES ('91', '108');
INSERT INTO `jc_content_channel` VALUES ('91', '109');
INSERT INTO `jc_content_channel` VALUES ('91', '110');
INSERT INTO `jc_content_channel` VALUES ('95', '111');
INSERT INTO `jc_content_channel` VALUES ('95', '112');
INSERT INTO `jc_content_channel` VALUES ('95', '113');
INSERT INTO `jc_content_channel` VALUES ('76', '114');
INSERT INTO `jc_content_channel` VALUES ('76', '115');
INSERT INTO `jc_content_channel` VALUES ('76', '116');
INSERT INTO `jc_content_channel` VALUES ('76', '117');
INSERT INTO `jc_content_channel` VALUES ('76', '118');
INSERT INTO `jc_content_channel` VALUES ('76', '119');
INSERT INTO `jc_content_channel` VALUES ('76', '120');
INSERT INTO `jc_content_channel` VALUES ('77', '121');
INSERT INTO `jc_content_channel` VALUES ('77', '122');
INSERT INTO `jc_content_channel` VALUES ('77', '123');
INSERT INTO `jc_content_channel` VALUES ('77', '124');
INSERT INTO `jc_content_channel` VALUES ('77', '125');
INSERT INTO `jc_content_channel` VALUES ('77', '126');
INSERT INTO `jc_content_channel` VALUES ('77', '127');
INSERT INTO `jc_content_channel` VALUES ('77', '128');
INSERT INTO `jc_content_channel` VALUES ('77', '129');
INSERT INTO `jc_content_channel` VALUES ('95', '130');
INSERT INTO `jc_content_channel` VALUES ('95', '131');
INSERT INTO `jc_content_channel` VALUES ('95', '132');
INSERT INTO `jc_content_channel` VALUES ('81', '133');
INSERT INTO `jc_content_channel` VALUES ('81', '134');
INSERT INTO `jc_content_channel` VALUES ('81', '135');
INSERT INTO `jc_content_channel` VALUES ('81', '136');
INSERT INTO `jc_content_channel` VALUES ('81', '137');
INSERT INTO `jc_content_channel` VALUES ('81', '138');
INSERT INTO `jc_content_channel` VALUES ('81', '139');
INSERT INTO `jc_content_channel` VALUES ('79', '140');
INSERT INTO `jc_content_channel` VALUES ('76', '141');
INSERT INTO `jc_content_channel` VALUES ('95', '143');
INSERT INTO `jc_content_channel` VALUES ('168', '199');
INSERT INTO `jc_content_channel` VALUES ('170', '200');
INSERT INTO `jc_content_channel` VALUES ('183', '203');
INSERT INTO `jc_content_channel` VALUES ('183', '204');
INSERT INTO `jc_content_channel` VALUES ('184', '205');
INSERT INTO `jc_content_channel` VALUES ('184', '206');
INSERT INTO `jc_content_channel` VALUES ('185', '207');
INSERT INTO `jc_content_channel` VALUES ('185', '208');
INSERT INTO `jc_content_channel` VALUES ('186', '209');
INSERT INTO `jc_content_channel` VALUES ('186', '210');
INSERT INTO `jc_content_channel` VALUES ('255', '211');
INSERT INTO `jc_content_channel` VALUES ('256', '212');
INSERT INTO `jc_content_channel` VALUES ('257', '213');
INSERT INTO `jc_content_channel` VALUES ('254', '214');
INSERT INTO `jc_content_channel` VALUES ('258', '215');
INSERT INTO `jc_content_channel` VALUES ('259', '216');

-- ----------------------------
-- Table structure for jc_content_charge
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_charge`;
CREATE TABLE `jc_content_charge` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `charge_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '收费金额',
  `total_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '已累计收费',
  `year_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '年金额',
  `month_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '月金额',
  `day_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '日金额',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '最后购买时间',
  `charge_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '模式，1收费 2打赏',
  `reward_random_min` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '随机 最小值',
  `reward_random_max` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '随机 最大值',
  `reward_pattern` tinyint(1) NOT NULL DEFAULT '0' COMMENT '打赏模式(0随机 1固定)',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费内容配置';

-- ----------------------------
-- Records of jc_content_charge
-- ----------------------------
INSERT INTO `jc_content_charge` VALUES ('130', '0.00', '0.00', '0.00', '0.00', '0.00', null, '1', '0.00', '0.00', '0');
INSERT INTO `jc_content_charge` VALUES ('143', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('199', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('200', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('203', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('204', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('205', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('206', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('207', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('208', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('209', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('210', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('211', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('212', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('213', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('214', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('215', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');
INSERT INTO `jc_content_charge` VALUES ('216', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.00', '10.00', '0');

-- ----------------------------
-- Table structure for jc_content_check
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_check`;
CREATE TABLE `jc_content_check` (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核步数',
  `check_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退回',
  `reviewer` int(11) DEFAULT NULL COMMENT '终审者',
  `check_date` datetime DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_check_user` (`reviewer`),
  CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容审核信息表';

-- ----------------------------
-- Records of jc_content_check
-- ----------------------------
INSERT INTO `jc_content_check` VALUES ('2', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('7', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('11', '-1', null, '0', '1', '2016-09-28 14:17:39');
INSERT INTO `jc_content_check` VALUES ('12', '-1', null, '0', '1', '2016-09-28 14:17:39');
INSERT INTO `jc_content_check` VALUES ('13', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('14', '-1', null, '0', '1', '2016-09-28 14:17:39');
INSERT INTO `jc_content_check` VALUES ('23', '-1', null, '0', '1', '2016-09-28 14:17:39');
INSERT INTO `jc_content_check` VALUES ('27', '-1', null, '0', '1', '2016-09-28 14:17:38');
INSERT INTO `jc_content_check` VALUES ('28', '-1', null, '0', '1', '2016-09-28 14:17:38');
INSERT INTO `jc_content_check` VALUES ('29', '-1', null, '0', '1', '2016-09-28 14:17:38');
INSERT INTO `jc_content_check` VALUES ('30', '-1', null, '0', '1', '2016-09-28 14:17:38');
INSERT INTO `jc_content_check` VALUES ('32', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('33', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('36', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('37', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('39', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('43', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('44', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('45', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('46', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('47', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('48', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('49', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('50', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('51', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('53', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('55', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('57', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('59', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('61', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('63', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('67', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('68', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('69', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('71', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('72', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('74', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('100', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('101', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('102', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('103', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('104', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('105', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('106', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('107', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('108', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('109', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('110', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('111', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('112', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('113', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('114', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('115', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('116', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('117', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('118', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('119', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('120', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('121', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('122', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('123', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('124', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('125', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('126', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('127', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('128', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('129', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('130', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('131', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('132', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('133', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('134', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('135', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('136', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('137', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('138', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('139', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('140', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('141', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('143', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('199', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('200', '4', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('203', '1', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('204', '1', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('205', '1', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('206', '1', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('207', '1', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('208', '1', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('209', '1', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('210', '1', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('211', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('212', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('213', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('214', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('215', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('216', '2', null, '0', null, null);

-- ----------------------------
-- Table structure for jc_content_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_count`;
CREATE TABLE `jc_content_count` (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '总评论数',
  `comments_month` int(11) NOT NULL DEFAULT '0' COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads` int(11) NOT NULL DEFAULT '0' COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL DEFAULT '0' COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups` int(11) NOT NULL DEFAULT '0' COMMENT '总顶数',
  `ups_month` int(11) NOT NULL DEFAULT '0' COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `downs` int(11) NOT NULL DEFAULT '0' COMMENT '总踩数',
  PRIMARY KEY (`content_id`),
  KEY `index_jc_content_count_views_day` (`views_day`),
  KEY `index_jc_content_count_views_week` (`views_week`),
  KEY `index_jc_content_count_views_month` (`views_month`),
  KEY `index_jc_content_count_views` (`views`),
  KEY `index_jc_content_count_comments_day` (`comments_day`),
  KEY `index_jc_content_count_comments_month` (`comments_month`),
  KEY `index_jc_content_count_comments_week` (`comments_week`),
  KEY `index_jc_content_count_comments` (`comments`),
  KEY `index_jc_content_count_downloads_day` (`downloads_day`),
  KEY `index_jc_content_count_downloads_month` (`downloads_month`),
  KEY `index_jc_content_count_downloads_week` (`downloads_week`),
  KEY `index_jc_content_count_downloads` (`downloads`),
  KEY `index_jc_content_count_ups_day` (`ups_day`),
  KEY `index_jc_content_count_ups_week` (`ups_week`),
  KEY `index_jc_content_count_ups_month` (`ups_month`),
  KEY `index_jc_content_count_ups` (`ups`),
  CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容计数表';

-- ----------------------------
-- Records of jc_content_count
-- ----------------------------
INSERT INTO `jc_content_count` VALUES ('2', '23', '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('7', '49', '44', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('11', '21', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('12', '10', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('13', '38', '33', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('14', '62', '48', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '16', '16', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('23', '16', '16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '12', '12', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('27', '9', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('28', '9', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('29', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('30', '72', '72', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '44', '44', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('32', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '1');
INSERT INTO `jc_content_count` VALUES ('33', '55', '55', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18', '18', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('36', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('37', '13', '13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('39', '36', '36', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '17', '17', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('43', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('44', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('45', '22', '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('46', '24', '24', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('47', '16', '16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('48', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('49', '18', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('50', '16', '16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('51', '17', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('53', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('55', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('57', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('59', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('61', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('63', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('67', '28', '28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('68', '52', '52', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('69', '48', '48', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('71', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('72', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('74', '59', '59', '0', '0', '3', '3', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('100', '5', '5', '0', '0', '0', '0', '0', '0', '9', '9', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('101', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('102', '16', '16', '0', '0', '0', '0', '0', '0', '40', '40', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('103', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('104', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('105', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('106', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('107', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('108', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('109', '16', '16', '0', '0', '0', '0', '0', '0', '21', '21', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('110', '4', '4', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('111', '16', '16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '12', '12', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('112', '17', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '16', '16', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('113', '60', '60', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '13', '13', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('114', '21', '21', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('115', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('116', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('117', '28', '28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('118', '8', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('119', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('120', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('121', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('122', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('123', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('124', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('125', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('126', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('127', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('128', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('129', '19', '19', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('130', '57', '57', '0', '0', '9', '9', '0', '0', '0', '0', '0', '0', '12', '12', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('131', '17', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '15', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('132', '19', '19', '0', '0', '3', '3', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('133', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('134', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('135', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('136', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('137', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('138', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('139', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('140', '18', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('141', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('143', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('199', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('200', '17', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('203', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('204', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('205', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('206', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('207', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('208', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('209', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('210', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('211', '38', '38', '38', '38', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('212', '4', '4', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('213', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('214', '3', '3', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('215', '7', '7', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('216', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for jc_content_doc
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_doc`;
CREATE TABLE `jc_content_doc` (
  `content_id` int(11) NOT NULL,
  `doc_path` varchar(255) NOT NULL COMMENT '文档路径',
  `swf_path` varchar(255) DEFAULT NULL COMMENT '转换的swf路径',
  `grain` int(11) NOT NULL DEFAULT '0' COMMENT '财富收益',
  `down_need` int(11) NOT NULL DEFAULT '0' COMMENT '下载需要财富',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开放',
  `file_suffix` varchar(10) NOT NULL COMMENT '文档文件格式',
  `avg_score` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '平均得分',
  `swf_num` int(11) NOT NULL DEFAULT '1' COMMENT 'swf文件总量',
  `pdf_path` varchar(255) DEFAULT '' COMMENT '转换后pdf路径',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文库相关';

-- ----------------------------
-- Records of jc_content_doc
-- ----------------------------
INSERT INTO `jc_content_doc` VALUES ('67', '/wenku/www/201609/26140852umf4.doc', null, '0', '10', '1', 'doc', '0.0', '0', '/wenku/www/201609/26140852umf4.pdf');
INSERT INTO `jc_content_doc` VALUES ('68', '/wenku/www/201609/26143427z84z.docx', null, '0', '1', '1', 'docx', '0.0', '0', '/wenku/www/201609/26143427z84z.pdf');
INSERT INTO `jc_content_doc` VALUES ('74', '/wenku/www/201609/30111538pwok.ppt', null, '5', '5', '1', 'ppt', '2.7', '0', '/wenku/www/201609/30111538pwok.pdf');
INSERT INTO `jc_content_doc` VALUES ('133', '/wenku/www/201610/10140727x1oa.docx', null, '0', '10', '1', 'docx', '0.0', '0', '/wenku/www/201610/10140727x1oa.pdf');
INSERT INTO `jc_content_doc` VALUES ('134', '/wenku/www/201610/10141136uie3.pdf', null, '0', '5', '1', 'pdf', '0.0', '0', '/wenku/www/201610/10141136uie3.pdf');
INSERT INTO `jc_content_doc` VALUES ('135', '/wenku/www/201610/10141333ijbu.docx', null, '0', '30', '1', 'docx', '0.0', '0', '/wenku/www/201610/10141333ijbu.pdf');
INSERT INTO `jc_content_doc` VALUES ('136', '/wenku/www/201610/101414578yc2.pdf', null, '0', '10', '1', 'pdf', '0.0', '0', '/wenku/www/201610/101414578yc2.pdf');
INSERT INTO `jc_content_doc` VALUES ('137', '/wenku/www/201610/101415310pgl.ppt', null, '0', '3', '1', 'ppt', '0.0', '0', '/wenku/www/201610/101415310pgl.pdf');
INSERT INTO `jc_content_doc` VALUES ('138', '/wenku/www/201610/10141954qukj.docx', null, '0', '10', '1', 'docx', '0.0', '0', '/wenku/www/201610/10141954qukj.pdf');
INSERT INTO `jc_content_doc` VALUES ('139', '/wenku/www/201610/10142429v5ra.pdf', null, '0', '10', '1', 'pdf', '0.0', '0', '/wenku/www/201610/10142429v5ra.pdf');

-- ----------------------------
-- Table structure for jc_content_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_ext`;
CREATE TABLE `jc_content_ext` (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '标题',
  `short_title` varchar(150) DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加粗',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '需要重新生成静态页',
  `tpl_mobile_content` varchar(100) DEFAULT NULL COMMENT '手机内容页模板',
  `toplevel_date` datetime DEFAULT NULL COMMENT '固顶到期日期',
  `pigeonhole_date` datetime DEFAULT NULL COMMENT '归档日期',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展表';

-- ----------------------------
-- Records of jc_content_ext
-- ----------------------------
INSERT INTO `jc_content_ext` VALUES ('2', '法国尼斯发生汽车冲撞事故 已致75人死上百人伤', null, null, null, null, null, '2016-07-15 14:47:24', null, null, null, '0', null, null, '/u/cms/www/201607/15154249ucra.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('7', '震撼的视角！2016年度无人机摄影大赛佳作大赏', null, null, null, null, null, '2016-07-15 15:33:26', null, null, null, '0', null, null, '/u/cms/www/201607/151530033koq.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('11', '全国28省遭灾 已投入抗洪抢险777万人次', '全国28省遭灾 已投入抗洪抢险777万人次', null, null, null, '据初步统计，截至7月13日，长江中下游湖北、湖南、江西、安徽、江苏等5省堤防巡查防守和抢险共投入62.2万人(含部队3.08万人)，6月30日以来已累计投入抗洪抢险777万人次。', '2016-07-15 16:23:32', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('12', '习近平就法国尼斯恐袭事件向法总统致慰问电', null, null, null, null, '当地时间2016年7月14日，法国国庆日，据法国媒体报道，法国尼斯一辆货车突然冲击人群发动恐怖袭击，据最新消息称，有84人丧生，目前事故原因仍在进一步调查之中。', '2016-07-15 17:22:47', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('13', '中国空军航空兵赴南海常态化战斗巡航', null, null, null, null, null, '2016-07-19 14:12:48', null, null, null, '0', null, null, '/u/cms/www/201607/19141129f6g4.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('14', '习近平宁夏考察第一天：长征永远在路上', null, null, null, null, '习近平考察宁夏首站到固原，冒雨向红军长征会师纪念碑敬献花篮。', '2016-07-19 14:26:30', null, null, null, '0', null, null, '/u/cms/www/201607/19142033fu5h.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('23', '“十一”黄金周凯里地区文化旅游活动精彩纷呈', null, null, '黔东南新闻网', 'http://qdnrbs.cn/htmls/shzh/20160913/137451.html', null, '2016-09-13 17:16:04', null, 'CK', null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('27', '“一带一路”：习近平打开的“筑梦空间”', null, null, null, null, '【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”', '2016-09-22 16:30:13', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23150119m7z0.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('28', '加拿大同意与中国协商引渡条约 转变抵制态度', null, null, null, null, '该项目声明，“中国专家将被邀请协助核查不被允许从中国内地来加拿大的人员的身份，”以便将他们遣返回国。', '2016-09-22 16:56:46', null, 'CK', null, '0', null, null, '/u/cms/www/201609/22165418ezkw.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('29', '深圳二手房卖主悔约不服判决 纠集60余人冲击法院', null, null, null, null, '新华社深圳9月22日专电（记者孙飞）记者22日从深圳市公安局福田分局获悉，深圳数名二手房卖主，因房价上涨不愿履行协议与买家发生纠纷，并对深圳市中院相关判决不满，聚集60余人前往深圳市中院闹访。', '2016-09-23 09:07:33', null, 'CK', null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('30', '不实名手机号停机在即 移动：不对任何社会渠道授权网络售卡', null, null, null, null, '中新网北京9月23日电 (吴涛)中新网从三大运营商处获悉，此前传北京地区未实名手机用户10月15日将被停机，实际是分批执行，10月15日开始，最晚至10月31日截止。', '2016-09-23 09:09:41', null, 'CK', null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('32', '台北故宫将拆除成龙所捐12兽首复制品 成龙回应', null, null, null, null, '成龙捐给台北故宫(微博)南院的12生肖兽首，面临斩首命运。', '2016-09-23 09:19:38', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23091850z61y.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('33', '亚马逊股价首破800美元大关 市值稳居全球上市公司第四', null, null, null, null, '亚马逊的股价在纽约当地时间周四上午首次突破每股800美元大关。亚马逊以3860亿美元的市值稳居全球上市公司第四的位置，仅次于苹果、谷歌(微博)母公司Alphabet和微软', '2016-09-23 09:23:39', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23092240hxg8.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('36', '海银系接盘匹凸匹谜局待解：P2P业务惨淡收场 多次被调查', null, null, null, null, '9月20日，匹凸匹投资者索赔案开庭，有十多位投资者向匹凸匹发起索赔。今年3月，匹凸匹公告，因未及时披露多项对外重大担保、重大诉讼事项及2013年年报中未披露对外重大事项，证监会对匹凸匹处40万元罚款，对鲜言处30万元罚款。前述投资者认为因虚假陈述行为而受到损失。', '2016-09-23 09:40:21', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23093922giys.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('37', '苹果研发神秘新设备：体积类似Apple TV 支持NFC蓝牙', null, null, null, null, '近日，美国联邦通信委员会意外曝光了苹果正在研发的一款新设备，其体积类似于苹果机顶盒（Apple TV），具体的用途尚不得而知。', '2016-09-23 09:43:34', null, 'CK', null, '0', null, null, '/u/cms/www/201609/230942139uh5.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('39', '四川理塘县发生4.9级地震 震源深度19千米', null, null, null, null, '中国地震台网正式测定：09月23日00时47分在四川甘孜州理塘县（北纬30.09度，东经99.64度）发生4.9级地震，震源深度19千米。', '2016-09-23 09:54:17', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23095358y6s6.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('43', 'web前端开发人员', null, null, null, null, null, '2016-09-26 09:33:15', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('44', 'asp.net开发工程师', null, null, null, null, null, '2016-09-26 09:34:35', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('45', '文案编辑', null, null, null, null, null, '2016-09-26 09:38:39', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('46', '项目经理', null, null, null, null, null, '2016-09-26 09:45:02', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('47', '3k计算机实习生双休', null, null, null, null, null, '2016-09-26 09:47:54', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('48', '急聘Android开发', null, null, null, null, null, '2016-09-26 09:50:04', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('49', 'IT公司招软件工程师助理', null, null, null, null, null, '2016-09-26 09:51:13', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('50', '聘网页前端设计3K双休', null, null, null, null, null, '2016-09-26 09:54:56', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('51', '诚聘微信推广专员', null, null, null, null, null, '2016-09-26 09:56:01', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('53', '北京天安门广场“祝福祖国”大花篮吊装完毕', null, null, null, null, null, '2016-09-26 10:19:13', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26101908i5ds.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('55', '墨西哥一油轮失火', null, null, null, null, null, '2016-09-26 10:20:11', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26102008qcao.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('57', '本网记者体验360行之【183】另类“复制”', null, null, null, null, null, '2016-09-26 10:21:19', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26102115joze.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('59', '旅比大熊猫宝宝取名“天宝”', null, null, null, null, null, '2016-09-26 10:22:24', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/261022192w54.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('61', '莫斯科举办国际灯光节', null, null, null, null, null, '2016-09-26 10:29:06', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26102904f2l8.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('63', '宇航员拍摄地球夜景：灯火辉煌灿烂 海水平滑如镜', null, null, null, null, null, '2016-09-26 10:30:05', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26103003hrib.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('67', '2014全行业运营数据分析报告', null, null, null, null, '洞察运营数据360行，行行有研究！', '2016-09-26 14:08:56', null, null, null, '0', null, null, '/u/cms/www/201609/301143025tdb.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('68', '乌镇自助游经典攻略', null, null, null, null, '乌镇是典型的中国江南地区水乡古镇，有“鱼米之乡，丝绸之府”之称，是“江南六大古镇”之一。', '2016-09-26 14:34:34', null, null, null, '0', null, null, '/u/cms/www/201609/30114226529k.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('69', '腾讯QQ', null, null, null, null, null, '2016-09-26 16:37:28', null, null, null, '0', '/u/cms/www/201609/26164039i3uv.jpg', '/u/cms/www/201609/261640457r2n.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('71', '百度云管家', null, null, null, null, '百度公司推出的一款云服务产品。支持便捷地查看、上传、下载百度云端各类数据。通过百度云管家存入的文件，不会占用本地空间。上传、下载文件过程更稳定。', '2016-09-27 09:47:27', null, null, null, '0', '/u/cms/www/201609/27095816s3y8.jpg', '/u/cms/www/201609/270958122ljv.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('72', '360杀毒 5.0.0.7092 官方正式版', '360杀毒', null, null, null, '专业防护，专心为您。\r\n增强敲诈者病毒查杀，最新木马一网打尽;\r\n优化白名单机制，减少打扰;\r\n完善文件实时防护用户体验。', '2016-09-27 10:18:46', null, null, null, '0', '/u/cms/www/201609/27101524dxj7.jpg', '/u/cms/www/201609/27101514u0i9.jpg', '/u/cms/www/201609/27101510bh0o.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('74', '2013年国家公务员考试备战资料', null, null, null, null, '文库联合中公教育为您准备了2013年国家公务员考试文档。包括备考总攻略、行测-言语理解、行测-数量关系、行测-判断推理、行测-资料分析、行测-常识判断、申论-归纳概括、申论-分析原因、申论-提出对策、申论-文章写作、历年真题、模拟试题。祝您考试顺利。', '2016-09-29 09:28:56', null, null, null, '0', null, null, '/u/cms/www/201609/29093250bbit.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('100', '诺亚传说', '诺亚传说', null, null, null, '《诺亚传说》是尚游游戏自主研发的大型角色扮演网游，新资料片《诺亚传说前传-亚特兰蒂斯》火爆发布。', '2016-10-10 11:09:06', null, null, null, '0', '/u/cms/www/201610/10110634gxcz.jpg', '/u/cms/www/201610/10110628vfwz.jpg', '/u/cms/www/201610/10110654vib6.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('101', '迅雷9', null, null, null, null, '迅雷9是“深圳市迅雷网络技术有限公司”于2016年推出的“迅雷”系列下载软件的最新换代产品。迅雷9采用全新下载引擎，对百兆光纤宽带网络环境进行诸多针对性的优化，让用户获得更卓越的下载体验；全新的界面功能布局，承载了更丰富的内容，打造找、下、用的一站式娱乐消费平台。', '2016-10-10 11:16:31', null, null, null, '0', '/u/cms/www/201610/10111618rhdk.jpg', '/u/cms/www/201610/10111549rupn.jpg', '/u/cms/www/201610/101116034e14.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('102', '360安全卫士', null, null, null, null, null, '2016-10-10 11:19:18', null, null, null, '0', '/u/cms/www/201610/101119092w8r.jpg', '/u/cms/www/201610/101119026ukx.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('103', '搜狗输入法', null, null, null, null, null, '2016-10-10 11:21:37', null, null, null, '0', '/u/cms/www/201610/101120330mpz.jpg', '/u/cms/www/201610/10112023kqfp.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('104', 'YY语音', null, null, null, null, null, '2016-10-10 11:27:17', null, null, null, '0', '/u/cms/www/201610/10112706jiii.jpg', '/u/cms/www/201610/10112657zklb.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('105', '阿里旺旺', null, null, null, null, null, '2016-10-10 11:28:52', null, null, null, '0', '/u/cms/www/201610/10112845wryq.jpg', '/u/cms/www/201610/10112839cvwx.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('106', '爱奇艺视频', null, null, null, null, null, '2016-10-10 11:30:54', null, null, null, '0', '/u/cms/www/201610/101130399dbt.jpg', '/u/cms/www/201610/10113032zu0k.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('107', '谷歌浏览器', null, null, null, null, null, '2016-10-10 11:32:35', null, null, null, '0', '/u/cms/www/201610/10113226knhj.jpg', '/u/cms/www/201610/10113218ya2p.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('108', '360浏览器', null, null, null, null, null, '2016-10-10 11:34:05', null, null, null, '0', '/u/cms/www/201610/10113400utfn.jpg', '/u/cms/www/201610/10113354g71e.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('109', 'PPTV聚力', null, null, null, null, null, '2016-10-10 11:35:26', null, null, null, '0', '/u/cms/www/201610/1011351336l0.jpg', '/u/cms/www/201610/10113506jz07.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('110', '腾讯视频', null, null, null, null, null, '2016-10-10 11:36:32', null, null, null, '0', '/u/cms/www/201610/101135560ne4.jpg', '/u/cms/www/201610/10113551yru8.jpg', null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('111', '专访百度科学家徐伟：百度比谷歌的人工智能平台更易上手', null, null, null, null, '“开发者在使用时，学习成本较低，这是我们平台易用性的体现。”负责搭建百度深度学习平台PaddlePaddle的百度美国研究院科学家徐伟22日在接受腾讯科技专访时表示。', '2016-10-10 11:45:47', null, 'CK', null, '0', null, null, '/u/cms/www/201610/10114452yjhh.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('112', '电信诈骗多发产生“蝴蝶效应”虚拟运营商融资受波及', null, null, null, null, '自2013年12月首批企业获牌以来，虚拟运营商发展迅速，目前已有42家企业获得牌照。9月22日，在“ICT中国· 2016高层论坛”移动转售分论坛上，中国通信企业协会披露，目前移动转售业务用户数已超3500万，占全国移动用户人数2.67%。', '2016-10-10 11:48:08', null, 'CK', null, '0', null, null, '/u/cms/www/201610/10114704dsba.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('113', '李克强联合国承诺援助难民：这是责任和道义的担当', null, null, null, null, '李克强总理首赴联合国，首场活动便是出席由联合国倡议举行的联大解决难移民大规模流动问题高级别会议。', '2016-10-10 11:50:03', null, 'CK', null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('114', '科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现', null, null, null, null, null, '2016-10-10 13:11:12', null, null, null, '0', null, null, '/u/cms/www/201610/101308178wzr.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('115', '四川石渠发现至少30万公顷珍贵泥炭湿地资源', null, null, null, null, null, '2016-10-10 13:15:37', null, null, null, '0', null, null, '/u/cms/www/201610/101314450fs1.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('116', '全世界最孤独的咖啡馆：海拔4860米 达古冰川之巅', null, null, null, null, null, '2016-10-10 13:19:22', null, null, null, '0', null, null, '/u/cms/www/201610/10131742wzhv.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('117', '中俄“合作－2016”联合反恐训练圆满结束', null, null, null, null, null, '2016-10-10 13:22:07', null, null, null, '0', null, null, '/u/cms/www/201610/101320442qbi.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('118', '探访燕城监狱：蔬菜自己种 午餐两菜一汤', null, null, null, null, null, '2016-10-10 13:23:50', null, null, null, '0', null, null, '/u/cms/www/201610/10132253w0rj.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('119', '摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕', null, null, null, null, null, '2016-10-10 13:26:38', null, null, null, '0', null, null, '/u/cms/www/201610/101326014zdc.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('120', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空', null, null, null, null, null, '2016-10-10 13:35:17', null, null, null, '0', null, null, '/u/cms/www/201610/10133449hwwr.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('121', '《半妖倾城》爱与恨，追与逃，人与妖再一次掀起一段的惊人的倾城传奇', null, null, null, null, '清末，八国联军攻入北京，聂如风带着妻子应蝶和二个女儿躲避追杀，应蝶策马将如风和女儿赶走，独自迎敌，应蝶突然长出雪白的翅膀飞了起来——原来她竟然是妖.', '2016-10-10 13:38:11', '/jeecmsv9/u/cms/www/201712/192014474957.mp4', 'CK', null, '0', '/u/cms/www/201610/10133842aiyf.png', null, '/u/cms/www/201610/10133710to3f.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('122', '《那年青春我们正好》刘诗诗、种丹妮演绎闺蜜', null, null, null, null, '《那年青春我们正好》在浙江卫视、东方卫视热播。种丹妮饰演的韩露“花痴”肖小军（郑恺），与闺蜜刘婷（刘诗诗）同爱一人而“掰面”。', '2016-10-10 13:40:05', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', '/u/cms/www/201610/101340004te2.png', null, '/u/cms/www/201610/10133954jfoc.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('123', '《奔跑吧兄弟》收官对决一触即发 邓超被岳云鹏压垮惨叫', null, null, null, null, '跑男搭档助阵勇士,力争宇宙最强者称号,究竟“跑男团们都有着怎样神奇的能力？最终谁又将在“助力勇士”的帮助下赢得本季“宇宙最强者”的称号呢？', '2016-10-10 13:41:03', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', '/u/cms/www/201610/101340393eav.png', null, '/u/cms/www/201610/10134048htcl.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('124', '李克强出席加拿大总理家宴 小小特鲁多表演后空翻', null, null, null, null, null, '2016-10-10 13:42:48', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/10134238qppo.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('125', '习主席和中央军委领导推进军队战斗力建设纪实', null, null, null, null, null, '2016-10-10 13:44:47', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/10134440wmng.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('126', '西北第一村白哈巴的早秋', null, null, null, null, null, '2016-10-10 13:46:01', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/101345564pok.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('127', '美国金秋不止红叶', null, null, null, null, null, '2016-10-10 13:46:26', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/101346227ayf.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('128', '德国举行南瓜称重比赛 763公斤南瓜获得加冕', null, null, null, null, null, '2016-10-10 13:46:52', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/101346473kic.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('129', '北京特战队员魔鬼周训练 挑战50项最严苛极限项目', null, null, null, null, null, '2016-10-10 13:47:24', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/10134720z8a5.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('130', '党中央推进民族工作创新发展纪实', null, null, null, null, '奏响新形势下民族工作新乐章（治国理政新思想新实践）党的十八大以来以习近平同志为总书记的党中央推进民族工作创新发展纪实。', '2016-10-10 13:51:07', null, 'CK', null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('131', '楼市调控应跳出周期性怪圈', null, null, null, null, '每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。', '2016-10-10 13:54:05', null, 'CK', null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('132', '黄金接连下跌难道又等大妈来托盘', null, null, null, null, '三年前，中国大妈们抢购黄金的记忆还历历在目，没想到如今的黄金又开始了一轮又一轮的下跌。', '2016-10-10 13:55:46', null, 'CK', null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('133', '2016高考状元笔记', null, null, null, null, '分科分章巧复习，内含状元做题方法总结', '2016-10-10 14:08:28', null, null, null, '0', null, null, '/u/cms/www/201610/1014082583ov.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('134', '2015年1季度国民经济开局平稳', null, null, null, null, '初步核算，一季度国内生产总值140667亿元，按可比价格计算，同比增长7.0%。分产业看，第一产业增加值7770亿元，同比增长3.2%；第二产业增加值60292亿元，增长6.4%；第三产业增加值72605亿元，增长7.9%。从环比看，一季度国内生产总值增长1.3%。', '2016-10-10 14:11:44', null, null, null, '0', null, null, '/u/cms/www/201610/10141115d2dm.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('135', '中国法院信息化第三方评估报告', null, null, null, null, '首部法院信息化第三方评估报告发布  全国法院向“智慧法院”升级', '2016-10-10 14:13:55', null, null, null, '0', null, null, '/u/cms/www/201610/10141350dw2t.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('136', '《习近平的国家治理现代化思想》出版', null, null, null, null, '“过去100年世界范围内，放任自由主义、激进社会主义、极端保守主义三大意识形态的经验教训显示，中国的国家治理必须秉承“混合至上”原则，走中国特色的国家治理道路”，中国人民大学政治学教授、比较政治研究所所长，《比较政治评论》主编，《习近平的国家治理现代化思想》一书作者杨光斌在座谈会上表示。', '2016-10-10 14:14:59', null, null, null, '0', null, null, '/u/cms/www/201610/10141429q19h.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('137', '宇宙系统的神秘设计', null, null, null, null, '电影《火星救援》的上映，《科学》杂志匪夷所思的新发现“黑洞吃太阳”，大大掀起一股宇宙热潮。如果再不补充知识，以后恐怕连科幻片都看不懂了。', '2016-10-10 14:17:16', null, null, null, '0', null, null, '/u/cms/www/201610/101415435gn1.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('138', '2015各地区毕业生薪酬报告', null, null, null, null, '各地区、学历毕业生薪酬独家曝光！', '2016-10-10 14:19:56', null, null, null, '0', null, null, '/u/cms/www/201610/10141936fd0q.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('139', 'QRcode国际标准', null, null, null, null, 'QRcode国际标准', '2016-10-10 14:24:49', null, null, null, '0', null, null, '/u/cms/www/201610/10142436t9pe.jpg', null, null, '0', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('140', '安卓游戏开发5险1金', null, null, null, null, null, '2016-10-10 14:27:44', null, null, null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('141', '乌兰布统牧歌秋韵', null, null, null, null, null, '2016-10-11 09:44:23', null, null, null, '0', null, null, '/u/cms/www/201610/11093237z5e8.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('143', '中国共产党纪律处分条例', null, null, null, null, null, '2017-04-12 09:09:57', null, 'CK', null, '0', null, null, null, null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('199', 'ttt', null, null, null, null, 'ttt', '2018-04-14 17:36:50', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/www/default/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('200', '啥啥啥', '打豆豆', null, null, null, '顶顶顶顶', '2018-04-19 22:56:23', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/main/main/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('203', '神秘的纪委监委如何工作案例', '实施B方案', null, null, null, '开放日上，东城区纪委副书记、区监委副主任李婧当起了“讲解员”，为大家现场答疑解惑。李婧介绍，2017年，干部群众对党风廉政建设的满意度大幅提升。东城区监委成立以后，按照监察范围已经实现对东城所有行使公权力的公职人员监察全覆盖；依法履行监督、调查、处置职责，全面审慎使用12项调查措施。一年来，追回在逃人员6人，顺利实施留置案件6件，全年问责27人。', '2018-04-21 09:07:27', null, 'CK', null, '0', '/u/cms/gczx/201804/21113829s2m9.png', null, null, null, '/WEB-INF/t/cms/gczx/gczx/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('204', '朝鲜宣布今日起停止核试验和导弹试射', '实施方案', null, null, null, '据朝中社21日报道，朝鲜最高领导人金正恩在20日举行的劳动党中央委员会第七届第三次全体会议上宣布，朝鲜将从21日开始，不再进行任何核试验和洲际弹道导弹发射，废弃朝鲜北部核试验场。只要朝鲜不受核威胁挑衅，朝鲜绝对不使用核武器，不泄露核武器和核技术。', '2018-04-21 09:08:26', null, 'CK', null, '0', '/u/cms/gczx/201804/21113819kbl6.png', null, null, null, '/WEB-INF/t/cms/gczx/gczx/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('205', '产品介绍', '产品介绍', null, null, null, '产品介绍', '2018-04-21 09:51:29', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/gczx/gczx/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('206', '产品价值', null, null, null, null, '产品价值', '2018-04-21 09:53:12', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/gczx/gczx/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('207', '产品介绍', null, null, null, null, '产品介绍', '2018-04-21 09:53:54', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/gczx/gczx/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('208', '产品价值', null, null, null, null, '产品价值', '2018-04-21 09:54:21', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/gczx/gczx/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('209', '产品介绍', null, null, null, null, '产品介绍', '2018-04-21 09:54:49', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/gczx/gczx/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('210', '产品价值', null, null, null, null, '产品价值', '2018-04-21 09:55:16', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/gczx/gczx/content/news.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('211', '专家A', null, null, null, null, null, '2018-06-09 15:09:56', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/zckj/zckj/content/zj.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('212', '石墨烯经济高效分散技术及其高性能防腐涂料', null, null, null, null, '本技术方案通过自主设计合成特色分散剂，实现石墨烯的经济高效分散。同时，拥有一整套完整自主...', '2018-06-11 20:39:58', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/zckj/zckj/content/news_js.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('213', '石墨烯复合电极材料及超级电容器集成应用关键技术', null, null, null, null, '本技术制备的三维石墨烯复合电极材料具有比容量高、能量密度大、循环稳定性好等特点；且三维石...', '2018-06-11 20:40:38', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/zckj/zckj/content/news_js.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('214', '中国科学院宁波材料所', '中国科学院宁波材料所', null, null, null, '中国科学院宁波材料所', '2018-06-11 22:12:39', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/zckj/zckj/content/news_hzjg.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('215', '吴晓波：企业如何转型？看完这三个故事就懂了', null, null, null, null, '导言：这个世界上真的没有所谓的夕阳产业，有的只是夕阳的人。吴晓波...', '2018-06-11 22:31:00', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/zckj/zckj/content/news_zx.html', '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('216', '上海市大学生科技创业基金“雄鹰计划”', null, null, null, null, '上海市大学生科技创业基金“雄鹰计划”', '2018-06-11 22:39:05', null, 'CK', null, '0', null, null, null, null, '/WEB-INF/t/cms/zckj/zckj/content/news_zc.html', '1', '', null, null);

-- ----------------------------
-- Table structure for jc_content_group_view
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_group_view`;
CREATE TABLE `jc_content_group_view` (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`group_id`),
  KEY `fk_jc_content_group_v` (`group_id`),
  CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容浏览会员组关联表';

-- ----------------------------
-- Records of jc_content_group_view
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content_picture
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_picture`;
CREATE TABLE `jc_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) NOT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`content_id`,`priority`),
  CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容图片表';

-- ----------------------------
-- Records of jc_content_picture
-- ----------------------------
INSERT INTO `jc_content_picture` VALUES ('2', '0', '/u/cms/www/201607/15154302mvu4.jpg', '当地时间2016年7月5日报道，美国宇航局“朱诺”号探测器成功进入环绕木星轨道，将展开探寻木星起源的任务。');
INSERT INTO `jc_content_picture` VALUES ('2', '1', '/u/cms/www/201607/15154338b6h9.jpg', '据悉，“朱诺”号将环绕木星运行20个月，收集有关该行星核心的数据，描绘其磁场，并测量大气中水和氨的含量。');
INSERT INTO `jc_content_picture` VALUES ('2', '2', '/u/cms/www/201607/15154354xp50.jpg', '另外，“朱诺”号还会观察木星表面著名的大红斑，一个持续了数百年的风暴，从而揭示其深层的秘密。');
INSERT INTO `jc_content_picture` VALUES ('2', '3', '/u/cms/www/201607/15154421y33m.jpg', '美国“朱诺”号探测器成功进入环绕木星轨道');
INSERT INTO `jc_content_picture` VALUES ('7', '0', '/u/cms/www/201607/15153012bpfd.jpg', '旅行类冠军：浓雾中的意大利阿西西圣弗兰西斯大教堂。摄影：Francesco Cattuto');
INSERT INTO `jc_content_picture` VALUES ('7', '1', '/u/cms/www/201607/15153034m1rr.jpg', '旅行类亚军：澳大利亚凯布尔海滩上的一队骆驼。摄影：Todd Kennedy');
INSERT INTO `jc_content_picture` VALUES ('7', '2', '/u/cms/www/201607/15153052j190.jpg', '旅行类季军：大加纳利岛上色彩斑斓的Playa de Amadores海滩。 摄影：Karolis Janulis');
INSERT INTO `jc_content_picture` VALUES ('7', '3', '/u/cms/www/201607/15153110yn2c.jpg', '自然与野生动物类冠军：丹麦Kalbyris森林。摄影：Michael Bernholdt');
INSERT INTO `jc_content_picture` VALUES ('7', '4', '/u/cms/www/201607/15153127qs41.jpg', '自然与野生动物类亚军：罗马尼亚Marpod公路旁的一大群羊。摄影：Szabolcs Ignacz');
INSERT INTO `jc_content_picture` VALUES ('7', '5', '/u/cms/www/201607/15153212rjvo.jpg', '自然与野生动物类季军：留尼旺岛富尔奈斯活火山喷发的壮观景象。摄影：Jonathan Payet');
INSERT INTO `jc_content_picture` VALUES ('7', '6', '/u/cms/www/201607/1515325323eh.jpg', '体育冒险类冠军：攀登者在美国犹他州莫泊峡谷120米处攀爬。摄影：Max Seigal');
INSERT INTO `jc_content_picture` VALUES ('7', '7', '/u/cms/www/201607/15153307441e.jpg', '体育冒险类亚军：在哥伦比亚库库塔举行的游泳比赛。摄影：Juan Pablo Bayona');
INSERT INTO `jc_content_picture` VALUES ('7', '8', '/u/cms/www/201607/15153321t1g3.jpg', '体育冒险类季军：在美国阿拉斯加州科尔多瓦沙滩上玩滑板。摄影：Tj Balon');
INSERT INTO `jc_content_picture` VALUES ('13', '0', '/u/cms/www/201607/19141216070j.jpg', '7月18日，中国空军新闻发言人申进科大校在北京宣布：中国空军近日组织了航空兵赴南海战斗巡航。这次南海战巡，空军出动轰-6K飞机赴黄岩岛等岛礁附近空域进行了巡航。');
INSERT INTO `jc_content_picture` VALUES ('13', '1', '/u/cms/www/201607/19141242pppk.jpg', '申进科介绍，中国空军航空兵此次赴南海例行性战斗巡航，紧贴使命任务和实战准备，轰-6K和歼击机、侦察机、空中加油机等遂行战巡任务，以空中侦察、对抗空战和岛礁巡航为主要样式组织行动，达成了战斗巡航目的。\r\n申进科表示：“根据有效履行空军使命任务的需要，空军航空兵赴南海战斗巡航，将继续常态化进行。”');
INSERT INTO `jc_content_picture` VALUES ('114', '0', '/u/cms/www/201610/101310383u27.jpg', '科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现');
INSERT INTO `jc_content_picture` VALUES ('114', '1', '/u/cms/www/201610/101311003aey.jpg', '科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现');
INSERT INTO `jc_content_picture` VALUES ('114', '2', '/u/cms/www/201610/101311098e8w.jpg', '科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现');
INSERT INTO `jc_content_picture` VALUES ('115', '0', '/u/cms/www/201610/10131516fhw7.jpg', '四川石渠发现至少30万公顷珍贵泥炭湿地资源');
INSERT INTO `jc_content_picture` VALUES ('115', '1', '/u/cms/www/201610/101315235s7b.jpg', '四川石渠发现至少30万公顷珍贵泥炭湿地资源');
INSERT INTO `jc_content_picture` VALUES ('115', '2', '/u/cms/www/201610/101315314qdt.jpg', '四川石渠发现至少30万公顷珍贵泥炭湿地资源');
INSERT INTO `jc_content_picture` VALUES ('116', '0', '/u/cms/www/201610/10131759kpti.jpg', '/u/cms/www/201610/10131742wzhv.jpg');
INSERT INTO `jc_content_picture` VALUES ('116', '1', '/u/cms/www/201610/10131811udfh.jpg', '/u/cms/www/201610/10131742wzhv.jpg');
INSERT INTO `jc_content_picture` VALUES ('117', '0', '/u/cms/www/201610/1013205987uh.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('117', '1', '/u/cms/www/201610/10132108kvcd.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('117', '2', '/u/cms/www/201610/10132117q0se.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('117', '3', '/u/cms/www/201610/10132128e9mz.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('117', '4', '/u/cms/www/201610/101321427ybi.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('118', '0', '/u/cms/www/201610/10132256evzu.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '1', '/u/cms/www/201610/10132301wue2.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '2', '/u/cms/www/201610/101323052xt2.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '3', '/u/cms/www/201610/10132310d08y.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '4', '/u/cms/www/201610/10132315avlw.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '5', '/u/cms/www/201610/10132322exj1.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '6', '/u/cms/www/201610/10132327lk40.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '7', '/u/cms/www/201610/10132336658k.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '8', '/u/cms/www/201610/10132342mxeq.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '9', '/u/cms/www/201610/10132347qr6a.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('119', '0', '/u/cms/www/201610/101326217xkx.jpg', '摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_content_picture` VALUES ('119', '1', '/u/cms/www/201610/10132629r00n.jpg', '摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_content_picture` VALUES ('119', '2', '/u/cms/www/201610/10132635f63e.jpg', '摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_content_picture` VALUES ('120', '0', '/u/cms/www/201610/10133454sydj.jpg', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空');
INSERT INTO `jc_content_picture` VALUES ('120', '1', '/u/cms/www/201610/10133506taqx.jpg', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空');
INSERT INTO `jc_content_picture` VALUES ('120', '2', '/u/cms/www/201610/10133511s7r1.jpg', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空');
INSERT INTO `jc_content_picture` VALUES ('120', '3', '/u/cms/www/201610/101335147ye6.jpg', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空');
INSERT INTO `jc_content_picture` VALUES ('141', '0', '/u/cms/www/201610/11094215kqsv.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '1', '/u/cms/www/201610/11094229szn0.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '2', '/u/cms/www/201610/11094234lj78.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '3', '/u/cms/www/201610/11094239ard1.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '4', '/u/cms/www/201610/11094243v534.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '5', '/u/cms/www/201610/11094246016h.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '6', '/u/cms/www/201610/11094250fq4t.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '7', '/u/cms/www/201610/11094254usxs.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '8', '/u/cms/www/201610/11094257nm5d.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '9', '/u/cms/www/201610/11094309iwnb.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '10', '/u/cms/www/201610/11094419duy6.jpg', '乌兰布统牧歌秋韵');

-- ----------------------------
-- Table structure for jc_content_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_record`;
CREATE TABLE `jc_content_record` (
  `content_record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  `operate_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 新增 1修改 2审核 3退回 4移动 5生成静态页 6删除到回收站 7归档 8出档 9推送共享',
  PRIMARY KEY (`content_record_id`),
  KEY `fk_index_jc_content_record_content` (`content_id`),
  KEY `fk_index_jc_content_record_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8 COMMENT='文章操作记录';

-- ----------------------------
-- Records of jc_content_record
-- ----------------------------
INSERT INTO `jc_content_record` VALUES ('2', '143', '1', '2017-04-12 09:09:57', '0');
INSERT INTO `jc_content_record` VALUES ('17', '136', '1', '2017-05-31 14:23:14', '1');
INSERT INTO `jc_content_record` VALUES ('18', '136', '1', '2017-05-31 14:23:21', '1');
INSERT INTO `jc_content_record` VALUES ('19', '136', '1', '2017-05-31 14:33:21', '1');
INSERT INTO `jc_content_record` VALUES ('20', '136', '1', '2017-05-31 14:33:30', '1');
INSERT INTO `jc_content_record` VALUES ('21', '136', '1', '2017-05-31 14:35:35', '1');
INSERT INTO `jc_content_record` VALUES ('22', '136', '1', '2017-05-31 14:54:45', '1');
INSERT INTO `jc_content_record` VALUES ('23', '136', '1', '2017-05-31 14:57:11', '1');
INSERT INTO `jc_content_record` VALUES ('24', '136', '1', '2017-05-31 15:00:26', '1');
INSERT INTO `jc_content_record` VALUES ('25', '136', '1', '2017-05-31 15:01:52', '1');
INSERT INTO `jc_content_record` VALUES ('26', '136', '1', '2017-05-31 15:03:57', '1');
INSERT INTO `jc_content_record` VALUES ('27', '136', '1', '2017-05-31 15:04:06', '1');
INSERT INTO `jc_content_record` VALUES ('28', '136', '1', '2017-05-31 15:04:14', '1');
INSERT INTO `jc_content_record` VALUES ('29', '136', '1', '2017-05-31 15:04:25', '1');
INSERT INTO `jc_content_record` VALUES ('174', '130', '1', '2017-08-15 13:19:21', '4');
INSERT INTO `jc_content_record` VALUES ('176', '130', '1', '2017-08-15 13:19:39', '4');
INSERT INTO `jc_content_record` VALUES ('182', '143', '1', '2017-08-15 13:19:39', '4');
INSERT INTO `jc_content_record` VALUES ('184', '132', '1', '2017-08-15 13:19:39', '4');
INSERT INTO `jc_content_record` VALUES ('185', '131', '1', '2017-08-15 13:19:39', '4');
INSERT INTO `jc_content_record` VALUES ('186', '113', '1', '2017-08-15 13:19:39', '4');
INSERT INTO `jc_content_record` VALUES ('187', '112', '1', '2017-08-15 13:19:40', '4');
INSERT INTO `jc_content_record` VALUES ('188', '111', '1', '2017-08-15 13:19:40', '4');
INSERT INTO `jc_content_record` VALUES ('189', '39', '1', '2017-08-15 13:19:40', '4');
INSERT INTO `jc_content_record` VALUES ('190', '37', '1', '2017-08-15 13:19:40', '4');
INSERT INTO `jc_content_record` VALUES ('191', '36', '1', '2017-08-15 13:19:40', '4');
INSERT INTO `jc_content_record` VALUES ('192', '33', '1', '2017-08-15 13:19:40', '4');
INSERT INTO `jc_content_record` VALUES ('193', '32', '1', '2017-08-15 13:19:40', '4');
INSERT INTO `jc_content_record` VALUES ('194', '30', '1', '2017-08-15 13:19:40', '4');
INSERT INTO `jc_content_record` VALUES ('195', '29', '1', '2017-08-15 13:19:40', '4');
INSERT INTO `jc_content_record` VALUES ('196', '28', '1', '2017-08-15 13:19:49', '4');
INSERT INTO `jc_content_record` VALUES ('197', '27', '1', '2017-08-15 13:19:49', '4');
INSERT INTO `jc_content_record` VALUES ('198', '23', '1', '2017-08-15 13:19:49', '4');
INSERT INTO `jc_content_record` VALUES ('199', '14', '1', '2017-08-15 13:19:49', '4');
INSERT INTO `jc_content_record` VALUES ('200', '12', '1', '2017-08-15 13:19:49', '4');
INSERT INTO `jc_content_record` VALUES ('201', '11', '1', '2017-08-15 13:19:49', '4');
INSERT INTO `jc_content_record` VALUES ('246', '121', '1', '2017-12-19 20:14:50', '1');
INSERT INTO `jc_content_record` VALUES ('306', '199', '1', '2018-04-14 17:36:50', '0');
INSERT INTO `jc_content_record` VALUES ('307', '200', '2', '2018-04-19 22:56:23', '0');
INSERT INTO `jc_content_record` VALUES ('308', '200', '2', '2018-04-19 23:45:28', '1');
INSERT INTO `jc_content_record` VALUES ('309', '200', '2', '2018-04-19 23:45:42', '1');
INSERT INTO `jc_content_record` VALUES ('318', '203', '9', '2018-04-21 09:07:27', '0');
INSERT INTO `jc_content_record` VALUES ('319', '204', '9', '2018-04-21 09:08:26', '0');
INSERT INTO `jc_content_record` VALUES ('320', '204', '9', '2018-04-21 09:12:06', '1');
INSERT INTO `jc_content_record` VALUES ('321', '203', '9', '2018-04-21 09:12:35', '1');
INSERT INTO `jc_content_record` VALUES ('322', '203', '9', '2018-04-21 09:18:57', '1');
INSERT INTO `jc_content_record` VALUES ('323', '205', '9', '2018-04-21 09:51:29', '0');
INSERT INTO `jc_content_record` VALUES ('324', '205', '9', '2018-04-21 09:52:29', '1');
INSERT INTO `jc_content_record` VALUES ('325', '206', '9', '2018-04-21 09:53:12', '0');
INSERT INTO `jc_content_record` VALUES ('326', '207', '9', '2018-04-21 09:53:54', '0');
INSERT INTO `jc_content_record` VALUES ('327', '208', '9', '2018-04-21 09:54:21', '0');
INSERT INTO `jc_content_record` VALUES ('328', '209', '9', '2018-04-21 09:54:49', '0');
INSERT INTO `jc_content_record` VALUES ('329', '210', '9', '2018-04-21 09:55:16', '0');
INSERT INTO `jc_content_record` VALUES ('330', '209', '9', '2018-04-21 10:01:15', '1');
INSERT INTO `jc_content_record` VALUES ('331', '209', '9', '2018-04-21 10:03:21', '1');
INSERT INTO `jc_content_record` VALUES ('332', '210', '9', '2018-04-21 10:04:33', '1');
INSERT INTO `jc_content_record` VALUES ('333', '210', '9', '2018-04-21 10:05:23', '1');
INSERT INTO `jc_content_record` VALUES ('334', '210', '9', '2018-04-21 10:06:17', '1');
INSERT INTO `jc_content_record` VALUES ('335', '207', '9', '2018-04-21 10:07:24', '1');
INSERT INTO `jc_content_record` VALUES ('336', '207', '9', '2018-04-21 10:07:42', '1');
INSERT INTO `jc_content_record` VALUES ('337', '207', '9', '2018-04-21 10:08:04', '1');
INSERT INTO `jc_content_record` VALUES ('338', '208', '9', '2018-04-21 10:12:42', '1');
INSERT INTO `jc_content_record` VALUES ('339', '205', '9', '2018-04-21 10:13:42', '1');
INSERT INTO `jc_content_record` VALUES ('340', '206', '9', '2018-04-21 10:14:21', '1');
INSERT INTO `jc_content_record` VALUES ('341', '204', '9', '2018-04-21 11:38:21', '1');
INSERT INTO `jc_content_record` VALUES ('342', '203', '9', '2018-04-21 11:38:31', '1');
INSERT INTO `jc_content_record` VALUES ('343', '211', '1', '2018-06-09 15:09:56', '0');
INSERT INTO `jc_content_record` VALUES ('344', '212', '1', '2018-06-11 20:39:58', '0');
INSERT INTO `jc_content_record` VALUES ('345', '213', '1', '2018-06-11 20:40:38', '0');
INSERT INTO `jc_content_record` VALUES ('346', '213', '1', '2018-06-11 20:44:35', '1');
INSERT INTO `jc_content_record` VALUES ('347', '212', '1', '2018-06-11 20:45:29', '1');
INSERT INTO `jc_content_record` VALUES ('348', '211', '1', '2018-06-11 21:07:18', '1');
INSERT INTO `jc_content_record` VALUES ('349', '214', '1', '2018-06-11 22:12:39', '0');
INSERT INTO `jc_content_record` VALUES ('350', '214', '1', '2018-06-11 22:14:08', '1');
INSERT INTO `jc_content_record` VALUES ('351', '215', '1', '2018-06-11 22:31:00', '0');
INSERT INTO `jc_content_record` VALUES ('352', '215', '1', '2018-06-11 22:34:27', '1');
INSERT INTO `jc_content_record` VALUES ('353', '216', '1', '2018-06-11 22:39:05', '0');
INSERT INTO `jc_content_record` VALUES ('354', '216', '1', '2018-06-11 22:41:16', '1');

-- ----------------------------
-- Table structure for jc_content_reward_fix
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_reward_fix`;
CREATE TABLE `jc_content_reward_fix` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '10',
  `reward_fix` double NOT NULL DEFAULT '0' COMMENT '固定值',
  UNIQUE KEY `jc_content_reward_fix` (`content_id`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容打赏设置固定值';

-- ----------------------------
-- Records of jc_content_reward_fix
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content_share_check
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_share_check`;
CREATE TABLE `jc_content_share_check` (
  `share_check_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL COMMENT '共享内容',
  `channel_id` int(11) NOT NULL COMMENT '共享栏目',
  `check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 0待审核 1审核通过 2推送',
  `check_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `share_valid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '共享有效性',
  PRIMARY KEY (`share_check_id`),
  KEY `fk_channel_jc_content_share` (`channel_id`),
  KEY `fk_check_jc_content_share` (`content_id`),
  CONSTRAINT `fk_channel_jc_content_share` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_check_jc_content_share` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS共享内容审核信息表';

-- ----------------------------
-- Records of jc_content_share_check
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content_tag
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_tag`;
CREATE TABLE `jc_content_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL COMMENT 'tag名称',
  `ref_counter` int(11) NOT NULL DEFAULT '1' COMMENT '被引用的次数',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `ak_tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='CMS内容TAG表';

-- ----------------------------
-- Records of jc_content_tag
-- ----------------------------
INSERT INTO `jc_content_tag` VALUES ('1', '中国共产党', '1');
INSERT INTO `jc_content_tag` VALUES ('3', '纪律处分', '1');
INSERT INTO `jc_content_tag` VALUES ('4', '条例', '1');
INSERT INTO `jc_content_tag` VALUES ('5', '水乳液', '1');
INSERT INTO `jc_content_tag` VALUES ('6', '钛白粉', '1');
INSERT INTO `jc_content_tag` VALUES ('7', '涂料', '1');
INSERT INTO `jc_content_tag` VALUES ('8', '中空结构', '1');
INSERT INTO `jc_content_tag` VALUES ('9', '遮盖性', '1');

-- ----------------------------
-- Table structure for jc_content_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_topic`;
CREATE TABLE `jc_content_topic` (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`topic_id`),
  KEY `fk_jc_content_topic` (`topic_id`),
  CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题内容关联表';

-- ----------------------------
-- Records of jc_content_topic
-- ----------------------------
INSERT INTO `jc_content_topic` VALUES ('2', '1');
INSERT INTO `jc_content_topic` VALUES ('7', '1');
INSERT INTO `jc_content_topic` VALUES ('11', '1');
INSERT INTO `jc_content_topic` VALUES ('12', '1');
INSERT INTO `jc_content_topic` VALUES ('13', '1');
INSERT INTO `jc_content_topic` VALUES ('14', '1');
INSERT INTO `jc_content_topic` VALUES ('27', '1');
INSERT INTO `jc_content_topic` VALUES ('28', '1');
INSERT INTO `jc_content_topic` VALUES ('32', '1');
INSERT INTO `jc_content_topic` VALUES ('112', '1');
INSERT INTO `jc_content_topic` VALUES ('113', '1');
INSERT INTO `jc_content_topic` VALUES ('114', '1');
INSERT INTO `jc_content_topic` VALUES ('115', '1');
INSERT INTO `jc_content_topic` VALUES ('116', '1');
INSERT INTO `jc_content_topic` VALUES ('117', '1');
INSERT INTO `jc_content_topic` VALUES ('118', '1');
INSERT INTO `jc_content_topic` VALUES ('119', '1');
INSERT INTO `jc_content_topic` VALUES ('120', '1');
INSERT INTO `jc_content_topic` VALUES ('130', '1');
INSERT INTO `jc_content_topic` VALUES ('131', '1');
INSERT INTO `jc_content_topic` VALUES ('132', '1');
INSERT INTO `jc_content_topic` VALUES ('141', '1');
INSERT INTO `jc_content_topic` VALUES ('2', '2');
INSERT INTO `jc_content_topic` VALUES ('7', '2');
INSERT INTO `jc_content_topic` VALUES ('11', '2');
INSERT INTO `jc_content_topic` VALUES ('12', '2');
INSERT INTO `jc_content_topic` VALUES ('13', '2');
INSERT INTO `jc_content_topic` VALUES ('14', '2');
INSERT INTO `jc_content_topic` VALUES ('27', '2');
INSERT INTO `jc_content_topic` VALUES ('28', '2');
INSERT INTO `jc_content_topic` VALUES ('32', '2');
INSERT INTO `jc_content_topic` VALUES ('112', '2');
INSERT INTO `jc_content_topic` VALUES ('113', '2');
INSERT INTO `jc_content_topic` VALUES ('114', '2');
INSERT INTO `jc_content_topic` VALUES ('115', '2');
INSERT INTO `jc_content_topic` VALUES ('116', '2');
INSERT INTO `jc_content_topic` VALUES ('117', '2');
INSERT INTO `jc_content_topic` VALUES ('118', '2');
INSERT INTO `jc_content_topic` VALUES ('119', '2');
INSERT INTO `jc_content_topic` VALUES ('120', '2');
INSERT INTO `jc_content_topic` VALUES ('131', '2');
INSERT INTO `jc_content_topic` VALUES ('132', '2');
INSERT INTO `jc_content_topic` VALUES ('2', '3');
INSERT INTO `jc_content_topic` VALUES ('7', '3');
INSERT INTO `jc_content_topic` VALUES ('11', '3');
INSERT INTO `jc_content_topic` VALUES ('12', '3');
INSERT INTO `jc_content_topic` VALUES ('13', '3');
INSERT INTO `jc_content_topic` VALUES ('14', '3');
INSERT INTO `jc_content_topic` VALUES ('27', '3');
INSERT INTO `jc_content_topic` VALUES ('28', '3');
INSERT INTO `jc_content_topic` VALUES ('32', '3');
INSERT INTO `jc_content_topic` VALUES ('112', '3');
INSERT INTO `jc_content_topic` VALUES ('113', '3');
INSERT INTO `jc_content_topic` VALUES ('114', '3');
INSERT INTO `jc_content_topic` VALUES ('115', '3');
INSERT INTO `jc_content_topic` VALUES ('116', '3');
INSERT INTO `jc_content_topic` VALUES ('117', '3');
INSERT INTO `jc_content_topic` VALUES ('118', '3');
INSERT INTO `jc_content_topic` VALUES ('119', '3');
INSERT INTO `jc_content_topic` VALUES ('120', '3');
INSERT INTO `jc_content_topic` VALUES ('131', '3');
INSERT INTO `jc_content_topic` VALUES ('132', '3');

-- ----------------------------
-- Table structure for jc_content_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_txt`;
CREATE TABLE `jc_content_txt` (
  `content_id` int(11) NOT NULL,
  `txt` longtext COMMENT '文章内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容文本表';

-- ----------------------------
-- Records of jc_content_txt
-- ----------------------------
INSERT INTO `jc_content_txt` VALUES ('11', '<p style=\"text-indent: 2em;\">记者从国家防总、水利部14日召开的新闻发布会上获悉：据初步统计，截至7月13日，长江中下游湖北、湖南、江西、安徽、江苏等5省堤防巡查防守和抢险共投入62.2万人(含部队3.08万人)，6月30日以来已累计投入抗洪抢险777万人次。</p><p><br/></p><p style=\"text-indent: 2em;\">截至7月13日，今年以来全国已有28省(区、市)1508县遭受洪灾，农作物受灾面积5460.66千公顷，受灾人口6074.67万人，因灾死亡237人、失踪93人，倒塌房屋14.72万间，直接经济损失约1469.80亿元。与2000年以来同期均值相比，今年受灾人口、死亡人口、倒塌房屋分别偏少6%、49%、55%，受灾面积、直接经济损失分别偏多26%、213%。</p><p><br/></p><p style=\"text-indent: 2em;\">此外，中央气象台14日继续发布暴雨蓝色预警，未来3天，强降雨将自西向东影响四川盆地、江汉、江淮、江南北部及黄淮南部，上述地区将有大到暴雨，部分地区有大暴雨，局部伴有短时雷雨大风等强对流天气。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('12', '<p style=\"text-indent: 2em;\">央视新闻：【习近平就#法国尼斯袭击事件#向法国总统致慰问电】习近平对这一骇人听闻的野蛮行径表示强烈谴责，向不幸遇难者表示深切的哀悼，向伤者和遇难者家属表示诚挚的慰问。习近平指出，中方坚决反对一切形式的恐怖主义，愿同法方深化反恐合作，共同维护中法两国和世界安全和平。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('14', '<p style=\"text-indent: 2em;\">【习近平考察宁夏首站到固原，冒雨向红军长征会师纪念碑敬献花篮】7月18日，习近平总书记到宁夏回族自治区考察。从北京直飞固原，驱车70多公里到将台堡，向红军长征会师纪念碑敬献花篮并参观三军会师纪念馆。1936年10月，红军三大主力在会宁和将台堡会师，标志二万五千里长征胜利结束。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142227i3ee.jpg\" title=\"16464387039280572236.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/1914230968h5.jpg\" title=\"9093755211529617012.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：缅怀先烈、不忘初心，走好新的长征路】参观三军会师纪念馆时，习近平说，红军长征创造了中外历史的奇迹。革命理想高于天，不怕牺牲、排除万难去争取胜利，面对形形色色的敌人决一死战、克敌制胜，这些都是长征精神的内涵。我们要继承和弘扬好伟大的长征精神。有了这样的精神，没有什么克服不了的困难。我们完全有信心有决心有恒心实现中华民族伟大复兴的中国梦。</p><p><br/></p><p style=\"text-indent: 2em;\">习近平说，长征永远在路上。这次专程来这里，就是缅怀先烈、不忘初心，走新的长征路。今天是实现“两个一百年”奋斗目标的新长征。我们这一代人要走好我们这一代人的长征路。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142342h33w.jpg\" title=\"13099311371353179840.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：革命传统教育基地不要贪大求洋】习近平说，革命传统和爱国主义教育基地建设一定不要追求高大全，搞得很洋气、很现代化，花很多钱，那就不是革命传统了，革命传统就变味了。可以通过传统教育带动旅游业，但不能失去红色旅游的底色。只有体会到革命年代的艰苦，才能使人们真正受到教育。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142414bvfg.jpg\" title=\"7973019827669232390.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：我是来看扶贫落实情况的】18日下午，习近平总书记来到泾源县大湾乡杨岭村看望父老乡亲，实地考察精准扶贫情况。总书记察看村容村貌，向当地干部了解村子脱贫情况。走进回族群众马科的家，习近平察看屋内陈设，掀开褥子看炕垒得好不好，问屋顶上铺没铺油毡、会不会漏雨，电视能看多少台。来到厨房，打开灶上的大锅盖，看里面做着什么好吃的。厨房一角有个淋浴的地方，听说安了太阳能热水器，习近平说“挺好”，关心地问家里的小男孩：“你常洗澡吗？”</p><p><br/></p><p style=\"text-indent: 2em;\">墙上张贴着的“建档立卡贫困户精准脱贫信息卡”引起总书记注意。“6口人、劳动力2人，养牛6头，种玉米15亩，牛出栏2头收入7000，劳务输出收入21500，综合收入47000……”习近平逐项察看，一笔一笔算着马科家的收入账。习近平说，信息登记挺细致，关键要抓好落实，我就是来看落实情况的。马科说，我一定努力让今年计划落到口袋里，实现脱贫摘帽的目标。习近平希望马科把孩子教育搞好，学知识、有文化，决不能让他们输在起跑线上。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142446ch8y.jpg\" title=\"2231079109511926610.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：固原的发展脱胎换骨，增强了我们打赢脱贫攻坚战的信心】习近平坐在杨岭村村民马克俊家的炕上，同村干部、党员代表、养牛大户和贫困户代表拉起家常。总书记说，我听你们说说心里话，咱们唠一唠。大家向总书记汇报近几年脱贫攻坚的情况，说党的政策确实确实太好太好了。习近平拉着马克俊的手说，你年纪比我小，是我老弟。看着你和乡亲们的生活越来越好我很高兴。西海固曾经“苦瘠甲天下”。这是我第3次到固原来。我提出再到比较艰苦的农村看一看。通过走访，了解到村里已经解决了饮水问题，住房等生活条件有了明显改善，还开始找到了产业脱贫的路子。全国还有5000万贫困人口，到2020年一定要实现全部脱贫目标。这是我当前最关心的事情。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142513not2.jpg\" title=\"4804757052710294014.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：农村脱贫奔小康，支部很重要】习近平称赞大湾乡杨岭村党支部第一书记兰竹林对村里的情况门儿清，说明工作比较扎实。他说，一个村子建设得好，关键要有一个好党支部。村党支部带领村民脱贫奔小康，只要有规划，有措施，真抓实干，群众拥护，就一定能把工作做好。希望你们把基层党组织和基层政权建设好，团结带领广大群众奔小康。我们还要更上一层楼!</p><p><br/></p><p style=\"text-indent: 2em;\">【总书记为村民算养牛收支账】宁夏固原市大湾乡杨岭村，习近平走进贫困户马克俊家，首先来到小院一角的牛棚。养牛是杨岭村产业脱贫的重要途径，村里的贫困户在政府帮扶下，每家饲养2头安格斯基础母牛、3头育肥牛。习近平询问肉牛出栏育肥、贷款等情况。“过去都是养大黄牛，如今养上了进口牛”，马克俊给总书记详细算起了现在的养牛收支明细账。养牛大户马全龙也来到了小院里，他告诉总书记，自家过去养了5头牛，如今有了10多头，还准备增加到20头。习近平勉励他说：“要发挥好示范带头作用，把好的经验传授给村民。”</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：防范市场风险，政府要做好信息服务】细雨绵绵，沃野千里。宁夏原州区彭堡镇姚磨村，习近平冒雨视察万亩冷凉蔬菜基地。蔬菜展台前，新鲜采摘的西兰花、紫甘蓝、辣椒、马铃薯等，整齐“列队”。边走边看，习近平问得仔细。“检测标准怎么样？”“一亩地收入多少？”“农活有技术员指导吗？”“喷灌设施一亩地成本多少？”村里的党员干部、种植大户簇拥在总书记身边。习近平和他们聊起土地承包费、务农打工费、入股分红等，询问他们生产中遇到的困难。一位农民说，感觉市场还不大稳定，想更好了解市场需求。习近平表示，防范市场风险，既需要经营个体敏锐把握，也需要政府加强服务，尤其要做好信息服务工作。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142548un62.jpg\" title=\"2176556949782138032.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142605p9xl.jpg\" title=\"17322238994688503995.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('23', '<p>　　为了贯彻落实贵州省委、省政府关于构建全域旅游、推动旅游“井喷式”增长和黔东南州委、州政府“用好生态文化两个宝贝，打造国内外知名的民族文化旅游目的地”的战略部署，凯里市委、市政府突出建设国际旅游城市、国家园林城市、国家创新型城市的功能定位，以“节庆搭台，旅游唱戏”的超常规举措，着力推动凯里旅游从初级阶段快速向中高级阶段演化。2016年“十一”黄金周推出了文化旅游系列活动。</p><p>　　1、一赛一节</p><p>　　“一赛”即“牛霸天下”2016首届中国•凯里斗牛国际标准赛，“一节”即2016中国•凯里牛崇拜文化艺术节。</p><p>　　活动共分为四个场地：(1)斗牛国际标准赛场：凯里市民族文化活动中心(民族体育场)。(2)牛崇拜文化艺术节第一会场：凯里市民族文化活动中心(民族体育场)场外。(3)牛崇拜文化艺术节第二会场：凯里苗侗风情园。(4)牛崇拜文化艺术节第三会场：凯里民族文化园。举办时间：“牛霸天下”2016首届中国•凯里斗牛国际标准赛10月1日至10月6日，每日下午一点开始。2016中国•凯里牛崇拜文化艺术节10月1日至3日，每天白天和晚上在三个会场均有不同活动。</p><p>　　2、“弘扬民族文化，共筑中国梦”苗族刺绣体验</p><p>　　活动时间：10月1日至10月9日。地点：苗妹非遗博物馆。活动内容：游客现场体验、设计、制作自己心仪的作品。</p><p>　　3、2016“国庆节”南花村约你做客</p><p>　　活动时间：10月1日至10月7日。地点：南花苗寨。活动内容：观原生态山水风光、赏苗族歌舞、学苗族刺绣、饮百年神泉、品苗家米酒、体验传统打糍粑。</p><p>　　4、“李宁红双喜杯”2016中国乒乓球协会会员联赛</p><p>　　活动时间：10月1日至10月7日。地点：凯里学院体育馆。来自全国各地600多名中国乒乓球协会会员参赛，世界乒乓球冠军马琳、国家乒乓球队金牌教练吴敬平亲临凯里为比赛开赛。</p><p>　　5、云谷田园观光康体系列活动</p><p>　　活动时间：10月1日至10月7日。地点：舟溪云谷田园生态农业观光园。活动内容：农业观光采摘和钓鱼比赛等趣味体验活动。</p><p>　　2016“十一”黄金周凯里地区文化旅游系列活动内容丰富，时间长、规模大，亮点多、参与性强，欢迎中外游客和广大市民积极参与体验。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('27', '<p style=\"text-indent: 2em; text-align: center;\"><img src=\"/u/cms/www/201609/23140225zalw.jpg\" title=\"641-(1).jpg\" alt=\"641-(1).jpg\"/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">习近平为何如此看重“一带一路”建设？自他发出沿线国家和地区共建“一带一路”倡议三年来，都取得了哪些进展？</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">6月22日，国家主席习近平在塔什干乌兹别克斯坦最高会议立法院发表题为《携手共创丝绸之路新辉煌》的重要演讲。 新华社记者马占成摄</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2013年9月7日，习近平在出访中亚国家期间，首次提出共建“丝绸之路经济带”。同年10月，他又提出共同建设21世纪“海上丝绸之路”，二者共同构成了“一带一路”重大倡议。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">而今，三年了。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>“一带一路”这三年</strong></p><p style=\"text-indent: 2em;\"><strong><br/></strong></p><p style=\"text-indent: 2em;\">三年，筚路蓝缕，春华秋实。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在“一带一路”倡议提出的当年11月，十八届三中全会通过的《中共中央关于全面深化改革若干重大问题的决定》明确指出：“加快同周边国家和区域基础设施互联互通建设，推进丝绸之路经济带、海上丝绸之路建设，形成全方位开放新格局。”</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2014年11月的中央财经领导小组第八次会议专门研究了丝绸之路经济带和21世纪海上丝绸之路规划，发起建立亚洲基础设施投资银行和设立丝路基金。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在博鳌亚洲论坛2015年年会上，习近平呼吁各国积极参与“一带一路”建设。随后，中国政府发布《推动共建丝绸之路经济带和21世纪海上丝绸之路的愿景与行动》，明确了“一带一路”的共建原则、框架思路、合作重点、合作机制等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2016年3月，国家“十三五”规划纲要正式发布，“推进‘一带一路’建设”成为其中专门一章。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2016年8月，习近平在推进“一带一路”建设工作座谈会上，进一步提出8项要求。从统一思想到统筹落实，从金融创新到人文合作，从话语体系建设到安全保障，面面俱到。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">三年，蓝图由草创到一步步展开、一笔笔绘就。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">目前，已有100多个国家和国际组织参与到“一带一路”建设中来，中国同30多个沿线国家签署了共建合作协议、同20多个国家开展了国际产能合作，联合国等国际组织也态度积极，以亚投行、丝路基金为代表的金融合作不断深入，一批有影响力的标志性项目逐步落地。“一带一路”建设从无到有、由点及面，进度和成果超出预期。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">“一带一路”东联亚太经济圈，西接欧洲经济圈，跨越高山深海，正在逐步构建世界上最壮美的经济走廊。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('28', '<p style=\"text-indent: 2em;\">9月21日，上海浦东机场，犯罪嫌疑人刘某被上海警方从马来西亚押送回沪。警方供图</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">骗税3400万，潜逃境外3100多天，辗转日本、马来西亚等地。经过上海警方漫长的追捕，2016年9月21日上午，国际红色通缉令出逃人员刘某被缉捕归案，押送回沪。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">澎湃新闻从上海警方获悉，近期“猎狐”行动捷报频传。8月22日，涉嫌巨额诈骗的国际红通犯罪嫌疑人钱某潜逃17年后被警方从南美国家苏里南劝返；8月31日，利用证券账户开设“老鼠仓”牟利、涉案金额高达1.2亿元的犯罪嫌疑人刘某被警方从美国劝返。至此，今年上海警方已经成功缉捕或劝返境外在逃人员71人。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('29', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230906198i4y.jpeg\" title=\"qe.jpeg\" alt=\"qe.jpeg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">新华社深圳9月22日专电（记者孙飞）记者22日从深圳市公安局福田分局获悉，深圳数名二手房卖主，因房价上涨不愿履行协议与买家发生纠纷，并对深圳市中院相关判决不满，聚集60余人前往深圳市中院闹访。目前，5人因涉嫌聚众冲击国家机关罪被福田警方依法刑事拘留，并于9月14日由福田区人民检察院批准逮捕。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方介绍，今年8月22日上午，在马某某（男，31岁，江西吉安人）、郑某某（男，47岁，广东深圳人）等人带领下，60余人拒不接受现场工作人员安检的要求，冲入深圳市中级人民法院一楼东大厅，扰乱深圳市中级人民法院的单位秩序。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方接报后，组织警力赶到现场。在深圳市公安局统一指挥下，罗湖区、南山区公安分局警力也赶到现场支援处置工作。通过多方合力，62人被带离深圳中院。民警在现场收缴了大量标语横幅及文化衫等物品。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方通报称，经查，该案系马某某、郑某某等二手房卖主，在签订二手房买卖协议后因房价上涨不愿履行协议引发纠纷，并对深圳市中院的相关判决不满，带领从东莞雁田等地雇佣的40余人前往深圳中院闹访。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">当日，深圳警方对这62人给予行政处罚，其中，56人分别被处以5至15日行政拘留，6人被处以罚款。后经进一步侦查，马某某、郑某某等5人因涉嫌聚众冲击国家机关罪被深圳福田警方依法刑事拘留，并于9月14日由福田区人民检察院批准逮捕。目前，该案尚在进一步侦办中。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('30', '<p style=\"text-indent: 2em;\">中新网北京9月23日电 (吴涛)中新网从三大运营商处获悉，此前传北京地区未实名手机用户10月15日将被停机，实际是分批执行，10月15日开始，最晚至10月31日截止。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">其实，多地已开始执行不实名就停机政策，中新网(微信公众号：cns2012)对此进行了梳理，大部分地区都是分批执行，如用户在规定时间内未实名，将面临被停机甚至销号的处理。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>北京10月底前手机全部实名 否则停机</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">最近不少手机用户都收到通知，未实名手机用户将被停机。以北京为例，提示短信显示，10月15日起，未实名手机用户将被暂停通信服务。三大运营商相关负责人分别对中新网表示，在北京地区，10月15日起将执行非实名就停机政策，分批执行，最晚至10月底，非实名手机用户全部停机。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">至于其他省份，三大运营商表示，电信运营商省公司可以结合本地实际情况确定执行不实名就停机政策的具体日期。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国电信强调，地方分公司提出执行不实名就停机政策的时间节点，不得晚于集团提出的时间节点；中国移动表示，各省通信管理局或当地政府有规定的，优先按当地的规定执行。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">一些地方对手机实名补登记早就出了要求，江苏三家运营商按照省通信管理局要求，于7月22日发布公告称，自11月起暂停未实名手机用户的部分通信服务，12月起，停止仍未实名用户的全部通信服务。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">7月份，山东省公安厅和省通信管理局联合发布通告，自10月起暂停未实名用户的部分通信服务，2017年6月30日前，停止仍未实名用户的全部通信服务。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('32', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230919031knf.jpg\" title=\"138678572.jpg\" alt=\"138678572.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">成龙捐给台北故宫(微博)南院的12生肖兽首，面临斩首命运。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国台湾网9月22日讯 据台湾《联合报》报道，台北故宫院长林正仪今天（22日）表示，9月底将移除影星成龙捐赠台北故宫南院的12生肖兽首。对此，成龙经纪人EMMA傍晚传达成龙的意见表示，当初捐兽首给台北故宫，是因为台北故宫是一个“尊重文明，保护文化”的单位，若台北故宫对于“尊重文明，保护文化”有不同态度，“那我们也尊重”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">成龙捐赠给台北故宫南院的12生肖兽首复制品，目前放置在台北故宫南院主建筑物外广场。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">EMMA指出，成龙将兽首捐给台北故宫时，想表达的“尊重文明 保护文化”的态度已经完成，“这整件事是一个态度传达的艺术行为”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据报道，成龙也曾捐赠一组相同的兽首给新加坡国立亚洲文明博物馆。EMMA指出，成龙捐赠兽首，捐给台北故宫和捐给新加坡国立亚洲文明博物馆，传达的态度是一样的，就是“尊重文明，保护文化”。“我们捐的不是艺术品或工艺品，而是传达一个态度。”捐给台北故宫，是因为它是一个“尊重文明，保护文化”的单位。若台北故宫对于“尊重文明，保护文化”有不同态度，“那我们也尊重”。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('33', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/23092247x1xp.jpg\" title=\"138679618.jpg\" alt=\"138679618.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">亚马逊季度利润连续三个财季创下新纪录。随之而来的是，亚马逊股价也打破了记录。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">亚马逊的股价在纽约当地时间周四上午首次突破每股800美元大关。亚马逊以3860亿美元的市值稳居全球上市公司第四的位置，仅次于苹果、谷歌(微博)母公司Alphabet和微软。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在过去的仅仅七个月时间里，亚马逊的股价大涨了40%。推动亚马逊股价增长的主要原因是亚马逊云计算业务AWS的增长及其带来的惊人利润。另外，亚马逊数千万Prime会员也贡献颇多，这些会员要比非会员更经常购物，而且购物支出也比非会员要多得多。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('36', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230939278x02.jpg\" title=\"138679965.jpg\" alt=\"138679965.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">9月20日，匹凸匹投资者索赔案开庭，有十多位投资者向匹凸匹发起索赔。今年3月，匹凸匹公告，因未及时披露多项对外重大担保、重大诉讼事项及2013年年报中未披露对外重大事项，证监会对匹凸匹处40万元罚款，对鲜言处30万元罚款。前述投资者认为因虚假陈述行为而受到损失。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">事实上，这也是匹凸匹原实际控制人鲜言给“海银系”掌门人韩宏伟的遗留问题。去年底，“海银系”以五牛基金为主力从鲜言手中接盘饱受争议的匹凸匹。韩宏伟与韩啸系父子关系。大半年过去，韩氏父子与鲜言的关系也从起初的甜蜜期走到如今对簿公堂。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">对于有着同窗情谊的两者是真翻脸还是另有图谋，投资者更为关心的是，韩氏父子掌控的“海银系”对匹凸匹未来发展有怎样的考虑，是否会注入资产让匹凸匹改头换面，而不是再次陷入“资本漩涡”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>实控人背后关联重重</strong><br/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在资本市场叱咤风云的“海银系”为何要染指匹凸匹。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">近三年来，匹凸匹（原多伦股份）及鲜言在资本市场可谓劣迹斑斑，先后被证监会两次立案调查、两次公开谴责，1次警告、1次罚款，1次行政监管，并多次收到上交所的问询函。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">对于上海一中院开庭审理的十多位投资者诉匹凸匹案，上述投资者的代理律师上海市华荣律师事务所许峰对中国证券报记者表示，通过庭审判断，投资者最终获赔概率较大。其法律依据主要是，去年年底证监会针对匹凸匹未及时披露多项对外重大担保、重大诉讼事项做出了处罚。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">事实上，7月份，中证中小投资者服务中心代理散户起诉匹凸匹，将鲜言及原其他七名高管及匹凸匹公司作为共同被告诉至法院，诉请判令鲜言赔偿经济损失37万余元，其余八被告承担连带赔偿责任。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">有投行人士还对中国证券报记者透露，2014年11月底，鲜言拟将上市公司实际控制权转让给自然人殷群，最终因对方未付款而夭折。在五牛基金入主匹凸匹之前，资本大鳄吴鸣霄也与鲜言谈过买壳，但最终不知为何没有谈拢。值得注意的是，目前颇受关注的ST慧球(13.300, 0.01, 0.08%)第一大自然人股东就是吴鸣霄，而ST慧球被指背后的实际控制人是鲜言。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">上述人士指出，在历经陈隆基、李勇鸿、鲜言的多次进进出出。多伦股份主营业务变更不断，从房地产、金融又回到房产，唯一不变的是业绩不见起色，并一步步走向“空壳”状态。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('37', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/23094218axhy.jpg\" title=\"138679463.jpg\" alt=\"138679463.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">近日，美国联邦通信委员会意外曝光了苹果正在研发的一款新设备，其体积类似于苹果机顶盒（Apple TV），具体的用途尚不得而知。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据美国科技新闻网站AppleInsider报道，联邦通信委员会的数据库中出现了这款苹果尚未对外宣布的新产品，其螺丝位置和设备外壳的大小，类似于第四代苹果机顶盒。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">苹果一直拥有对外保密的传统，而在这款新设备中，苹果也要求不对外泄漏相关信息，因此媒体无法判断到底作何用途。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这款设备使用的型号A1844，目前并未被苹果发售的商品使用过。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据称，该设备的电源参数为5.5V到13.2V,输出电流为100毫安，峰值为700毫安。这些参数有别于苹果最新的机顶盒，其电源参数为12V、920毫安。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这款设备还具有蓝牙通信和NFC（近场通信）功能，美国联邦通信委员会也对这些通信功能进行了测试，相关的无线电通信功能也是这款设备提交到该机构进行测试的原因。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这一设备没有进行Wi-Fi通信测试，可能意味着会采用目前某个设备的Wi-Fi通信技术，或者根本就不具备Wi-Fi通信功能。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">此前，外部机构曾经对苹果第四代机顶盒进行过拆解，相关的螺丝位置，和此次对外披露的设备有类似之处。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">近些年，苹果的研发资源集中在了智能手机、平板电脑等领域，传统的机顶盒似乎受到了冷落。去年，在长期不更新之后，苹果推出了全新第四代的机顶盒，苹果推出了专有的机顶盒操作系统，在遥控器中植入了语音操控工具Siri。库克也表示，电视的未来是应用软件。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">苹果也围绕机顶盒构建了一个客厅互联网的生态系统，许多第三方开发商正在为苹果机顶盒开发电视端的应用软件。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"/u/cms/www/201609/230943156ihf.jpg\" title=\"138679317.jpg\" alt=\"138679317.jpg\"/></p><p style=\"text-indent: 2em; text-align: center;\">第四代苹果机顶盒</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">此次披露的设备，是否是未来第五代的苹果机顶盒，仍无法判断。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('39', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230954058tco.jpg\" title=\"138678243.jpg\" alt=\"138678243.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">中国地震台网正式测定：09月23日00时47分在四川甘孜州理塘县（北纬30.09度，东经99.64度）发生4.9级地震，震源深度19千米。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('43', '<p>工作职责：<br/>1、负责Web前端多终端产品的整体框架设计；<br/>2、引导前沿技术的预研与实施，通用模块的搭建与维护；<br/>3、负责Web前端开发规范与流程的指定；<br/>4、负责团队成员的技术发展方向及成长；<br/>5、与相关业务部门沟通，协调内部资源，管理前端外包团队。<br/><br/>任职资格：<br/>1、计算机科学或相关专毕业，5年以上工作经验；<br/>2、精通JavaScript、Html5、Css3、NodeJS等Web开发技术；<br/>3、关注Web前端前沿技术发展，具有根据项目情况进行技术选型的能力；<br/>4、熟悉W3C标准，对表现与数据分离、Web语义化等有深刻理解；<br/>5、具有软件工程意识，对数据结构和算法设计有充分理解；<br/>6、具有良好的沟通能力和团队合作精神、优秀的分析问题和解决问题的能力；<br/>7、熟悉Linux平台，掌握一种后端开发语言（PHPJavaCC++Python等）。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('44', '<p>基本要求：&nbsp;<br/>1、精通ASP.NET（C#），熟悉三层架构，精通Web　Services开发，良好的面向对象开发经验；&nbsp;<br/>2、精通AJAX技术运用；<br/>3、精通SqlServer，熟练编写存储过程；&nbsp;<br/>4、精通div,css前端布局；&nbsp;<br/>5、必须有一年以上ASP.NET开发经验，有3个以上完整div＋css、asp.net网站制作或系统研发作品。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('45', '<p>岗位职责：</p><p>1、大专及以上学历，新闻采编相关专业毕业；</p><p>2、1年以上工作经历，有较好的文字功底；</p><p>3、认真务实，态度端正。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('46', '<p>岗位职责：<br/>1、负责电信天网工程项目；<br/>2、负责施工小队工程进度、质量管理<br/>3、负责甲方、监理及相关方协调；<br/><br/>任职资格：<br/>1、专科以上学历，有工程管理经验者优先，熟悉电信流程者优先</p><p>2、良好的理解和表达能力，善于沟通，很好的团队合作意识。<br/></p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('47', '<p>1、大专或大专以上应往届毕业生&nbsp;</p><p>2、理工类毕业生，计算机相关专业优先<br/></p><p>3、对软件行业有强烈的兴趣<br/></p><p>4、有良好的执行力，致力于软件行业发展<br/></p><p>5、后期发展从事网页设计，网站美工，网站开发，互联网系统开发等方向</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('48', '<p>岗位职责：<br/>1、负责Android互联网应用的开发及维护；<br/>2、根据项目需要快速学习并掌握新技术；<br/><br/>职位描述：<br/>1、具有扎实的Java基础，熟练掌握J2ME、J2SE等相关技术及代码优化技巧（容量、内存、速度）；<br/>2、熟悉TCP/IP通信机制，对Socket通信和HTTP通信有较深刻的理解和经验，有网络编程经验；<br/>3、熟悉Android操作系统和AndirodSDK,有一年以上Andriod开发经验优先&nbsp;<br/>4、具备良好的沟通能力和优秀的团队协作能力；<br/>5、优秀的文档编写和语言表达能力，良好的中英文阅读水平；<br/>6、诚恳、踏实、谨慎细致，对工作充满热情，优秀的学习能力，具有良好的自律意识和上进心；<br/>7、有嵌入式LinuxC/C++开发经验优先 ；<br/>8、熟悉MS SQL数据库开发。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('49', '<p>岗位条件：<br/>1、年龄18-28周岁；<br/>2、学历大专及以上，理工科专业毕业优先录用；<br/>3、对互联网行业感兴趣（非销售、非保险岗位），懂编程语言优先考虑，但是也可以接收零基础求职者，有项目经理带团队；<br/>4、工作认真、细致、敬业，责任心强；<br/>5、想获得一份有长远发展、稳定、有晋升空间的工作。</p><p><br/>待遇：<br/>1、转正基本薪资3500起，另有项目奖金和提成；<br/>2、五险一金，双休、法定节假日，正常休息；<br/>3、公司工作环境优雅、氛围好，同事关系融洽，生日派对、聚餐等活动丰富；<br/>4、公司注重员工培养，给予晋升机会，管理层主要员工中培养、提拔；</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('50', '<p>岗位要求：</p><p>1、喜欢从事计算机设计行业；</p><p>2、想获得一份稳定的工作；</p><p>3、好学、细心，喜欢发现事物当中的不足，责任心强。</p><p><br/></p><p>任职要求：</p><p>1、能够尽快入职、长期稳定工作。</p><p>2、大专及大专以上学历。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('51', '<p>岗位职责：<br/>1.熟悉微信的各项功能应用，擅长企业微信的日常操作以及维护<br/>2.根据企业的受众群体可以养成数据分析能力，善于通过数据分析掌握时间段与顾客互动.更新及维护公司企业微信内容，提高各项关注度，提升转化率。&nbsp;<br/>3.负责企业微信的运营策略、活动、话题的制定及策划方案和活动创意、活动宣传，完成微信营销。&nbsp;<br/>4.挖掘和分析粉丝使用习惯，情感及体验感受，及时掌握新闻热点，与用户进行互动。&nbsp;<br/>5.具有一定的市场分析及判断能力，具有良好的客户服务意识，具有亲和力。&nbsp;<br/>6.跟踪微信推广效果，分析数据并反馈，分享微信推广经验，推动及提高团队的网络推广能力。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('69', '<p>腾讯推出的即时通讯工具。支持在线聊天、视频电话、点对点断点续传文件、共享文件、网络硬盘、自定义面板、QQ邮箱等多种功能。免费的通讯平台，QQ2015年给您带来更多沟通乐趣。</p><p><br/></p><p>开发商：腾讯</p><p><br/></p><p>新版特征</p><p>1.文件共享，便捷分享本地文件；</p><p>2.群组通话管理，有序发言，掌控全场；</p><p>3.团队通讯录，快速查看群成员电话。</p><p><br/></p><p><strong>下载说明</strong></p><p><br/></p><p>1、推荐使用迅雷等下载工具下载本站软件，使用 WinRAR v3.10 以上版本解压本站软件。<br/></p><p>2、如果该软件不能下载，请留言报告错误,谢谢合作。</p><p>3、下载本站资源时，如果遇到服务器忙暂不能下载的情况，请过一段时间重试。</p><p>4、如果您有任何意见或建议，欢迎给我们留言，我们将提供更多 、更好的资源。</p><p>5、本站提供的一些商业软件是供学习研究之用，如用于商业用途，请购买正版。</p><p><strong><br/></strong><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('71', '<p>百度公司推出的一款云服务产品。支持便捷地查看、上传、下载百度云端各类数据。通过百度云管家存入的文件，不会占用本地空间。上传、下载文件过程更稳定。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('72', '<p>360杀毒软件下载2016官方下载版是永久免费杀毒软件,360杀毒软件下载免费版开创了杀毒软件免费杀毒的先河.本站提供360杀毒软件下载2016官方下载.360杀毒通过对用户反馈的持续关注与分析，我们进一步改进了针对浏览器不能上网的问题的扫描和自动修复逻辑。您通过快速或是全盘扫描就能够对该类问题进行快速修复!还有大幅优化了开机过程中对CPU和IO的占用，大大减少了对系统开机过程的影响。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('100', '<p>《诺亚传说》是尚游游戏自主研发的大型角色扮演网游，新资料片《诺亚传说前传-亚特兰蒂斯》火爆发布。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('101', '<p>迅雷9是“深圳市迅雷网络技术有限公司”于2016年推出的“迅雷”系列下载软件的最新换代产品。迅雷9采用全新下载引擎，对百兆光纤宽带网络环境进行诸多针对性的优化，让用户获得更卓越的下载体验；全新的界面功能布局，承载了更丰富的内容，打造找、下、用的一站式娱乐消费平台。</p><p>开发商：深圳市迅雷网络技术有限公司</p><p>软件官网：&nbsp;http://xl9.xunlei.com</p><p>新版特征</p><p>1、全新上线资源评论功能，进入资源详情页，参与精彩讨论；<br/>2、新增磁盘缓存设置功能；<br/>3、个性化中心新增“人气”“精品”“超级会员”提示，帮你找到个性化皮肤和头像。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('102', '<p>软件介绍：<br/>&nbsp; 1.360安全卫士是一款由奇虎360公司推出的功能强、效果好、受用户欢迎的安全杀毒软件<br/>&nbsp; 2.目前4.2亿中国网民中，首选安装360的已超过3亿<br/>&nbsp; 3.拥有查杀木马、清理插件、修复漏洞、电脑体检、电脑救援、保护隐私，电脑专家，清理垃圾，清理痕迹多种功能<br/>&nbsp; 4.独创了&amp;ldquo;木马防火墙&quot;&amp;ldquo;360密盘&amp;rdquo;等功能<br/>&nbsp; 5.依靠抢先侦测和云端鉴别，可全面、智能地拦截各类木马，保护用户的帐号、隐私等重要信息<br/>&nbsp; 6.内含的360软件管家还可帮助用户轻松下载、升级和强力卸载各种应用软件</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('103', '<p>搜狗（sougou）拼音输入法是一款Windows平台下的汉字拼音输入法。搜狗拼音输入法是基于搜索引擎技术的、特别适合网民使用的、新一代的输入法产品，用户可以通过互联网备份自己的个性化词库和配置信息。</p><p>开发商：搜狗</p><p>软件官网：&nbsp;http://pinyin.sogou.com/</p><p>新版特征</p><p>升级日志：<br/>1、标点补全：对（）、“”等成对的符号自动补全；<br/>2、图片表情：<br/>a）更新emoji资源和候选位置；<br/>b）支持表情包名搜索；<br/>3、拆分输入：增加更多拆分输入数据；<br/>4、网址直达：增加更多的网址数据；<br/>5、工具箱：更新工具箱图标，界面更美观；<br/>6、解决自定义短语、固定首位等删除之后同步又出现的问题。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('104', '<p>歪歪语音是广州多玩信息技术有限公司研发的一款基于Internet 团队语音通信平台，功能强大、音质清晰、安全稳定、不占资源、适应游戏玩家的免费语音软件。在网络上通常用YY表示。</p><p>开发商：多玩游戏</p><p>软件官网：&nbsp;http://www.yy.com/index/t/download</p><p>新版特征</p><p>优化了部分内容。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('105', '<p>阿里旺旺专为淘宝会员量身定做的个人交易沟通软件，方便买家和卖家在交易过程实时进行沟通。可以进行文字聊天、语音聊天、视频聊天、文件传输、发送离线文件等。有了它，用户就算有万水千山阻隔亦可零距离地与卖家交流宝贝细节，尽情“砍价”了！</p><p>开发商：阿里巴巴</p><p>软件官网：&nbsp;http://www.taobao.com/wangwang/</p><p>新版特征</p><p>1. 全新界面，清晰的圆形头像、轻薄的图标设计、界面结构更加简洁；<br/>2. 全新会话面板，汇总各类消息提醒，处理更高效；&nbsp;<br/>3. 皮肤设置升级，新增多款皮肤主题，带给你全新感觉；<br/>4. 拟物化登陆动画，简洁、灵动，一试难忘；<br/>5. 新增”星标好友“分组，方便找到重要联系人；<br/>6. 主面板新增快捷店铺入口，快速访问好友店铺；<br/>7. 消息管理器优化，重新梳理消息类型和菜单项，分类清晰.查找便捷；<br/>8. 旺旺个人资料和名片全新设计，支持设置个性背景图；<br/>9. 软件升级优化，让您第一时间了解新版本的功能；<br/>10. 文件发送完成后自动关闭发送框，在聊天窗口中实时穿透传输结果；<br/>11. 聊天窗口合并优化，同时和多人聊天更方便；<br/>12. 应用平台全新升级，访问更便捷，应用消息更直观。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('106', '<p>爱奇艺视频桌面版3.0是一款专注视频播放的客户端软件，免费下载安装，观看高清正版影视，可在线享受爱奇艺网站内全部免费高清正版视频、最新影视大片、最独家的综艺、旅游、纪录片，支持全网搜索，是最个性化、时尚化的视频客户端。</p><p>开发商：北京爱奇艺科技有限公司</p><p>软件官网：&nbsp;http://www.iqiyi.com/</p><p>新版特征</p><p>1. 提升系统稳定性。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('107', '<p>谷歌浏览器稳定版（Chrome）是一个由Google（谷歌）公司开发的开放原始码网页浏览器。该浏览器是基于其他开放原始码软件所撰写，包括WebKit和Mozilla，目标是提升稳定性、速度和安全性，并创造出简单且有效率的使用者界面。</p><p>开发商：谷歌</p><p>软件官网：&nbsp;http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html</p><p>新版特征</p><p>1. 修复了部分bug问题。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('108', '<p>360浏览器是互联网上最好用、最安全的新一代浏览器，和360安全卫士、360杀毒等软件等产品一同成为360安全中心的系列产品。木马已经取代病毒成为当前互联网上最大的威胁，90%的木马用挂马网站通过普通浏览器入侵，每天有200万用户访问挂马网站中毒。360安全浏览器拥有全国最大的恶意网址库，采用恶意网址拦截技术，可自动拦截挂马、欺诈、网银仿冒等恶意网址。独创沙箱技术，在隔离模式即使访问木马也不会感染。除了在安全方面的特性，360安全浏览器在速度、资源占用、防假死不崩溃等基础特性上表现同样优异，在功能方面拥有翻译、截图、鼠标手势、广告过滤等几十种实用功能，在外观上设计典雅精致，是外观设计最好的浏览器，已成为广大网民使用浏览器的第一选择。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('109', '<p>PPTV网络电视是PPLive旗下产品，一款安装量大的P2P网络电视软件，支持对海量高清影视内容的直播+点播功能。可在线观看电影、电视剧、动漫、综艺、体育直播、游戏竞技、财经资讯等丰富视频娱乐节目。P2P传输，越多人看越流畅、完全免费，是广受网友推崇的上网装机必备软件。</p><p>开发商：上海聚力传媒技术有限公司</p><p>软件官网：&nbsp;http://www.pptv.com</p><p>新版特征</p><p>1、直播回看无限制，想看哪里看哪里；<br/>2、调整注册方式，手机注册更方便；<br/>3、程序猿们日夜兼程，保证您观影更流畅</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('110', '<p>腾讯视频播放器是腾讯视频旗下的客户端产品，是一款支持丰富内容的在线点播及电视台直播的软件。它采用了先进的P2P流媒体播放技术，可以确保在大量用户同时观看节目的情况下，节目依然流畅清晰；同时具有很强的防火墙穿透能力，为用户在任何网络环境下收看流畅的视频节目提供了有力保障。</p><p>开发商：腾讯</p><p>软件官网：&nbsp;http://v.qq.com/index.html</p><p>新版特征</p><p>1. 客户端专享1080P蓝光画质，全员免费观看和下载；<br/>2. 鼠标停留在播放进度条上可看到预览画面；<br/>3. 启动时提示上次观看内容；<br/>4. 优化了搜索的体验；<br/>5. 精选频道点击栏目标题可跳转；<br/>6. 优化了VIP会员频道的分类筛选。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('111', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114510l7x1.jpg\" title=\"138683743.jpg\" alt=\"138683743.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">本月初的百度世界大会上，百度正式对外宣布，开源其深度学习平台PaddlePaddle，这也让百度成为国内首家开放深度学习技术平台的科技公司。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟表示，百度希望通过开放深度学习平台的方式，营造开发者社区，推动人工智能行业的发展。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据徐伟介绍，该平台最初是百度研发的深度学习内部平台，项目于2013年启动，主要用于支持的百度产品，目前百度有超过30个产品应用到该深度学习平台，包括预测外卖送达时间、图文问答、商家好感度模型等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在行业开放的大趋势下，百度决定将这一平台开源，现在所有的从事深度学习开发的开发人员均可以下载安装并使用百度的这一深度学习工具。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">除了百度以外，谷歌(微博)在去年底宣布开放其深度学习平台Tensorflow，此外，业内主流的深度学习平台还包括Facebook的Torch，加州伯克利大学的Caffe等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟说，百度的PaddlePaddle平台具备易用、高效、灵活、可伸缩等特点，能够满足多种不同的应用开发需求。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在接受采访时，徐伟重点强调了该平台的易用性特征，他表示，相比谷歌的Tensorflow来说，开发者在使用PaddlePaddle时更容易上手，尤其是对于序列输入、稀疏输入和大规模数据的模型训练有着良好的支持，支持GPU运算、数据并行和模型并行，仅需少量代码就能训练深度学习模型，大大降低了用户使用深度学习技术的成本。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟说，让开发者决定使用哪个平台进行开发的决定因素主要包含几个方面，首先是该平台能否实现自己想实现的功能，其次是使用某平台实现起来的难度有多大，最后是效率有多高。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">本月底，PaddlePaddle将迎来开源后的首次重大更新，徐伟介绍称，此次更新主要是进一步完善对不同操作系统的支持、进一步完善说明文档以及解决不同安全环境下的问题等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">百度开源人工智能技术引起了开发者社区的关注，Facebook深度学习研究员、曾参与谷歌Tensorflow研发的贾扬清评价称，PaddlePaddle有高质量的GPU代码、非常好的RNN（回归神经网络）设计，并且设计很干净，没有太多的抽象表达，这一点比Tensorflow好很多。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟表示，正式开源后，下一步的目标是进一步完善平台的易用性和性能，并增强与开发者群体的沟通，了解他们的需求。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在谈到人工智能行业的发展时，他认为，人工智能行业这两年出现爆发式增长，主要在语音识别、图像识别等领域出现了显著的突破。在谈到人工智能未来发展时，他表示乐观，并认为，未来可能的突破点在于自然语言识别、理解和处理以及机器翻译等方面，另外基于人工智能的”人工助手”的智能化程度也有望进一步加强。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('112', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114715p0as.jpg\" title=\"138679801.jpg\" alt=\"138679801.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">自2013年12月首批企业获牌以来，虚拟运营商发展迅速，目前已有42家企业获得牌照。9月22日，在“ICT中国· 2016高层论坛”移动转售分论坛上，中国通信企业协会披露，目前移动转售业务用户数已超3500万，占全国移动用户人数2.67%。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">不过，移动转售行业也因实名制未落实到位出现诸多“乱象”，尤其“170”号段诈骗多发遭诟病，在“徐玉玉受骗致死”案等多个热点事件的舆论声讨中，虚拟运营商声誉受到重大打击，其融资也受到影响。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>虚拟运营商“很受伤”</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">3年前，第一批企业获得牌照进入试点，中国移动(微博)虚拟运营业方缓缓起步，而经过几年的发展，这一行业已小有规模，不过“成长的烦恼”也使其备受困扰。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国通信企业协会披露的数据显示，移动转售业的发展速度有所下降。自2015年3月起，移动通信转售业务月净增超过100万户，其中2015年10月起连续6个月净增达到200万，然而自2016年1月以来，增速有所放缓，甚至出现“停滞”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">增速降低与行业乱象不无关联。女大学生徐玉玉被骗后昏聩致死使得社会的目光投向虚拟运营商，尤其是因为“实名制”再次被推上风口浪尖。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据央广网2016年8月报道，工信部网络安全管理局对虚拟运营商新入网电话用户实名登记工作暗访，暗访的26家转售企业的109个营销网点中，37个网点存在违规行为，违规占比超三成。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">虚拟运营商“实名制”漏洞也成了舆论谴责的“靶子”。中兴视通显然备受折磨，其CEO邓慕超向与会者“倒苦水”，称自己有时“夜不能寐、梦不能求”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">巴士在线CEO王献蜀在业内摸爬滚打多年，也叫苦不迭，“170贴了一个标签，就是诈骗，虚商也变成了诈骗公司。”王献蜀表示，这让虚拟运营商要“很受伤”，并呼吁业内外应给予虚拟运营商“容错空间”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>声誉受损融资受波及</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国虚拟运营业起步晚于发达国家，而虚拟运营商们盈利困难早已不是新闻，而今，命途多舛的它们又遇“拦路虎”，这也让资本市场对其发展前景打了个问号，虚拟运营商直接受到冲击。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">王献蜀称，“170”号段的问题影响了虚拟运营的融资。“我们很少听到说哪一家虚商拿了多少融资，然后怎么样，多么风光，虚商这个行业几乎都是每一家虚商，每一个老板，每一个企业真金白银自己从口袋里面往外掏钱。”王献蜀表示，从业几年来，他自己已经投入了1.8亿元。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">蜗牛移动CEO陈艳也深有体会，在她看来，虚拟运营商还是个“婴儿”，她表示，英国发展虚拟运营已有18年，虚拟运营的比例占到全行业的12%，而中国发展2、3年达到2.67%，未来还有很大发展空间，但她却感受到了行业内的恐慌。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">融资困境及舆论压力促进了虚拟运营商的反思。9月22日的论坛上，虚拟运营企业代表均坦承，虚拟运营商也是诈骗案的受害者，落实实名制可促使虚拟运营业健康发展。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">今年4月份，工信部发布了《关于加强规范管理，促进移动通信转售业务健康发展》的通知，向移动转售企业提出了落实移动用户实名登记要求的有关具体规定。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据中国通信企业协会常务副会长兼秘书长苗建华介绍，整治以来，虚拟运营商采用系统整改、完善手段、有奖举报等一系列措施取得了一定的成效。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('113', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114919rtom.jpg\" title=\"641.jpg\" alt=\"641.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">李克强总理首赴联合国，首场活动便是出席由联合国倡议举行的联大解决难移民大规模流动问题高级别会议。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这是自联合国成立以来，首次召开的应对难移民问题的高级别会议。同时尤其值得注意的是，这也是中国领导人首次在此种国际场合阐述对于难移民问题的主张。总理的首场与联合国的首次，两者碰撞出怎样的火花?</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">人道主义的价值观，这是李克强主张的要旨。在联合国的讲台上，中国总理的视野超越国别和地域。他将难民和移民问题视为一场“拷问人类社会良知”的人道主义危机，因此郑重向国际社会发出呼吁：“每一个人的生命都是宝贵的，每一个人的尊严都应得到维护，人道主义精神必须弘扬。”中国传统政治伦理中有着人道主义的丰沛思想资源，李克强将其带到联合国讲台上，从而丰富了中国当代外交与政治的实践。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">与此相应，在联合国这个庄严的讲台上，李克强代表中国宣布的3项举措，实打实地彰显了基于人道主义的国际政治理念。中国将这样做：在原有援助规模的基础上，向有关国家和国际组织提供1亿美元的人道主义援助;积极研究把中国-联合国和平与发展基金的部分资金用于支持发展中国家难民移民工作;积极探讨同有关国际机构和发展中国家开展三方合作。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">怎么做，真金白银，某种意义上比怎么说更触及实质。然而这里面有一个厘清“责任观”的问题。中国作为联合国常任理事国，在难移民这一全球性议题上当然有义不容辞的责任。该出手时就出手，正如李克强在当天会议上所言，中国把人道主义援助视为“道义之举”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">同时，中国经济虽有了很大发展，但仍是发展中国家，愿意承担与自身能力相适应的责任。李克强在联合国所承诺的援助资金，是中国的量力而为，我们决不放空炮;所承诺的援助方式，比如使用和平与发展基金的部分资金、开展三方合作等，也是真正的“务实之举”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">更关键的是，李克强的“说”与“做”，在一个更高层面上实现了统一，那就是发展。战乱冲突、贫穷落后是难移民问题的主要根源，实现真正的包容性增长方为治本之策。中国的主张和举措，牢牢把握住了解决问题最关键点——长远和根本地看，出路还蕴藏在发展这一主题中。这也是李克强一直以来在国际外交舞台上所强调的，以发展弥合伤痕、促进平衡、共同向前。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在联合国的首场活动，阐述理念、承诺硬招，李克强总理在这个最高的国际场合，展示了中国“软实力”。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('130', '<p style=\"text-indent: 2em;\">细心的人会观察到，在发表2016年新年贺词的镜头中，习近平总书记办公室有了新变化：新添的7张照片中，有3张记录着总书记和民族地区各族干部群众一起谋发展、话小康的难忘瞬间。</p><p style=\"text-indent: 2em;\"><br/></p><p>　　民族工作关乎大局。党的十八大以来，以习近平同志为总书记的党中央高度重视民族工作，多次深入民族地区调研，体察少数民族群众冷暖。先后召开第二次中央新疆工作座谈会、中央民族工作会议、中央第六次西藏工作座谈会等，对民族工作作出全面部署，力度之大、频次之高、涉面之广、阐述之深，前所未有，一曲新形势下民族工作新乐章在中华大地奏响。</p><p><br/></p><p>　　保持定力：坚持走中国特色解决民族问题的正确道路</p><p><br/></p><p>　　2014年9月，中央民族工作会议在京召开。会上，习近平总书记在坚持党的民族理论政策基本原则的基础上，提出了一系列新思想新观点新举措，为新形势下民族工作提供了行动指南和基本遵循：</p><p><br/></p><p>　　——我国历史演进的这个特点，造就了我国各民族在分布上的交错杂居、文化上的兼收并蓄、经济上的相互依存、情感上的相互亲近，形成了你中有我、我中有你、谁也离不开谁的多元一体格局。</p><p><br/></p><p>　　——新中国成立65年来，党的民族理论和方针政策是正确的，中国特色解决民族问题的道路是正确的，我国民族关系总体是和谐的。</p><p><br/></p><p>　　——同世界上其他国家相比，我国民族工作做得都是最成功的。</p><p><br/></p><p>　　——中华民族和各民族的关系，形象地说，是一个大家庭和家庭成员的关系，各民族的关系是一个大家庭里不同成员的关系。</p><p><br/></p><p>　　——坚持中国特色解决民族问题的正确道路。</p><p><br/></p><p>　　——坚持和完善民族区域自治制度，要做到坚持统一和自治相结合，坚持民族因素和区域因素相结合。</p><p><br/></p><p>　　——做好民族工作，最关键的是搞好民族团结，最管用的是争取人心。</p><p><br/></p><p>　　——城市民族工作要把着力点放在社区，推动建立相互嵌入式的社会结构和社区环境。</p><p><br/></p><p>　　——加强中华民族大团结，长远和根本的是增强文化认同，建设各民族共有精神家园，积极培养中华民族共同体意识。</p><p><br/></p><p>　　——尊重差异、包容多样，通过扩大交往交流交融，创造各族群众共居、共学、共事、共乐的社会条件，让各民族在中华民族大家庭中手足相亲、守望相助。</p><p>　　……</p><p>　　中央民族工作会议的召开，统一思想、坚定信心，在新的历史起点上推动民族团结进步事业踏上新的时代征程。</p><p><br/></p><p>　　大政方针已定，关键就在落实。中央民族工作会议以来，以理论创新为先导，民族工作的政策创新、制度创新、实践创新不断推进。</p><p><br/></p><p>　　——出台贯彻落实《中共中央、国务院关于加强和改进新形势下民族工作的意见》的重要举措分工方案，包括16项47条，条条都是硬举措。相关部委组成联合督查组督促中央民族工作会议精神的贯彻落实。</p><p><br/></p><p>　　——时隔13年召开全国民族教育工作会议，首次召开全国城市民族工作会议……中央民族工作会议精神逐一贯彻，渐次落实。</p><p><br/></p><p>　　——全国31个省、自治区、直辖市和新疆生产建设兵团相继召开贯彻落实中央民族工作会议精神的会议，出台了相关配套文件。</p><p><br/></p><p>　　——为支持民族地区加快发展，输送“真金白银”，研究制定差别化政策：第一次对川甘青交界地区，对南疆四地州，对怒江、凉山、临夏等三个特困自治州，专门制定政策举措。</p><p><br/></p><p>　　——明确少数民族学生高考加分政策，对国家通用语言文字已经普及、教育水平大体相同的地区，逐步缩小差距，逐步做到一律平等；对语言文化差异较大、教育质量还不高的一些地区少数民族学生，除大力普及双语教育、调整专业设置、提高教学质量外，仍是实行高考加分政策，支持少数民族学生取得较好教育水平。</p><p><br/></p><p>　　两年来，中央民族工作会议精神在各地生根发芽、开花结果。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('131', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/101353469a1k.jpg\" title=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\" alt=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">今年的国庆节注定是个不平凡的节日，北京、广州、深圳、苏州、合肥等20个一二线城市相继出台楼市限购限贷政策，“深八条”、“沪六条”等严厉调控措施相继出笼，犹豫在中国大地上引爆了无数颗原子弹，看得人眼花缭乱、心惊肉跳，让人感受到了中国楼市调控“变脸术”之快、之严。&nbsp;</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">社会各界姑且会猜测，这些调控措施付诸实施之后能否成为医治楼市癫狂的灵丹妙药？房地产业服了这些调控药之后是否能走上理性、健康发展轨道？中国民众是否从此不再有楼市猛涨带来的恐慌之虞？回答无疑是否定的。因为这些调控之“药”依然没有摆脱行政窠臼，其结局也就很难跳出行政调控怪圈：“严格管制房价暂时趋缓—放松管制房价暴涨”。也就是说，出台调控措施的这些城市，楼市价格上涨趋势可能暂时会缓一缓，但过后可能又将迎来新一轮量价齐涨周期。因为中国从2005年3月底的“国八条”算起，短短十年间，中国房地产市场虽经历过无数次调控，无论是国务院的各项“通知”，还是九部委、七部委的各种“意见”，都没能阻挡住房价上涨的步伐；不少城市的房价比2005年翻了几番甚至十番都不止。每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这是为什么呢？道理其实很简单，因为我们楼市调控政策存在严重问题：一是没有理顺楼市调控的目的到底是什么，是控制住房价让老百姓买得起房，还是不要过于严厉让房地产开发商能有钱赚和地方财政有收入可进？正因为楼市调控政策总是处于摇摆不定状态，忽而严厉、忽而放松，缺乏长久可持续调控政策措施，让房地产开发商及各级地方政府形成了“耐药性”，使调控功效被抵消。二是没有割断地方政府与房地产业发展之间的各种利益关系，是让楼市调控步入市场运行机制、让市场充分发挥自发调节作用，还是继续伸出行政权力之手来生硬地管制房价或分割利益？由于这种利益关系没理顺，使一些地方政府难下决心认真调控，致使调控政策得不到认真落实走形变样；同时也会更加诱发一些地方政府竭力追求土地财政、推高房价获得足够收入搞高楼房、宽马路等城市形象政绩工程建设，使调控陷入了“死胡同”。三是没有足够底牌或也不愿意拿出有效手段来对冲楼市上涨带来的压力，使楼市调控政策软弱无力。比如保障房、经济适用房等建设速度缓慢、数量严重短缺，把一大批城市中低收入人群也逼向商品房购买行列，更加剧了楼市非理性上涨；也让政府对楼市非正常上涨现象缺乏必要平抑措施，只能望楼市价格上涨兴叹。四是对楼市上涨失控城市政府调控不力、楼市中存在各种违规行为及投机炒作行为缺乏必要法治惩治手段，使楼市失常状况难得到及时扭转。如调控政策出台之后，没有一个地方政府领导因楼市调控措施落实不力受到严肃问责，丢下官帽；没有一个开发商因弄虚作假、违规开发而被罚得倾家荡产；更没有一个楼市投机炒作者被追究刑责入狱。于是地方政府调控措施执行不力已司空见惯，开发商违规行为让人熟视无睹，投机商哄抬房价打乱楼市现象更是让人见怪不怪。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">由此，目前中国一二线城市楼市调控政策不能只求一时轰动效应，而应把追求实实在在的长久调控效果放在首位，推动楼市调控彻底走出“屡涨屡调，屡调屡涨”怪圈：首先，制定富有弹性的楼市调控政策，确立楼市调控近期目标、中期目标和长远目标，分阶段实施，消除狂风暴雨式调控模式；把楼市调控政策制定要交给各级地方政府，建立目标考核责任制，将其纳入施政目标，让民众来打分评价，对民众不满意或房价涨幅过大的地方政府领导实施行政降级、行政记过、诫勉谈话等问责处罚，增强楼市调控政策的严肃性。其次，进一步厘清行政干预与市场调节的界限，确立地方政府在房地产市场中的责任；将房地产市场纳入法治监管轨道，对楼市调控不力的地方政府、违法违规的房地产开发及哄抬房价扰乱楼市秩序的投机商追究刑事责任，增强楼市调控的法治威慑力。再次，应尽快终结土地财政，加快税收制度改革步伐，将中央政府与地方政府事权与财权改革到位，消除地方政府对土地财政的依赖，楼市疯狂暴涨和挤泡沫才真正有希望。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('132', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10135526bcqb.jpg\" title=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\" alt=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">三年前，中国大妈们抢购黄金的记忆还历历在目，没想到如今的黄金又开始了一轮又一轮的下跌。接连的破位下跌，再次有人开始蠢蠢欲动，想着投资抄底，再加上中国房地产市场的调控力度不断加大，那么会不会有一部分投资热钱也会进入到黄金市场呢？其实，投资市场历来有句名言是买涨不买跌。不过，对于黄金这种相对常见的避险投资工具来说，很多人买了就是资产配置和“囤货”，并不是简单的投资或者快速的出手，她们持有的耐心和时间更长，因此任何一个低价的出现，都有可能成为触发市场投资的一种诱惑。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">连续下跌，何时是个头？</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">今年的“十一黄金周”期间，黄金价格已经跌破1,300美元/盎司的重要支撑。10月1日～7日，纽约商业交易所（COMEX）黄金大跌4.5%，创下一年来最大单周跌幅，其中上周二跌幅超过3.3%，也创下了2013年12月以来单日最大跌幅。10月4日，现货金价一度跌破1270美元/盎司关口，白银一度跌破18美元关口，跌幅超过5%，多次刷新英国脱欧公投以来最低。市场对欧佩克限产协议不断炒作，原油看涨情绪升温。这都使黄金的价格不被看好。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">市场对全球央行货币政策转向，担忧流动性逆转是黄金下跌的主要原因。其实在8月份之后，全球资本市场人士普遍猜测，各国将统一行动，主要在结构性改革、财政政策上发力，货币政策可能接近极限，全球的流动性将很快出现逆转。黄金价格的剧烈波动，就是对这一猜测的又一次市场反应。如果全球货币宽松走到尽头，那么利率将缓慢上升，全球的债券牛市也将终结。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">摩根大通统计的数据显示，今年英国退欧公投后，欧英日三大央行的季度资产购买规模连创新高。目前美欧英日四大央行的资产负债表已高达13万亿美元之巨，已占全球GDP的40%。预计在今年最后一个季度，欧英日三大央行将“加印”5060亿美元在市场上购买资产，创2009年美联储首推QE以来的最大季度规模。高盛表示，基于全球经济增长仍面临持续下行风险，同时市场可能仍在质疑货币政策应对任何经济潜在冲击的能力。因此，金价跌破每盎司1250美元可能是一个战略性的购买机会。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">值得关注的是，中国央行一直是购买黄金的主力。最新数据显示，截至9月末，国内黄金储备从2014年6月的1054.1吨大幅增加74%至1838.53吨。据中国黄金协会报导，2015年中国生产黄金515.88吨，黄金产量连续九年保持世界第一，黄金消费量连续三年保持世界第一。今年有望继续保持这一势头。不过，今年的黄金需求较往年有明显的回落。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">来自Wind数据统计显示，目前，共有4家拥有黄金业务的上市公司发布了公司的前三季度业绩预报，而从预报结果来看，金价的变化，让这些公司的投资者暂时松了口气。“预计前三季度归属于上市公司股东的净利润变动幅度为增长350.00%至400.00%；同期归属于上市公司股东的净利润变动区间为9847.85万元至10942.05万元；业绩变动的原因是成本下降，黄金价格上升。”</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('140', '<p>任职资格:<br/>1、大专及以上学历，计算机相关专业<br/>2、有一年及以上Java或者安卓开发经验者优先考虑<br/>3、有责任心，能独立思考问题</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('143', '<p>中国共产党纪律处分条例</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('199', '<p>tt</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('205', '<p style=\"margin: 13px 0px 25px; line-height: 2em;\"><span style=\"color: rgb(89, 89, 89);\">党的十八大以来，以习近平同志为核心的党中央坚持从发展中国特色社会主义、实现中华民族伟大复兴中国梦的战略高度，系统部署和全面推进网络安全和信息化工作。我国互联网发展和治理不断开创新局面，网络空间日渐清朗，信息化成果惠及亿万群众，网络安全保障能力不断增强，网络空间命运共同体主张获得国际社会广泛认同。中国网信事业勇立潮头、踏浪而行，阔步迈入新时代。</span></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('206', '<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">2018年以来，针对当前网络视频行业存在的突出问题，国家主管部门以约谈、整改、下架等一系列“组合重拳”，为一路狂飙的网络视频行业踩下“急刹车”。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">这只是党的十八大以来党和政府依法管网、猛药治疴的一个缩影。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">“网络是把双刃剑，一定要严厉打击好好整治这些乱象”“支持整改！严管这些给社会带来负能量的主播们”……网民们点赞支持的声潮，映射着广大人民群众对建设网上美好精神家园的期盼。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">网络空间是亿万民众共同的精神家园。网络空间天朗气清、生态良好，符合人民利益。网络空间乌烟瘴气、生态恶化，不符合人民利益。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">习近平总书记强调，我们要本着对社会负责、对人民负责的态度，依法加强网络空间治理，加强网络内容建设，做强网上正面宣传，培育积极健康、向上向善的网络文化，用社会主义核心价值观和人类优秀文明成果滋养人心、滋养社会，做到正能量充沛、主旋律高昂，为广大网民特别是青少年营造一个风清气正的网络空间。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">党的十九大报告指出，加强互联网内容建设，建立网络综合治理体系，营造清朗的网络空间。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">党的十八大以来，按照“正能量是总要求、管得住是硬道理”的要求，有关部门密切配合、协同发力、综合治理。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">——网络安全法、《互联网新闻信息服务管理规定》《互联网用户公众账号信息服务管理规定》《互联网群组信息服务管理规定》等一批法律法规相继出台，为依法管网、办网、用网提供基本依据。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">——“净网”“剑网”“清源”“护苗”等一系列专项治理行动及网站管理人员失信黑名单制度无缝衔接，网络谣言、网络色情、“伪基站”等网络乱象得到有效整治，网络空间日渐清朗。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">——“网络媒体走转改”“中国好网民工程”“网上公益工程”及国家网络安全宣传周等一批项目成功实施，公民网络文明素养大幅提升，健康向上的网络生态传递正能量。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">……</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">从《“一带一路”大道之行》到《小账本连着大情怀》，从“砥砺奋进的五年”到“厉害了，我的国”……党的十八大以来，重大主题宣传综合运用互联网传播方式手段，形成“往实里走、往深里走、往心里走”的刷屏效应。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">从“中国梦”践行者故事网络传播工程到中国原创游戏精品出版工程，从“两微一端”百佳评选到网络正能量“五个一百”精品评选，中华优秀传统文化网上传承与当代中国正能量传播齐头并进，弘扬网上网下“同心圆”的家国情怀。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">灾难中的守望相助、见义勇为中的无私无畏、邻里间的相互关爱、公益事业中的慷慨解囊……党的十八大以来，互联网正日益成为社会主义核心价值体系的有益传播者，让那些感动中国的好人好事、浸润心灵的良知义举通过真实、正面、健康的传播为网民和公众熟知，为构建社会主义和谐社会凝心聚力。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">网络空间正日益成为正能量的策源地和亿万民众共同的精神家园。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('207', '<p style=\"margin: 13px 0px 25px; line-height: 2em;\"><span style=\"font-family: &quot;Microsoft YaHei&quot;; text-align: justify; text-indent: 32px; background-color: rgb(255, 255, 255); color: rgb(89, 89, 89); font-size: 14px;\">在外打工的“80后”姑娘梁倩娟回到家乡开起网店创业后，给村里带来不小的震动：仅仅靠着一根网线，轻敲几下键盘，就把地里种的庄稼、树上结的核桃、山里长的野菜变成了钱，生意越做越红火。如今，梁倩娟的线上销售收入累计达到450多万元，还带动村里30多个贫困户长期给网店供货，找到了脱贫的门路。</span></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('208', '<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);margin-top: 33px;\">推动网络发展，用好数字力量，是促进社会进步、增进人民福祉的基础性工程。党的十八大以来，在以习近平同志为核心的党中央高度重视和频密部署下，“网络扶贫行动”如春风拂遍神州大地，为决胜全面小康增添助力。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">——目前我国建档立卡贫困村通宽带比例超过86%，今年有望提前超额完成“十三五”规划纲要提出的“宽带网络覆盖90%以上的贫困村”的目标。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">——499个国家级贫困县已纳入电子商务进农村综合示范支持范围，占全部贫困县的60%。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">——网络扶贫行动大数据分析平台，有效支撑贫困人口的精准识别、精准施策、精准退出。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">——100多家网信企业与深度贫困地区开展结对帮扶，实施网络助学、“春蕾计划”、“母亲水窖”等网络公益项目。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">“网信事业要发展，必须贯彻以人民为中心的发展思想。”党的十八大以来，“数字红利”加快释放，“互联网+”深入百姓生活。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">在车辆穿梭的深圳街头，城市交通大脑借助互联网大数据，由车流量来决定全市红绿灯的运营配时，使车流监测准确率达到95%以上，道路通行能力提高8%以上，30分钟就能形成交通情报精准推送。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">在游人如织的福建武夷山，15个主要景区实现智慧旅游，除了为游客提供吃、住、行、游、购、娱等服务外，还运用智能计算和科学预判，分析汇总游客数据、景区情况。</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">在人头攒动的北京市丰台区不动产登记事务中心，“一窗办理”的综合服务窗口让很多原本以为跑断腿的群众一次就办好所有手续，切实感受到“最多跑一次”的便利……</p><p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">从远程课堂带领山里娃迈过“数字鸿沟”到寻亲平台帮助失踪儿童回家，从在线培训让果农喜获丰收到互联网政务“让群众少跑腿”，从共享模式带来便捷舒适到“互联网+”带动双创热潮……党的十八大以来，我国网信事业着力补齐民生短板、提升公共服务，不断解决面对人民日益增长的美好生活需要和不平衡不充分的发展之间的矛盾。用得上、用得起、用得好的信息服务正在惠及更多百姓，亿万人民在共享互联网发展成果上拥有更多获得感、幸福感和安全感。</p><p style=\"margin-bottom: 25px;\"><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('209', '<p style=\"line-height: 2em; margin: 13px 0px 25px;\"><span style=\"font-family: &quot;Microsoft YaHei&quot;; text-align: justify; text-indent: 32px; background-color: rgb(255, 255, 255); color: rgb(89, 89, 89);\">4月，美丽榕城福州即将迎来主题为“以信息化驱动现代化，加快建设数字中国”的首届数字中国建设峰会。这是贯彻落实习近平总书记关于网络强国战略思想的重要举措，将进一步引导信息化发展更好地满足人民日益增长的美好生活需要。更加便捷、高效的数字体验指日可待。</span></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('210', '<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);margin-top: 33px;\">\n    2018年3月，作为全球最大社交平台之一的Facebook遭遇信任危机，超过5000万名用户个人资料疑遭泄露。此前，类似事件屡见不鲜：全球连锁酒店支付系统被黑客入侵，大量数据外泄；勒索病毒在全球大范围内爆发……\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    “聪者听于无声，明者见于未形。”党的十八大以来，习近平总书记深刻指出“没有网络安全就没有国家安全”，为推动我国网络安全体系的建立，树立正确的网络安全观指明了方向。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    哪里有无视法律法规的铤而走险，哪里就有互联网监管和执法。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    ——国家网信办牵头编制研究提出信息网络专项立法规划，积极推进网络安全法、电子商务法、未成年人网络保护条例等重要法律法规立法进程。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    ——《中华人民共和国电信条例》《计算机软件保护条例》《信息网络传播权保护条例》等相关法律、法规、规章和司法解释加快出台。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    ——网络安全法正式施行，将网络安全各项工作带入法治化轨道。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    ——《国家网络空间安全战略》《通信网络安全防护管理办法》《电话用户真实身份信息登记规定》《公共互联网网络安全突发事件应急预案》等配套规章、规划和政策文件相继出台。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    ——通过对微信、新浪微博、淘宝网、京东商城等10款网络产品和服务的隐私条款进行评审，企业违法违规收集用户隐私信息的行为得到有效整改。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    ——网络安全审查、数据出境安全评估、个人信息保护等重要制度逐步建立，共同为网络安全织就“牢不可破”的制度防线。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    网络安全，需要关键信息基础设施作保障。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    一张小小卡片，能够阻止非接触式敏感信息的获取；在线签证核身技术，从源头对非法入境行为进行识别和拦截；国内首个网络安全保险，为广大网民提供更多保障……党的十八大以来，针对“物理隔离”防线可被跨网入侵，电力调配指令可被恶意篡改，金融交易信息可被窃取等重大风险隐患，金融、能源、电力、通信、交通等领域的关键信息基础设施建设突飞猛进、不断创新，正在织密网络安全的防护网，打造国家安全的金钟罩。\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    “网络安全为人民，网络安全靠人民，维护网络安全是全社会共同责任，需要政府、企业、社会组织、广大网民共同参与，共筑网络安全防线。”\n</p>\n<p style=\"vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; padding: 0px; margin-top: 0px; margin-bottom: 28px; border: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal; background-color: rgb(255, 255, 255);\">\n    “网络空间安全”成为一级学科,“网络空间安全学院”在多所大学落地；中国网络空间安全协会等各类新型网络社会组织纷纷成立，连续4年举办的国家网络安全宣传周走入社区……党的十八大以来,各方面齐抓共管的良好局面已经形成，网络安全的共治共建渐入佳境。\n</p>\n<p style=\"margin: 0px 0px 25px;\">\n    <br/>\n</p>', null, null, null);

-- ----------------------------
-- Table structure for jc_content_type
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_type`;
CREATE TABLE `jc_content_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL COMMENT '名称',
  `img_width` int(11) DEFAULT NULL COMMENT '图片宽',
  `img_height` int(11) DEFAULT NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容类型表';

-- ----------------------------
-- Records of jc_content_type
-- ----------------------------
INSERT INTO `jc_content_type` VALUES ('1', '普通', '100', '100', '0', '0');
INSERT INTO `jc_content_type` VALUES ('2', '图文', '510', '288', '1', '0');
INSERT INTO `jc_content_type` VALUES ('3', '焦点', '280', '200', '1', '0');
INSERT INTO `jc_content_type` VALUES ('4', '头条', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for jc_custom_form
-- ----------------------------
DROP TABLE IF EXISTS `jc_custom_form`;
CREATE TABLE `jc_custom_form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(100) NOT NULL COMMENT '表单名',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `is_member_meun` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否会员菜单',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `tpl_submit_url` varchar(100) DEFAULT NULL COMMENT '模板提交路径',
  `tpl_view_url` varchar(100) DEFAULT NULL COMMENT '模板列表路径',
  `start_time` datetime DEFAULT NULL COMMENT '表单发起时间',
  `end_time` datetime DEFAULT NULL COMMENT '表单结束时间',
  `all_site` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否全站:0否 1是',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用:0否 1是',
  `day_limit` int(11) NOT NULL DEFAULT '0' COMMENT '每日限制提交数',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `workflow_id` int(11) DEFAULT NULL COMMENT '工作流id',
  PRIMARY KEY (`form_id`),
  KEY `fk_jc_custom_form_site` (`site_id`),
  KEY `fk_jc_custom_form_user` (`user_id`),
  CONSTRAINT `fk_jc_custom_form_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_custom_form_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义表单';

-- ----------------------------
-- Records of jc_custom_form
-- ----------------------------

-- ----------------------------
-- Table structure for jc_custom_form_filed
-- ----------------------------
DROP TABLE IF EXISTS `jc_custom_form_filed`;
CREATE TABLE `jc_custom_form_filed` (
  `filed_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `label` varchar(100) NOT NULL COMMENT '字段名',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在记录列表中显示',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填项',
  PRIMARY KEY (`filed_id`),
  KEY `fk_jc_filed_form` (`form_id`),
  CONSTRAINT `fk_jc_filed_form` FOREIGN KEY (`form_id`) REFERENCES `jc_custom_form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义表单字段表';

-- ----------------------------
-- Records of jc_custom_form_filed
-- ----------------------------

-- ----------------------------
-- Table structure for jc_custom_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_custom_record`;
CREATE TABLE `jc_custom_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0:未审核 1:审核中 2:已终审',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`record_id`),
  KEY `fk_jc_custom_record_form` (`form_id`),
  KEY `fk_jc_custom_record_site` (`site_id`),
  KEY `fk_jc_custom_record_user` (`user_id`),
  CONSTRAINT `fk_jc_custom_record_form` FOREIGN KEY (`form_id`) REFERENCES `jc_custom_form` (`form_id`),
  CONSTRAINT `fk_jc_custom_record_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_custom_record_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义表单记录表';

-- ----------------------------
-- Records of jc_custom_record
-- ----------------------------

-- ----------------------------
-- Table structure for jc_custom_record_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_custom_record_attr`;
CREATE TABLE `jc_custom_record_attr` (
  `record_id` int(11) NOT NULL,
  `filed_name` varchar(30) NOT NULL COMMENT '字段名',
  `filed_value` varchar(255) DEFAULT NULL COMMENT '字段值',
  KEY `fk_jc_attr_record` (`record_id`),
  CONSTRAINT `fk_jc_attr_record` FOREIGN KEY (`record_id`) REFERENCES `jc_custom_record` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义表单记录属性表';

-- ----------------------------
-- Records of jc_custom_record_attr
-- ----------------------------

-- ----------------------------
-- Table structure for jc_custom_record_check
-- ----------------------------
DROP TABLE IF EXISTS `jc_custom_record_check`;
CREATE TABLE `jc_custom_record_check` (
  `record_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核步数',
  `check_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退回',
  `reviewer` int(11) DEFAULT NULL COMMENT '终审者',
  `check_date` datetime DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`record_id`),
  KEY `fk_jc_custom_record_check` (`reviewer`),
  CONSTRAINT `fk_jc_custom_record` FOREIGN KEY (`record_id`) REFERENCES `jc_custom_record` (`record_id`),
  CONSTRAINT `fk_jc_custom_record_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义表单记录审核表';

-- ----------------------------
-- Records of jc_custom_record_check
-- ----------------------------

-- ----------------------------
-- Table structure for jc_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_department`;
CREATE TABLE `jc_department` (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `site_id` int(11) DEFAULT '0' COMMENT '站点',
  `priority` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `weights` int(11) NOT NULL DEFAULT '1' COMMENT '权重(值越大，级别越高)',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级部门ID',
  PRIMARY KEY (`depart_id`),
  KEY `fk_jc_department_site` (`site_id`),
  KEY `fk_jc_jc_department_parent` (`parent_id`),
  CONSTRAINT `fk_jc_jc_department_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_department` (`depart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of jc_department
-- ----------------------------
INSERT INTO `jc_department` VALUES ('1', '一级部门', null, '1', '1', null);

-- ----------------------------
-- Table structure for jc_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `jc_dictionary`;
CREATE TABLE `jc_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `value` varchar(255) NOT NULL COMMENT 'value',
  `type` varchar(255) NOT NULL COMMENT 'type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of jc_dictionary
-- ----------------------------
INSERT INTO `jc_dictionary` VALUES ('1', '10-20人', '10-20人', 'scale');
INSERT INTO `jc_dictionary` VALUES ('2', '20-50人', '20-50人', 'scale');
INSERT INTO `jc_dictionary` VALUES ('3', '50-10人', '50-10人', 'scale');
INSERT INTO `jc_dictionary` VALUES ('4', '100人以上', '100人以上', 'scale');
INSERT INTO `jc_dictionary` VALUES ('5', '私企', '私企', 'nature');
INSERT INTO `jc_dictionary` VALUES ('6', '股份制', '股份制', 'nature');
INSERT INTO `jc_dictionary` VALUES ('7', '国企', '国企', 'nature');
INSERT INTO `jc_dictionary` VALUES ('8', '互联网', '互联网', 'industry');
INSERT INTO `jc_dictionary` VALUES ('9', '房地产', '房地产', 'industry');
INSERT INTO `jc_dictionary` VALUES ('10', '加工制造', '加工制造', 'industry');
INSERT INTO `jc_dictionary` VALUES ('11', '服务行业', '服务行业', 'industry');

-- ----------------------------
-- Table structure for jc_directive_tpl
-- ----------------------------
DROP TABLE IF EXISTS `jc_directive_tpl`;
CREATE TABLE `jc_directive_tpl` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '标签描述',
  `code` text COMMENT '标签代码',
  `user_id` int(11) NOT NULL COMMENT '标签创建者',
  PRIMARY KEY (`tpl_id`),
  KEY `fk_jc_directive_tpl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FComment';

-- ----------------------------
-- Records of jc_directive_tpl
-- ----------------------------

-- ----------------------------
-- Table structure for jc_file
-- ----------------------------
DROP TABLE IF EXISTS `jc_file`;
CREATE TABLE `jc_file` (
  `file_path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名字',
  `file_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `content_id` int(11) DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`file_path`),
  KEY `fk_jc_file_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_file
-- ----------------------------
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/07153215jvdp.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/071602579szt.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08115859ckxn.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08130539wlkq.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/081308131i31.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08131324qxgj.jpg', 'Koala.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08131909mb17.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08132618srr1.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08142930q3z0.jpg', 'Lighthouse.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08143328riqh.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08144203pv6h.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08144845j3hi.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/0814574227ff.jpg', 'Koala.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08153341h5kf.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/081540446zh7.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08154457owxq.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08162007z439.jpg', 'Koala.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08163120qhnr.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08163405vdzf.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08163630dep1.jpg', 'Koala.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08164000g8gn.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08164546ih8b.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08165608yvd2.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08170248modk.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08170328e9nk.jpg', 'Penguins.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08170350t373.jpg', 'Tulips.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08170433u11f.jpg', 'Penguins.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08171146t2qj.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/081712044hmt.jpg', 'Lighthouse.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08171221besl.jpg', 'Lighthouse.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08171237iwhu.jpg', 'Tulips.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/081713008osd.jpg', 'Hydrangeas.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08171509xgx5.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08171539i5ie.jpg', 'Lighthouse.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/081718166giq.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08171907dn5e.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/08172632qico.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/090917496b2i.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/09092930e9hy.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/090932320v40.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/09093401j83d.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/09093924luiy.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/091342599wkf.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/09142258fmq5.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/09142719x13k.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/09143017hvb0.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/09144031212v.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/09145545au7m.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201703/09154526gesb.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201704/27102128g9d6.docx', 'JEECMS测试问题总结170421.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201704/27102156g8qg.docx', 'JEECMS测试问题总结170421.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201704/27102216808e.txt', 'jeecms问题.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201705/09140700bgk3.jpg', '94i58PICwVU.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201705/09145345itqp.png', '1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201705/091455584rii.png', '1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201705/09145614flbh.jpg', '94i58PICwVU.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201705/10171027rm4r.png', '1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201706/26105809zfjx.png', '1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201706/26110347gtxt.jpg', '94i58PICwVU.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201706/26110717zlsx.jpg', '94i58PICwVU.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201706/26111129qa5o.png', '1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201706/26111138x0fi.png', '1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201709/27114425e9x4.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201709/271144415azm.jpg', 'Koala.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www1.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www//03000801005A1FF9948E554FDB41D5F2AAD4B0-86D5-0FD9-1085-B127A5378330.mp4', '03000801005A1FF9948E554FDB41D5F2AAD4B0-86D5-0FD9-1085-B127A5378330.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/031522589b4q.png', '031522589b4q.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/03152327ckuv.log', '03152327ckuv.log', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/08150638q3zr.mp4', '08150638q3zr.mp4', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/08153906dmjk.jpg', '08153906dmjk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/081540214khn.jpg', '081540214khn.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/08154224b4zl.jpg', '08154224b4zl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/08155845dhts.jpg', '08155845dhts.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/08160110rjjx.jpg', '08160110rjjx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/081602097gfq.jpg', '081602097gfq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/08162230t0wf.jpg', '08162230t0wf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/081625537bo9.jpg', '081625537bo9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/08162651u5t0.jpg', '08162651u5t0.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09084324ngx9.jpg', '09084324ngx9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09084441ekq4.jpg', '09084441ekq4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/090856097ubn.jpg', '090856097ubn.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09090047s4f3.jpg', '09090047s4f3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09090353ajbq.jpg', '09090353ajbq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09090458gbjf.jpg', '09090458gbjf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09091802b9f8.jpg', '09091802b9f8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09091815xfgh.zip', '09091815xfgh.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09092620ycam.jpg', '09092620ycam.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09093641911h.zip', '09093641911h.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09093730gdon.jpg', '09093730gdon.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09093737rmu4.jpg', '09093737rmu4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09093742npfe.jpg', '09093742npfe.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094223qoss.jpg', '09094223qoss.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/090942324qyi.jpg', '090942324qyi.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094320ca4r.zip', '09094320ca4r.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094742hsfj.zip', '09094742hsfj.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094751f2z7.jpg', '09094751f2z7.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094754qm6l.jpg', '09094754qm6l.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/090954430ill.jpg', '090954430ill.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/0909545080vq.jpg', '0909545080vq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09095552jgle.zip', '09095552jgle.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091001282fzx.png', '091001282fzx.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09100149g9w7.jpg', '09100149g9w7.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/0910015324yn.jpg', '0910015324yn.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09100206ul4w.zip', '09100206ul4w.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09100623ll5a.jpg', '09100623ll5a.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09100627cx8n.jpg', '09100627cx8n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09100649yil9.zip', '09100649yil9.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09100920v0ma.jpg', '09100920v0ma.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09100927aa5v.jpg', '09100927aa5v.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09100951u3mj.zip', '09100951u3mj.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091012398gtn.zip', '091012398gtn.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09101254xyms.jpg', '09101254xyms.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09101300t91x.jpg', '09101300t91x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091014491wcv.jpg', '091014491wcv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09101455xo8k.jpg', '09101455xo8k.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091015133utq.zip', '091015133utq.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/100.png', '100.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101.png', '101.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10100842hqdk.jpg', '10100842hqdk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10100850mssf.jpg', '10100850mssf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10100951y2xy.jpg', '10100951y2xy.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1010095517rc.jpg', '1010095517rc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101010021q7v.jpg', '101010021q7v.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10101006fqv3.jpg', '10101006fqv3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10110628vfwz.jpg', '10110628vfwz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10110634gxcz.jpg', '10110634gxcz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10110654vib6.jpg', '10110654vib6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10110756cg7o.zip', '10110756cg7o.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10111518cqda.zip', '10111518cqda.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10111549rupn.jpg', '10111549rupn.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101116034e14.jpg', '101116034e14.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10111618rhdk.jpg', '10111618rhdk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10111758q1kj.zip', '10111758q1kj.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101119026ukx.jpg', '101119026ukx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101119092w8r.jpg', '101119092w8r.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10112023kqfp.jpg', '10112023kqfp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101120330mpz.jpg', '101120330mpz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101120397iez.zip', '101120397iez.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10112554wirt.zip', '10112554wirt.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10112657zklb.jpg', '10112657zklb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10112706jiii.jpg', '10112706jiii.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10112814u17l.zip', '10112814u17l.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10112839cvwx.jpg', '10112839cvwx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10112845wryq.jpg', '10112845wryq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101130257966.zip', '101130257966.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10113032zu0k.jpg', '10113032zu0k.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101130399dbt.jpg', '101130399dbt.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101131571wkz.zip', '101131571wkz.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10113218ya2p.jpg', '10113218ya2p.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10113226knhj.jpg', '10113226knhj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101133341nc3.zip', '101133341nc3.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10113354g71e.jpg', '10113354g71e.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10113400utfn.jpg', '10113400utfn.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10113459gvbx.zip', '10113459gvbx.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10113506jz07.jpg', '10113506jz07.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1011351336l0.jpg', '1011351336l0.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10113551yru8.jpg', '10113551yru8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101135560ne4.jpg', '101135560ne4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101136270k36.zip', '101136270k36.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10114452yjhh.jpg', '10114452yjhh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10114510l7x1.jpg', '10114510l7x1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10114704dsba.jpg', '10114704dsba.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10114715p0as.jpg', '10114715p0as.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10114919rtom.jpg', '10114919rtom.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101308178wzr.jpg', '101308178wzr.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101310383u27.jpg', '101310383u27.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101311003aey.jpg', '101311003aey.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101311098e8w.jpg', '101311098e8w.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101314450fs1.jpg', '101314450fs1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10131516fhw7.jpg', '10131516fhw7.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101315235s7b.jpg', '101315235s7b.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101315314qdt.jpg', '101315314qdt.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101317064t3l.jpg', '101317064t3l.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10131742wzhv.jpg', '10131742wzhv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10131759kpti.jpg', '10131759kpti.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10131811udfh.jpg', '10131811udfh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101320442qbi.jpg', '101320442qbi.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1013205987uh.jpg', '1013205987uh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132108kvcd.jpg', '10132108kvcd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132117q0se.jpg', '10132117q0se.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132128e9mz.jpg', '10132128e9mz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101321427ybi.jpg', '101321427ybi.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132253w0rj.jpg', '10132253w0rj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132256evzu.jpg', '10132256evzu.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132301wue2.jpg', '10132301wue2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101323052xt2.jpg', '101323052xt2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132310d08y.jpg', '10132310d08y.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132315avlw.jpg', '10132315avlw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132322exj1.jpg', '10132322exj1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132327lk40.jpg', '10132327lk40.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132336658k.jpg', '10132336658k.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132342mxeq.jpg', '10132342mxeq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132347qr6a.jpg', '10132347qr6a.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101326014zdc.jpg', '101326014zdc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101326217xkx.jpg', '101326217xkx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132629r00n.jpg', '10132629r00n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10132635f63e.jpg', '10132635f63e.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10133449hwwr.jpg', '10133449hwwr.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10133454sydj.jpg', '10133454sydj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10133506taqx.jpg', '10133506taqx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10133511s7r1.jpg', '10133511s7r1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101335147ye6.jpg', '101335147ye6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10133710to3f.jpg', '10133710to3f.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101338015yhf.mp4', '101338015yhf.mp4', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10133842aiyf.png', '10133842aiyf.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10133954jfoc.jpg', '10133954jfoc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101340004te2.png', '101340004te2.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101340393eav.png', '101340393eav.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10134048htcl.jpg', '10134048htcl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10134238qppo.jpg', '10134238qppo.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10134440wmng.jpg', '10134440wmng.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101345564pok.jpg', '101345564pok.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101346227ayf.jpg', '101346227ayf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101346473kic.jpg', '101346473kic.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10134720z8a5.jpg', '10134720z8a5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101353469a1k.jpg', '101353469a1k.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10135526bcqb.jpg', '10135526bcqb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1014082583ov.jpg', '1014082583ov.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10141115d2dm.jpg', '10141115d2dm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10141350dw2t.jpg', '10141350dw2t.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10141429q19h.jpg', '10141429q19h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/101415435gn1.jpg', '101415435gn1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10141936fd0q.jpg', '10141936fd0q.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10142436t9pe.jpg', '10142436t9pe.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10163704qo36.odt', '10163704qo36.odt', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10163704qo36.txt', '10163704qo36.txt', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/102.png', '102.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/103.png', '103.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/104.png', '104.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/105.png', '105.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/106.png', '106.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/107.png', '107.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/108.png', '108.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/109.png', '109.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11.png', '11.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/110.png', '110.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/110911592mxa.jpg', '110911592mxa.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/110919049wkh.jpg', '110919049wkh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11092148co74.jpg', '11092148co74.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11092540p27t.jpg', '11092540p27t.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11092701sxi4.jpg', '11092701sxi4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11093237z5e8.jpg', '11093237z5e8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094215kqsv.jpg', '11094215kqsv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094229szn0.jpg', '11094229szn0.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094234lj78.jpg', '11094234lj78.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094239ard1.jpg', '11094239ard1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094243v534.jpg', '11094243v534.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094246016h.jpg', '11094246016h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094250fq4t.jpg', '11094250fq4t.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094254usxs.jpg', '11094254usxs.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094257nm5d.jpg', '11094257nm5d.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094309iwnb.jpg', '11094309iwnb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11094419duy6.jpg', '11094419duy6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111.png', '111.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11111659rnpb.mp4', '11111659rnpb.mp4', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11111729glis.docx', '11111729glis.docx', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11111755u5w4.jpg', '11111755u5w4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11111806t1hj.mp4', '11111806t1hj.mp4', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11111832o7zz.jpg', '11111832o7zz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111118456g3w.docx', '111118456g3w.docx', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111118588poy.mp4', '111118588poy.mp4', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11112051yx2x.mp4', '11112051yx2x.mp4', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111121133pnh.mp4', '111121133pnh.mp4', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111121213xss.docx', '111121213xss.docx', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11112126ed99.jpg', '11112126ed99.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11112910l4qa.jpg', '11112910l4qa.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11113157dh9e.jpg', '11113157dh9e.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1114540004ww.jpg', '1114540004ww.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111454124i8g.jpg', '111454124i8g.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/112.png', '112.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/113.png', '113.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/114.png', '114.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/115.png', '115.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/116.png', '116.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/117.png', '117.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/118.png', '118.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/119.png', '119.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12.png', '12.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/120.png', '120.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121.png', '121.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/122.png', '122.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/123.png', '123.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/124.png', '124.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/125.png', '125.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/126.png', '126.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/127.png', '127.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/128.png', '128.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/129.png', '129.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13.png', '13.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/130.png', '130.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131.png', '131.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13103353l0rl.png', '13103353l0rl.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131035049a54.png', '131035049a54.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13103723gjne.png', '13103723gjne.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13103724lwp5.png', '13103724lwp5.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13103724wi3l.png', '13103724wi3l.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1310372501bw.png', '1310372501bw.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13103813zfv9.png', '13103813zfv9.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13103824db3u.png', '13103824db3u.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131554026zkz.png', '131554026zkz.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13155428hyo0.png', '13155428hyo0.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131607103um2.png', '131607103um2.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165058b8tu.jpg', '13165058b8tu.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172414ickb.jpg', '13172414ickb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131724151oj9.jpg', '131724151oj9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131724167oxy.jpg', '131724167oxy.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172416e6sm.jpg', '13172416e6sm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172417xkr2.jpg', '13172417xkr2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131724186kjb.jpg', '131724186kjb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172418jg88.jpg', '13172418jg88.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172419bvxp.jpg', '13172419bvxp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131724202idz.jpg', '131724202idz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172420q663.jpg', '13172420q663.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172421trri.jpg', '13172421trri.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172422056z.jpg', '13172422056z.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172422b780.jpg', '13172422b780.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172423ffmr.jpg', '13172423ffmr.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1317242425o5.jpg', '1317242425o5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172424sf1p.jpg', '13172424sf1p.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172425kgg3.jpg', '13172425kgg3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172425nsdu.jpg', '13172425nsdu.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172426abui.jpg', '13172426abui.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172427iznz.jpg', '13172427iznz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13172427t8rn.jpg', '13172427t8rn.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/132.png', '132.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/133.png', '133.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/134.png', '134.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/135.png', '135.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/136.png', '136.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/137.png', '137.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/138.png', '138.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/139.png', '139.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/14.png', '14.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/140.png', '140.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/141.png', '141.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/14104949937k.png', '14104949937k.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/14105049o6jq.png', '14105049o6jq.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/14105106sphr.png', '14105106sphr.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/14171503ss9n.png', '14171503ss9n.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/14172504v15c.png', '14172504v15c.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/150846487ry1.png', '150846487ry1.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15112842nhcx.jpg', '15112842nhcx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143710qqqk.jpg', '15143710qqqk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143710ro0w.jpg', '15143710ro0w.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143711cwu4.jpg', '15143711cwu4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143711jrc1.jpg', '15143711jrc1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143711uaoy.jpg', '15143711uaoy.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143734d7vv.jpg', '15143734d7vv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143739c9cw.jpg', '15143739c9cw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143744jbxp.jpg', '15143744jbxp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143749niil.jpg', '15143749niil.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15143752uk5e.jpg', '15143752uk5e.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151439449cqt.jpg', '151439449cqt.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15144722d5ed.jpg', '15144722d5ed.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1514502565fl.jpg', '1514502565fl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15151518at9k.jpg', '15151518at9k.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15151518filn.jpg', '15151518filn.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151515198cbq.jpg', '151515198cbq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15151532rq6j.jpg', '15151532rq6j.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151515331ilw.jpg', '151515331ilw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1515153339uo.jpg', '1515153339uo.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151515490s6a.jpg', '151515490s6a.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151515584kkx.jpg', '151515584kkx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151516043sn0.jpg', '151516043sn0.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15151628h566.jpg', '15151628h566.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15151721umfm.jpg', '15151721umfm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151517299eg2.jpg', '151517299eg2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15151738qvyq.jpg', '15151738qvyq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15151745x8x9.jpg', '15151745x8x9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15152240vbaj.jpg', '15152240vbaj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15152251zlwh.jpg', '15152251zlwh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151523086j8h.jpg', '151523086j8h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151530033koq.jpg', '151530033koq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153012bpfd.jpg', '15153012bpfd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153034m1rr.jpg', '15153034m1rr.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153052j190.jpg', '15153052j190.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153110yn2c.jpg', '15153110yn2c.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153127qs41.jpg', '15153127qs41.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153212rjvo.jpg', '15153212rjvo.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1515325323eh.jpg', '1515325323eh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153307441e.jpg', '15153307441e.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153321t1g3.jpg', '15153321t1g3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153439hfcl.jpg', '15153439hfcl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/151535152u22.jpg', '151535152u22.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15153547uv22.jpg', '15153547uv22.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15154001xgx4.jpg', '15154001xgx4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15154012zjaq.jpg', '15154012zjaq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15154044yijq.jpg', '15154044yijq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15154249ucra.jpg', '15154249ucra.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15154302mvu4.jpg', '15154302mvu4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15154338b6h9.jpg', '15154338b6h9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15154354xp50.jpg', '15154354xp50.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/15154421y33m.jpg', '15154421y33m.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/152.png', '152.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/153.png', '153.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/181641524nzf.jpg', '181641524nzf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191123392b33.png', '191123392b33.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19112339h89t.png', '19112339h89t.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19112340284b.png', '19112340284b.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141038z1oi.png', '19141038z1oi.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141039p0m5.png', '19141039p0m5.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141129f6g4.jpg', '19141129f6g4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141143l95w.jpg', '19141143l95w.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141205t5d9.jpg', '19141205t5d9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141216070j.jpg', '19141216070j.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141242pppk.jpg', '19141242pppk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141245pju5.png', '19141245pju5.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141333lfub.png', '19141333lfub.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141401ja9u.png', '19141401ja9u.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141439dmu8.png', '19141439dmu8.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141521jkex.png', '19141521jkex.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141816yiyn.png', '19141816yiyn.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141851tc4m.png', '19141851tc4m.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141857vcd3.png', '19141857vcd3.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141939kdil.png', '19141939kdil.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142033fu5h.jpg', '19142033fu5h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142101t6ph.jpg', '19142101t6ph.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1914221692cs.png', '1914221692cs.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142227i3ee.jpg', '19142227i3ee.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1914230968h5.jpg', '1914230968h5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142342h33w.jpg', '19142342h33w.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142414bvfg.jpg', '19142414bvfg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142446ch8y.jpg', '19142446ch8y.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142513not2.jpg', '19142513not2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142548un62.jpg', '19142548un62.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142605p9xl.jpg', '19142605p9xl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142734bpnp.png', '19142734bpnp.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19143003se1f.png', '19143003se1f.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19143047y3p0.png', '19143047y3p0.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191431021pfp.png', '191431021pfp.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19143216vdn5.png', '19143216vdn5.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19143401s0lk.png', '19143401s0lk.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19143458nie8.png', '19143458nie8.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19143719dh5g.png', '19143719dh5g.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191440187jtg.png', '191440187jtg.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144018lw4v.png', '19144018lw4v.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144101jj0x.png', '19144101jj0x.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144127xmxp.png', '19144127xmxp.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144128rla4.png', '19144128rla4.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144211q7wh.png', '19144211q7wh.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144211zj3b.png', '19144211zj3b.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144242yrj3.png', '19144242yrj3.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191442436rtb.png', '191442436rtb.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191443321zxd.png', '191443321zxd.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144332dln4.png', '19144332dln4.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144411cc9v.png', '19144411cc9v.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19144412tgye.png', '19144412tgye.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19145112kmxd.png', '19145112kmxd.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19145149hbt2.png', '19145149hbt2.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19145232cd92.png', '19145232cd92.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191454169ckk.png', '191454169ckk.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19145632opl3.png', '19145632opl3.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19145632w2ht.png', '19145632w2ht.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191457017nuu.png', '191457017nuu.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19145701ugn3.png', '19145701ugn3.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19145723e9us.png', '19145723e9us.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19145724xxxk.png', '19145724xxxk.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150017jlcs.png', '19150017jlcs.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150017wafs.png', '19150017wafs.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150303qrtr.png', '19150303qrtr.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150303s8pz.png', '19150303s8pz.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150327edv4.png', '19150327edv4.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150327iorh.png', '19150327iorh.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150430mnua.png', '19150430mnua.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150430zsie.png', '19150430zsie.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1915050152f5.png', '1915050152f5.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150501pl7e.png', '19150501pl7e.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1915055168yi.png', '1915055168yi.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150551oilb.png', '19150551oilb.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191506374mdk.png', '191506374mdk.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150638bflg.png', '19150638bflg.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150730rvp3.png', '19150730rvp3.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19150730ytdj.png', '19150730ytdj.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19152319tjq4.png', '19152319tjq4.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19152412hzzi.png', '19152412hzzi.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191535032l85.png', '191535032l85.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19153503qjwl.png', '19153503qjwl.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19153920h4eu.png', '19153920h4eu.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19154055s1o7.png', '19154055s1o7.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191544366efu.png', '191544366efu.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19154641z4av.png', '19154641z4av.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191547450q92.png', '191547450q92.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19154854sed0.png', '19154854sed0.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19155012rfja.png', '19155012rfja.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19155535g178.png', '19155535g178.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191556168oxh.png', '191556168oxh.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191557592avc.png', '191557592avc.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19155839xtw8.png', '19155839xtw8.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191559127g8a.png', '191559127g8a.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19155948ohk3.png', '19155948ohk3.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191601382uqh.png', '191601382uqh.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19160214xqcz.png', '19160214xqcz.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19160256yti4.png', '19160256yti4.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201607/19141129f6g4.jpg', 'qweq.jpg', '1', '13');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201607/19141205t5d9.jpg', 'MAIN201607190815465375224112529.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201607/19142033fu5h.jpg', 'zxc.jpg', '1', '14');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201608/30174757ffr0.jpg', '255901999.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103353l0rl.png', 'small-prev-page-on.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/131035049a54.png', 'm-sj.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103723gjne.png', 'small-prev-page-on.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103724lwp5.png', 'small-next-page.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103724wi3l.png', 'small-next-page-on.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/1310372501bw.png', 'small-prev-page.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103813zfv9.png', 'member-nav.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103824db3u.png', 'm-sj.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19152319tjq4.png', 'zsr.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19152412hzzi.png', 'zsr.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191535032l85.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19153503qjwl.png', 'zsr.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19153920h4eu.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19154055s1o7.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191544366efu.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19154641z4av.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191547450q92.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19154854sed0.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155012rfja.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155535g178.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191556168oxh.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191557592avc.png', 'zsr.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155839xtw8.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191559127g8a.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155948ohk3.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191601382uqh.png', 'txsj.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19160214xqcz.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19160256yti4.png', 'txcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/22165418ezkw.jpg', 'vs.jpg', '1', '28');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23091850z61y.jpg', 'ttsf.jpg', '1', '32');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23092240hxg8.jpg', 'adff.jpg', '1', '33');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23093922giys.jpg', 'bc.jpg', '1', '36');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/230942139uh5.jpg', 'xcv.jpg', '1', '37');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23095358y6s6.jpg', 'qw.jpg', '1', '39');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23100710845n.jpg', 'sf.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23150119m7z0.jpg', 'zsf.jpg', '1', '27');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26101908i5ds.jpg', 'video02.jpg', '1', '53');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26102008qcao.jpg', 'video04.jpg', '1', '55');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26102115joze.jpg', 'video06.jpg', '1', '57');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/261022192w54.jpg', 'video08.jpg', '1', '59');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26102904f2l8.jpg', 'video12.jpg', '1', '61');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26103003hrib.jpg', 'video11.jpg', '1', '63');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/261635496465.zip', '演示.zip', '1', '69');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26164039i3uv.jpg', 'dl-QQ.jpg', '1', '69');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/261640457r2n.jpg', 'dl_top.jpg', '1', '69');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27094715plsz.jpg', 'download02.jpg', '0', '71');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/270953566xxw.jpg', 'content-bdy.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27095528bd43.jpg', 'download02.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/270958122ljv.jpg', 'content-bdy.jpg', '1', '71');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27095816s3y8.jpg', 'dl-bdy.jpg', '1', '71');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/271002022fag.zip', '演示.zip', '1', '71');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27101510bh0o.jpg', 'download03.jpg', '1', '72');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27101514u0i9.jpg', 'content-360sd.jpg', '1', '72');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27101524dxj7.jpg', 'dl-360shadu.jpg', '1', '72');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27102743993k.zip', '演示.zip', '1', '72');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27103024lgp2.jpg', 'download02.jpg', '0', '71');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/271031297jwc.jpg', 'download02.jpg', '0', '71');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27103421zh99.jpg', 'download04.jpg', '0', '71');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27103503tm30.jpg', 'download04.jpg', '0', '71');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/29093250bbit.jpg', 'a0a3201e6a6ca24c4c918f56bbb212d5.jpg', '1', '74');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/30114226529k.jpg', 'wenku_item02.jpg', '1', '68');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/301143025tdb.jpg', 'wenku_item03.jpg', '1', '67');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08153906dmjk.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/081540214khn.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08154224b4zl.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08155845dhts.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08160110rjjx.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/081602097gfq.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08162230t0wf.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08162651u5t0.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10100842hqdk.jpg', 'topic_title03.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10100850mssf.jpg', 'topic03.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10100951y2xy.jpg', 'topic_title02.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/1010095517rc.jpg', 'topic02.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101010021q7v.jpg', 'topic_title01.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10101006fqv3.jpg', 'topic01.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10110628vfwz.jpg', 'content-nycs.jpg', '1', '100');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10110634gxcz.jpg', 'dl-nycs.jpg', '1', '100');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10110654vib6.jpg', 'download01.jpg', '1', '100');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10110756cg7o.zip', '演示.zip', '1', '100');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10111518cqda.zip', '演示.zip', '1', '101');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10111549rupn.jpg', 'content-xunlei.jpg', '1', '101');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101116034e14.jpg', 'download05.jpg', '1', '101');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10111618rhdk.jpg', 'dl-xunlei7.jpg', '1', '101');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10111758q1kj.zip', '演示.zip', '1', '102');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101119026ukx.jpg', 'content-360safe.jpg', '1', '102');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101119092w8r.jpg', 'dl-360safe.jpg', '1', '102');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10112023kqfp.jpg', 'content-sougou.jpg', '1', '103');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101120330mpz.jpg', 'dl-sougou.jpg', '1', '103');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101120397iez.zip', '演示.zip', '1', '103');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10112554wirt.zip', '演示.zip', '1', '104');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10112657zklb.jpg', 'content-yy.jpg', '1', '104');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10112706jiii.jpg', 'dl-YY.jpg', '1', '104');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10112814u17l.zip', '演示.zip', '1', '105');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10112839cvwx.jpg', 'content-ali.jpg', '1', '105');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10112845wryq.jpg', 'dl-aliwwmaijia.jpg', '1', '105');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101130257966.zip', '演示.zip', '1', '106');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10113032zu0k.jpg', 'content-iqy.jpg', '1', '106');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101130399dbt.jpg', 'dl-QIY.jpg', '1', '106');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101131571wkz.zip', '演示.zip', '1', '107');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10113218ya2p.jpg', 'content-google.jpg', '1', '107');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10113226knhj.jpg', 'dl-google.jpg', '1', '107');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101133341nc3.zip', '演示.zip', '1', '108');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10113354g71e.jpg', 'content-360exp.jpg', '1', '108');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10113400utfn.jpg', 'dl-360exp.jpg', '1', '108');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10113459gvbx.zip', '演示.zip', '1', '109');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10113506jz07.jpg', 'content-pptv.jpg', '1', '109');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/1011351336l0.jpg', 'dl-PPTV.jpg', '1', '109');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10113551yru8.jpg', 'content-txsp.jpg', '1', '110');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101135560ne4.jpg', 'dl-txsp.jpg', '1', '110');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101136270k36.zip', '演示.zip', '1', '110');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10114452yjhh.jpg', 'zxcvx.jpg', '1', '111');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10114704dsba.jpg', 'cb.jpg', '1', '112');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101308178wzr.jpg', 'df.jpg', '1', '114');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101314450fs1.jpg', 'banner02.jpg', '1', '115');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101317064t3l.jpg', 'xZ.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10131759kpti.jpg', '5672662427112447485.jpg', '1', '116');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101320442qbi.jpg', 'zdsad.jpg', '1', '117');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10132253w0rj.jpg', 'sf.jpg', '1', '118');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101326014zdc.jpg', 'banner02.jpg', '1', '119');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10133449hwwr.jpg', 'vjkhk.jpg', '1', '120');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10133710to3f.jpg', 'video_banner02.jpg', '1', '121');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10133842aiyf.png', 'video_Btn02.png', '1', '121');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10133954jfoc.jpg', 'video_banner01.jpg', '1', '122');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101340004te2.png', 'video_Btn01.png', '1', '122');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101340393eav.png', 'video_Btn03.png', '1', '123');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10134048htcl.jpg', 'video_banner03.jpg', '1', '123');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10134238qppo.jpg', 'video10.jpg', '1', '124');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10134440wmng.jpg', 'video01.jpg', '1', '125');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101345564pok.jpg', 'video09.jpg', '1', '126');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101346227ayf.jpg', 'video07.jpg', '1', '127');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101346473kic.jpg', 'video05.jpg', '1', '128');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10134720z8a5.jpg', 'zdsad.jpg', '1', '129');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/1014082583ov.jpg', 'wenku_item05.jpg', '1', '133');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10141115d2dm.jpg', 'wenku_item07.jpg', '1', '134');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10141350dw2t.jpg', 'wenku_item08.jpg', '1', '135');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10141429q19h.jpg', 'wenku_item09.jpg', '1', '136');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101415435gn1.jpg', 'wenku_item06.jpg', '1', '137');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10141936fd0q.jpg', 'wenku_item04.jpg', '1', '138');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10142436t9pe.jpg', 'wenku_item111.jpg', '1', '139');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/110911592mxa.jpg', 'hlwjia.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/110919049wkh.jpg', 'qglh.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11092148co74.jpg', 'qglh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11092540p27t.jpg', 'zph.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11092701sxi4.jpg', 'zph.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11093237z5e8.jpg', 'fghj.jpg', '1', '141');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11111659rnpb.mp4', '/u/cms/www/201610/11111659rnpb.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11111729glis.docx', '测试.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11111806t1hj.mp4', '/u/cms/www/201610/11111806t1hj.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111118456g3w.docx', '测试.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111118588poy.mp4', '/u/cms/www/201610/111118588poy.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11112051yx2x.mp4', '/u/cms/www/201610/11112051yx2x.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111121133pnh.mp4', '/u/cms/www/201610/111121133pnh.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111121213xss.docx', '测试.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11112910l4qa.jpg', '3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11113157dh9e.jpg', '0.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07153946sy50.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07154443fq4h.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07155335nmd0.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/071553564zv8.jpg', 'Hydrangeas.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07162949xofa.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07163640xj1f.jpg', 'Penguins.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07163736pjqb.jpg', 'Hydrangeas.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/0717121233yu.jpg', 'Hydrangeas.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/071715128umq.jpg', 'Penguins.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07171739wtoa.jpg', 'Lighthouse.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07172138heaf.png', '1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/071724121ru9.jpg', 'Koala.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07172517j7g0.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/07172934ios0.jpg', 'Tulips.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/071730015sp4.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08083748p65z.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08084359l5c5.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08084533isda.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08084642w0lq.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/080903281z8z.jpg', 'Koala.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08091004y0i3.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08091307mbvz.jpg', 'Lighthouse.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/080915441lnm.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08092155b1cg.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/080928573iyw.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08093638uwrh.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08095222suq0.jpg', 'Desert.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08112333lka5.jpg', 'Jellyfish.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08112911hd86.jpg', 'Tulips.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08115329phpx.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08134308us8d.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/081405256amm.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/0814100289fl.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201703/08141335a8zp.jpg', 'Chrysanthemum.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093458gynd.jpg', '22093458gynd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093502mmft.jpg', '22093502mmft.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093506l8pv.jpg', '22093506l8pv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093509qm3l.jpg', '22093509qm3l.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093513srmf.jpg', '22093513srmf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094752xoxd.jpg', '22094752xoxd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094906lrj8.jpg', '22094906lrj8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094911xe9x.jpg', '22094911xe9x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094915t8h1.jpg', '22094915t8h1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094918gnze.jpg', '22094918gnze.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100555lytj.jpg', '22100555lytj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100558gfsb.jpg', '22100558gfsb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100601l1us.jpg', '22100601l1us.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100606t8mw.jpg', '22100606t8mw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100611o2gl.jpg', '22100611o2gl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22165418ezkw.jpg', '22165418ezkw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23.png', '23.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23085954rqcq.jpg', '23085954rqcq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23090004hdq8.jpg', '23090004hdq8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23090250np8q.jpeg', '23090250np8q.jpeg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23090548etpm.jpeg', '23090548etpm.jpeg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23090548etyp.png', '23090548etyp.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/230906198i4y.jpeg', '230906198i4y.jpeg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23091328t6lo.jpg', '23091328t6lo.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23091345zzun.jpg', '23091345zzun.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23091850z61y.jpg', '23091850z61y.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/230919031knf.jpg', '230919031knf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23092240hxg8.jpg', '23092240hxg8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23092247x1xp.jpg', '23092247x1xp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23092636hos2.jpg', '23092636hos2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23092643bq90.jpg', '23092643bq90.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23093046loeh.jpg', '23093046loeh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23093052865p.jpg', '23093052865p.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23093922giys.jpg', '23093922giys.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/230939278x02.jpg', '230939278x02.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/230942139uh5.jpg', '230942139uh5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23094218axhy.jpg', '23094218axhy.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/230943156ihf.jpg', '230943156ihf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/2309464696op.jpg', '2309464696op.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23094658mdfq.jpg', '23094658mdfq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23094715mfnm.jpg', '23094715mfnm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/230947237ufx.jpg', '230947237ufx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23094737nia9.jpg', '23094737nia9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23094801oky4.jpg', '23094801oky4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23094818p0f4.jpg', '23094818p0f4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23094829rx73.jpg', '23094829rx73.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23094843zrec.jpg', '23094843zrec.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23094857n5f9.jpg', '23094857n5f9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/230951174hpz.jpg', '230951174hpz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23095358y6s6.jpg', '23095358y6s6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/230954058tco.jpg', '230954058tco.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23100710845n.jpg', '23100710845n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23140225zalw.jpg', '23140225zalw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23150119m7z0.jpg', '23150119m7z0.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23150528k9xt.jpg', '23150528k9xt.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23150631g5hd.jpg', '23150631g5hd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172935t4sb.jpg', '23172935t4sb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172936acob.jpg', '23172936acob.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172937bli1.jpg', '23172937bli1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172937r23n.jpg', '23172937r23n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172939ln5a.jpg', '23172939ln5a.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/231729407e1v.jpg', '231729407e1v.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/231729434x7h.jpg', '231729434x7h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172944o38x.jpg', '23172944o38x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172944vvdh.jpg', '23172944vvdh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172946mzqx.jpg', '23172946mzqx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172947nrrl.jpg', '23172947nrrl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24102446b7al.jpg', '24102446b7al.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24102503z9wj.jpg', '24102503z9wj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/2416455972ro.jpg', '2416455972ro.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/241646340nq6.jpg', '241646340nq6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24164707ksjq.jpg', '24164707ksjq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26101811jq67.jpg', '26101811jq67.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26101908i5ds.jpg', '26101908i5ds.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26101940fhxg.jpg', '26101940fhxg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26102008qcao.jpg', '26102008qcao.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/261020362ixm.jpg', '261020362ixm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26102115joze.jpg', '26102115joze.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/261021529cvc.jpg', '261021529cvc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/261022192w54.jpg', '261022192w54.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26102833kwea.jpg', '26102833kwea.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26102904f2l8.jpg', '26102904f2l8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26102938l8dp.jpg', '26102938l8dp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26103003hrib.jpg', '26103003hrib.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26103129282p.jpg', '26103129282p.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/261032209l74.jpg', '261032209l74.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26103256ajnk.jpg', '26103256ajnk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/261100456d57.png', '261100456d57.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26110107z08y.png', '26110107z08y.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26110126dj7w.png', '26110126dj7w.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26115537aper.jpg', '26115537aper.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26115537rs0f.jpg', '26115537rs0f.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26150136kryi.txt', '26150136kryi.txt', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/261635496465.zip', '261635496465.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26164039i3uv.jpg', '26164039i3uv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/261640457r2n.jpg', '261640457r2n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27.png', '27.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/2708543620bx.zip', '2708543620bx.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/270917181hy7.jpg', '270917181hy7.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27094021gxrf.jpg', '27094021gxrf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27094025c7fk.jpg', '27094025c7fk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27094715plsz.jpg', '27094715plsz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/270953566xxw.jpg', '270953566xxw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27095528bd43.jpg', '27095528bd43.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/270958122ljv.jpg', '270958122ljv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27095816s3y8.jpg', '27095816s3y8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/271002022fag.zip', '271002022fag.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27101510bh0o.jpg', '27101510bh0o.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27101514u0i9.jpg', '27101514u0i9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27101524dxj7.jpg', '27101524dxj7.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27102743993k.zip', '27102743993k.zip', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27103024lgp2.jpg', '27103024lgp2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/271031297jwc.jpg', '271031297jwc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27103421zh99.jpg', '27103421zh99.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/27103503tm30.jpg', '27103503tm30.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/276.png', '276.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/28.png', '28.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/288.png', '288.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/29.png', '29.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/29093250bbit.jpg', '29093250bbit.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/291.png', '291.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/30.png', '30.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/30114226529k.jpg', '30114226529k.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/301143025tdb.jpg', '301143025tdb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/30114336u4tz.jpg', '30114336u4tz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/30174757ffr0.jpg', '30174757ffr0.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/32.png', '32.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/33.png', '33.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/36.png', '36.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/37.png', '37.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/39.png', '39.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/43.png', '43.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/44.png', '44.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/45.png', '45.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/46.png', '46.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/47.png', '47.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/48.png', '48.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/49.png', '49.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/50.png', '50.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/51.png', '51.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/53.png', '53.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/55.png', '55.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/57.png', '57.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/59.png', '59.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/61.png', '61.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/63.png', '63.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/67.png', '67.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/68.png', '68.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/69.png', '69.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/7.png', '7.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/71.png', '71.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/72.png', '72.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/74.png', '74.png', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/codeimg', 'codeimg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/Thumbs.db', 'Thumbs.db', '1', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13135536pnt2.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131359296e9c.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/1314055350gc.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140606bjte.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140635xydz.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140702pfne.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140909s64p.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13141723ywh0.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13142644qpdm.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131429269ikl.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131431450xia.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131431578u9o.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/1316123792p0.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13163251c8d5.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131634322gqg.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131636277cxi.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13163934xmp0.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13164248ng73.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13165347xxty.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13170503bwpw.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13170603q1bw.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131706463pqt.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13172446osvy.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13172626x71c.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13173752etj3.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13173805fii8.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14091703u57k.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14091741h0w0.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14092030cnyx.mp4', '18183451i5bi.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14092835ljai.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095531y5tg.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095543za61.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095551kk1a.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095759mdqw.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14102936l7gw.txt', 'freemarker.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14104521p9ey.zip', 'bbs-update-2012-11-2.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14105137jxtn.mp4', '/v6/u/cms/www/201403/14105137jxtn.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14112725dsar.zip', '/v6/u/cms/www/201403/14112725dsar.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14130702z3xz.png', '/v6/u/cms/www/201403/14130702z3xz.png', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14165746s64i.pdf', '1.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/1914315903bj.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/20151821gj8y.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2015202141s0.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211128348kuw.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2111305770l1.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21113452hsxh.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211137096eif.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211149148tx0.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21115759y8sm.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211511276v74.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21151948k1fh.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21154820xtfs.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2115485050rw.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21155236mk9b.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22084701xqxy.doc', '/v6/u/cms/www/201404/22084701xqxy.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22084833ys27.doc', '/v6/u/cms/www/201404/22084833ys27.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22111217hftv.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22111332dwt3.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22114143pw1a.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22132355vqdf.txt', 'IBM LDAP.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22133304pnoh.txt', '/v6/u/cms/www/201404/22133304pnoh.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22133312pz3j.exe', 'wpp.exe', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22135235m1m1.txt', 'cmstop.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22135348pbqp.swf', '2.swf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/221353537d0o.doc', 'discuz_2.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140446zkgv.txt', 'jeecms新bug.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140629jx27.txt', '360检测.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140634er4n.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140716e5bk.flv', '/v6/u/cms/www/201404/22140716e5bk.flv', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22141101f9tv.txt', '360检测.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22141404irh6.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22142207xrqx.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22145137jigp.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22145142drkb.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/221501301rkt.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22151702mcwi.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22152145c9do.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22152231wfrv.mp4', '/v6/u/cms/www/201404/22152231wfrv.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155743mgws.txt', 'bug平台推荐.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155756p9of.txt', 'flot柱状图.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155756scdn.txt', 'flot使用笔记.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/28134316erf3.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/281402505i20.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/28140346452f.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/30140543hzlx.gif', 'webLogo.gif', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08091845sh2l.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092143cyap.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092249ype2.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092924h3fr.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08093111b3jm.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/09083819wiab.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/090840146ik7.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/090918028k13.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09144419786f.txt', 'bbs好的功能.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09145849ap2u.docx', '1.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09151219pj5s.doc', '2.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/0915215434ij.txt', 'cmstop.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/121650299xv9.doc', 'DiscuzX2文件说明,目录说明.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/12165642273e.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/12170522j2ct.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30093714q9ic.mp4', '/v6/u/cms/www/201407/30093714q9ic.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30130947bmm3.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30170627hj1m.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31114444inln.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31114945lp9t.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31115246futn.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31115423u7e6.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31132254zdh7.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201409/03105035q9em.mp4', '/v6/u/cms/www/201409/03105035q9em.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201409/03105050xcbs.txt', 'bug平台推荐.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201312/241031214kys.txt', '/v6/wenku/www/201312/241031214kys.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/16164720tu2n.doc', '/v6/wenku/www/201401/16164720tu2n.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17083718btie.doc', '/v6/wenku/www/201401/17083718btie.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17084032522j.doc', '/v6/wenku/www/201401/17084032522j.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/170842070sy2.doc', '/v6/wenku/www/201401/170842070sy2.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17084442fd08.doc', '/v6/wenku/www/201401/17084442fd08.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17085101zvcg.doc', '/v6/wenku/www/201401/17085101zvcg.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/25095002cniq.doc', '/v6/wenku/www/201401/25095002cniq.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/10115402nl6c.docx', '/v6/wenku/www/201403/10115402nl6c.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/1011550974pv.docx', '/v6/wenku/www/201403/1011550974pv.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/101155409soa.txt', '/v6/wenku/www/201403/101155409soa.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/10115750uxwh.txt', '/v6/wenku/www/201403/10115750uxwh.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04132656esvy.pdf', '/v6/wenku/www/201406/04132656esvy.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133131ky4f.pdf', '/v6/wenku/www/201406/04133131ky4f.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133159jryy.pdf', '/v6/wenku/www/201406/04133159jryy.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133312rszg.pdf', '/v6/wenku/www/201406/04133312rszg.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133437555h.pdf', '/v6/wenku/www/201406/04133437555h.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133611h3sa.pdf', '/v6/wenku/www/201406/04133611h3sa.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/041340029cmx.pdf', '/v6/wenku/www/201406/041340029cmx.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/0413413473t5.pdf', '/v6/wenku/www/201406/0413413473t5.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/041353368k3b.doc', '/v6/wenku/www/201406/041353368k3b.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04135541s2ay.doc', '/v6/wenku/www/201406/04135541s2ay.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201408/08112543cj83.pdf', '/v6/wenku/www/201408/08112543cj83.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201408/08131514njo0.pdf', '/v6/wenku/www/201408/08131514njo0.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201411/061426416ze3.doc', '/v6/wenku/www/201411/061426416ze3.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201411/07142936mhzk.docx', '/v6/wenku/www/201411/07142936mhzk.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201411/07143112x1tn.docx', '/v6/wenku/www/201411/07143112x1tn.docx', '0', null);

-- ----------------------------
-- Table structure for jc_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink`;
CREATE TABLE `jc_friendlink` (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '网站名称',
  `domain` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(150) DEFAULT NULL COMMENT '图标',
  `email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`),
  KEY `fk_jc_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_jc_friendlink_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `jc_friendlink_ctg` (`friendlinkctg_id`),
  CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';

-- ----------------------------
-- Records of jc_friendlink
-- ----------------------------
INSERT INTO `jc_friendlink` VALUES ('1', '1', '1', 'JEECMS官网', 'http://www.jeecms.com', null, 'jeecms@163.com', 'JEECMS是JavaEE版网站管理系统（Java Enterprise Edition Content Manage System）的简称。Java凭借其强大、稳定、安全、高效等多方面的优势，一直是企业级应用的首选。', '35', '1', '1');
INSERT INTO `jc_friendlink` VALUES ('2', '1', '1', 'JEEBBS论坛', 'http://bbs.jeecms.com', null, 'jeecms@163.com', 'JEEBBS论坛', '5', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('3', '1', '2', '京东商城', 'http://www.360buy.com/', '/u/cms/www/201112/1910271036lr.gif', '', '', '4', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('4', '1', '2', '当当网', 'http://www.dangdang.com/', '/u/cms/www/201112/191408344rwj.gif', '', '', '1', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('5', '1', '2', '亚马逊', 'http://www.amazon.cn/', '/u/cms/www/201112/19141012lh2q.gif', '', '', '2', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('6', '1', '2', 'ihush', 'http://www.ihush.com/', '/u/cms/www/201112/19141255yrfb.gif', '', '', '1', '1', '10');

-- ----------------------------
-- Table structure for jc_friendlink_ctg
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink_ctg`;
CREATE TABLE `jc_friendlink_ctg` (
  `friendlinkctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlinkctg_id`),
  KEY `fk_jc_friendlinkctg_site` (`site_id`),
  CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';

-- ----------------------------
-- Records of jc_friendlink_ctg
-- ----------------------------
INSERT INTO `jc_friendlink_ctg` VALUES ('1', '1', '文字链接', '1');
INSERT INTO `jc_friendlink_ctg` VALUES ('2', '1', '品牌专区（图片链接）', '2');
INSERT INTO `jc_friendlink_ctg` VALUES ('4', '1', '', '10');

-- ----------------------------
-- Table structure for jc_group
-- ----------------------------
DROP TABLE IF EXISTS `jc_group`;
CREATE TABLE `jc_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `need_captcha` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要验证码',
  `need_check` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要审核',
  `allow_per_day` int(11) NOT NULL DEFAULT '4096' COMMENT '每日允许上传KB',
  `allow_max_file` int(11) NOT NULL DEFAULT '1024' COMMENT '每个文件最大KB',
  `allow_suffix` varchar(255) DEFAULT 'jpg,jpeg,gif,png,bmp' COMMENT '允许上传的后缀',
  `is_reg_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认会员组',
  `allow_file_size` int(11) NOT NULL DEFAULT '4096' COMMENT '每个上传文库的文件大小限制kB',
  `allow_file_total` int(11) NOT NULL DEFAULT '0' COMMENT '上传总数限制(0没有限制)',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS会员组表';

-- ----------------------------
-- Records of jc_group
-- ----------------------------
INSERT INTO `jc_group` VALUES ('1', '普通会员', '2', '1', '1', '10', '1000', 'jpg,png,bmp,gif,txt,doc,docx,xls,xlsx,ppt,pptx,wps,odt', '1', '1024', '10');
INSERT INTO `jc_group` VALUES ('2', '高级组', '10', '1', '1', '0', '0', '', '0', '4096', '0');
INSERT INTO `jc_group` VALUES ('3', 'vip', '11', '1', '1', '0', '0', '', '0', '4096', '0');

-- ----------------------------
-- Table structure for jc_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook`;
CREATE TABLE `jc_guestbook` (
  `guestbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '留言会员',
  `admin_id` int(11) DEFAULT NULL COMMENT '回复管理员',
  `ip` varchar(50) NOT NULL COMMENT '留言IP',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `replay_time` datetime DEFAULT NULL COMMENT '回复时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`guestbook_id`),
  KEY `fk_jc_ctg_guestbook` (`guestbookctg_id`),
  KEY `fk_jc_guestbook_admin` (`admin_id`),
  KEY `fk_jc_guestbook_member` (`member_id`),
  KEY `fk_jc_guestbook_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='CMS留言';

-- ----------------------------
-- Records of jc_guestbook
-- ----------------------------
INSERT INTO `jc_guestbook` VALUES ('3', '1', '1', null, '1', '117.41.152.66', '2016-10-10 15:02:04', null, '1', '1');
INSERT INTO `jc_guestbook` VALUES ('4', '1', '1', null, '1', '117.41.152.66', '2016-10-10 15:07:53', null, '1', '1');
INSERT INTO `jc_guestbook` VALUES ('5', '1', '1', null, '1', '117.41.152.66', '2016-10-10 15:08:41', null, '1', '1');
INSERT INTO `jc_guestbook` VALUES ('6', '1', '1', null, '1', '117.41.152.66', '2016-10-10 15:09:06', null, '1', '1');
INSERT INTO `jc_guestbook` VALUES ('7', '9', '2', '1', null, '127.0.0.1', '2018-06-09 15:31:55', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('8', '9', '3', '1', null, '127.0.0.1', '2018-06-09 15:36:13', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('9', '9', '4', '1', null, '127.0.0.1', '2018-06-09 15:38:28', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('10', '9', '4', '1', null, '127.0.0.1', '2018-06-09 15:48:53', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('11', '1', '2', '1', null, '127.0.0.1', '2018-06-09 15:58:19', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('12', '9', '4', '1', null, '127.0.0.1', '2018-06-09 15:58:45', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('13', '9', '4', '1', null, '127.0.0.1', '2018-06-09 15:59:48', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('14', '9', '4', '1', null, '127.0.0.1', '2018-06-09 16:11:14', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('15', '9', '3', '1', null, '127.0.0.1', '2018-06-09 16:12:04', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('16', '9', '3', '1', null, '127.0.0.1', '2018-06-09 16:33:26', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('17', '9', '3', '7', '1', '127.0.0.1', '2018-06-09 16:37:03', null, '1', '0');

-- ----------------------------
-- Table structure for jc_guestbook_ctg
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ctg`;
CREATE TABLE `jc_guestbook_ctg` (
  `guestbookctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`guestbookctg_id`),
  KEY `fk_jc_guestbookctg_site` (`site_id`),
  CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS留言类别';

-- ----------------------------
-- Records of jc_guestbook_ctg
-- ----------------------------
INSERT INTO `jc_guestbook_ctg` VALUES ('1', '1', '普通', '1', '普通留言');
INSERT INTO `jc_guestbook_ctg` VALUES ('2', '1', '投诉', '10', '投诉');
INSERT INTO `jc_guestbook_ctg` VALUES ('3', '9', '专家咨询', '10', '');
INSERT INTO `jc_guestbook_ctg` VALUES ('4', '9', '活动', '10', '');

-- ----------------------------
-- Table structure for jc_guestbook_ctg_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ctg_department`;
CREATE TABLE `jc_guestbook_ctg_department` (
  `guestbookctg_id` int(11) NOT NULL,
  `depart_id` int(11) NOT NULL,
  PRIMARY KEY (`guestbookctg_id`,`depart_id`),
  KEY `fk_jc_channel_department` (`depart_id`),
  CONSTRAINT `fk_jc_department_guestbook_ctg` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_ctg_department` FOREIGN KEY (`depart_id`) REFERENCES `jc_department` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言类别部门关联表';

-- ----------------------------
-- Records of jc_guestbook_ctg_department
-- ----------------------------

-- ----------------------------
-- Table structure for jc_guestbook_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ext`;
CREATE TABLE `jc_guestbook_ext` (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `content` longtext COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  KEY `fk_jc_ext_guestbook` (`guestbook_id`),
  CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言内容';

-- ----------------------------
-- Records of jc_guestbook_ext
-- ----------------------------
INSERT INTO `jc_guestbook_ext` VALUES ('3', '新版jeecms v8的改动很大，希望做得更好，持续关注中。', '新版jeecms v8的改动很大，希望做得更好，持续关注中。', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('4', '怎么在页面首页放一个视频之后我点击的时候就可以看？', '怎么在页面首页放一个视频之后我点击的时候就可以看？', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('5', '网店和论坛的用户管理和jeecms 可以统一起来吗？	', '网店和论坛的用户管理和jeecms 可以统一起来吗？	', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('6', '请问在内容中上传视频的限制是多大，能不能自己设置设置视频的大小	', '请问在内容中上传视频的限制是多大，能不能自己设置设置视频的大小	', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('7', '555', '666', null, '11991762@qq.com', '333', '4444');
INSERT INTO `jc_guestbook_ext` VALUES ('8', '好好好', '阿斯顿发斯蒂芬', null, '11991762@qq.com', '3333', '4444');
INSERT INTO `jc_guestbook_ext` VALUES ('9', '标题图拖拖拖', '内容柔柔弱弱', null, 'sss', 'fff', 'dddd');
INSERT INTO `jc_guestbook_ext` VALUES ('10', 'asdf', 'bbb', null, 'asdf ', 'asdf', 'fgg');
INSERT INTO `jc_guestbook_ext` VALUES ('11', '反反复复', '反反复复', null, '啥啥啥', '对对对', 'fff');
INSERT INTO `jc_guestbook_ext` VALUES ('12', null, '啊啊士大夫', null, '对对对', '阿斯蒂芬', '发发发');
INSERT INTO `jc_guestbook_ext` VALUES ('13', '444', '6666', null, '通天塔', '也一样', '666');
INSERT INTO `jc_guestbook_ext` VALUES ('14', 'g', 'g', null, 'ss ', 'd', 'f');
INSERT INTO `jc_guestbook_ext` VALUES ('15', '4', '5', null, '1', '2', '3');
INSERT INTO `jc_guestbook_ext` VALUES ('16', 'ddd', 'dddd', null, 'ddd', 'ddd', 'ddd');
INSERT INTO `jc_guestbook_ext` VALUES ('17', 'vv', 'vvv', null, 'vvv', 'vv', 'vv');

-- ----------------------------
-- Table structure for jc_job_apply
-- ----------------------------
DROP TABLE IF EXISTS `jc_job_apply`;
CREATE TABLE `jc_job_apply` (
  `job_apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content_id` int(11) NOT NULL COMMENT '职位id',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`job_apply_id`),
  KEY `fk_jc_job_apply_user` (`user_id`),
  KEY `fk_jc_job_apply_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位申请表';

-- ----------------------------
-- Records of jc_job_apply
-- ----------------------------

-- ----------------------------
-- Table structure for jc_keyword
-- ----------------------------
DROP TABLE IF EXISTS `jc_keyword`;
CREATE TABLE `jc_keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `keyword_name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`keyword_id`),
  KEY `fk_jc_keyword_site` (`site_id`),
  CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS内容关键词表';

-- ----------------------------
-- Records of jc_keyword
-- ----------------------------
INSERT INTO `jc_keyword` VALUES ('1', null, '内容管理系统', '<a href=\"http://www.jeecms.com/\" target=\"_blank\">内容管理系统</a>', '0');
INSERT INTO `jc_keyword` VALUES ('2', null, 'jeecms', '<a href=\"http://www.jeecms.com/\" target=\"_blank\">内容管理系统</a>', '0');

-- ----------------------------
-- Table structure for jc_log
-- ----------------------------
DROP TABLE IF EXISTS `jc_log`;
CREATE TABLE `jc_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`log_id`),
  KEY `fk_jc_log_site` (`site_id`),
  KEY `fk_jc_log_user` (`user_id`),
  CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2279 DEFAULT CHARSET=utf8 COMMENT='CMS日志表';

-- ----------------------------
-- Records of jc_log
-- ----------------------------
INSERT INTO `jc_log` VALUES ('1715', '1', '1', '3', '2018-03-24 22:04:04', '127.0.0.1', '/api/admin/config/system_update', '修改系统设置', null);
INSERT INTO `jc_log` VALUES ('1716', '1', '1', '3', '2018-03-24 22:08:26', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=4;name=吉林正泰第三方公共服务平台');
INSERT INTO `jc_log` VALUES ('1717', '1', '1', '3', '2018-03-24 22:10:51', '127.0.0.1', '/api/admin/site/update', '修改站点', 'id=1;name=jeecms演示站');
INSERT INTO `jc_log` VALUES ('1718', '1', '1', '3', '2018-03-24 22:11:00', '127.0.0.1', '/api/admin/site/update', '修改站点', 'id=4;name=吉林正泰第三方公共服务平台');
INSERT INTO `jc_log` VALUES ('1719', '1', '1', '3', '2018-03-24 22:18:20', '127.0.0.1', '/api/admin/admin/global_save', '增加用户', 'id=2;username=jlzt');
INSERT INTO `jc_log` VALUES ('1720', '1', '1', '3', '2018-03-24 22:20:04', '127.0.0.1', '/api/admin/admin/global_update', '修改用户', 'id=2;username=jlzt');
INSERT INTO `jc_log` VALUES ('1721', '2', '4', '3', '2018-03-24 22:29:24', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=11;name=栏目菜单');
INSERT INTO `jc_log` VALUES ('1722', '2', '4', '3', '2018-03-24 22:38:25', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=1;name=新闻');
INSERT INTO `jc_log` VALUES ('1723', '2', '4', '3', '2018-03-24 22:38:39', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=4;name=下载');
INSERT INTO `jc_log` VALUES ('1724', '2', '4', '3', '2018-03-24 22:38:48', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=5;name=图库');
INSERT INTO `jc_log` VALUES ('1725', '2', '4', '3', '2018-03-24 22:38:57', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=6;name=视频');
INSERT INTO `jc_log` VALUES ('1726', '2', '4', '3', '2018-03-24 22:39:06', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=8;name=招聘');
INSERT INTO `jc_log` VALUES ('1727', '2', '4', '3', '2018-03-24 22:39:12', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=9;name=文库');
INSERT INTO `jc_log` VALUES ('1728', '2', '4', '3', '2018-03-24 22:40:04', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=1;name=新闻');
INSERT INTO `jc_log` VALUES ('1729', '2', '4', '3', '2018-03-24 22:40:14', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=2;name=单页');
INSERT INTO `jc_log` VALUES ('1730', '2', '4', '3', '2018-03-24 22:40:21', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=4;name=下载');
INSERT INTO `jc_log` VALUES ('1731', '2', '4', '3', '2018-03-24 22:40:34', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=5;name=图库');
INSERT INTO `jc_log` VALUES ('1732', '2', '4', '3', '2018-03-24 22:40:42', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=6;name=视频');
INSERT INTO `jc_log` VALUES ('1733', '2', '4', '3', '2018-03-24 22:40:49', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=8;name=招聘');
INSERT INTO `jc_log` VALUES ('1734', '2', '4', '3', '2018-03-24 22:40:55', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=9;name=文库');
INSERT INTO `jc_log` VALUES ('1735', '2', '4', '3', '2018-03-24 22:42:29', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=12;name=栏目项');
INSERT INTO `jc_log` VALUES ('1736', '2', '4', '3', '2018-03-24 22:45:22', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=13;name=关于页');
INSERT INTO `jc_log` VALUES ('1737', '2', '4', '3', '2018-03-24 22:50:57', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=14;name=公告');
INSERT INTO `jc_log` VALUES ('1738', '2', '4', '3', '2018-03-24 22:53:33', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=15;name=信息');
INSERT INTO `jc_log` VALUES ('1739', '2', '4', '3', '2018-03-24 22:53:46', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=15;name=信息');
INSERT INTO `jc_log` VALUES ('1740', '2', '4', '3', '2018-03-24 22:57:22', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=16;name=评审');
INSERT INTO `jc_log` VALUES ('1741', '2', '4', '3', '2018-03-24 23:02:14', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=17;name=评价');
INSERT INTO `jc_log` VALUES ('1742', '2', '4', '3', '2018-03-24 23:05:46', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=18;name=评估');
INSERT INTO `jc_log` VALUES ('1743', '2', '4', '3', '2018-03-24 23:10:06', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=117;title=信息公示');
INSERT INTO `jc_log` VALUES ('1744', '2', '4', '3', '2018-03-24 23:12:16', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=118;title=通知公告');
INSERT INTO `jc_log` VALUES ('1745', '2', '4', '3', '2018-03-24 23:13:19', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=119;title=政策信息');
INSERT INTO `jc_log` VALUES ('1746', '2', '4', '3', '2018-03-24 23:14:50', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=120;title=平台新闻');
INSERT INTO `jc_log` VALUES ('1747', '2', '4', '3', '2018-03-24 23:16:30', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=121;title=评估评价');
INSERT INTO `jc_log` VALUES ('1748', '2', '4', '3', '2018-03-24 23:17:37', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=122;title=成果展示');
INSERT INTO `jc_log` VALUES ('1749', '2', '4', '3', '2018-03-24 23:18:47', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=123;title=平台简介');
INSERT INTO `jc_log` VALUES ('1750', '2', '4', '3', '2018-03-24 23:20:26', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=301;title=联评联审');
INSERT INTO `jc_log` VALUES ('1751', '2', '4', '3', '2018-03-24 23:21:21', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=302;title=科技成果评价');
INSERT INTO `jc_log` VALUES ('1752', '2', '4', '3', '2018-03-24 23:23:44', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=303;title=预算内资金绩效评价');
INSERT INTO `jc_log` VALUES ('1753', '2', '4', '3', '2018-03-24 23:24:54', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=304;title=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('1754', '2', '4', '3', '2018-03-24 23:33:25', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=305;title=扶贫成效评估');
INSERT INTO `jc_log` VALUES ('1755', '2', '4', '3', '2018-03-24 23:34:09', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=306;title=省级示范镇评估');
INSERT INTO `jc_log` VALUES ('1756', '2', '4', '3', '2018-03-24 23:35:00', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=307;title=其他评估');
INSERT INTO `jc_log` VALUES ('1757', '2', '4', '3', '2018-03-25 00:23:50', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=117;name=信息公示');
INSERT INTO `jc_log` VALUES ('1758', '2', '4', '3', '2018-03-25 00:25:45', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=118;name=通知公告');
INSERT INTO `jc_log` VALUES ('1759', '2', '4', '3', '2018-03-25 01:14:00', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=315;title=关于我们');
INSERT INTO `jc_log` VALUES ('1760', '2', '4', '3', '2018-03-25 01:14:24', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=316;title=联系方式');
INSERT INTO `jc_log` VALUES ('1761', '2', '4', '3', '2018-03-25 01:14:48', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=317;title=在线交流');
INSERT INTO `jc_log` VALUES ('1762', '2', '4', '3', '2018-03-27 20:22:32', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=124;title=联评联审');
INSERT INTO `jc_log` VALUES ('1763', '2', '4', '3', '2018-03-27 20:28:51', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=125;title=科技成果评价');
INSERT INTO `jc_log` VALUES ('1764', '2', '4', '3', '2018-03-27 20:29:48', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=126;title=预算内资金绩效评价');
INSERT INTO `jc_log` VALUES ('1765', '2', '4', '3', '2018-03-27 20:30:25', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=127;title=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('1766', '2', '4', '3', '2018-03-27 20:31:29', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=128;title=扶贫成效评估');
INSERT INTO `jc_log` VALUES ('1767', '2', '4', '3', '2018-03-27 20:31:57', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=129;title=省级示范镇评估');
INSERT INTO `jc_log` VALUES ('1768', '2', '4', '3', '2018-03-27 20:32:24', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=130;title=其他评估');
INSERT INTO `jc_log` VALUES ('1769', '2', '4', '3', '2018-03-27 20:33:27', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=131;title=关于我们');
INSERT INTO `jc_log` VALUES ('1770', '2', '4', '3', '2018-03-27 20:33:52', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=132;title=联系方式');
INSERT INTO `jc_log` VALUES ('1771', '2', '4', '3', '2018-03-27 20:34:29', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=133;title=在线交流');
INSERT INTO `jc_log` VALUES ('1772', '2', '4', '3', '2018-03-27 20:44:56', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=124;name=联评联审');
INSERT INTO `jc_log` VALUES ('1773', '2', '4', '3', '2018-03-27 20:48:43', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=318;title=联评联审');
INSERT INTO `jc_log` VALUES ('1774', '2', '4', '3', '2018-03-27 20:51:11', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=124;name=联评联审');
INSERT INTO `jc_log` VALUES ('1775', '2', '4', '3', '2018-03-27 20:51:33', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=125;name=科技成果评价');
INSERT INTO `jc_log` VALUES ('1776', '2', '4', '3', '2018-03-27 20:52:00', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=126;name=预算内资金绩效评价');
INSERT INTO `jc_log` VALUES ('1777', '2', '4', '3', '2018-03-27 21:00:26', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=126;name=预算内资金绩效评价');
INSERT INTO `jc_log` VALUES ('1778', '2', '4', '3', '2018-03-27 21:00:48', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=127;name=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('1779', '2', '4', '3', '2018-03-27 21:01:03', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=128;name=扶贫成效评估');
INSERT INTO `jc_log` VALUES ('1780', '2', '4', '3', '2018-03-27 21:01:16', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=129;name=省级示范镇评估');
INSERT INTO `jc_log` VALUES ('1781', '2', '4', '3', '2018-03-27 21:01:45', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=130;name=其他评估');
INSERT INTO `jc_log` VALUES ('1782', '2', '4', '3', '2018-03-27 21:09:10', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=124;name=联评联审');
INSERT INTO `jc_log` VALUES ('1783', '2', '4', '3', '2018-03-27 21:09:27', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=125;name=科技成果评价');
INSERT INTO `jc_log` VALUES ('1784', '2', '4', '3', '2018-03-27 21:09:40', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=126;name=预算内资金绩效评价');
INSERT INTO `jc_log` VALUES ('1785', '2', '4', '3', '2018-03-27 21:10:13', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=127;name=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('1786', '2', '4', '3', '2018-03-27 21:11:21', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=127;name=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('1787', '2', '4', '3', '2018-03-27 21:11:38', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=128;name=扶贫成效评估');
INSERT INTO `jc_log` VALUES ('1788', '2', '4', '3', '2018-03-27 21:11:57', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=129;name=省级示范镇评估');
INSERT INTO `jc_log` VALUES ('1789', '2', '4', '3', '2018-03-27 21:12:09', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=130;name=其他评估');
INSERT INTO `jc_log` VALUES ('1790', '2', '4', '3', '2018-03-27 21:13:30', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=131;name=关于我们');
INSERT INTO `jc_log` VALUES ('1791', '2', '4', '3', '2018-03-27 21:13:47', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=132;name=联系方式');
INSERT INTO `jc_log` VALUES ('1792', '2', '4', '3', '2018-03-27 21:14:01', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=133;name=在线交流');
INSERT INTO `jc_log` VALUES ('1793', '2', '4', '3', '2018-03-27 21:17:31', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=122;name=成果展示');
INSERT INTO `jc_log` VALUES ('1794', '2', '4', '3', '2018-03-27 21:18:27', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=317;title=在线交流');
INSERT INTO `jc_log` VALUES ('1795', '2', '4', '3', '2018-03-27 21:18:40', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=316;title=联系方式');
INSERT INTO `jc_log` VALUES ('1796', '2', '4', '3', '2018-03-27 21:18:40', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=315;title=关于我们');
INSERT INTO `jc_log` VALUES ('1797', '2', '4', '3', '2018-03-27 21:19:00', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=304;title=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('1798', '2', '4', '3', '2018-03-27 21:19:00', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=303;title=预算内资金绩效评价');
INSERT INTO `jc_log` VALUES ('1799', '2', '4', '3', '2018-03-27 21:19:00', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=302;title=科技成果评价');
INSERT INTO `jc_log` VALUES ('1800', '2', '4', '3', '2018-03-27 21:19:00', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=318;title=联评联审');
INSERT INTO `jc_log` VALUES ('1801', '2', '4', '3', '2018-03-27 21:19:00', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=307;title=其他评估');
INSERT INTO `jc_log` VALUES ('1802', '2', '4', '3', '2018-03-27 21:19:00', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=306;title=省级示范镇评估');
INSERT INTO `jc_log` VALUES ('1803', '2', '4', '3', '2018-03-27 21:19:00', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=305;title=扶贫成效评估');
INSERT INTO `jc_log` VALUES ('1804', '2', '4', '3', '2018-03-27 21:19:00', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=301;title=联评联审');
INSERT INTO `jc_log` VALUES ('1805', '2', '4', '3', '2018-03-27 21:19:27', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=308;title=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('1806', '2', '4', '3', '2018-03-27 21:19:27', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=309;title=预算内资金绩效评价');
INSERT INTO `jc_log` VALUES ('1807', '2', '4', '3', '2018-03-27 21:19:27', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=310;title=科技成果评价');
INSERT INTO `jc_log` VALUES ('1808', '2', '4', '3', '2018-03-27 21:19:27', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=314;title=联评联审');
INSERT INTO `jc_log` VALUES ('1809', '2', '4', '3', '2018-03-27 21:19:28', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=312;title=省级示范镇评估');
INSERT INTO `jc_log` VALUES ('1810', '2', '4', '3', '2018-03-27 21:19:28', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=313;title=扶贫成效评估');
INSERT INTO `jc_log` VALUES ('1811', '2', '4', '3', '2018-03-27 21:19:28', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=311;title=其他评估');
INSERT INTO `jc_log` VALUES ('1812', '2', '4', '3', '2018-03-27 21:43:56', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=131;name=关于我们');
INSERT INTO `jc_log` VALUES ('1813', '2', '4', '3', '2018-03-27 21:44:06', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=132;name=联系方式');
INSERT INTO `jc_log` VALUES ('1814', '2', '4', '3', '2018-03-27 21:44:15', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=133;name=在线交流');
INSERT INTO `jc_log` VALUES ('1815', '2', '4', '3', '2018-03-27 21:47:57', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=123;name=平台简介');
INSERT INTO `jc_log` VALUES ('1816', '2', '4', '3', '2018-04-03 22:06:43', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=144;title=习近平举行仪式欢迎津巴布韦总统访华');
INSERT INTO `jc_log` VALUES ('1817', '2', '4', '3', '2018-04-03 22:07:03', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=145;title=登录查找 习近平将出席博鳌亚洲论坛2018年年会开幕式');
INSERT INTO `jc_log` VALUES ('1818', '2', '4', '3', '2018-04-03 22:07:33', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=146;title=绿水青山里的人民情怀');
INSERT INTO `jc_log` VALUES ('1819', '2', '4', '3', '2018-04-03 22:08:31', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=147;title= 新华社评论员：种下一片新绿 收获美丽中国');
INSERT INTO `jc_log` VALUES ('1820', '2', '4', '3', '2018-04-03 22:09:07', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=148;title=农业农村部：今年大豆补贴标准要高于玉米');
INSERT INTO `jc_log` VALUES ('1821', '2', '4', '3', '2018-04-03 22:09:36', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=149;title= 记住这些名字！2017年361名因公牺牲警察名单');
INSERT INTO `jc_log` VALUES ('1822', '2', '4', '3', '2018-04-03 22:10:04', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=150;title=交通运输部：清明假期高速公路小客车免费通行');
INSERT INTO `jc_log` VALUES ('1823', '2', '4', '3', '2018-04-03 22:10:35', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=151;title=清明节前后南京多项活动祭悼南京大屠杀遇难同胞');
INSERT INTO `jc_log` VALUES ('1824', '2', '4', '3', '2018-04-03 22:11:00', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=152;title= 清明节也可以当情人节过？古人真是这么做的');
INSERT INTO `jc_log` VALUES ('1825', '2', '4', '3', '2018-04-03 22:11:31', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=153;title=清明到高速路周边扫墓 来看出行避堵提醒');
INSERT INTO `jc_log` VALUES ('1826', '2', '4', '3', '2018-04-03 22:21:20', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=117;name=信息公示');
INSERT INTO `jc_log` VALUES ('1827', '2', '4', '3', '2018-04-06 23:19:19', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=100;name=通用列表');
INSERT INTO `jc_log` VALUES ('1828', '2', '4', '3', '2018-04-07 09:04:25', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=123;name=平台简介');
INSERT INTO `jc_log` VALUES ('1829', '2', '4', '3', '2018-04-08 19:35:17', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=134;title=test');
INSERT INTO `jc_log` VALUES ('1830', '2', '4', '3', '2018-04-08 19:39:18', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=135;title=null');
INSERT INTO `jc_log` VALUES ('1831', '2', '4', '3', '2018-04-08 19:42:22', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=135;name=ttt');
INSERT INTO `jc_log` VALUES ('1832', '2', '4', '3', '2018-04-08 20:06:25', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=135;title=null');
INSERT INTO `jc_log` VALUES ('1833', '2', '4', '3', '2018-04-08 20:11:37', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=121;name=评估评价');
INSERT INTO `jc_log` VALUES ('1834', '2', '4', '3', '2018-04-08 20:17:14', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=121;name=评估评价');
INSERT INTO `jc_log` VALUES ('1835', '2', '4', '3', '2018-04-08 20:39:15', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=121;name=评估评价');
INSERT INTO `jc_log` VALUES ('1836', '2', '4', '3', '2018-04-08 20:47:41', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=146;title=绿水青山里的人民情怀');
INSERT INTO `jc_log` VALUES ('1837', '2', '4', '3', '2018-04-08 20:47:41', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=145;title=登录查找 习近平将出席博鳌亚洲论坛2018年年会开幕式');
INSERT INTO `jc_log` VALUES ('1838', '2', '4', '3', '2018-04-08 20:47:41', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=144;title=习近平举行仪式欢迎津巴布韦总统访华');
INSERT INTO `jc_log` VALUES ('1839', '2', '4', '3', '2018-04-08 20:47:53', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=118;title=通知公告');
INSERT INTO `jc_log` VALUES ('1840', '2', '4', '3', '2018-04-08 20:48:17', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=136;title=null');
INSERT INTO `jc_log` VALUES ('1841', '2', '4', '3', '2018-04-08 20:52:42', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=153;title=清明到高速路周边扫墓 来看出行避堵提醒');
INSERT INTO `jc_log` VALUES ('1842', '2', '4', '3', '2018-04-08 20:52:42', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=152;title= 清明节也可以当情人节过？古人真是这么做的');
INSERT INTO `jc_log` VALUES ('1843', '2', '4', '3', '2018-04-08 20:52:42', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=151;title=清明节前后南京多项活动祭悼南京大屠杀遇难同胞');
INSERT INTO `jc_log` VALUES ('1844', '2', '4', '3', '2018-04-08 20:52:43', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=150;title=交通运输部：清明假期高速公路小客车免费通行');
INSERT INTO `jc_log` VALUES ('1845', '2', '4', '3', '2018-04-08 20:52:43', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=149;title= 记住这些名字！2017年361名因公牺牲警察名单');
INSERT INTO `jc_log` VALUES ('1846', '2', '4', '3', '2018-04-08 20:52:43', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=148;title=农业农村部：今年大豆补贴标准要高于玉米');
INSERT INTO `jc_log` VALUES ('1847', '2', '4', '3', '2018-04-08 20:52:43', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=147;title= 新华社评论员：种下一片新绿 收获美丽中国');
INSERT INTO `jc_log` VALUES ('1848', '2', '4', '3', '2018-04-08 20:52:55', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=119;title=政策信息');
INSERT INTO `jc_log` VALUES ('1849', '2', '4', '3', '2018-04-08 20:53:24', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=137;title=null');
INSERT INTO `jc_log` VALUES ('1850', '2', '4', '3', '2018-04-09 19:47:55', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=117;name=信息公示');
INSERT INTO `jc_log` VALUES ('1851', '2', '4', '3', '2018-04-09 19:49:59', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=121;title=评估评价');
INSERT INTO `jc_log` VALUES ('1852', '2', '4', '3', '2018-04-09 19:51:04', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=138;title=null');
INSERT INTO `jc_log` VALUES ('1853', '2', '4', '3', '2018-04-09 19:53:27', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=139;title=null');
INSERT INTO `jc_log` VALUES ('1854', '2', '4', '3', '2018-04-09 19:54:04', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=140;title=null');
INSERT INTO `jc_log` VALUES ('1855', '2', '4', '3', '2018-04-09 19:54:51', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=141;title=null');
INSERT INTO `jc_log` VALUES ('1856', '2', '4', '3', '2018-04-09 19:55:05', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=142;title=null');
INSERT INTO `jc_log` VALUES ('1857', '2', '4', '3', '2018-04-09 19:55:13', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=143;title=null');
INSERT INTO `jc_log` VALUES ('1858', '2', '4', '3', '2018-04-09 19:55:19', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=144;title=null');
INSERT INTO `jc_log` VALUES ('1859', '2', '4', '3', '2018-04-09 19:55:26', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=145;title=null');
INSERT INTO `jc_log` VALUES ('1860', '2', '4', '3', '2018-04-09 19:56:18', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=138;name=评估评价');
INSERT INTO `jc_log` VALUES ('1861', '2', '4', '3', '2018-04-09 20:00:56', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=101;name=成果展示');
INSERT INTO `jc_log` VALUES ('1862', '2', '4', '3', '2018-04-09 20:01:31', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=122;name=成果展示');
INSERT INTO `jc_log` VALUES ('1863', '2', '4', '3', '2018-04-09 20:19:16', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=154;title=项目名称');
INSERT INTO `jc_log` VALUES ('1864', '2', '4', '3', '2018-04-09 20:40:03', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=155;title=项目2');
INSERT INTO `jc_log` VALUES ('1865', '2', '4', '3', '2018-04-09 20:40:16', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=156;title=项目2');
INSERT INTO `jc_log` VALUES ('1866', '2', '4', '3', '2018-04-09 20:41:50', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=157;title=22222');
INSERT INTO `jc_log` VALUES ('1867', '2', '4', '3', '2018-04-09 20:41:59', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=155;title=项目2');
INSERT INTO `jc_log` VALUES ('1868', '2', '4', '3', '2018-04-09 20:42:24', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=155;title=项目2');
INSERT INTO `jc_log` VALUES ('1869', '2', '4', '3', '2018-04-09 20:42:38', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=156;title=项目2');
INSERT INTO `jc_log` VALUES ('1870', '2', '4', '3', '2018-04-09 20:42:45', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=157;title=22222');
INSERT INTO `jc_log` VALUES ('1871', '2', '4', '3', '2018-04-09 20:43:13', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=158;title=2222');
INSERT INTO `jc_log` VALUES ('1872', '2', '4', '3', '2018-04-09 20:44:40', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=159;title=333333');
INSERT INTO `jc_log` VALUES ('1873', '2', '4', '3', '2018-04-09 20:45:02', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=160;title=4444444');
INSERT INTO `jc_log` VALUES ('1874', '2', '4', '3', '2018-04-09 20:46:50', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=134;title=test');
INSERT INTO `jc_log` VALUES ('1875', '2', '4', '3', '2018-04-09 21:07:36', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=161;title=奥地利总统对华“历史性访问”释放什么信号');
INSERT INTO `jc_log` VALUES ('1876', '2', '4', '3', '2018-04-09 21:08:06', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=162;title=《新闻联播》头条播报了中国国家主席习近平欢迎奥地利总统亚历山大·范德贝伦对我国进行国事访问的相关消息');
INSERT INTO `jc_log` VALUES ('1877', '2', '4', '3', '2018-04-09 21:09:02', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=163;title=一条六分多钟的新闻看似平常，实则包含了大量重磅信息。');
INSERT INTO `jc_log` VALUES ('1878', '2', '4', '3', '2018-04-09 21:10:11', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=164;title=范德贝伦用“历史性访问”来定义此次对华访问有着深刻含义。');
INSERT INTO `jc_log` VALUES ('1879', '1', '4', '3', '2018-04-10 21:12:55', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=5;name=吉林正泰众创空间');
INSERT INTO `jc_log` VALUES ('1880', '1', '4', '3', '2018-04-10 21:14:31', '127.0.0.1', '/api/admin/admin/global_save', '增加用户', 'id=3;username=zckj');
INSERT INTO `jc_log` VALUES ('1891', '1', '4', '3', '2018-04-10 22:03:27', '127.0.0.1', '/api/admin/admin/global_delete', '删除用户', 'id=3;username=zckj');
INSERT INTO `jc_log` VALUES ('1897', '1', '4', '3', '2018-04-10 22:09:38', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=9;name=吉林正泰众创空间');
INSERT INTO `jc_log` VALUES ('1898', '1', '4', '3', '2018-04-10 22:14:36', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=10;name=正泰服务聚合平台');
INSERT INTO `jc_log` VALUES ('1899', '1', '4', '3', '2018-04-10 22:14:56', '127.0.0.1', '/api/admin/site/delete', '删除站点', 'id=10;name=正泰服务聚合平台');
INSERT INTO `jc_log` VALUES ('1900', '1', '4', '3', '2018-04-10 22:18:05', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=11;name=正泰服务聚合平台');
INSERT INTO `jc_log` VALUES ('1901', '1', '4', '3', '2018-04-10 22:18:39', '127.0.0.1', '/api/admin/site/delete', '删除站点', 'id=11;name=正泰服务聚合平台');
INSERT INTO `jc_log` VALUES ('1902', '1', '4', '3', '2018-04-10 22:21:47', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=12;name=正泰服务聚合平台');
INSERT INTO `jc_log` VALUES ('1903', '1', '4', '3', '2018-04-10 22:26:11', '127.0.0.1', '/api/admin/admin/global_save', '增加用户', 'id=4;username=zckj');
INSERT INTO `jc_log` VALUES ('1904', '1', '9', '3', '2018-04-10 22:28:24', '127.0.0.1', '/api/admin/admin/global_delete', '删除用户', 'id=4;username=zckj');
INSERT INTO `jc_log` VALUES ('1905', '1', '9', '3', '2018-04-10 22:29:19', '127.0.0.1', '/api/admin/admin/local_save', '增加用户', 'id=5;username=zckj');
INSERT INTO `jc_log` VALUES ('1910', '1', '9', '3', '2018-04-11 21:12:44', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=13;name=九维智库信息聚合平台');
INSERT INTO `jc_log` VALUES ('1911', '1', '9', '3', '2018-04-11 21:17:22', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=14;name=工程咨询');
INSERT INTO `jc_log` VALUES ('1912', '1', '9', '3', '2018-04-11 21:19:11', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=15;name=科技咨询');
INSERT INTO `jc_log` VALUES ('1913', '1', '9', '3', '2018-04-11 21:20:19', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=16;name=九维智库');
INSERT INTO `jc_log` VALUES ('1916', '1', '9', '3', '2018-04-14 12:02:45', '127.0.0.1', '/api/admin/admin/local_save', '增加用户', 'id=7;username=zckj');
INSERT INTO `jc_log` VALUES ('1918', '1', '14', '3', '2018-04-14 12:04:59', '127.0.0.1', '/api/admin/admin/local_save', '增加用户', 'id=9;username=gczx');
INSERT INTO `jc_log` VALUES ('1919', '1', '15', '3', '2018-04-14 12:05:37', '127.0.0.1', '/api/admin/admin/local_save', '增加用户', 'id=10;username=kjzx');
INSERT INTO `jc_log` VALUES ('1920', '1', '16', '3', '2018-04-14 12:06:11', '127.0.0.1', '/api/admin/admin/local_save', '增加用户', 'id=11;username=jwzk');
INSERT INTO `jc_log` VALUES ('1921', '9', '14', '3', '2018-04-14 13:43:29', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=154;title=咨询服务');
INSERT INTO `jc_log` VALUES ('1922', '9', '14', '3', '2018-04-14 13:44:19', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=155;title=申报服务');
INSERT INTO `jc_log` VALUES ('1923', '9', '14', '3', '2018-04-14 13:45:21', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=156;title=评估评价');
INSERT INTO `jc_log` VALUES ('1924', '9', '14', '3', '2018-04-14 13:45:55', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=157;title=关于我们');
INSERT INTO `jc_log` VALUES ('1925', '11', '16', '3', '2018-04-14 13:49:27', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=158;title=动态');
INSERT INTO `jc_log` VALUES ('1926', '11', '16', '3', '2018-04-14 13:50:19', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=159;title=咨询');
INSERT INTO `jc_log` VALUES ('1927', '11', '16', '3', '2018-04-14 13:50:50', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=160;title=研究');
INSERT INTO `jc_log` VALUES ('1928', '11', '16', '3', '2018-04-14 13:51:57', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=161;title=期刊');
INSERT INTO `jc_log` VALUES ('1929', '11', '16', '3', '2018-04-14 13:52:40', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=162;title=影响');
INSERT INTO `jc_log` VALUES ('1930', '11', '16', '3', '2018-04-14 13:53:49', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=163;title=理事');
INSERT INTO `jc_log` VALUES ('1931', '11', '16', '3', '2018-04-14 13:54:10', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=164;title=关于');
INSERT INTO `jc_log` VALUES ('1932', '2', '4', '3', '2018-04-14 14:35:44', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=165;title=重要通知');
INSERT INTO `jc_log` VALUES ('1933', '2', '4', '3', '2018-04-14 14:36:12', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=166;title=重要通知');
INSERT INTO `jc_log` VALUES ('1934', '2', '4', '3', '2018-04-14 14:39:37', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=165;title=俄国防部：美英法三国导弹没有进入俄防空区域');
INSERT INTO `jc_log` VALUES ('1935', '2', '4', '3', '2018-04-14 14:39:41', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=166;title=俄国防部：美英法三国导弹没有进入俄防空区域');
INSERT INTO `jc_log` VALUES ('1936', '2', '4', '3', '2018-04-14 14:40:03', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=165;title=俄国防部：美英法三国导弹没有进入俄防空区域');
INSERT INTO `jc_log` VALUES ('1937', '2', '4', '3', '2018-04-14 14:40:36', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=167;title=院士被“双开” 中纪委刊文谈学者该有怎样的操守');
INSERT INTO `jc_log` VALUES ('1938', '2', '4', '3', '2018-04-14 14:41:55', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=168;title=海上阅兵当天，这个新部门把中国领海都管起来了');
INSERT INTO `jc_log` VALUES ('1939', '2', '4', '3', '2018-04-14 14:45:53', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=169;title=独家|袁隆平：粮食安全要掌握在自己手里 否则会被卡脖子');
INSERT INTO `jc_log` VALUES ('1940', '2', '4', '3', '2018-04-14 14:46:18', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=170;title= 新组建部门今年怎么花钱？公务员福利待遇有变化');
INSERT INTO `jc_log` VALUES ('1941', '2', '4', '3', '2018-04-14 14:48:15', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=171;title= 唐驳虎：南海阅舰气势壮观 中国海军在全球又是啥地位？');
INSERT INTO `jc_log` VALUES ('1942', '2', '4', '3', '2018-04-14 14:49:00', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=172;title=3月贸易逆差的秘密：大豆进口量大跌 飞机汽车进口剧增');
INSERT INTO `jc_log` VALUES ('1943', '2', '4', '3', '2018-04-14 14:49:49', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=173;title=叙利亚国家电视台：美英法三国对叙“发动侵略”');
INSERT INTO `jc_log` VALUES ('1944', '2', '4', '3', '2018-04-14 14:50:35', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=174;title=杜特尔特：中国之行将为菲律宾人创造一万个工作机会');
INSERT INTO `jc_log` VALUES ('1945', '2', '4', '3', '2018-04-14 14:51:10', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=175;title=蔡英文称登舰阅兵“不是和大陆较劲” 被批：你不配');
INSERT INTO `jc_log` VALUES ('1946', '2', '4', '3', '2018-04-14 14:53:10', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=162;title=白山市江源区列入首批国家农村产业融合发展示范园名单');
INSERT INTO `jc_log` VALUES ('1947', '2', '4', '3', '2018-04-14 14:53:46', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=161;title=奥地利总统对华“历史性访问”释放什么信号');
INSERT INTO `jc_log` VALUES ('1948', '2', '4', '3', '2018-04-14 14:54:50', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=176;title=关于深入推进农业供给侧结构性改革加快培育农业农村发展新动能的若干意见');
INSERT INTO `jc_log` VALUES ('1949', '2', '4', '3', '2018-04-14 14:55:30', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=177;title=关于实施中华优秀传统文化传承发展工程的意见');
INSERT INTO `jc_log` VALUES ('1950', '2', '4', '3', '2018-04-14 14:55:56', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=178;title=中国（浙江）自由贸易试验区总体方案');
INSERT INTO `jc_log` VALUES ('1951', '2', '4', '3', '2018-04-14 14:56:54', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=179;title=东北地区与东部地区部分省市对口合作工作方案');
INSERT INTO `jc_log` VALUES ('1952', '2', '4', '3', '2018-04-14 14:57:14', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=180;title=中山市市级特色小镇建设发展规划编制导则');
INSERT INTO `jc_log` VALUES ('1953', '2', '4', '3', '2018-04-14 14:59:00', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=181;title=推动共建丝绸之路经济带和21世纪海上丝绸之路的愿景与行动');
INSERT INTO `jc_log` VALUES ('1954', '2', '4', '3', '2018-04-14 15:00:06', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=182;title=“十三五”国家技术创新工程规划');
INSERT INTO `jc_log` VALUES ('1955', '2', '4', '3', '2018-04-14 15:00:28', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=183;title=关于加快运用PPP模式 盘活基础设施存量资产有关工作的通知');
INSERT INTO `jc_log` VALUES ('1956', '2', '4', '3', '2018-04-14 15:00:46', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=184;title=《国家中小企业公共服务示范平台认定管理办法》');
INSERT INTO `jc_log` VALUES ('1957', '2', '4', '3', '2018-04-14 15:01:13', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=185;title=吉林正泰拓展为政府提供第三方服务新领域');
INSERT INTO `jc_log` VALUES ('1958', '2', '4', '3', '2018-04-14 15:01:34', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=186;title=国家发改委 国家旅游局关于实施旅游休闲重大工程的通知');
INSERT INTO `jc_log` VALUES ('1959', '2', '4', '3', '2018-04-14 15:05:23', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=187;title=国务院办公厅关于进一步促进农产品加工业发展的意见');
INSERT INTO `jc_log` VALUES ('1960', '2', '4', '3', '2018-04-14 15:05:42', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=188;title=体育总局等23部门群众冬季运动推广普及计划（2016-2020年）');
INSERT INTO `jc_log` VALUES ('1961', '2', '4', '3', '2018-04-14 15:06:06', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=189;title=国务院关于发布政府核准的投资项目目录（2016年本）的通知');
INSERT INTO `jc_log` VALUES ('1962', '2', '4', '3', '2018-04-14 15:06:33', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=190;title=吉林省关于以市场化方式发展养老服务产业的实施意见');
INSERT INTO `jc_log` VALUES ('1963', '2', '4', '3', '2018-04-14 15:06:50', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=191;title=国家旅游局国家体育总局关于大力发展体育旅游的指导意见');
INSERT INTO `jc_log` VALUES ('1964', '2', '4', '3', '2018-04-14 15:07:14', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=192;title=2016年12月开始实施的工程建设标准');
INSERT INTO `jc_log` VALUES ('1965', '2', '4', '3', '2018-04-14 15:08:11', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=193;title=中共中央国务院关于深化投融资体制改革的意见');
INSERT INTO `jc_log` VALUES ('1966', '2', '4', '3', '2018-04-14 15:08:40', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=194;title=吉林省人民政府关于积极推进 吉林省“互联网＋”行动的实施意见');
INSERT INTO `jc_log` VALUES ('1967', '2', '4', '3', '2018-04-14 15:09:00', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=195;title=吉林省关于建立贫困对象退出机制的实施意见');
INSERT INTO `jc_log` VALUES ('1968', '2', '4', '3', '2018-04-14 15:09:17', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=196;title=创新服务模式，开拓科技咨询新领域');
INSERT INTO `jc_log` VALUES ('1969', '2', '4', '3', '2018-04-14 15:10:36', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=197;title=转型升级中的吉林正泰工程咨询公司');
INSERT INTO `jc_log` VALUES ('1970', '2', '4', '3', '2018-04-14 15:10:52', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=198;title=吉林正泰公司乔迁新址');
INSERT INTO `jc_log` VALUES ('1971', '2', '4', '3', '2018-04-14 16:05:27', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=160;title=4444444');
INSERT INTO `jc_log` VALUES ('1972', '2', '4', '3', '2018-04-14 16:24:21', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=123;name=平台简介');
INSERT INTO `jc_log` VALUES ('1973', '2', '4', '3', '2018-04-14 16:54:27', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=167;title=test');
INSERT INTO `jc_log` VALUES ('1974', '1', '1', '3', '2018-04-14 17:19:06', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=168;title=test1');
INSERT INTO `jc_log` VALUES ('1975', '1', '1', '3', '2018-04-14 17:36:01', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=168;name=test1');
INSERT INTO `jc_log` VALUES ('1976', '1', '1', '3', '2018-04-14 17:36:50', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=199;title=ttt');
INSERT INTO `jc_log` VALUES ('1977', '1', '1', '3', '2018-04-14 17:51:57', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=168;name=test1');
INSERT INTO `jc_log` VALUES ('1978', '2', '4', '3', '2018-04-14 17:56:51', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=167;name=test');
INSERT INTO `jc_log` VALUES ('1979', '2', '4', '3', '2018-04-14 17:58:59', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=122;name=成果展示');
INSERT INTO `jc_log` VALUES ('1980', '2', '4', '3', '2018-04-15 23:43:48', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=122;name=成果展示');
INSERT INTO `jc_log` VALUES ('1981', '2', '4', '3', '2018-04-15 23:44:53', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=122;name=成果展示');
INSERT INTO `jc_log` VALUES ('1982', '2', '4', '3', '2018-04-15 23:45:05', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=122;name=成果展示');
INSERT INTO `jc_log` VALUES ('1983', '2', '4', '3', '2018-04-17 20:32:08', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=167;title=test');
INSERT INTO `jc_log` VALUES ('1984', '2', '4', '3', '2018-04-17 20:34:29', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=181;title=推动共建丝绸之路经济带和21世纪海上丝绸之路的愿景与行动');
INSERT INTO `jc_log` VALUES ('1985', '2', '4', '3', '2018-04-17 20:34:29', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=180;title=中山市市级特色小镇建设发展规划编制导则');
INSERT INTO `jc_log` VALUES ('1986', '2', '4', '3', '2018-04-17 20:34:29', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=179;title=东北地区与东部地区部分省市对口合作工作方案');
INSERT INTO `jc_log` VALUES ('1987', '2', '4', '3', '2018-04-17 20:34:29', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=178;title=中国（浙江）自由贸易试验区总体方案');
INSERT INTO `jc_log` VALUES ('1988', '2', '4', '3', '2018-04-17 20:34:29', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=177;title=关于实施中华优秀传统文化传承发展工程的意见');
INSERT INTO `jc_log` VALUES ('1989', '2', '4', '3', '2018-04-17 20:34:29', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=176;title=关于深入推进农业供给侧结构性改革加快培育农业农村发展新动能的若干意见');
INSERT INTO `jc_log` VALUES ('1990', '2', '4', '3', '2018-04-17 20:34:29', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=162;title=白山市江源区列入首批国家农村产业融合发展示范园名单');
INSERT INTO `jc_log` VALUES ('1991', '2', '4', '3', '2018-04-17 20:34:29', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=161;title=奥地利总统对华“历史性访问”释放什么信号');
INSERT INTO `jc_log` VALUES ('1992', '2', '4', '3', '2018-04-17 20:34:55', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=120;title=平台新闻');
INSERT INTO `jc_log` VALUES ('1993', '2', '4', '3', '2018-04-17 20:35:27', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=169;title=平台新闻');
INSERT INTO `jc_log` VALUES ('1994', '2', '4', '3', '2018-04-17 20:37:09', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=170;title=政策咨询');
INSERT INTO `jc_log` VALUES ('1995', '2', '4', '3', '2018-04-17 20:39:06', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=171;title=在线服务');
INSERT INTO `jc_log` VALUES ('1996', '2', '4', '3', '2018-04-17 20:39:48', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=198;title=吉林正泰公司乔迁新址');
INSERT INTO `jc_log` VALUES ('1997', '2', '4', '3', '2018-04-17 20:39:48', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=197;title=转型升级中的吉林正泰工程咨询公司');
INSERT INTO `jc_log` VALUES ('1998', '2', '4', '3', '2018-04-17 20:39:48', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=196;title=创新服务模式，开拓科技咨询新领域');
INSERT INTO `jc_log` VALUES ('1999', '2', '4', '3', '2018-04-17 20:39:48', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=195;title=吉林省关于建立贫困对象退出机制的实施意见');
INSERT INTO `jc_log` VALUES ('2000', '2', '4', '3', '2018-04-17 20:39:48', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=194;title=吉林省人民政府关于积极推进 吉林省“互联网＋”行动的实施意见');
INSERT INTO `jc_log` VALUES ('2001', '2', '4', '3', '2018-04-17 20:39:48', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=193;title=中共中央国务院关于深化投融资体制改革的意见');
INSERT INTO `jc_log` VALUES ('2002', '2', '4', '3', '2018-04-17 20:39:49', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=192;title=2016年12月开始实施的工程建设标准');
INSERT INTO `jc_log` VALUES ('2003', '2', '4', '3', '2018-04-17 20:39:49', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=191;title=国家旅游局国家体育总局关于大力发展体育旅游的指导意见');
INSERT INTO `jc_log` VALUES ('2004', '2', '4', '3', '2018-04-17 20:39:49', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=190;title=吉林省关于以市场化方式发展养老服务产业的实施意见');
INSERT INTO `jc_log` VALUES ('2005', '2', '4', '3', '2018-04-17 20:39:49', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=189;title=国务院关于发布政府核准的投资项目目录（2016年本）的通知');
INSERT INTO `jc_log` VALUES ('2006', '2', '4', '3', '2018-04-17 20:39:54', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=188;title=体育总局等23部门群众冬季运动推广普及计划（2016-2020年）');
INSERT INTO `jc_log` VALUES ('2007', '2', '4', '3', '2018-04-17 20:39:54', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=187;title=国务院办公厅关于进一步促进农产品加工业发展的意见');
INSERT INTO `jc_log` VALUES ('2008', '2', '4', '3', '2018-04-17 20:39:54', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=186;title=国家发改委 国家旅游局关于实施旅游休闲重大工程的通知');
INSERT INTO `jc_log` VALUES ('2009', '2', '4', '3', '2018-04-17 20:39:54', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=185;title=吉林正泰拓展为政府提供第三方服务新领域');
INSERT INTO `jc_log` VALUES ('2010', '2', '4', '3', '2018-04-17 20:39:54', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=184;title=《国家中小企业公共服务示范平台认定管理办法》');
INSERT INTO `jc_log` VALUES ('2011', '2', '4', '3', '2018-04-17 20:39:54', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=183;title=关于加快运用PPP模式 盘活基础设施存量资产有关工作的通知');
INSERT INTO `jc_log` VALUES ('2012', '2', '4', '3', '2018-04-17 20:39:55', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=182;title=“十三五”国家技术创新工程规划');
INSERT INTO `jc_log` VALUES ('2013', '2', '4', '3', '2018-04-17 20:39:55', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=163;title=一条六分多钟的新闻看似平常，实则包含了大量重磅信息。');
INSERT INTO `jc_log` VALUES ('2014', '2', '4', '3', '2018-04-17 20:39:59', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=164;title=范德贝伦用“历史性访问”来定义此次对华访问有着深刻含义。');
INSERT INTO `jc_log` VALUES ('2015', '2', '4', '3', '2018-04-17 20:40:08', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=160;title=4444444');
INSERT INTO `jc_log` VALUES ('2016', '2', '4', '3', '2018-04-17 20:40:08', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=159;title=333333');
INSERT INTO `jc_log` VALUES ('2017', '2', '4', '3', '2018-04-17 20:40:08', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=158;title=2222');
INSERT INTO `jc_log` VALUES ('2018', '2', '4', '3', '2018-04-17 20:40:08', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=154;title=项目名称');
INSERT INTO `jc_log` VALUES ('2019', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=175;title=蔡英文称登舰阅兵“不是和大陆较劲” 被批：你不配');
INSERT INTO `jc_log` VALUES ('2020', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=174;title=杜特尔特：中国之行将为菲律宾人创造一万个工作机会');
INSERT INTO `jc_log` VALUES ('2021', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=173;title=叙利亚国家电视台：美英法三国对叙“发动侵略”');
INSERT INTO `jc_log` VALUES ('2022', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=172;title=3月贸易逆差的秘密：大豆进口量大跌 飞机汽车进口剧增');
INSERT INTO `jc_log` VALUES ('2023', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=171;title= 唐驳虎：南海阅舰气势壮观 中国海军在全球又是啥地位？');
INSERT INTO `jc_log` VALUES ('2024', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=170;title= 新组建部门今年怎么花钱？公务员福利待遇有变化');
INSERT INTO `jc_log` VALUES ('2025', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=169;title=独家|袁隆平：粮食安全要掌握在自己手里 否则会被卡脖子');
INSERT INTO `jc_log` VALUES ('2026', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=168;title=海上阅兵当天，这个新部门把中国领海都管起来了');
INSERT INTO `jc_log` VALUES ('2027', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=167;title=院士被“双开” 中纪委刊文谈学者该有怎样的操守');
INSERT INTO `jc_log` VALUES ('2028', '2', '4', '3', '2018-04-17 20:40:44', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=166;title=俄国防部：美英法三国导弹没有进入俄防空区域');
INSERT INTO `jc_log` VALUES ('2029', '2', '4', '3', '2018-04-17 20:41:15', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=117;title=信息公示');
INSERT INTO `jc_log` VALUES ('2030', '2', '4', '3', '2018-04-17 20:41:15', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=122;title=成果展示');
INSERT INTO `jc_log` VALUES ('2031', '2', '4', '3', '2018-04-17 20:41:15', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=138;title=null');
INSERT INTO `jc_log` VALUES ('2032', '2', '4', '3', '2018-04-17 20:41:15', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=165;title=重要通知');
INSERT INTO `jc_log` VALUES ('2033', '9', '14', '3', '2018-04-18 20:38:13', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=154;name=咨询服务');
INSERT INTO `jc_log` VALUES ('2034', '9', '14', '3', '2018-04-18 20:41:25', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=155;name=申报服务');
INSERT INTO `jc_log` VALUES ('2035', '9', '14', '3', '2018-04-18 20:41:40', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=156;name=评估评价');
INSERT INTO `jc_log` VALUES ('2036', '9', '14', '3', '2018-04-18 20:41:55', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=157;name=关于我们');
INSERT INTO `jc_log` VALUES ('2037', '9', '14', '3', '2018-04-18 20:44:52', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=100;name=咨询服务');
INSERT INTO `jc_log` VALUES ('2038', '9', '14', '3', '2018-04-18 20:47:49', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=154;name=咨询服务');
INSERT INTO `jc_log` VALUES ('2039', '9', '14', '3', '2018-04-18 20:50:46', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=12;name=栏目项');
INSERT INTO `jc_log` VALUES ('2040', '9', '14', '3', '2018-04-18 20:54:48', '127.0.0.1', '/api/admin/model/update', '修改模型', 'id=12;name=栏目项');
INSERT INTO `jc_log` VALUES ('2041', '9', '14', '3', '2018-04-18 21:52:28', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=155;name=申报服务');
INSERT INTO `jc_log` VALUES ('2042', '9', '14', '3', '2018-04-18 22:13:56', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=156;name=评估评价');
INSERT INTO `jc_log` VALUES ('2043', '9', '14', '3', '2018-04-18 22:58:30', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=157;name=关于我们');
INSERT INTO `jc_log` VALUES ('2044', '9', '14', '3', '2018-04-18 23:39:01', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=172;title=战略研究');
INSERT INTO `jc_log` VALUES ('2045', '9', '14', '3', '2018-04-18 23:40:19', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=173;title=工程造价');
INSERT INTO `jc_log` VALUES ('2046', '9', '14', '3', '2018-04-18 23:40:52', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=174;title=试点方案');
INSERT INTO `jc_log` VALUES ('2047', '9', '14', '3', '2018-04-18 23:41:29', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=175;title=可行性研究');
INSERT INTO `jc_log` VALUES ('2048', '2', '4', '3', '2018-04-19 22:56:23', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=200;title=啥啥啥');
INSERT INTO `jc_log` VALUES ('2049', '2', '4', '3', '2018-04-19 23:25:35', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=171;name=在线服务');
INSERT INTO `jc_log` VALUES ('2050', '2', '4', '3', '2018-04-19 23:26:06', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=176;title=联评联审');
INSERT INTO `jc_log` VALUES ('2051', '2', '4', '3', '2018-04-19 23:26:28', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=176;name=联评联审');
INSERT INTO `jc_log` VALUES ('2052', '2', '4', '3', '2018-04-19 23:29:29', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=177;title=科技成果评价');
INSERT INTO `jc_log` VALUES ('2053', '2', '4', '3', '2018-04-19 23:29:51', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=178;title=预算内资金绩效评价');
INSERT INTO `jc_log` VALUES ('2054', '2', '4', '3', '2018-04-19 23:30:06', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=179;title=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('2055', '2', '4', '3', '2018-04-19 23:30:19', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=180;title=扶贫成效评估');
INSERT INTO `jc_log` VALUES ('2056', '2', '4', '3', '2018-04-19 23:30:32', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=181;title=省级示范镇评估');
INSERT INTO `jc_log` VALUES ('2057', '2', '4', '3', '2018-04-19 23:30:48', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=182;title=其他评估');
INSERT INTO `jc_log` VALUES ('2058', '2', '4', '3', '2018-04-19 23:31:14', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=171;name=在线服务');
INSERT INTO `jc_log` VALUES ('2059', '2', '4', '3', '2018-04-19 23:32:20', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=181;name=省级示范镇评估');
INSERT INTO `jc_log` VALUES ('2060', '2', '4', '3', '2018-04-19 23:34:30', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=177;name=科技成果评价');
INSERT INTO `jc_log` VALUES ('2061', '2', '4', '3', '2018-04-19 23:40:21', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=123;name=平台简介');
INSERT INTO `jc_log` VALUES ('2062', '2', '4', '3', '2018-04-19 23:45:28', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=200;title=啥啥啥');
INSERT INTO `jc_log` VALUES ('2063', '2', '4', '3', '2018-04-19 23:45:42', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=200;title=啥啥啥');
INSERT INTO `jc_log` VALUES ('2064', '9', '14', '3', '2018-04-21 08:44:45', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=201;title=资金申请');
INSERT INTO `jc_log` VALUES ('2065', '9', '14', '3', '2018-04-21 08:46:18', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=202;title=资金申请');
INSERT INTO `jc_log` VALUES ('2066', '9', '14', '3', '2018-04-21 08:52:59', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=201;title=项目申报');
INSERT INTO `jc_log` VALUES ('2067', '9', '14', '3', '2018-04-21 08:54:13', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=202;title=资金申请');
INSERT INTO `jc_log` VALUES ('2068', '9', '14', '3', '2018-04-21 08:54:41', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=201;title=项目申报');
INSERT INTO `jc_log` VALUES ('2069', '9', '14', '3', '2018-04-21 08:57:53', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=155;name=申报服务');
INSERT INTO `jc_log` VALUES ('2070', '9', '14', '3', '2018-04-21 08:58:59', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=202;title=资金申请');
INSERT INTO `jc_log` VALUES ('2071', '9', '14', '3', '2018-04-21 08:59:09', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=201;title=项目申报');
INSERT INTO `jc_log` VALUES ('2072', '9', '14', '3', '2018-04-21 09:05:20', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=183;title=最新案例');
INSERT INTO `jc_log` VALUES ('2073', '9', '14', '3', '2018-04-21 09:07:27', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=203;title=神秘的纪委监委如何工作案例');
INSERT INTO `jc_log` VALUES ('2074', '9', '14', '3', '2018-04-21 09:08:26', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=204;title=朝鲜宣布今日起停止核试验和导弹试射');
INSERT INTO `jc_log` VALUES ('2075', '9', '14', '3', '2018-04-21 09:12:06', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=204;title=朝鲜宣布今日起停止核试验和导弹试射');
INSERT INTO `jc_log` VALUES ('2076', '9', '14', '3', '2018-04-21 09:12:35', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=203;title=神秘的纪委监委如何工作案例');
INSERT INTO `jc_log` VALUES ('2077', '9', '14', '3', '2018-04-21 09:18:57', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=203;title=神秘的纪委监委如何工作案例');
INSERT INTO `jc_log` VALUES ('2078', '9', '14', '3', '2018-04-21 09:24:48', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=184;title=节能评估');
INSERT INTO `jc_log` VALUES ('2079', '9', '14', '3', '2018-04-21 09:25:51', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=185;title=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('2080', '9', '14', '3', '2018-04-21 09:26:09', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=186;title=重大专项评审');
INSERT INTO `jc_log` VALUES ('2081', '9', '14', '3', '2018-04-21 09:27:56', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=156;name=评估评价');
INSERT INTO `jc_log` VALUES ('2082', '9', '14', '3', '2018-04-21 09:28:28', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=184;name=节能评估');
INSERT INTO `jc_log` VALUES ('2083', '9', '14', '3', '2018-04-21 09:28:37', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=185;name=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('2084', '9', '14', '3', '2018-04-21 09:29:11', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=186;name=重大专项评审');
INSERT INTO `jc_log` VALUES ('2085', '9', '14', '3', '2018-04-21 09:29:32', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=185;name=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('2086', '9', '14', '3', '2018-04-21 09:29:53', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=184;name=节能评估');
INSERT INTO `jc_log` VALUES ('2087', '9', '14', '3', '2018-04-21 09:38:03', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=155;name=申报服务');
INSERT INTO `jc_log` VALUES ('2088', '9', '14', '3', '2018-04-21 09:38:50', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=155;name=申报服务');
INSERT INTO `jc_log` VALUES ('2089', '9', '14', '3', '2018-04-21 09:39:41', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=155;name=申报服务');
INSERT INTO `jc_log` VALUES ('2090', '9', '14', '3', '2018-04-21 09:40:38', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=156;name=评估评价');
INSERT INTO `jc_log` VALUES ('2091', '9', '14', '3', '2018-04-21 09:44:00', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=185;name=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('2092', '9', '14', '3', '2018-04-21 09:44:15', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=185;name=社会稳定风险评估');
INSERT INTO `jc_log` VALUES ('2093', '9', '14', '3', '2018-04-21 09:44:24', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=186;name=重大专项评审');
INSERT INTO `jc_log` VALUES ('2094', '9', '14', '3', '2018-04-21 09:51:29', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=205;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2095', '9', '14', '3', '2018-04-21 09:52:29', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=205;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2096', '9', '14', '3', '2018-04-21 09:53:13', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=206;title=产品价值');
INSERT INTO `jc_log` VALUES ('2097', '9', '14', '3', '2018-04-21 09:53:54', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=207;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2098', '9', '14', '3', '2018-04-21 09:54:21', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=208;title=产品价值');
INSERT INTO `jc_log` VALUES ('2099', '9', '14', '3', '2018-04-21 09:54:49', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=209;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2100', '9', '14', '3', '2018-04-21 09:55:16', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=210;title=产品价值');
INSERT INTO `jc_log` VALUES ('2101', '9', '14', '3', '2018-04-21 10:01:15', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=209;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2102', '9', '14', '3', '2018-04-21 10:03:21', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=209;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2103', '9', '14', '3', '2018-04-21 10:04:33', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=210;title=产品价值');
INSERT INTO `jc_log` VALUES ('2104', '9', '14', '3', '2018-04-21 10:05:23', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=210;title=产品价值');
INSERT INTO `jc_log` VALUES ('2105', '9', '14', '3', '2018-04-21 10:06:17', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=210;title=产品价值');
INSERT INTO `jc_log` VALUES ('2106', '9', '14', '3', '2018-04-21 10:07:24', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=207;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2107', '9', '14', '3', '2018-04-21 10:07:42', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=207;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2108', '9', '14', '3', '2018-04-21 10:08:04', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=207;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2109', '1', '14', '3', '2018-04-21 10:08:56', '127.0.0.1', '/api/admin/admin/local_update', '修改用户', 'id=9;username=gczx');
INSERT INTO `jc_log` VALUES ('2110', '9', '14', '3', '2018-04-21 10:12:42', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=208;title=产品价值');
INSERT INTO `jc_log` VALUES ('2111', '9', '14', '3', '2018-04-21 10:13:42', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=205;title=产品介绍');
INSERT INTO `jc_log` VALUES ('2112', '9', '14', '3', '2018-04-21 10:14:21', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=206;title=产品价值');
INSERT INTO `jc_log` VALUES ('2113', '9', '14', '3', '2018-04-21 10:16:18', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=187;title=资金申请');
INSERT INTO `jc_log` VALUES ('2114', '9', '14', '3', '2018-04-21 10:16:55', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=188;title= 项目申报');
INSERT INTO `jc_log` VALUES ('2115', '9', '14', '3', '2018-04-21 10:19:08', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=202;title=资金申请');
INSERT INTO `jc_log` VALUES ('2116', '9', '14', '3', '2018-04-21 10:19:08', '127.0.0.1', '/api/admin/content/delete', '删除文章', 'id=201;title=项目申报');
INSERT INTO `jc_log` VALUES ('2117', '9', '14', '3', '2018-04-21 10:40:01', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=184;name=节能评估');
INSERT INTO `jc_log` VALUES ('2118', '9', '14', '3', '2018-04-21 11:38:22', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=204;title=朝鲜宣布今日起停止核试验和导弹试射');
INSERT INTO `jc_log` VALUES ('2119', '9', '14', '3', '2018-04-21 11:38:31', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=203;title=神秘的纪委监委如何工作案例');
INSERT INTO `jc_log` VALUES ('2120', '11', '16', '3', '2018-04-21 15:56:29', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=189;title=专家');
INSERT INTO `jc_log` VALUES ('2121', '11', '16', '3', '2018-04-21 15:57:34', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=163;name=理事');
INSERT INTO `jc_log` VALUES ('2122', '11', '16', '3', '2018-04-21 15:57:47', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=162;name=影响');
INSERT INTO `jc_log` VALUES ('2123', '11', '16', '3', '2018-04-21 15:57:58', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=161;name=期刊');
INSERT INTO `jc_log` VALUES ('2124', '11', '16', '3', '2018-04-21 15:58:08', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=160;name=研究');
INSERT INTO `jc_log` VALUES ('2125', '11', '16', '3', '2018-04-21 17:21:51', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=158;name=动态');
INSERT INTO `jc_log` VALUES ('2126', '11', '16', '3', '2018-04-21 17:22:10', '127.0.0.1', '/api/admin/admin/local_update', '修改用户', 'id=11;username=jwzk');
INSERT INTO `jc_log` VALUES ('2127', '11', '16', '3', '2018-04-21 22:17:32', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=159;name=咨询');
INSERT INTO `jc_log` VALUES ('2128', '11', '16', '3', '2018-04-21 23:39:25', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=189;name=专家');
INSERT INTO `jc_log` VALUES ('2129', '11', '16', '3', '2018-04-22 00:08:48', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=164;name=关于');
INSERT INTO `jc_log` VALUES ('2141', '11', '16', '3', '2018-04-24 22:08:09', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=189;name=专家');
INSERT INTO `jc_log` VALUES ('2142', '1', '4', '3', '2018-05-15 21:43:06', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=17;name=审计咨询');
INSERT INTO `jc_log` VALUES ('2143', '1', '4', '3', '2018-05-15 21:48:26', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=18;name=评估评价');
INSERT INTO `jc_log` VALUES ('2144', '1', '4', '3', '2018-05-15 21:51:48', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=19;name=六维空间规划');
INSERT INTO `jc_log` VALUES ('2145', '1', '4', '3', '2018-05-15 21:52:44', '127.0.0.1', '/api/admin/site/save', '增加站点', 'id=20;name=资产评估');
INSERT INTO `jc_log` VALUES ('2146', '1', '17', '3', '2018-05-15 22:01:00', '127.0.0.1', '/api/admin/admin/local_save', '增加用户', 'id=12;username=sjzx');
INSERT INTO `jc_log` VALUES ('2147', '1', '17', '3', '2018-05-15 22:05:00', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=198;title=关于我们');
INSERT INTO `jc_log` VALUES ('2148', '1', '17', '3', '2018-05-15 22:07:17', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=199;title=新闻中心');
INSERT INTO `jc_log` VALUES ('2149', '1', '17', '3', '2018-05-15 22:08:23', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=200;title=主营业务');
INSERT INTO `jc_log` VALUES ('2150', '1', '17', '3', '2018-05-15 22:10:18', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=201;title=业绩展示');
INSERT INTO `jc_log` VALUES ('2151', '1', '17', '3', '2018-05-15 22:10:57', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=202;title=联系我们');
INSERT INTO `jc_log` VALUES ('2152', '1', '18', '3', '2018-05-15 22:16:46', '127.0.0.1', '/api/admin/admin/local_save', '增加用户', 'id=13;username=pgpj');
INSERT INTO `jc_log` VALUES ('2153', '1', '18', '3', '2018-05-15 22:19:31', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=203;title=关于我们');
INSERT INTO `jc_log` VALUES ('2154', '1', '18', '3', '2018-05-15 22:22:03', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=204;title=新闻中心');
INSERT INTO `jc_log` VALUES ('2155', '1', '18', '3', '2018-05-15 22:22:48', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=205;title=主营业务');
INSERT INTO `jc_log` VALUES ('2156', '1', '18', '3', '2018-05-15 22:23:21', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=206;title=业绩展示');
INSERT INTO `jc_log` VALUES ('2157', '1', '18', '3', '2018-05-15 22:23:54', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=207;title=联系我们');
INSERT INTO `jc_log` VALUES ('2158', '1', '19', '3', '2018-05-15 22:26:28', '127.0.0.1', '/api/admin/admin/local_save', '增加用户', 'id=14;username=kjgh');
INSERT INTO `jc_log` VALUES ('2159', '1', '19', '3', '2018-05-15 22:30:14', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=208;title=关于我们');
INSERT INTO `jc_log` VALUES ('2160', '1', '19', '3', '2018-05-15 22:30:49', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=209;title=新闻中心');
INSERT INTO `jc_log` VALUES ('2161', '1', '19', '3', '2018-05-15 22:31:24', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=210;title=主营业务');
INSERT INTO `jc_log` VALUES ('2162', '1', '19', '3', '2018-05-15 22:31:51', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=211;title=业绩展示');
INSERT INTO `jc_log` VALUES ('2163', '1', '19', '3', '2018-05-15 22:32:44', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=212;title=联系我们');
INSERT INTO `jc_log` VALUES ('2164', '1', '19', '3', '2018-05-15 22:33:16', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=213;title=联系我们');
INSERT INTO `jc_log` VALUES ('2165', '1', '19', '3', '2018-05-15 22:33:48', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=214;title=加入我们');
INSERT INTO `jc_log` VALUES ('2166', '1', '20', '3', '2018-05-15 22:41:43', '127.0.0.1', '/api/admin/admin/local_save', '增加用户', 'id=15;username=zcpj');
INSERT INTO `jc_log` VALUES ('2167', '1', '20', '3', '2018-05-15 22:45:01', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=215;title=关于我们');
INSERT INTO `jc_log` VALUES ('2168', '1', '20', '3', '2018-05-15 22:45:34', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=216;title=新闻中心');
INSERT INTO `jc_log` VALUES ('2169', '1', '20', '3', '2018-05-15 22:46:15', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=217;title=主营业务');
INSERT INTO `jc_log` VALUES ('2170', '1', '20', '3', '2018-05-15 22:46:59', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=218;title=业绩展示');
INSERT INTO `jc_log` VALUES ('2171', '1', '20', '3', '2018-05-15 22:47:22', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=219;title=关于我们');
INSERT INTO `jc_log` VALUES ('2172', '1', '20', '3', '2018-05-15 22:48:05', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=219;name=联系我们');
INSERT INTO `jc_log` VALUES ('2173', '1', '20', '3', '2018-05-15 22:48:30', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=220;title=联系我们');
INSERT INTO `jc_log` VALUES ('2174', '1', '20', '3', '2018-05-15 22:48:56', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=220;title=联系我们');
INSERT INTO `jc_log` VALUES ('2175', '1', '20', '3', '2018-05-15 22:49:34', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=221;title=联系我们');
INSERT INTO `jc_log` VALUES ('2176', '1', '20', '3', '2018-05-15 22:50:01', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=222;title=加入我们');
INSERT INTO `jc_log` VALUES ('2181', '1', '4', '3', '2018-06-02 10:20:35', '127.0.0.1', '/api/admin/admin/global_delete', '删除用户', 'id=8;username=ztfwjh');
INSERT INTO `jc_log` VALUES ('2182', '1', '18', '3', '2018-06-04 11:30:45', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=203;name=关于我们');
INSERT INTO `jc_log` VALUES ('2183', '1', '18', '3', '2018-06-04 11:31:08', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=203;name=关于我们');
INSERT INTO `jc_log` VALUES ('2184', '1', '19', '3', '2018-06-05 10:00:06', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=210;name=主营业务');
INSERT INTO `jc_log` VALUES ('2185', '1', '19', '3', '2018-06-05 10:03:19', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=210;name=主营业务');
INSERT INTO `jc_log` VALUES ('2186', '1', '19', '3', '2018-06-05 11:03:59', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=211;name=业绩展示');
INSERT INTO `jc_log` VALUES ('2187', '1', '19', '3', '2018-06-05 11:47:25', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=210;name=主营业务');
INSERT INTO `jc_log` VALUES ('2188', '1', '19', '3', '2018-06-05 15:53:29', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=223;title=空间体系规划');
INSERT INTO `jc_log` VALUES ('2189', '1', '19', '3', '2018-06-05 18:08:18', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=213;name=联系我们');
INSERT INTO `jc_log` VALUES ('2190', '1', '19', '3', '2018-06-06 17:23:12', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=208;name=关于我们');
INSERT INTO `jc_log` VALUES ('2191', '1', '19', '3', '2018-06-07 11:58:30', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=224;title=公司要闻');
INSERT INTO `jc_log` VALUES ('2192', '1', '19', '3', '2018-06-07 15:22:08', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=225;title=新闻详情');
INSERT INTO `jc_log` VALUES ('2193', '1', '19', '3', '2018-06-08 16:46:59', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=208;name=关于我们');
INSERT INTO `jc_log` VALUES ('2194', '1', '18', '3', '2018-06-09 09:32:59', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=207;name=联系我们');
INSERT INTO `jc_log` VALUES ('2195', '1', '18', '3', '2018-06-09 09:33:59', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=226;title=联系我们');
INSERT INTO `jc_log` VALUES ('2196', '1', '18', '3', '2018-06-09 09:34:25', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=227;title=加入我们');
INSERT INTO `jc_log` VALUES ('2197', '1', '18', '3', '2018-06-09 09:35:36', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=102;name=加入我们');
INSERT INTO `jc_log` VALUES ('2198', '1', '17', '3', '2018-06-09 09:41:46', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=202;name=联系我们');
INSERT INTO `jc_log` VALUES ('2199', '1', '17', '3', '2018-06-09 09:42:29', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=228;title=联系我们');
INSERT INTO `jc_log` VALUES ('2200', '1', '17', '3', '2018-06-09 09:42:44', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=229;title=加入我们');
INSERT INTO `jc_log` VALUES ('2201', '1', '15', '3', '2018-06-09 09:49:05', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=230;title=关于我们');
INSERT INTO `jc_log` VALUES ('2202', '1', '15', '3', '2018-06-09 09:50:02', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=231;title=新闻中心');
INSERT INTO `jc_log` VALUES ('2203', '1', '15', '3', '2018-06-09 09:50:17', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=231;name=新闻中心');
INSERT INTO `jc_log` VALUES ('2204', '1', '15', '3', '2018-06-09 09:50:44', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=232;title=主营业务');
INSERT INTO `jc_log` VALUES ('2205', '1', '15', '3', '2018-06-09 09:51:13', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=233;title=业绩展示');
INSERT INTO `jc_log` VALUES ('2206', '1', '15', '3', '2018-06-09 09:51:42', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=234;title=联系我们');
INSERT INTO `jc_log` VALUES ('2207', '1', '15', '3', '2018-06-09 09:51:57', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=235;title=加入我们');
INSERT INTO `jc_log` VALUES ('2208', '1', '15', '3', '2018-06-09 09:52:21', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=235;name=加入我们');
INSERT INTO `jc_log` VALUES ('2209', '1', '15', '3', '2018-06-09 09:53:17', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=236;title=集团新闻');
INSERT INTO `jc_log` VALUES ('2210', '1', '15', '3', '2018-06-09 09:53:28', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=237;title=地方动态');
INSERT INTO `jc_log` VALUES ('2211', '1', '15', '3', '2018-06-09 09:53:38', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=238;title=媒体报道');
INSERT INTO `jc_log` VALUES ('2212', '1', '20', '3', '2018-06-09 09:54:40', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=216;name=新闻中心');
INSERT INTO `jc_log` VALUES ('2213', '1', '20', '3', '2018-06-09 09:54:53', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=216;name=新闻中心');
INSERT INTO `jc_log` VALUES ('2214', '1', '20', '3', '2018-06-09 09:55:38', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=216;name=新闻中心');
INSERT INTO `jc_log` VALUES ('2215', '1', '20', '3', '2018-06-09 09:56:05', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=239;title=集团要闻');
INSERT INTO `jc_log` VALUES ('2216', '1', '20', '3', '2018-06-09 09:56:26', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=240;title=产业新闻');
INSERT INTO `jc_log` VALUES ('2217', '1', '20', '3', '2018-06-09 09:56:40', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=241;title=媒体关注');
INSERT INTO `jc_log` VALUES ('2218', '1', '20', '3', '2018-06-09 09:57:01', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=217;name=主营业务');
INSERT INTO `jc_log` VALUES ('2219', '1', '20', '3', '2018-06-09 09:57:16', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=218;name=业绩展示');
INSERT INTO `jc_log` VALUES ('2220', '1', '20', '3', '2018-06-09 09:57:29', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=219;name=联系我们');
INSERT INTO `jc_log` VALUES ('2221', '1', '20', '3', '2018-06-09 09:57:46', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=222;name=加入我们');
INSERT INTO `jc_log` VALUES ('2222', '1', '19', '3', '2018-06-09 10:02:39', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=212;name=联系我们');
INSERT INTO `jc_log` VALUES ('2223', '1', '19', '3', '2018-06-09 10:44:44', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=242;title=测绘');
INSERT INTO `jc_log` VALUES ('2224', '1', '19', '3', '2018-06-09 10:52:27', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=243;title=行业洞察');
INSERT INTO `jc_log` VALUES ('2225', '1', '19', '3', '2018-06-09 10:52:46', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=243;name=行业洞察');
INSERT INTO `jc_log` VALUES ('2226', '1', '19', '3', '2018-06-09 10:53:07', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=244;title=媒体聚焦');
INSERT INTO `jc_log` VALUES ('2227', '1', '19', '3', '2018-06-09 10:53:15', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=245;title=视频中心');
INSERT INTO `jc_log` VALUES ('2228', '1', '9', '3', '2018-06-09 10:56:04', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=246;title=技术');
INSERT INTO `jc_log` VALUES ('2229', '1', '9', '3', '2018-06-09 10:56:41', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=247;title=智库');
INSERT INTO `jc_log` VALUES ('2230', '1', '9', '3', '2018-06-09 10:57:01', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=248;title=活动');
INSERT INTO `jc_log` VALUES ('2231', '1', '9', '3', '2018-06-09 10:57:16', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=249;title=咨询');
INSERT INTO `jc_log` VALUES ('2232', '1', '9', '3', '2018-06-09 10:57:27', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=250;title=政策');
INSERT INTO `jc_log` VALUES ('2233', '1', '9', '3', '2018-06-09 10:57:46', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=150;title=众创咨询');
INSERT INTO `jc_log` VALUES ('2234', '1', '9', '3', '2018-06-09 10:57:46', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=151;title=服务机构');
INSERT INTO `jc_log` VALUES ('2235', '1', '9', '3', '2018-06-09 10:57:46', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=152;title=专题培训');
INSERT INTO `jc_log` VALUES ('2236', '1', '9', '3', '2018-06-09 10:57:46', '127.0.0.1', '/api/admin/channel/delete', '删除栏目', 'id=153;title=关于我们');
INSERT INTO `jc_log` VALUES ('2237', '1', '9', '3', '2018-06-09 10:58:11', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=251;title=所有技术');
INSERT INTO `jc_log` VALUES ('2238', '1', '9', '3', '2018-06-09 11:00:08', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=252;title=精选专题');
INSERT INTO `jc_log` VALUES ('2239', '1', '9', '3', '2018-06-09 11:01:19', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=253;title=行业专家');
INSERT INTO `jc_log` VALUES ('2240', '1', '9', '3', '2018-06-09 11:01:38', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=254;title=合作机构');
INSERT INTO `jc_log` VALUES ('2241', '1', '9', '3', '2018-06-09 11:23:29', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=246;name=技术');
INSERT INTO `jc_log` VALUES ('2242', '1', '9', '3', '2018-06-09 11:26:30', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=247;name=智库');
INSERT INTO `jc_log` VALUES ('2243', '1', '9', '3', '2018-06-09 11:28:01', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=248;name=活动');
INSERT INTO `jc_log` VALUES ('2244', '1', '9', '3', '2018-06-09 11:29:50', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=249;name=咨询');
INSERT INTO `jc_log` VALUES ('2245', '1', '9', '3', '2018-06-09 11:31:01', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=250;name=政策');
INSERT INTO `jc_log` VALUES ('2246', '1', '9', '3', '2018-06-09 11:42:52', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=251;name=所有技术');
INSERT INTO `jc_log` VALUES ('2247', '1', '9', '3', '2018-06-09 11:44:51', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=251;name=所有技术');
INSERT INTO `jc_log` VALUES ('2248', '1', '9', '3', '2018-06-09 11:45:14', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=252;name=精选专题');
INSERT INTO `jc_log` VALUES ('2249', '1', '9', '3', '2018-06-09 13:33:20', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=253;name=行业专家');
INSERT INTO `jc_log` VALUES ('2250', '1', '9', '3', '2018-06-09 13:34:08', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=254;name=合作机构');
INSERT INTO `jc_log` VALUES ('2251', '1', '9', '3', '2018-06-09 15:08:02', '127.0.0.1', '/api/admin/model/save', '增加模型', 'id=103;name=专家');
INSERT INTO `jc_log` VALUES ('2252', '1', '9', '3', '2018-06-09 15:09:18', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=255;title=医药科学');
INSERT INTO `jc_log` VALUES ('2253', '1', '9', '3', '2018-06-09 15:09:56', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=211;title=专家A');
INSERT INTO `jc_log` VALUES ('2254', '1', '9', '3', '2018-06-09 15:11:19', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=255;name=医药科学');
INSERT INTO `jc_log` VALUES ('2255', '1', '9', '3', '2018-06-09 15:35:02', '127.0.0.1', '/api/admin/guestbook_ctg/save', '增加留言类别', 'id=3;name=专家咨询');
INSERT INTO `jc_log` VALUES ('2256', '1', '9', '3', '2018-06-09 15:35:12', '127.0.0.1', '/api/admin/guestbook_ctg/save', '增加留言类别', 'id=4;name=活动');
INSERT INTO `jc_log` VALUES ('2257', '1', '9', '3', '2018-06-09 16:38:03', '127.0.0.1', '/api/admin/admin/global_update', '修改用户', 'id=7;username=zckj');
INSERT INTO `jc_log` VALUES ('2258', '1', '9', '3', '2018-06-09 16:39:41', '127.0.0.1', '/api/admin/guestbook/check', '审核留言', 'id=17;title=vv');
INSERT INTO `jc_log` VALUES ('2259', '1', '9', '3', '2018-06-11 20:12:01', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=256;title=污水处理之工业膜相关技术');
INSERT INTO `jc_log` VALUES ('2260', '1', '9', '3', '2018-06-11 20:13:11', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=257;title=新材料之王石墨烯相关技术');
INSERT INTO `jc_log` VALUES ('2261', '1', '9', '3', '2018-06-11 20:27:43', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=256;name=污水处理之工业膜相关技术123');
INSERT INTO `jc_log` VALUES ('2262', '1', '9', '3', '2018-06-11 20:28:03', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=257;name=新材料之王石墨烯相关技术456');
INSERT INTO `jc_log` VALUES ('2263', '1', '9', '3', '2018-06-11 20:39:58', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=212;title=石墨烯经济高效分散技术及其高性能防腐涂料');
INSERT INTO `jc_log` VALUES ('2264', '1', '9', '3', '2018-06-11 20:40:38', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=213;title=石墨烯复合电极材料及超级电容器集成应用关键技术');
INSERT INTO `jc_log` VALUES ('2265', '1', '9', '3', '2018-06-11 20:44:35', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=213;title=石墨烯复合电极材料及超级电容器集成应用关键技术');
INSERT INTO `jc_log` VALUES ('2266', '1', '9', '3', '2018-06-11 20:45:29', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=212;title=石墨烯经济高效分散技术及其高性能防腐涂料');
INSERT INTO `jc_log` VALUES ('2267', '1', '9', '3', '2018-06-11 21:07:19', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=211;title=专家A');
INSERT INTO `jc_log` VALUES ('2268', '1', '9', '3', '2018-06-11 22:12:39', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=214;title=中国科学院宁波材料所');
INSERT INTO `jc_log` VALUES ('2269', '1', '9', '3', '2018-06-11 22:14:08', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=214;title=中国科学院宁波材料所');
INSERT INTO `jc_log` VALUES ('2270', '1', '9', '3', '2018-06-11 22:18:01', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=258;title=企业案例');
INSERT INTO `jc_log` VALUES ('2271', '1', '9', '3', '2018-06-11 22:25:22', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=258;name=企业案例');
INSERT INTO `jc_log` VALUES ('2272', '1', '9', '3', '2018-06-11 22:25:56', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=258;name=我的企业案例');
INSERT INTO `jc_log` VALUES ('2273', '1', '9', '3', '2018-06-11 22:26:14', '127.0.0.1', '/api/admin/channel/update', '修改栏目', 'id=258;name=我的企业案例');
INSERT INTO `jc_log` VALUES ('2274', '1', '9', '3', '2018-06-11 22:31:00', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=215;title=吴晓波：企业如何转型？看完这三个故事就懂了');
INSERT INTO `jc_log` VALUES ('2275', '1', '9', '3', '2018-06-11 22:34:27', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=215;title=吴晓波：企业如何转型？看完这三个故事就懂了');
INSERT INTO `jc_log` VALUES ('2276', '1', '9', '3', '2018-06-11 22:38:11', '127.0.0.1', '/api/admin/channel/save', '增加栏目', 'id=259;title=正在进行111');
INSERT INTO `jc_log` VALUES ('2277', '1', '9', '3', '2018-06-11 22:39:05', '127.0.0.1', '/api/admin/content/save', '增加文章', 'id=216;title=上海市大学生科技创业基金“雄鹰计划”');
INSERT INTO `jc_log` VALUES ('2278', '1', '9', '3', '2018-06-11 22:41:16', '127.0.0.1', '/api/admin/content/update', '修改文章', 'id=216;title=上海市大学生科技创业基金“雄鹰计划”');

-- ----------------------------
-- Table structure for jc_message
-- ----------------------------
DROP TABLE IF EXISTS `jc_message`;
CREATE TABLE `jc_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  PRIMARY KEY (`msg_id`),
  KEY `fk_jc_message_user_send` (`msg_send_user`),
  KEY `fk_jc_message_user_receiver` (`msg_receiver_user`),
  KEY `fk_jc_message_site` (`site_id`),
  CONSTRAINT `fk_jc_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Records of jc_message
-- ----------------------------

-- ----------------------------
-- Table structure for jc_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_model`;
CREATE TABLE `jc_model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL COMMENT '名称',
  `model_path` varchar(100) NOT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(20) DEFAULT NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(20) DEFAULT NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认模型',
  `is_global` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否全站模型',
  `site_id` int(11) DEFAULT NULL COMMENT '非全站模型所属站点',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模型表';

-- ----------------------------
-- Records of jc_model
-- ----------------------------
INSERT INTO `jc_model` VALUES ('1', '新闻', '1', 'news', 'news', '139', '139', '310', '310', '1', '1', '0', '0', '1', '4');
INSERT INTO `jc_model` VALUES ('2', '单页', '2', 'alone', 'alone', '139', '139', '310', '310', '2', '0', '1', '0', '1', null);
INSERT INTO `jc_model` VALUES ('4', '下载', '4', 'download', 'download', '139', '139', '310', '310', '4', '1', '1', '0', '1', '4');
INSERT INTO `jc_model` VALUES ('5', '图库', '5', 'pic', 'pic', '139', '139', '310', '310', '5', '1', '1', '0', '1', '4');
INSERT INTO `jc_model` VALUES ('6', '视频', '6', 'video', 'video', '139', '139', '310', '310', '10', '1', '1', '0', '1', '4');
INSERT INTO `jc_model` VALUES ('8', '招聘', 'job', 'job', 'job', '139', '139', '310', '310', '10', '1', '1', '0', '1', '4');
INSERT INTO `jc_model` VALUES ('9', '文库', 'wenku', 'doc', 'doc', '139', '139', '310', '310', '10', '1', '1', '0', '1', '4');
INSERT INTO `jc_model` VALUES ('11', '栏目菜单', 'column_menu', 'column_menu', 'column_menu', '139', '139', '310', '310', '11', '1', '0', '1', '1', null);
INSERT INTO `jc_model` VALUES ('12', '栏目项', 'column_item', 'column_item', 'column_item', '1900', '550', '310', '310', '12', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('13', '关于页', 'about', 'about', 'about', '139', '139', '310', '310', '13', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('14', '公告', 'public_notice', 'public_notice', 'public_notice', '139', '139', '310', '310', '14', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('15', '信息', 'info', 'info', 'info', '139', '139', '310', '310', '15', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('16', '评审', 'review', 'review', 'review', '139', '139', '310', '310', '16', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('17', '评价', 'asses', 'asses', 'asses', '139', '139', '310', '310', '17', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('18', '评估', 'evaluate', 'evaluate', 'evaluate', '139', '139', '310', '310', '18', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('100', '咨询服务', 'consulting', 'consulting', 'consulting', '1920', '350', '310', '310', '10', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('101', '成果展示', 'cgzs', 'cgzs', 'cgzs', '94', '94', '94', '94', '10', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('102', '加入我们', '102', 'about', 'about', '139', '139', '310', '310', '10', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('103', '专家', '103', 'zj', 'zj', '139', '139', '310', '310', '10', '1', '0', '0', '1', null);

-- ----------------------------
-- Table structure for jc_model_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_model_item`;
CREATE TABLE `jc_model_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '70' COMMENT '排列顺序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型',
  `is_single` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否独占一行',
  `is_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否栏目模型项',
  `is_custom` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否自定义',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填项',
  `image_width` int(11) DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(11) DEFAULT NULL COMMENT '图片宽度',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_model` (`model_id`),
  CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=883 DEFAULT CHARSET=utf8 COMMENT='CMS模型项表';

-- ----------------------------
-- Records of jc_model_item
-- ----------------------------
INSERT INTO `jc_model_item` VALUES ('1', '1', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('2', '1', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('3', '1', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('4', '1', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('5', '1', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('6', '1', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('7', '1', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('8', '1', 'channelStatic', '栏目静态化', '11', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('9', '1', 'contentStatic', '内容静态化', '11', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('10', '1', 'priority', '排列顺序', '11', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('11', '1', 'display', '显示', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('12', '1', 'docImg', '文档图片', '11', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('14', '1', 'afterCheck', '审核后', '12', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('15', '1', 'commentControl', '评论', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('16', '1', 'allowUpdown', '顶踩', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('17', '1', 'viewGroupIds', '浏览权限', '11', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('18', '1', 'contriGroupIds', '投稿权限', '11', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('20', '1', 'link', '外部链接', '11', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('21', '1', 'titleImg', '标题图', '11', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('23', '1', 'title', '标题', '9', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('24', '1', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('25', '1', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('26', '1', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('27', '1', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('28', '1', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('29', '1', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('30', '1', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('31', '1', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('32', '1', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('33', '1', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('34', '1', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('42', '2', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('43', '2', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('44', '2', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('45', '2', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('46', '2', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('47', '2', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('48', '2', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('49', '2', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('51', '2', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('52', '2', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('53', '2', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('93', '4', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('94', '4', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('95', '4', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('96', '4', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('97', '4', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('98', '4', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('99', '4', 'tplContent', '选择模型模板', '9', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('100', '4', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('101', '4', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('102', '4', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('103', '4', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('104', '4', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('105', '4', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('107', '4', 'channelId', '栏目', '1', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('108', '4', 'title', '软件名称', '2', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('109', '4', 'shortTitle', '软件简称', '3', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('110', '4', 'titleColor', '标题颜色', '4', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('111', '4', 'description', '摘要', '5', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('112', '4', 'author', '发布人', '6', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('113', '4', 'viewGroupIds', '浏览权限', '7', null, null, null, null, null, null, null, '7', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('114', '4', 'topLevel', '固顶级别', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('115', '4', 'releaseDate', '发布时间', '9', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('116', '4', 'typeId', '内容类型', '9', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('117', '4', 'tplContent', '指定模板', '22', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('118', '4', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('119', '4', 'attachments', '资源上传', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('120', '4', 'txt', '软件介绍', '20', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('121', '4', 'softType', '软件类型', '12', '国产软件', '国产软件,国外软件', '100', '3', '30', null, null, '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('122', '4', 'warrant', '软件授权', '13', '免费版', '免费版,共享版', '', '3', '30', '', '', '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('123', '4', 'relatedLink', '相关链接', '14', 'http://', '', '50', '3', '30', '', '', '1', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('124', '4', 'demoUrl', '演示地址', '15', 'http://', null, '60', '3', '30', null, null, '1', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('125', '5', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('126', '5', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('127', '5', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('128', '5', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('129', '5', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('130', '5', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('131', '5', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('132', '5', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('133', '5', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('134', '5', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('135', '5', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('136', '5', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('138', '5', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('139', '5', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('140', '5', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('141', '5', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('142', '5', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('144', '5', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('145', '5', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('146', '5', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('147', '5', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('148', '5', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('149', '5', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('150', '5', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('151', '5', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('152', '5', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('153', '5', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('154', '5', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('155', '5', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('156', '5', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('157', '5', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('158', '5', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('159', '5', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('160', '5', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('161', '5', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('162', '5', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('163', '5', 'pictures', '图片集', '11', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('164', '6', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('165', '6', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('166', '6', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('167', '6', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('168', '6', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('169', '6', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('170', '6', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('171', '6', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('172', '6', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('173', '6', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('174', '6', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('175', '6', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('177', '6', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('178', '6', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('179', '6', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('180', '6', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('181', '6', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('183', '6', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('184', '6', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('185', '6', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('186', '6', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('187', '6', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('188', '6', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('189', '6', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('190', '6', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('191', '6', 'description', '内容简介', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('192', '6', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('193', '6', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('194', '6', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('195', '6', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('196', '6', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('197', '6', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('198', '6', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('199', '6', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('200', '6', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('201', '6', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('202', '6', 'attachments', '附件', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('203', '6', 'media', '多媒体', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('246', '4', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('249', '8', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('250', '8', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('251', '8', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('252', '8', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('253', '8', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('254', '8', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('255', '8', 'tplContent', '选择模型模板', '9', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('256', '8', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('257', '8', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('258', '8', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('259', '8', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('260', '8', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('262', '8', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('263', '8', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('264', '8', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('265', '8', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('266', '8', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('268', '8', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('269', '8', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('270', '8', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('271', '8', 'channelId', '栏目', '1', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('272', '8', 'title', '岗位名称', '1', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('275', '8', 'tagStr', 'Tag标签', '7', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('279', '8', 'viewGroupIds', '浏览权限', '8', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('280', '8', 'topLevel', '固顶级别', '7', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('281', '8', 'releaseDate', '发布时间', '2', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('282', '8', 'typeId', '内容类型', '7', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('283', '8', 'tplContent', '指定模板', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('289', '8', 'txt', '职位描述', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('290', '8', 'deadline', '截止日期', '2', null, null, null, '3', '30', '留空永久有效', null, '5', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('291', '8', 'experience', '工作经验', '3', null, '1-3年,3-5年,5年以上,不限', null, '3', '30', null, null, '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('292', '8', 'education', '最低学历', '3', '', '专科,本科,硕士,不限', '', '3', '30', '', '', '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('293', '8', 'salary', '职位月薪', '4', null, '1500-2000,2000-3000,3000-5000,5000-8000,8000以上,面议', null, '3', '30', null, null, '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('294', '8', 'workplace', '工作地点', '4', '', '北京,上海,深圳,广州,重庆,南京,杭州,西安,南昌', '', '3', '30', '', '', '7', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('295', '8', 'nature', '工作性质', '5', '', '全职,兼职', '', '3', '30', '', '', '8', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('296', '8', 'hasmanage', '管理经验', '5', '', '要求,不要求', '', '3', '30', '', '', '8', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('297', '8', 'nums', '招聘人数', '6', '', '1-3人,3-5人,5-10人,若干', '', '3', '30', '', '', '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('298', '8', 'category', '职位类别', '6', null, '项目主管,java高级工程师,java工程师,网页设计师,测试人员,技术支持', null, '3', '30', null, null, '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('299', '9', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('300', '9', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('301', '9', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('302', '9', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('303', '9', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('304', '9', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('305', '9', 'tplContent', '内容模板', '9', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('306', '9', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('307', '9', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('308', '9', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('309', '9', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('310', '9', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('312', '9', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('313', '9', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('314', '9', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('315', '9', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('316', '9', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('317', '9', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('318', '9', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('319', '9', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('320', '9', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('321', '9', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('322', '9', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('323', '9', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('324', '9', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('325', '9', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('326', '9', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('327', '9', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('328', '9', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('329', '9', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('330', '9', 'docPath', '文档', '11', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('333', '9', 'downNeed', '下载需要财富', '11', null, null, null, null, null, null, null, '2', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('334', '9', 'isOpen', '是否开放', '11', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('335', '1', 'workflowId', '工作流', '12', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('338', '4', 'workflowId', '工作流', '10', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('339', '5', 'workflowId', '工作流', '11', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('340', '6', 'workflowId', '工作流', '11', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('342', '8', 'workflowId', '工作流', '11', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('343', '9', 'workflowId', '工作流', '11', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('344', '1', 'channelId', '栏目', '8', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('403', '6', 'Director', '导演', '10', '', '', '', '1', '2', '', '', '1', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('404', '6', 'Starring', '主演', '10', '', '', '', '1', '30', '', '', '1', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('405', '6', 'VideoType', '视频类型', '10', null, '历史,古装,都市,喜剧,悬疑,动作,谍战,伦理,战争,惊悚', null, '3', '30', null, null, '7', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('406', '6', 'Video', '影片信息', '10', '', '正片,预告片', '', '3', '30', '', '', '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('408', '1', 'contentImg', '内容图', '11', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('409', '5', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '0', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('410', '6', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('412', '1', 'allowShare', '分享', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('413', '1', 'allowScore', '评分', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('416', '1', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('417', '1', 'tplMobileContent', '指定手机模板', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('418', '2', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('419', '2', 'channelStatic', '栏目静态化', '9', null, null, null, null, null, null, null, '4', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('420', '2', 'contentStatic', '内容静态化', '9', null, null, null, null, null, null, null, '4', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('421', '4', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('422', '4', 'channelStatic', '栏目静态化', '9', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('423', '4', 'contentStatic', '内容静态化', '9', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('424', '4', 'tplMobileContent', '指定手机模板', '9', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('425', '5', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('426', '6', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('427', '9', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('431', '8', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('432', '8', 'tplMobileContent', '指定手机模板', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('438', '1', 'charge', '是否收费', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('439', '9', 'hy', '文档类型', '11', null, 'DOC,PPT,TXT,PDF', null, '3', '30', null, null, '8', '1', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('440', '9', 'em', '所属行业', '11', null, '科技,人文社科,经管营销,教育,办公应用', null, '3', '30', null, null, '8', '1', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('442', '4', 'size', '大小', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('443', '4', 'edition', '版本', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('444', '4', 'system', '支持系统', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('445', '4', 'bit', '位数', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('456', '4', 'charge', '是否收费', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('457', '4', 'typeImg', '类型图', '9', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('458', '9', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('462', '1', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('609', '1', 'typeImg', '类型图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('610', '1', 'titleImg', '标题图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('611', '1', 'contentImg', '内容图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('612', '1', 'attachments', '附件', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('613', '1', 'media', '多媒体', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('614', '1', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('615', '1', 'pictures', '图片集', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('617', '11', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('618', '11', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('619', '11', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('620', '11', 'description', 'meta描述', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('621', '11', 'keywords', 'meta关键字', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('622', '11', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('623', '11', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('624', '11', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('625', '11', 'link', '外部链接', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('626', '11', 'display', '显示', '10', null, null, null, '3', '30', null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('627', '11', 'workflowId', '工作流', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('628', '11', 'channelId', '栏目', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('629', '11', 'title', '标题', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('630', '11', 'shortTitle', '简短标题', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('631', '11', 'titleColor', '标题颜色', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('632', '11', 'description', '摘要', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('633', '11', 'tplContent', '指定模板', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('634', '11', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('635', '11', 'isOpen', '是否开放', '10', null, null, null, '3', '30', null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('636', '12', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('637', '12', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('638', '12', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('639', '12', 'keywords', 'meta关键字', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('640', '12', 'description', 'meta描述', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('641', '12', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('642', '12', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('643', '12', 'workflowId', '工作流', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('644', '12', 'link', '外部链接', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('645', '12', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('646', '12', 'display', '显示', '10', null, null, null, '3', '30', null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('647', '13', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('648', '13', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('649', '13', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('650', '13', 'description', 'meta描述', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('651', '13', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('652', '13', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('653', '13', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('654', '14', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('655', '14', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('656', '14', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('657', '14', 'keywords', 'meta关键字', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('658', '14', 'description', 'meta描述', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('659', '14', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('660', '14', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('661', '14', 'display', '显示', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('662', '14', 'viewGroupIds', '浏览权限', '10', null, null, null, '3', '30', null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('663', '14', 'link', '外部链接', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('664', '14', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('665', '15', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('666', '15', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('667', '15', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('668', '15', 'display', '显示', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('669', '15', 'commentControl', '评论', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('670', '15', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('671', '15', 'link', '外部链接', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('672', '15', 'workflowId', '工作流', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('673', '15', 'viewGroupIds', '浏览权限', '10', null, null, null, '3', '30', null, null, '7', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('674', '16', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('675', '16', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('676', '16', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('677', '16', 'keywords', 'meta关键字', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('678', '16', 'description', 'meta描述', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('680', '16', 'commentControl', '评论', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('681', '16', 'allowScore', '评分', '10', null, null, null, '3', '30', null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('682', '16', 'workflowId', '工作流', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('683', '16', 'contriGroupIds', '投稿权限', '10', null, null, null, '3', '30', null, null, '7', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('684', '16', 'channelId', '栏目', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('685', '16', 'title', '标题', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('686', '16', 'shortTitle', '简短标题', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('687', '16', 'titleColor', '标题颜色', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('688', '16', 'description', '摘要', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('689', '16', 'author', '作者', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('690', '16', 'origin', '来源', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('691', '16', 'releaseDate', '发布时间', '10', null, null, null, '3', '30', null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('692', '16', 'tplContent', '指定模板', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('693', '16', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('694', '17', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('695', '17', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('696', '17', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('697', '17', 'allowScore', '评分', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('698', '17', 'commentControl', '评论', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('699', '17', 'workflowId', '工作流', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('700', '17', 'afterCheck', '审核后', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('701', '17', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('702', '17', 'channelId', '栏目', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('703', '17', 'title', '标题', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('704', '17', 'shortTitle', '简短标题', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('705', '17', 'titleColor', '标题颜色', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('706', '17', 'tplContent', '指定模板', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('707', '17', 'releaseDate', '发布时间', '10', null, null, null, '3', '30', null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('708', '17', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('709', '17', 'downNeed', '下载需要财富', '10', null, null, null, '3', '30', null, null, '2', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('710', '17', 'attachments', '附件', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('711', '18', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('712', '18', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('713', '18', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('714', '18', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('715', '18', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('716', '18', 'allowScore', '评分', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('717', '18', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('719', '18', 'titleImg', '标题图', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('720', '18', 'channelId', '栏目', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('721', '18', 'title', '标题', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('722', '18', 'shortTitle', '简短标题', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('723', '18', 'titleColor', '标题颜色', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('724', '18', 'description', '摘要', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('725', '18', 'author', '作者', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('726', '18', 'tplContent', '指定模板', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('727', '18', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('728', '13', 'channelId', '栏目', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('729', '13', 'title', '标题', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('730', '13', 'shortTitle', '简短标题', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('731', '13', 'titleColor', '标题颜色', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('732', '13', 'author', '作者', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('733', '13', 'origin', '来源', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('734', '13', 'description', '摘要', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('735', '13', 'tplContent', '指定模板', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('736', '13', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('737', '16', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('738', '16', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('739', '16', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('740', '17', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('741', '17', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('742', '100', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('743', '100', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('744', '100', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('745', '100', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('746', '100', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('747', '100', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('748', '100', 'link', '外部链接', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('749', '100', 'workflowId', '工作流', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('750', '101', 'channelId', '栏目', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('751', '101', 'title', '项目名称', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('752', '101', 'titleImg', '标题图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('753', '101', 'attachments', '附件', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('754', '101', 'isOpen', '是否开放', '10', null, null, null, '3', '30', null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('755', '101', 'shortTitle', '简短标题', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('759', '101', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('760', '101', 'description', '项目介绍', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('761', '101', 'origin', '项目类型', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('763', '101', 'author', '项目亮点', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('764', '101', 'typeImg', '类型图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('765', '101', 'contentImg', '内容图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('766', '101', 'typeId', '内容类型', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('767', '101', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('768', '101', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('769', '101', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('770', '101', 'keywords', 'meta关键字', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('771', '101', 'description', 'meta描述', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('772', '101', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('773', '101', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('774', '101', 'tplMobileChannel', '栏目手机模板', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('775', '101', 'channelStatic', '栏目静态化', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('776', '101', 'contentStatic', '内容静态化', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('777', '101', 'priority', '排列顺序', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('778', '101', 'display', '显示', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('779', '101', 'docImg', '文档图片', '10', null, null, null, '3', '30', null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('780', '101', 'afterCheck', '审核后', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('781', '101', 'commentControl', '评论', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('782', '101', 'allowUpdown', '顶踩', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('783', '101', 'allowShare', '分享', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('784', '101', 'allowScore', '评分', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('785', '101', 'viewGroupIds', '浏览权限', '10', null, null, null, '3', '30', null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('786', '101', 'contriGroupIds', '投稿权限', '10', null, null, null, '3', '30', null, null, '7', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('787', '101', 'workflowId', '工作流', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('788', '101', 'link', '外部链接', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('789', '101', 'titleImg', '标题图', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('790', '101', 'contentImg', '内容图', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('791', '101', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('792', '12', 'titleImg', '标题图', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('793', '12', 'contentImg', '内容图', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('794', '12', 'docImg', '文档图片', '10', null, null, null, '3', '30', null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('795', '11', 'titleImg', '标题图', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('796', '11', 'contentImg', '内容图', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('797', '11', 'docImg', '文档图片', '10', null, null, null, '3', '30', null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('798', '102', 'channelId', '栏目', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('799', '102', 'title', '职位名称', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('800', '102', 'shortTitle', '工作地点', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('801', '102', 'titleColor', '标题颜色', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('802', '102', 'tagStr', '人数', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('803', '102', 'description', '摘要', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('804', '102', 'author', '专业要求', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('805', '102', 'origin', '学历要求', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('806', '102', 'viewGroupIds', '浏览权限', '10', null, null, null, '3', '30', null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('807', '102', 'topLevel', '固顶级别', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('808', '102', 'releaseDate', '发布时间', '10', null, null, null, '3', '30', null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('809', '102', 'typeId', '内容类型', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('810', '102', 'tplContent', '指定模板', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('811', '102', 'tplMobileContent', '指定手机模板', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('812', '102', 'typeImg', '类型图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('813', '102', 'titleImg', '标题图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('814', '102', 'contentImg', '内容图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('815', '102', 'attachments', '附件', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('816', '102', 'media', '多媒体', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('817', '102', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('818', '102', 'txt1', '内容1', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('819', '102', 'txt2', '内容2', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('820', '102', 'txt3', '内容3', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('821', '102', 'pictures', '图片集', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('822', '102', 'docPath', '文档路径', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('823', '102', 'downNeed', '下载需要财富', '10', null, null, null, '3', '30', null, null, '2', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('824', '102', 'isOpen', '是否开放', '10', null, null, null, '3', '30', null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('825', '102', 'charge', '是否收费', '10', null, null, null, '3', '30', null, null, '7', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('826', '13', 'allowScore', '显示子栏目', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('827', '103', 'name', '栏目名称', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('828', '103', 'path', '访问路径', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('829', '103', 'title', 'meta标题', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('830', '103', 'keywords', 'meta关键字', '10', null, null, null, '3', '30', null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('831', '103', 'description', 'meta描述', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('832', '103', 'tplChannel', '栏目模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('833', '103', 'tplContent', '内容模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('834', '103', 'tplMobileChannel', '栏目手机模板', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('835', '103', 'channelStatic', '栏目静态化', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('836', '103', 'contentStatic', '内容静态化', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('837', '103', 'priority', '排列顺序', '10', null, null, null, '3', '30', null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('838', '103', 'display', '显示', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('839', '103', 'docImg', '文档图片', '10', null, null, null, '3', '30', null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('840', '103', 'afterCheck', '审核后', '10', null, null, null, '3', '30', null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('841', '103', 'commentControl', '评论', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('842', '103', 'allowUpdown', '顶踩', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('843', '103', 'allowShare', '分享', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('844', '103', 'allowScore', '评分', '10', null, null, null, '3', '30', null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('845', '103', 'viewGroupIds', '浏览权限', '10', null, null, null, '3', '30', null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('846', '103', 'contriGroupIds', '投稿权限', '10', null, null, null, '3', '30', null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('847', '103', 'workflowId', '工作流', '10', null, null, null, '3', '30', null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('848', '103', 'link', '外部链接', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('849', '103', 'titleImg', '标题图', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('850', '103', 'contentImg', '内容图', '10', null, null, null, '3', '30', null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('851', '103', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('852', '103', 'txt1', '内容1', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('853', '103', 'txt2', '内容2', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('854', '103', 'txt3', '内容3', '10', null, null, null, '3', '30', null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('855', '103', 'channelId', '栏目', '10', null, null, null, '3', '30', null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('856', '103', 'title', '标题', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('857', '103', 'shortTitle', '简短标题', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('858', '103', 'titleColor', '标题颜色', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('859', '103', 'tagStr', 'Tag标签', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('860', '103', 'description', '摘要', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('861', '103', 'author', '作者', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('862', '103', 'origin', '来源', '10', null, null, null, '3', '30', null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('863', '103', 'viewGroupIds', '浏览权限', '10', null, null, null, '3', '30', null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('864', '103', 'topLevel', '固顶级别', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('865', '103', 'releaseDate', '发布时间', '10', null, null, null, '3', '30', null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('866', '103', 'typeId', '内容类型', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('867', '103', 'tplContent', '指定模板', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('868', '103', 'tplMobileContent', '指定手机模板', '10', null, null, null, '3', '30', null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('869', '103', 'typeImg', '类型图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('870', '103', 'titleImg', '标题图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('871', '103', 'contentImg', '内容图', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('872', '103', 'attachments', '附件', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('873', '103', 'media', '多媒体', '10', null, null, null, '3', '30', null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('874', '103', 'txt', '内容', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('875', '103', 'txt1', '内容1', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('876', '103', 'txt2', '内容2', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('877', '103', 'txt3', '内容3', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('878', '103', 'pictures', '图片集', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('879', '103', 'docPath', '文档路径', '10', null, null, null, '3', '30', null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('880', '103', 'downNeed', '下载需要财富', '10', null, null, null, '3', '30', null, null, '2', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('881', '103', 'isOpen', '是否开放', '10', null, null, null, '3', '30', null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('882', '103', 'charge', '是否收费', '10', null, null, null, '3', '30', null, null, '7', '0', '0', '0', '1', '0', null, null);

-- ----------------------------
-- Table structure for jc_origin
-- ----------------------------
DROP TABLE IF EXISTS `jc_origin`;
CREATE TABLE `jc_origin` (
  `origin_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(255) NOT NULL COMMENT '来源名称',
  `ref_count` int(11) NOT NULL DEFAULT '0' COMMENT '来源文章总数',
  PRIMARY KEY (`origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='来源';

-- ----------------------------
-- Records of jc_origin
-- ----------------------------
INSERT INTO `jc_origin` VALUES ('1', '新浪微博', '0');
INSERT INTO `jc_origin` VALUES ('2', '百度', '0');
INSERT INTO `jc_origin` VALUES ('3', '百度论坛', '0');
INSERT INTO `jc_origin` VALUES ('4', '百度贴吧', '0');
INSERT INTO `jc_origin` VALUES ('5', '新浪新闻', '0');
INSERT INTO `jc_origin` VALUES ('6', '腾讯新闻', '0');

-- ----------------------------
-- Table structure for jc_oss
-- ----------------------------
DROP TABLE IF EXISTS `jc_oss`;
CREATE TABLE `jc_oss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) DEFAULT NULL COMMENT 'id',
  `secret_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'secret_id',
  `app_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'key或者secret',
  `bucket_name` varchar(255) DEFAULT NULL COMMENT 'bucket名',
  `bucket_area` varchar(255) DEFAULT '' COMMENT '地区码',
  `oss_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '存储类型(1腾讯云cos  2阿里云oss  3七牛云)',
  `end_point` varchar(255) NOT NULL DEFAULT '' COMMENT 'end_point',
  `access_domain` varchar(255) NOT NULL DEFAULT '' COMMENT '访问域名',
  `oss_name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='oss云存储配置';

-- ----------------------------
-- Records of jc_oss
-- ----------------------------

-- ----------------------------
-- Table structure for jc_plug
-- ----------------------------
DROP TABLE IF EXISTS `jc_plug`;
CREATE TABLE `jc_plug` (
  `plug_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '插件名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `install_time` datetime DEFAULT NULL COMMENT '安装时间',
  `uninstall_time` datetime DEFAULT NULL COMMENT '卸载时间',
  `file_conflict` tinyint(1) NOT NULL DEFAULT '0' COMMENT '包含文件是否冲突',
  `is_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用状态(0未使用,1使用中)',
  `plug_perms` varchar(255) DEFAULT '' COMMENT '插件权限（,分隔各个权限配置）',
  `plug_repair` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否修复类插件(0 新功能插件 1修复类)',
  PRIMARY KEY (`plug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='插件';

-- ----------------------------
-- Records of jc_plug
-- ----------------------------
INSERT INTO `jc_plug` VALUES ('1', '应用中心', '/WEB-INF/plug/plugStore.zip', '应用中心', 'jeecms', '2016-09-08 09:05:12', '2016-10-08 16:12:57', '2016-10-08 16:12:39', '0', '1', 'plugStore.center@store:center;storeConfig.edit@storeConfig:v_edit;storeConfig.update@storeConfig:o_update;', '0');

-- ----------------------------
-- Table structure for jc_plug_store_config
-- ----------------------------
DROP TABLE IF EXISTS `jc_plug_store_config`;
CREATE TABLE `jc_plug_store_config` (
  `config_id` int(11) NOT NULL DEFAULT '1',
  `server_url` varchar(255) NOT NULL DEFAULT '' COMMENT '接口根地址',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '应用商店密码',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_plug_store_config
-- ----------------------------
INSERT INTO `jc_plug_store_config` VALUES ('1', 'http://bbs.jeecms.com', '5f4dcc3b5aa765d61d8327deb882cf99');

-- ----------------------------
-- Table structure for jc_receiver_message
-- ----------------------------
DROP TABLE IF EXISTS `jc_receiver_message`;
CREATE TABLE `jc_receiver_message` (
  `msg_re_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  `msg_id` int(11) DEFAULT NULL COMMENT '发信的信件id',
  PRIMARY KEY (`msg_re_id`),
  KEY `jc_receiver_message_user_send` (`msg_send_user`),
  KEY `jc_receiver_message_user_receiver` (`msg_receiver_user`),
  KEY `jc_receiver_message_site` (`site_id`),
  KEY `jc_receiver_message_message` (`msg_re_id`),
  KEY `fk_jc_receiver_message_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_message` FOREIGN KEY (`msg_id`) REFERENCES `jc_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_receiver_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_receiver_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信收信表';

-- ----------------------------
-- Records of jc_receiver_message
-- ----------------------------

-- ----------------------------
-- Table structure for jc_role
-- ----------------------------
DROP TABLE IF EXISTS `jc_role`;
CREATE TABLE `jc_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_super` char(1) NOT NULL DEFAULT '0' COMMENT '拥有所有权限',
  `role_level` int(11) NOT NULL DEFAULT '10' COMMENT '角色等级',
  PRIMARY KEY (`role_id`),
  KEY `fk_jc_role_site` (`site_id`),
  CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS角色表';

-- ----------------------------
-- Records of jc_role
-- ----------------------------
INSERT INTO `jc_role` VALUES ('1', null, '管理员', '10', '1', '10');

-- ----------------------------
-- Table structure for jc_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `jc_role_permission`;
CREATE TABLE `jc_role_permission` (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  KEY `fk_jc_permission_role` (`role_id`),
  CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS角色授权表';

-- ----------------------------
-- Records of jc_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for jc_score_group
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_group`;
CREATE TABLE `jc_score_group` (
  `score_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分组名',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `def` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `site_id` int(11) NOT NULL COMMENT '站点',
  PRIMARY KEY (`score_group_id`),
  KEY `fk_jc_score_group_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='FComment';

-- ----------------------------
-- Records of jc_score_group
-- ----------------------------
INSERT INTO `jc_score_group` VALUES ('1', '心情组', '心情组', '0', '1', '1');
INSERT INTO `jc_score_group` VALUES ('2', '星级评分', '星级评分', '1', '0', '1');

-- ----------------------------
-- Table structure for jc_score_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_item`;
CREATE TABLE `jc_score_item` (
  `score_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_group_id` int(11) NOT NULL COMMENT '评分组',
  `name` varchar(255) NOT NULL COMMENT '评分名',
  `score` int(11) NOT NULL COMMENT '分值',
  `image_path` varchar(255) DEFAULT NULL COMMENT '评分图标路径',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`score_item_id`),
  KEY `fk_jc_score_item_group` (`score_group_id`),
  CONSTRAINT `fk_jc_score_item_group` FOREIGN KEY (`score_group_id`) REFERENCES `jc_score_group` (`score_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='评分项';

-- ----------------------------
-- Records of jc_score_item
-- ----------------------------
INSERT INTO `jc_score_item` VALUES ('1', '1', '开心', '1', '/r/cms/smilies/m1.gif', '1');
INSERT INTO `jc_score_item` VALUES ('2', '1', '板砖', '1', '/r/cms/smilies/m2.gif', '2');
INSERT INTO `jc_score_item` VALUES ('3', '1', '感动', '1', '/r/cms/smilies/m3.gif', '3');
INSERT INTO `jc_score_item` VALUES ('4', '1', '有用', '1', '/r/cms/smilies/m4.gif', '4');
INSERT INTO `jc_score_item` VALUES ('5', '1', '疑问', '1', '/r/cms/smilies/m5.gif', '5');
INSERT INTO `jc_score_item` VALUES ('6', '1', '难过', '1', '/r/cms/smilies/m6.gif', '6');
INSERT INTO `jc_score_item` VALUES ('7', '1', '无聊', '1', '/r/cms/smilies/m7.gif', '7');
INSERT INTO `jc_score_item` VALUES ('8', '1', '震惊', '1', '/r/cms/smilies/m8.gif', '8');
INSERT INTO `jc_score_item` VALUES ('9', '2', '非常差', '1', '', '1');
INSERT INTO `jc_score_item` VALUES ('10', '2', '差', '2', '', '2');
INSERT INTO `jc_score_item` VALUES ('11', '2', '一般', '3', '', '3');
INSERT INTO `jc_score_item` VALUES ('12', '2', '好', '4', '', '4');
INSERT INTO `jc_score_item` VALUES ('13', '2', '非常好', '5', '', '5');

-- ----------------------------
-- Table structure for jc_score_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_record`;
CREATE TABLE `jc_score_record` (
  `score_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_item_id` int(11) NOT NULL COMMENT '评分项',
  `content_id` int(11) NOT NULL COMMENT '内容',
  `score_count` int(11) NOT NULL COMMENT '评分次数',
  PRIMARY KEY (`score_record_id`),
  KEY `fk_jc_record_score_item` (`score_item_id`),
  KEY `index_score_record_content` (`content_id`),
  CONSTRAINT `fk_jc_record_score_item` FOREIGN KEY (`score_item_id`) REFERENCES `jc_score_item` (`score_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='评分纪录';

-- ----------------------------
-- Records of jc_score_record
-- ----------------------------
INSERT INTO `jc_score_record` VALUES ('3', '1', '33', '17');
INSERT INTO `jc_score_record` VALUES ('4', '5', '33', '1');
INSERT INTO `jc_score_record` VALUES ('6', '1', '32', '2');
INSERT INTO `jc_score_record` VALUES ('7', '8', '12', '1');
INSERT INTO `jc_score_record` VALUES ('10', '1', '132', '1');
INSERT INTO `jc_score_record` VALUES ('11', '1', '113', '11');
INSERT INTO `jc_score_record` VALUES ('12', '1', '27', '2');
INSERT INTO `jc_score_record` VALUES ('13', '1', '39', '18');
INSERT INTO `jc_score_record` VALUES ('14', '1', '131', '13');
INSERT INTO `jc_score_record` VALUES ('15', '1', '30', '41');
INSERT INTO `jc_score_record` VALUES ('16', '1', '14', '15');
INSERT INTO `jc_score_record` VALUES ('17', '1', '130', '12');
INSERT INTO `jc_score_record` VALUES ('18', '1', '112', '18');
INSERT INTO `jc_score_record` VALUES ('19', '1', '111', '12');
INSERT INTO `jc_score_record` VALUES ('20', '1', '29', '1');
INSERT INTO `jc_score_record` VALUES ('21', '1', '28', '1');
INSERT INTO `jc_score_record` VALUES ('22', '1', '23', '11');
INSERT INTO `jc_score_record` VALUES ('23', '5', '28', '1');

-- ----------------------------
-- Table structure for jc_search_words
-- ----------------------------
DROP TABLE IF EXISTS `jc_search_words`;
CREATE TABLE `jc_search_words` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '搜索词汇',
  `hit_count` int(11) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '优先级',
  `name_initial` varchar(500) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='搜索热词';

-- ----------------------------
-- Records of jc_search_words
-- ----------------------------
INSERT INTO `jc_search_words` VALUES ('1', '台湾地震', '6', '10', 'twdz', '1', '1');
INSERT INTO `jc_search_words` VALUES ('5', '楼市', '64', '2', 'ls', '1', '1');
INSERT INTO `jc_search_words` VALUES ('6', '四川', '2', '11', 'sc', '1', '1');
INSERT INTO `jc_search_words` VALUES ('7', '黄金接连下跌', '13', '10', 'hjjlxd', '1', '1');
INSERT INTO `jc_search_words` VALUES ('8', '里约奥运会', '2', '12', 'lyayh', '1', '1');
INSERT INTO `jc_search_words` VALUES ('9', '电信诈骗', '23', '10', 'dxzp', '1', '1');
INSERT INTO `jc_search_words` VALUES ('10', '雷洋案', '12', '11', 'lya', '1', '1');
INSERT INTO `jc_search_words` VALUES ('13', '2015各行业平均工资', '9', '10', '2015gxypjgz', '1', '1');
INSERT INTO `jc_search_words` VALUES ('14', '太阳的后裔', '10', '10', 'tydhy', '1', '1');
INSERT INTO `jc_search_words` VALUES ('15', '广西 ', '1', '10', 'gx', '0', '1');
INSERT INTO `jc_search_words` VALUES ('17', '莆田系', '17', '10', 'ptx', '1', '1');
INSERT INTO `jc_search_words` VALUES ('18', '巴基斯坦', '1', '10', 'bjst', '0', '1');
INSERT INTO `jc_search_words` VALUES ('21', '北京', '1', '10', 'bj', '0', '1');
INSERT INTO `jc_search_words` VALUES ('29', '中级java工程师', '1', '10', 'zjjavagcs', '0', '1');
INSERT INTO `jc_search_words` VALUES ('30', '高考', '1', '10', 'gk', '0', '1');
INSERT INTO `jc_search_words` VALUES ('31', '请输入关键词', '2', '10', 'qsrgjc', '0', '1');
INSERT INTO `jc_search_words` VALUES ('33', '草原天路收费', '3', '11', 'cytlsf', '1', '1');
INSERT INTO `jc_search_words` VALUES ('35', 'jeecms', '3', '10', 'jeecms', '0', '1');
INSERT INTO `jc_search_words` VALUES ('38', '高考减招', '22', '10', 'gkjz', '1', '1');

-- ----------------------------
-- Table structure for jc_sensitivity
-- ----------------------------
DROP TABLE IF EXISTS `jc_sensitivity`;
CREATE TABLE `jc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `search` varchar(255) NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';

-- ----------------------------
-- Records of jc_sensitivity
-- ----------------------------
INSERT INTO `jc_sensitivity` VALUES ('1', '法论功', '***');

-- ----------------------------
-- Table structure for jc_site
-- ----------------------------
DROP TABLE IF EXISTS `jc_site`;
CREATE TABLE `jc_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) NOT NULL COMMENT '域名',
  `site_path` varchar(20) NOT NULL COMMENT '路径',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) NOT NULL DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) NOT NULL DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) NOT NULL DEFAULT 'default' COMMENT '模板方案',
  `final_step` tinyint(4) NOT NULL DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) DEFAULT NULL COMMENT '域名重定向',
  `is_master` tinyint(1) DEFAULT '0' COMMENT '是否主站',
  `parent_id` int(11) DEFAULT NULL COMMENT '父站点id',
  `tpl_index` varchar(255) DEFAULT NULL COMMENT '首页模板',
  `access_path` varchar(50) DEFAULT NULL COMMENT '访问路径',
  `keywords` varchar(255) DEFAULT NULL COMMENT '站点关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '站点描述',
  `tpl_mobile_solution` varchar(50) NOT NULL DEFAULT 'mobile' COMMENT '手机站模板方案',
  `mobile_static_dir` varchar(50) DEFAULT '/wap' COMMENT '手机站静态页存放目录',
  `mobile_static_sync` tinyint(1) NOT NULL DEFAULT '0' COMMENT '手机站静态页同步生成',
  `ftp_sync_page_id` int(11) DEFAULT NULL COMMENT '静态页同步FTP',
  `page_is_sync_ftp` tinyint(1) NOT NULL DEFAULT '0' COMMENT '静态页同步发布FTP',
  `resouce_is_sync_ftp` tinyint(1) NOT NULL DEFAULT '0' COMMENT '资源同步发布FTP',
  `oss_id` int(11) DEFAULT NULL COMMENT '图片附件云存储oss',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `ak_domain_path` (`domain`,`access_path`),
  KEY `fk_jc_site_config` (`config_id`),
  KEY `fk_jc_site_upload_ftp` (`ftp_upload_id`),
  KEY `fk_jc_site_parent` (`parent_id`),
  CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`),
  CONSTRAINT `fk_jc_site_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `jo_ftp` (`ftp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='CMS站点表';

-- ----------------------------
-- Records of jc_site
-- ----------------------------
INSERT INTO `jc_site` VALUES ('1', '1', null, 'localhost', 'www', 'jeecms演示站', 'jeecms演示站', 'http://', '.jhtml', '.html', '/html', '0', '0', 'zh_CN', 'zh_CN', 'default', '3', '3', '1', '0', '', '', '0', null, '', '1', 'JEECMS－JAVA网站内容管理系统|开源java cms系统,jsp cms网站管理', 'JEECMS-国内优秀的JAVA&＃40JSP&＃41网站内容管理系统', 'mobile', '/wap', '0', null, '0', '0', null);
INSERT INTO `jc_site` VALUES ('4', '1', null, 'localhost', 'main', '吉林正泰第三方公共服务平台', '服务平台', 'http://', '.jhtml', '.html', '', '0', '0', 'zh_CN', 'zh_CN', 'main', '2', '3', '0', '0', '', '', '1', null, '', 'main', '服务平台', '服务平台', 'main', '', '0', null, '0', '0', null);
INSERT INTO `jc_site` VALUES ('9', '1', null, 'localhost', 'zckj', '吉林正泰众创空间', '众创空间', 'http://', '.jhtml', '.html', '', '0', '0', 'zh_CN', 'zh_CN', 'zckj', '2', '3', '0', '0', '', '', '0', '4', '', 'zckj', '吉林正泰众创空间', '吉林正泰众创空间', 'zckj', '', '0', null, '0', '0', null);
INSERT INTO `jc_site` VALUES ('14', '1', null, 'localhost', 'gczx', '工程咨询', '工程咨询', 'http://', '.jhtml', '.html', '', '0', '0', 'zh_CN', 'zh_CN', 'gczx', '2', '3', '0', '0', '', '', '0', '4', '', 'gczx', '工程咨询', '工程咨询', 'gczx', '', '0', null, '0', '0', null);
INSERT INTO `jc_site` VALUES ('15', '1', null, 'localhost', 'kjzx', '科技咨询', '科技咨询', 'http://', '.jhtml', '.html', '', '0', '0', 'zh_CN', 'zh_CN', 'kjzx', '2', '3', '0', '0', '', '', '0', '4', '', 'kjzx', '科技咨询', '科技咨询', 'kjzx', '', '0', null, '0', '0', null);
INSERT INTO `jc_site` VALUES ('16', '1', null, 'localhost', 'jwzk', '九维智库', '九维智库', 'http://', '.jhtml', '.html', '', '0', '0', 'zh_CN', 'zh_CN', 'jwzk', '2', '3', '0', '0', '', '', '0', '4', '', 'jwzk', '九维智库', '九维智库', 'jwzk', '', '0', null, '0', '0', null);
INSERT INTO `jc_site` VALUES ('17', '1', null, 'localhost', 'sjzx', '审计咨询', '审计咨询', 'http://', '.jhtml', '.html', '', '0', '0', 'zh_CN', 'zh_CN', 'sjzx', '2', '3', '0', '0', 'sjzx', '', '0', '4', '', 'sjzx', '审计咨询', '审计咨询', 'sjzx', '', '0', null, '0', '0', null);
INSERT INTO `jc_site` VALUES ('18', '1', null, 'localhost', 'pgpj', '评估评价', '评估评价', 'http://', '.jhtml', '.html', '', '0', '0', 'zh_CN', 'zh_CN', 'pgpj', '2', '3', '0', '0', 'pgpj', '', '0', '4', '', 'pgpj', '评估评价', '评估评价', 'pgpj', '', '0', null, '0', '0', null);
INSERT INTO `jc_site` VALUES ('19', '1', null, 'localhost', 'kjgh', '六维空间规划', '六维空间规划', 'http://', '.jhtml', '.html', '', '0', '0', 'zh_CN', 'zh_CN', 'kjgh', '2', '3', '0', '0', 'kjgh', '', '0', '4', '', 'kjgh', '六维空间规划', '六维空间规划', 'kjgh', '', '0', null, '0', '0', null);
INSERT INTO `jc_site` VALUES ('20', '1', null, 'localhost', 'zcpg', '资产评估', '资产评估', 'http://', '.jhtml', '.html', '', '0', '0', 'zh_CN', 'zh_CN', 'zcpg', '2', '3', '0', '0', 'zcpg', '', '0', '4', '', 'zcpg', '资产评估', '资产评估', 'zcpg', '', '0', null, '0', '0', null);

-- ----------------------------
-- Table structure for jc_site_access
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access`;
CREATE TABLE `jc_site_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `access_time` time NOT NULL COMMENT '访问时间',
  `access_date` date NOT NULL COMMENT '访问日期',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `area` varchar(50) DEFAULT NULL COMMENT '访问地区',
  `access_source` varchar(255) DEFAULT NULL COMMENT '访问来源',
  `external_link` varchar(255) DEFAULT NULL COMMENT '外部链接网址',
  `engine` varchar(50) DEFAULT NULL COMMENT '搜索引擎',
  `entry_page` varchar(255) DEFAULT NULL COMMENT '入口页面',
  `last_stop_page` varchar(255) DEFAULT NULL COMMENT '最后停留页面',
  `visit_second` int(11) DEFAULT NULL COMMENT '访问时长(秒)',
  `visit_page_count` int(11) DEFAULT NULL COMMENT '访问页面数',
  `operating_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  `keyword` varchar(255) DEFAULT NULL COMMENT '来访关键字',
  PRIMARY KEY (`access_id`),
  KEY `fk_jc_access_site` (`site_id`),
  CONSTRAINT `fk_jc_access_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='站点访问表';

-- ----------------------------
-- Records of jc_site_access
-- ----------------------------
INSERT INTO `jc_site_access` VALUES ('5', '5756DA27E94D7F8A9B8746F8F52FCF54', '19', '14:21:10', '2018-06-08', '127.0.0.1', '', '直接访问', null, null, 'http://localhost:8080/kjgh/gsyw/index.jhtml', 'http://localhost:8080/kjgh/xwxq/index.jhtml', '8005', '44', 'Win 7', 'firefox 60', '');
INSERT INTO `jc_site_access` VALUES ('6', '7EF5145D0651DFCFD174D2C5C2E42294', '17', '09:43:37', '2018-06-09', '127.0.0.1', '', '直接访问', null, null, 'http://localhost:8080/sjzx/zyyw/index.jhtml', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '4079', '22', 'Win 7', 'chrome 63', '');
INSERT INTO `jc_site_access` VALUES ('7', '375F2500CDF1EC5599DCB4C309FBFA43', '9', '20:52:25', '2018-06-11', '127.0.0.1', '', '外部链接', 'http://localhost:8080', null, 'http://localhost:8080/zckj/xclzwsmxxgjs/213.jhtml', 'http://localhost:8080/zckj/yykx/211.jhtml', '4674', '43', 'Win 7', 'chrome 65', '');
INSERT INTO `jc_site_access` VALUES ('8', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '9', '22:16:08', '2018-06-11', '127.0.0.1', '', '外部链接', 'http://localhost:8080', null, 'http://localhost:8080/zckj/hzjg/214.jhtml', 'http://localhost:8080/', '1854', '15', 'Win 7', 'chrome 65', '');

-- ----------------------------
-- Table structure for jc_site_access_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_count`;
CREATE TABLE `jc_site_access_count` (
  `access_count` int(11) NOT NULL AUTO_INCREMENT,
  `page_count` int(11) NOT NULL DEFAULT '1' COMMENT '访问页数',
  `visitors` int(11) NOT NULL DEFAULT '0' COMMENT '用户数',
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `site_id` int(11) NOT NULL COMMENT '统计站点',
  PRIMARY KEY (`access_count`),
  KEY `fk_jc_access_count_site` (`site_id`),
  CONSTRAINT `fk_jc_access_count_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='每日统计页数访问情况';

-- ----------------------------
-- Records of jc_site_access_count
-- ----------------------------
INSERT INTO `jc_site_access_count` VALUES ('1', '72', '1', '2018-03-25', '4');
INSERT INTO `jc_site_access_count` VALUES ('2', '1', '1', '2018-03-26', '1');
INSERT INTO `jc_site_access_count` VALUES ('3', '4', '1', '2018-03-26', '1');
INSERT INTO `jc_site_access_count` VALUES ('4', '1', '2', '2018-03-27', '1');
INSERT INTO `jc_site_access_count` VALUES ('5', '29', '1', '2018-04-03', '4');
INSERT INTO `jc_site_access_count` VALUES ('6', '2', '1', '2018-04-06', '4');
INSERT INTO `jc_site_access_count` VALUES ('7', '7', '1', '2018-04-06', '4');
INSERT INTO `jc_site_access_count` VALUES ('8', '3', '1', '2018-04-07', '4');
INSERT INTO `jc_site_access_count` VALUES ('9', '6', '1', '2018-04-07', '4');
INSERT INTO `jc_site_access_count` VALUES ('10', '20', '1', '2018-04-08', '4');
INSERT INTO `jc_site_access_count` VALUES ('11', '1', '3', '2018-04-09', '4');
INSERT INTO `jc_site_access_count` VALUES ('12', '2', '1', '2018-04-14', '4');
INSERT INTO `jc_site_access_count` VALUES ('13', '3', '1', '2018-04-14', '4');
INSERT INTO `jc_site_access_count` VALUES ('14', '33', '1', '2018-04-15', '4');
INSERT INTO `jc_site_access_count` VALUES ('15', '1', '1', '2018-04-15', '4');
INSERT INTO `jc_site_access_count` VALUES ('16', '17', '1', '2018-04-15', '4');
INSERT INTO `jc_site_access_count` VALUES ('17', '17', '1', '2018-04-19', '4');
INSERT INTO `jc_site_access_count` VALUES ('18', '5', '1', '2018-04-21', '16');
INSERT INTO `jc_site_access_count` VALUES ('19', '6', '1', '2018-04-21', '16');
INSERT INTO `jc_site_access_count` VALUES ('20', '27', '1', '2018-04-21', '16');
INSERT INTO `jc_site_access_count` VALUES ('21', '32', '1', '2018-04-21', '16');
INSERT INTO `jc_site_access_count` VALUES ('22', '10', '1', '2018-04-22', '16');
INSERT INTO `jc_site_access_count` VALUES ('23', '2', '2', '2018-06-03', '1');
INSERT INTO `jc_site_access_count` VALUES ('24', '1', '1', '2018-06-03', '1');
INSERT INTO `jc_site_access_count` VALUES ('25', '67', '1', '2018-06-06', '19');
INSERT INTO `jc_site_access_count` VALUES ('26', '32', '1', '2018-06-07', '19');
INSERT INTO `jc_site_access_count` VALUES ('27', '49', '1', '2018-06-07', '19');

-- ----------------------------
-- Table structure for jc_site_access_count_hour
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_count_hour`;
CREATE TABLE `jc_site_access_count_hour` (
  `access_count_hour_id` int(11) NOT NULL AUTO_INCREMENT,
  `hour_pv` int(11) NOT NULL DEFAULT '0' COMMENT '小时PV',
  `hour_ip` int(11) NOT NULL DEFAULT '0' COMMENT '小时IP',
  `hour_uv` int(11) NOT NULL DEFAULT '0' COMMENT '小时访客数',
  `access_date` date NOT NULL,
  `access_hour` int(2) NOT NULL DEFAULT '0',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  PRIMARY KEY (`access_count_hour_id`),
  KEY `index_jc_access_count_hour` (`access_hour`),
  KEY `index_jc_access_count_hour_date` (`access_date`),
  KEY `index_jc_access_count_hour_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='小时数据统计';

-- ----------------------------
-- Records of jc_site_access_count_hour
-- ----------------------------
INSERT INTO `jc_site_access_count_hour` VALUES ('1', '72', '1', '1', '2018-03-25', '0', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('2', '5', '1', '2', '2018-03-26', '20', '1');
INSERT INTO `jc_site_access_count_hour` VALUES ('3', '2', '1', '2', '2018-03-27', '20', '1');
INSERT INTO `jc_site_access_count_hour` VALUES ('4', '29', '1', '1', '2018-04-03', '22', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('5', '7', '1', '1', '2018-04-06', '22', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('6', '2', '1', '1', '2018-04-06', '23', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('7', '3', '1', '1', '2018-04-07', '9', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('8', '6', '1', '1', '2018-04-07', '10', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('9', '20', '1', '1', '2018-04-08', '19', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('10', '2', '1', '2', '2018-04-09', '19', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('11', '1', '1', '1', '2018-04-09', '22', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('12', '3', '1', '1', '2018-04-14', '14', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('13', '2', '1', '1', '2018-04-14', '16', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('14', '17', '1', '1', '2018-04-15', '20', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('15', '34', '1', '2', '2018-04-15', '23', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('16', '17', '1', '1', '2018-04-19', '23', '4');
INSERT INTO `jc_site_access_count_hour` VALUES ('17', '27', '1', '1', '2018-04-21', '18', '16');
INSERT INTO `jc_site_access_count_hour` VALUES ('18', '38', '1', '2', '2018-04-21', '22', '16');
INSERT INTO `jc_site_access_count_hour` VALUES ('19', '5', '1', '1', '2018-04-21', '23', '16');
INSERT INTO `jc_site_access_count_hour` VALUES ('20', '10', '1', '1', '2018-04-22', '0', '16');
INSERT INTO `jc_site_access_count_hour` VALUES ('21', '2', '1', '1', '2018-06-03', '11', '1');
INSERT INTO `jc_site_access_count_hour` VALUES ('22', '2', '1', '1', '2018-06-03', '14', '1');
INSERT INTO `jc_site_access_count_hour` VALUES ('23', '1', '1', '1', '2018-06-03', '15', '1');
INSERT INTO `jc_site_access_count_hour` VALUES ('24', '67', '1', '1', '2018-06-06', '15', '19');
INSERT INTO `jc_site_access_count_hour` VALUES ('25', '49', '1', '1', '2018-06-07', '13', '19');
INSERT INTO `jc_site_access_count_hour` VALUES ('26', '32', '1', '1', '2018-06-07', '15', '19');

-- ----------------------------
-- Table structure for jc_site_access_pages
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_pages`;
CREATE TABLE `jc_site_access_pages` (
  `access_pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_page` varchar(255) NOT NULL COMMENT '访问页面',
  `session_id` varchar(32) NOT NULL,
  `access_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '访问日期',
  `access_time` time NOT NULL COMMENT '访问时间',
  `visit_second` int(11) NOT NULL DEFAULT '0' COMMENT '停留时长（秒）',
  `page_index` int(11) NOT NULL DEFAULT '0' COMMENT '用户访问页面的索引',
  `site_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`access_pages_id`),
  KEY `fk_jc_access_pages_access` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 COMMENT='访问详细页面表';

-- ----------------------------
-- Records of jc_site_access_pages
-- ----------------------------
INSERT INTO `jc_site_access_pages` VALUES ('151', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:21:11', '186', '2', '19');
INSERT INTO `jc_site_access_pages` VALUES ('152', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:24:17', '128', '3', '19');
INSERT INTO `jc_site_access_pages` VALUES ('153', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:26:25', '81', '4', '19');
INSERT INTO `jc_site_access_pages` VALUES ('154', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:27:46', '934', '5', '19');
INSERT INTO `jc_site_access_pages` VALUES ('155', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:43:20', '26', '6', '19');
INSERT INTO `jc_site_access_pages` VALUES ('156', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:43:46', '1', '7', '19');
INSERT INTO `jc_site_access_pages` VALUES ('157', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:43:57', '192', '9', '19');
INSERT INTO `jc_site_access_pages` VALUES ('158', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:43:47', '10', '8', '19');
INSERT INTO `jc_site_access_pages` VALUES ('159', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:47:09', '49', '10', '19');
INSERT INTO `jc_site_access_pages` VALUES ('160', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:47:58', '41', '11', '19');
INSERT INTO `jc_site_access_pages` VALUES ('161', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:48:39', '37', '12', '19');
INSERT INTO `jc_site_access_pages` VALUES ('162', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:49:16', '128', '13', '19');
INSERT INTO `jc_site_access_pages` VALUES ('163', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:51:24', '50', '14', '19');
INSERT INTO `jc_site_access_pages` VALUES ('164', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:52:14', '50', '15', '19');
INSERT INTO `jc_site_access_pages` VALUES ('165', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '14:53:04', '1133', '16', '19');
INSERT INTO `jc_site_access_pages` VALUES ('166', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '15:11:57', '11', '17', '19');
INSERT INTO `jc_site_access_pages` VALUES ('167', 'http://localhost:8080/kjgh/xwxq/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '15:12:08', '281', '18', '19');
INSERT INTO `jc_site_access_pages` VALUES ('168', 'http://localhost:8080/kjgh/xwxq/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '15:16:49', '46', '19', '19');
INSERT INTO `jc_site_access_pages` VALUES ('169', 'http://localhost:8080/kjgh/xwxq/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '15:17:35', '0', '20', '19');
INSERT INTO `jc_site_access_pages` VALUES ('170', 'http://localhost:8080/kjgh/xwxq/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '15:20:06', '243', '22', '19');
INSERT INTO `jc_site_access_pages` VALUES ('171', 'http://localhost:8080/kjgh/xwxq/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '15:24:09', '61', '23', '19');
INSERT INTO `jc_site_access_pages` VALUES ('172', 'http://localhost:8080/kjgh/xwxq/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '15:25:10', '1841', '24', '19');
INSERT INTO `jc_site_access_pages` VALUES ('173', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '15:55:51', '277', '25', '19');
INSERT INTO `jc_site_access_pages` VALUES ('174', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:00:28', '127', '26', '19');
INSERT INTO `jc_site_access_pages` VALUES ('175', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:02:35', '28', '27', '19');
INSERT INTO `jc_site_access_pages` VALUES ('176', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:03:03', '270', '28', '19');
INSERT INTO `jc_site_access_pages` VALUES ('177', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:07:33', '127', '29', '19');
INSERT INTO `jc_site_access_pages` VALUES ('178', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:09:40', '20', '30', '19');
INSERT INTO `jc_site_access_pages` VALUES ('179', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:10:00', '57', '31', '19');
INSERT INTO `jc_site_access_pages` VALUES ('180', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:10:57', '170', '32', '19');
INSERT INTO `jc_site_access_pages` VALUES ('181', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:13:47', '134', '33', '19');
INSERT INTO `jc_site_access_pages` VALUES ('182', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:16:01', '31', '34', '19');
INSERT INTO `jc_site_access_pages` VALUES ('183', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:16:32', '7', '35', '19');
INSERT INTO `jc_site_access_pages` VALUES ('184', 'http://localhost:8080/kjgh/xwxq/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:16:39', '110', '36', '19');
INSERT INTO `jc_site_access_pages` VALUES ('185', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:18:29', '14', '37', '19');
INSERT INTO `jc_site_access_pages` VALUES ('186', 'http://localhost:8080/kjgh/xwxq/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:18:43', '780', '38', '19');
INSERT INTO `jc_site_access_pages` VALUES ('187', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:31:43', '34', '39', '19');
INSERT INTO `jc_site_access_pages` VALUES ('188', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:32:17', '1', '40', '19');
INSERT INTO `jc_site_access_pages` VALUES ('189', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:32:18', '12', '41', '19');
INSERT INTO `jc_site_access_pages` VALUES ('190', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:32:30', '120', '42', '19');
INSERT INTO `jc_site_access_pages` VALUES ('191', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '5756DA27E94D7F8A9B8746F8F52FCF54', '2018-06-08', '16:34:30', '0', '43', '19');
INSERT INTO `jc_site_access_pages` VALUES ('192', 'http://localhost:8080/jwzk/gy/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '09:45:12', '457', '2', '16');
INSERT INTO `jc_site_access_pages` VALUES ('193', 'http://localhost:8080/sjzx/zyyw/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '09:43:37', '95', '1', '17');
INSERT INTO `jc_site_access_pages` VALUES ('194', 'http://localhost:8080/kjzx/xwzx/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '09:52:49', '286', '3', '15');
INSERT INTO `jc_site_access_pages` VALUES ('195', 'http://localhost:8080/zcpg/jrwm/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '09:57:35', '1526', '4', '20');
INSERT INTO `jc_site_access_pages` VALUES ('196', 'http://localhost:8080/', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:23:01', '9', '5', '1');
INSERT INTO `jc_site_access_pages` VALUES ('197', 'http://localhost:8080/1/gn/113.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:23:10', '13', '6', '1');
INSERT INTO `jc_site_access_pages` VALUES ('198', 'http://localhost:8080/comment.jspx?contentId=113', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:23:23', '20', '7', '1');
INSERT INTO `jc_site_access_pages` VALUES ('199', 'http://localhost:8080/comment.jspx?contentId=113', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:23:43', '3', '8', '1');
INSERT INTO `jc_site_access_pages` VALUES ('200', 'http://localhost:8080/comment.jspx?contentId=113', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:23:50', '181', '12', '1');
INSERT INTO `jc_site_access_pages` VALUES ('201', 'http://localhost:8080/comment.jspx?contentId=113', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:23:48', '2', '11', '1');
INSERT INTO `jc_site_access_pages` VALUES ('202', 'http://localhost:8080/comment.jspx?contentId=113', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:23:47', '1', '10', '1');
INSERT INTO `jc_site_access_pages` VALUES ('203', 'http://localhost:8080/comment.jspx?contentId=113', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:23:46', '1', '9', '1');
INSERT INTO `jc_site_access_pages` VALUES ('204', 'http://localhost:8080/1/gn/113.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:26:51', '17', '13', '1');
INSERT INTO `jc_site_access_pages` VALUES ('205', 'http://localhost:8080/1/gn/132.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:27:08', '270', '14', '1');
INSERT INTO `jc_site_access_pages` VALUES ('206', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:31:38', '407', '15', '19');
INSERT INTO `jc_site_access_pages` VALUES ('207', 'http://localhost:8080/kjgh/jrwm/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:38:25', '413', '16', '19');
INSERT INTO `jc_site_access_pages` VALUES ('208', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:45:18', '13', '17', '19');
INSERT INTO `jc_site_access_pages` VALUES ('209', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:45:31', '134', '18', '19');
INSERT INTO `jc_site_access_pages` VALUES ('210', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:47:45', '17', '19', '19');
INSERT INTO `jc_site_access_pages` VALUES ('211', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:48:02', '211', '20', '19');
INSERT INTO `jc_site_access_pages` VALUES ('212', 'http://localhost:8080/kjgh/gsyw/index.jhtml', '7EF5145D0651DFCFD174D2C5C2E42294', '2018-06-09', '10:51:33', '0', '21', '19');
INSERT INTO `jc_site_access_pages` VALUES ('213', 'http://localhost:8080/zckj/xclzwsmxxgjs/213.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '20:52:26', '26', '1', '9');
INSERT INTO `jc_site_access_pages` VALUES ('214', 'http://localhost:8080/zckj/wsclzgymxgjs/212.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '20:52:52', '59', '2', '9');
INSERT INTO `jc_site_access_pages` VALUES ('215', 'http://localhost:8080/zckj/wsclzgymxgjs/212.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '20:53:51', '48', '3', '9');
INSERT INTO `jc_site_access_pages` VALUES ('216', 'http://localhost:8080/zckj/wsclzgymxgjs/212.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '20:54:39', '0', '4', '9');
INSERT INTO `jc_site_access_pages` VALUES ('217', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:09:53', '23', '7', '9');
INSERT INTO `jc_site_access_pages` VALUES ('218', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:10:16', '2', '8', '9');
INSERT INTO `jc_site_access_pages` VALUES ('219', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:10:18', '36', '9', '9');
INSERT INTO `jc_site_access_pages` VALUES ('220', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:10:54', '62', '10', '9');
INSERT INTO `jc_site_access_pages` VALUES ('221', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:11:56', '270', '11', '9');
INSERT INTO `jc_site_access_pages` VALUES ('222', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:16:26', '40', '12', '9');
INSERT INTO `jc_site_access_pages` VALUES ('223', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:17:06', '199', '13', '9');
INSERT INTO `jc_site_access_pages` VALUES ('224', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:20:25', '45', '14', '9');
INSERT INTO `jc_site_access_pages` VALUES ('225', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:21:10', '74', '15', '9');
INSERT INTO `jc_site_access_pages` VALUES ('226', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:22:24', '409', '16', '9');
INSERT INTO `jc_site_access_pages` VALUES ('227', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:29:13', '31', '17', '9');
INSERT INTO `jc_site_access_pages` VALUES ('228', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:29:44', '76', '18', '9');
INSERT INTO `jc_site_access_pages` VALUES ('229', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:31:00', '21', '19', '9');
INSERT INTO `jc_site_access_pages` VALUES ('230', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:31:21', '16', '20', '9');
INSERT INTO `jc_site_access_pages` VALUES ('231', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:31:37', '6', '21', '9');
INSERT INTO `jc_site_access_pages` VALUES ('232', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:31:43', '194', '22', '9');
INSERT INTO `jc_site_access_pages` VALUES ('233', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:34:57', '26', '23', '9');
INSERT INTO `jc_site_access_pages` VALUES ('234', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:35:23', '134', '24', '9');
INSERT INTO `jc_site_access_pages` VALUES ('235', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:37:37', '178', '25', '9');
INSERT INTO `jc_site_access_pages` VALUES ('236', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:40:35', '0', '26', '9');
INSERT INTO `jc_site_access_pages` VALUES ('237', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:48:07', '113', '28', '9');
INSERT INTO `jc_site_access_pages` VALUES ('238', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:50:00', '55', '29', '9');
INSERT INTO `jc_site_access_pages` VALUES ('239', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:50:55', '8', '30', '9');
INSERT INTO `jc_site_access_pages` VALUES ('240', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:51:03', '1', '31', '9');
INSERT INTO `jc_site_access_pages` VALUES ('241', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:51:17', '61', '33', '9');
INSERT INTO `jc_site_access_pages` VALUES ('242', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:51:04', '13', '32', '9');
INSERT INTO `jc_site_access_pages` VALUES ('243', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:52:18', '218', '34', '9');
INSERT INTO `jc_site_access_pages` VALUES ('244', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '21:55:56', '313', '35', '9');
INSERT INTO `jc_site_access_pages` VALUES ('245', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '22:01:09', '16', '36', '9');
INSERT INTO `jc_site_access_pages` VALUES ('246', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '22:01:25', '67', '37', '9');
INSERT INTO `jc_site_access_pages` VALUES ('247', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '22:02:32', '248', '38', '9');
INSERT INTO `jc_site_access_pages` VALUES ('248', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '22:06:40', '32', '39', '9');
INSERT INTO `jc_site_access_pages` VALUES ('249', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '22:07:12', '12', '40', '9');
INSERT INTO `jc_site_access_pages` VALUES ('250', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '22:07:24', '117', '41', '9');
INSERT INTO `jc_site_access_pages` VALUES ('251', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '22:09:21', '58', '42', '9');
INSERT INTO `jc_site_access_pages` VALUES ('252', 'http://localhost:8080/zckj/yykx/211.jhtml', '375F2500CDF1EC5599DCB4C309FBFA43', '2018-06-11', '22:10:19', '0', '43', '9');
INSERT INTO `jc_site_access_pages` VALUES ('253', 'http://localhost:8080/zckj/hzjg/214.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:16:09', '31', '1', '9');
INSERT INTO `jc_site_access_pages` VALUES ('254', 'http://localhost:8080/zckj/hzjg/214.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:16:40', '0', '2', '9');
INSERT INTO `jc_site_access_pages` VALUES ('255', 'http://localhost:8080/zckj/qyal/215.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:32:11', '122', '4', '9');
INSERT INTO `jc_site_access_pages` VALUES ('256', 'http://localhost:8080/zckj/qyal/215.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:34:13', '1', '5', '9');
INSERT INTO `jc_site_access_pages` VALUES ('257', 'http://localhost:8080/zckj/qyal/215.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:34:15', '15', '7', '9');
INSERT INTO `jc_site_access_pages` VALUES ('258', 'http://localhost:8080/zckj/qyal/215.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:34:14', '1', '6', '9');
INSERT INTO `jc_site_access_pages` VALUES ('259', 'http://localhost:8080/zckj/qyal/215.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:34:30', '19', '8', '9');
INSERT INTO `jc_site_access_pages` VALUES ('260', 'http://localhost:8080/zckj/qyal/215.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:34:49', '0', '9', '9');
INSERT INTO `jc_site_access_pages` VALUES ('261', 'http://localhost:8080/zckj/zzjx/216.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:45:47', '2', '12', '9');
INSERT INTO `jc_site_access_pages` VALUES ('262', 'http://localhost:8080/zckj/zzjx/216.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:45:49', '16', '13', '9');
INSERT INTO `jc_site_access_pages` VALUES ('263', 'http://localhost:8080/zckj/zzjx/216.jhtml', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:46:05', '57', '14', '9');
INSERT INTO `jc_site_access_pages` VALUES ('264', 'http://localhost:8080/', 'D27CF557C0B84AA7ACBA7F1570FF8CCB', '2018-06-11', '22:47:02', '0', '15', '1');
INSERT INTO `jc_site_access_pages` VALUES ('265', 'http://localhost:8080/', '630302D542F701E001A7804BA081E666', '2018-06-12', '23:19:58', '0', '1', '1');

-- ----------------------------
-- Table structure for jc_site_access_statistic
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_statistic`;
CREATE TABLE `jc_site_access_statistic` (
  `access_statistic_id` int(11) NOT NULL AUTO_INCREMENT,
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `pv` int(11) NOT NULL DEFAULT '0' COMMENT 'pv量',
  `ip` int(11) NOT NULL DEFAULT '0' COMMENT 'ip量',
  `visitors` int(11) NOT NULL DEFAULT '0' COMMENT '访客数量',
  `pages_aver` int(11) NOT NULL DEFAULT '0' COMMENT '人均浏览次数',
  `visit_second_aver` int(11) NOT NULL DEFAULT '0' COMMENT '人均访问时长（秒）',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `statisitc_type` varchar(255) NOT NULL DEFAULT 'all' COMMENT '统计分类（all代表当天所有访问量的统计）',
  `statistic_column_value` varchar(255) DEFAULT '' COMMENT '统计列值',
  PRIMARY KEY (`access_statistic_id`),
  KEY `fk_jc_access_statistic_site` (`site_id`),
  CONSTRAINT `fk_jc_access_statistic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='访问统计表';

-- ----------------------------
-- Records of jc_site_access_statistic
-- ----------------------------
INSERT INTO `jc_site_access_statistic` VALUES ('1', '2018-03-25', '72', '1', '1', '72', '3881', '4', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('2', '2018-03-25', '72', '1', '1', '72', '3881', '4', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('3', '2018-03-25', '72', '1', '1', '72', '3881', '4', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('4', '2018-03-26', '5', '1', '2', '2', '29', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('5', '2018-03-26', '5', '1', '2', '2', '29', '1', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('6', '2018-03-26', '1', '1', '1', '1', '0', '1', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('7', '2018-03-26', '4', '1', '1', '4', '58', '1', 'link', 'http://localhost:8889');
INSERT INTO `jc_site_access_statistic` VALUES ('8', '2018-03-27', '2', '1', '2', '1', '0', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('9', '2018-03-27', '2', '1', '2', '1', '0', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('10', '2018-04-03', '29', '1', '1', '29', '3946', '4', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('11', '2018-04-03', '29', '1', '1', '29', '3946', '4', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('12', '2018-04-03', '29', '1', '1', '29', '3946', '4', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('13', '2018-04-06', '9', '1', '2', '4', '880', '4', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('14', '2018-04-06', '2', '1', '1', '2', '4', '4', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('15', '2018-04-06', '7', '1', '1', '7', '1756', '4', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('16', '2018-04-06', '2', '1', '1', '2', '4', '4', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('17', '2018-04-07', '9', '1', '2', '4', '780', '4', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('18', '2018-04-07', '9', '1', '2', '4', '780', '4', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('19', '2018-04-07', '9', '1', '2', '4', '780', '4', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('20', '2018-04-08', '20', '1', '1', '20', '3316', '4', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('21', '2018-04-08', '20', '1', '1', '20', '3316', '4', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('22', '2018-04-08', '20', '1', '1', '20', '3316', '4', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('23', '2018-04-09', '3', '1', '3', '1', '0', '4', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('24', '2018-04-09', '3', '1', '3', '1', '0', '4', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('25', '2018-04-09', '3', '1', '3', '1', '0', '4', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('26', '2018-04-14', '5', '1', '2', '2', '-761831955', '4', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('27', '2018-04-14', '5', '1', '2', '2', '-761831955', '4', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('28', '2018-04-14', '5', '1', '2', '2', '-761831955', '4', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('29', '2018-04-15', '51', '1', '3', '17', '462', '4', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('30', '2018-04-15', '18', '1', '2', '9', '377', '4', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('31', '2018-04-15', '33', '1', '1', '33', '632', '4', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('32', '2018-04-15', '18', '1', '2', '9', '377', '4', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('33', '2018-04-19', '17', '1', '1', '17', '680', '4', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('34', '2018-04-19', '17', '1', '1', '17', '680', '4', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('35', '2018-04-19', '17', '1', '1', '17', '680', '4', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('36', '2018-04-21', '70', '1', '4', '17', '-19769', '16', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('37', '2018-04-21', '70', '1', '4', '17', '-19769', '16', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('38', '2018-04-21', '70', '1', '4', '17', '-19769', '16', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('39', '2018-04-22', '10', '1', '1', '10', '860', '16', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('40', '2018-04-22', '10', '1', '1', '10', '860', '16', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('41', '2018-04-22', '10', '1', '1', '10', '860', '16', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('42', '2018-06-03', '5', '1', '3', '1', '-509327996', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('43', '2018-06-03', '5', '1', '3', '1', '-509327996', '1', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('44', '2018-06-03', '5', '1', '3', '1', '-509327996', '1', 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES ('45', '2018-06-06', '67', '1', '1', '67', '7106', '19', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('46', '2018-06-06', '67', '1', '1', '67', '7106', '19', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('47', '2018-06-07', '81', '1', '2', '40', '3638', '19', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('48', '2018-06-07', '81', '1', '2', '40', '3638', '19', 'source', '直接访问');

-- ----------------------------
-- Table structure for jc_site_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_attr`;
CREATE TABLE `jc_site_attr` (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_site` (`site_id`),
  CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点属性表';

-- ----------------------------
-- Records of jc_site_attr
-- ----------------------------
INSERT INTO `jc_site_attr` VALUES ('1', 'pvTotal', '45');
INSERT INTO `jc_site_attr` VALUES ('1', 'visitors', '13');
INSERT INTO `jc_site_attr` VALUES ('1', 'wxAppkey', 'wxc596191fde33119f');
INSERT INTO `jc_site_attr` VALUES ('1', 'wxAppSecret', '97c84c68390df25dea0fec7ff2adab26');
INSERT INTO `jc_site_attr` VALUES ('1', 'dayPvTotal', '1');
INSERT INTO `jc_site_attr` VALUES ('1', 'dayVisitors', '1');
INSERT INTO `jc_site_attr` VALUES ('1', 'weekPvTotal', '2');
INSERT INTO `jc_site_attr` VALUES ('1', 'monthPvTotal', '31');
INSERT INTO `jc_site_attr` VALUES ('1', 'monthVisitors', '8');
INSERT INTO `jc_site_attr` VALUES ('1', 'weekVisitors', '1');
INSERT INTO `jc_site_attr` VALUES ('1', 'wxToken', 'aaaasddsadfasdf');
INSERT INTO `jc_site_attr` VALUES ('1', 'contentTotal', '80');
INSERT INTO `jc_site_attr` VALUES ('1', 'commentTotal', '5');
INSERT INTO `jc_site_attr` VALUES ('1', 'guestbookTotal', '4');
INSERT INTO `jc_site_attr` VALUES ('1', 'memberTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('4', 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('4', 'weekPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('4', 'monthPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('4', 'weekVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('4', 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('4', 'monthVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('4', 'pvTotal', '554');
INSERT INTO `jc_site_attr` VALUES ('4', 'visitors', '43');
INSERT INTO `jc_site_attr` VALUES ('9', 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('9', 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('14', 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('14', 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('15', 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('15', 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('16', 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('16', 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('9', 'weekPvTotal', '53');
INSERT INTO `jc_site_attr` VALUES ('9', 'monthPvTotal', '53');
INSERT INTO `jc_site_attr` VALUES ('9', 'pvTotal', '177');
INSERT INTO `jc_site_attr` VALUES ('9', 'visitors', '3');
INSERT INTO `jc_site_attr` VALUES ('9', 'monthVisitors', '2');
INSERT INTO `jc_site_attr` VALUES ('9', 'weekVisitors', '2');
INSERT INTO `jc_site_attr` VALUES ('14', 'monthPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('14', 'weekPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('14', 'pvTotal', '5');
INSERT INTO `jc_site_attr` VALUES ('14', 'weekVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('14', 'visitors', '2');
INSERT INTO `jc_site_attr` VALUES ('14', 'monthVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('15', 'weekPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('15', 'weekVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('16', 'weekPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('16', 'weekVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('16', 'pvTotal', '182');
INSERT INTO `jc_site_attr` VALUES ('16', 'monthPvTotal', '1');
INSERT INTO `jc_site_attr` VALUES ('16', 'visitors', '17');
INSERT INTO `jc_site_attr` VALUES ('16', 'monthVisitors', '1');
INSERT INTO `jc_site_attr` VALUES ('15', 'monthPvTotal', '1');
INSERT INTO `jc_site_attr` VALUES ('15', 'monthVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('17', 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('17', 'weekPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('17', 'monthPvTotal', '2');
INSERT INTO `jc_site_attr` VALUES ('17', 'weekVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('17', 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('17', 'monthVisitors', '1');
INSERT INTO `jc_site_attr` VALUES ('18', 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('18', 'weekPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('18', 'monthPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('18', 'weekVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('18', 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('18', 'monthVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('19', 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('19', 'weekPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('19', 'monthPvTotal', '194');
INSERT INTO `jc_site_attr` VALUES ('19', 'weekVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('19', 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('19', 'monthVisitors', '5');
INSERT INTO `jc_site_attr` VALUES ('20', 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('20', 'weekPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('20', 'monthPvTotal', '1');
INSERT INTO `jc_site_attr` VALUES ('20', 'weekVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('20', 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES ('20', 'monthVisitors', '0');
INSERT INTO `jc_site_attr` VALUES ('17', 'pvTotal', '2');
INSERT INTO `jc_site_attr` VALUES ('17', 'visitors', '2');
INSERT INTO `jc_site_attr` VALUES ('19', 'pvTotal', '194');
INSERT INTO `jc_site_attr` VALUES ('19', 'visitors', '5');
INSERT INTO `jc_site_attr` VALUES ('15', 'pvTotal', '1');
INSERT INTO `jc_site_attr` VALUES ('15', 'visitors', '0');
INSERT INTO `jc_site_attr` VALUES ('20', 'pvTotal', '1');
INSERT INTO `jc_site_attr` VALUES ('20', 'visitors', '0');

-- ----------------------------
-- Table structure for jc_site_cfg
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_cfg`;
CREATE TABLE `jc_site_cfg` (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) NOT NULL COMMENT '名称',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_cfg_site` (`site_id`),
  CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点配置表';

-- ----------------------------
-- Records of jc_site_cfg
-- ----------------------------

-- ----------------------------
-- Table structure for jc_site_company
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_company`;
CREATE TABLE `jc_site_company` (
  `site_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '公司名称',
  `scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `nature` varchar(255) DEFAULT NULL COMMENT '公司性质',
  `industry` varchar(1000) DEFAULT NULL COMMENT '公司行业',
  `contact` varchar(500) DEFAULT NULL COMMENT '联系方式',
  `description` text COMMENT '公司简介',
  `address` varchar(500) DEFAULT NULL COMMENT '公司地址',
  `longitude` float(5,2) DEFAULT NULL COMMENT '经度',
  `latitude` float(4,2) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`site_id`),
  CONSTRAINT `fk_jc_company_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息';

-- ----------------------------
-- Records of jc_site_company
-- ----------------------------
INSERT INTO `jc_site_company` VALUES ('1', 'JEECMS开发站', '10-20人', '私企', '互联网', '', '<p><span id=\"_baidu_bookmark_start_1\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_4\" style=\"display: none; line-height: 0px;\">‍</span></p><p><span id=\"_baidu_bookmark_start_0\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_3\" style=\"display: none; line-height: 0px;\">‍</span><br/></p><p><span id=\"_baidu_bookmark_end_5\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_end_2\" style=\"display: none; line-height: 0px;\">‍</span></p>', '', null, null);
INSERT INTO `jc_site_company` VALUES ('4', '吉林正泰第三方公共服务平台', null, null, null, null, null, null, null, null);
INSERT INTO `jc_site_company` VALUES ('9', '吉林正泰众创空间', null, null, null, null, null, null, null, null);
INSERT INTO `jc_site_company` VALUES ('14', '工程咨询', null, null, null, null, null, null, null, null);
INSERT INTO `jc_site_company` VALUES ('15', '科技咨询', null, null, null, null, null, null, null, null);
INSERT INTO `jc_site_company` VALUES ('16', '九维智库', null, null, null, null, null, null, null, null);
INSERT INTO `jc_site_company` VALUES ('17', '审计咨询', null, null, null, null, null, null, null, null);
INSERT INTO `jc_site_company` VALUES ('18', '评估评价', null, null, null, null, null, null, null, null);
INSERT INTO `jc_site_company` VALUES ('19', '六维空间规划', null, null, null, null, null, null, null, null);
INSERT INTO `jc_site_company` VALUES ('20', '资产评估', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for jc_site_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_model`;
CREATE TABLE `jc_site_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `model_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `upload_path` varchar(100) DEFAULT NULL COMMENT '上传路径',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) DEFAULT '1' COMMENT '0:编辑器;1:文本框;2:文本区;3:图片;4:附件',
  `is_single` tinyint(1) DEFAULT '1' COMMENT '是否独占一行',
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `ak_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点信息模型表';

-- ----------------------------
-- Records of jc_site_model
-- ----------------------------

-- ----------------------------
-- Table structure for jc_site_refer
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_refer`;
CREATE TABLE `jc_site_refer` (
  `site_id` int(11) NOT NULL,
  `from_site_id` int(11) NOT NULL,
  PRIMARY KEY (`from_site_id`,`site_id`),
  KEY `fk_jc_site_to` (`site_id`),
  CONSTRAINT `fk_jc_site_from` FOREIGN KEY (`from_site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_site_to` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点转载权限';

-- ----------------------------
-- Records of jc_site_refer
-- ----------------------------
INSERT INTO `jc_site_refer` VALUES ('1', '1');

-- ----------------------------
-- Table structure for jc_site_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_txt`;
CREATE TABLE `jc_site_txt` (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) NOT NULL COMMENT '名称',
  `txt_value` longtext COMMENT '值',
  KEY `fk_jc_txt_site` (`site_id`),
  CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点文本表';

-- ----------------------------
-- Records of jc_site_txt
-- ----------------------------

-- ----------------------------
-- Table structure for jc_sms
-- ----------------------------
DROP TABLE IF EXISTS `jc_sms`;
CREATE TABLE `jc_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '消息服务名称',
  `access_key_id` varchar(255) NOT NULL COMMENT 'app id/accessKeyId',
  `access_key_secret` varchar(255) NOT NULL COMMENT 'app key/accessKey secret',
  `template_code` varchar(255) NOT NULL COMMENT '模板ID',
  `template_param` varchar(255) DEFAULT NULL COMMENT '模板对应键',
  `interval_time` int(11) DEFAULT NULL COMMENT '短信发送间隔时间 0无限制',
  `interval_unit` int(1) DEFAULT NULL COMMENT '间隔时间单位 0秒 1分 2时',
  `effective_time` int(11) DEFAULT NULL COMMENT '短信验证码有效时间 0无限制',
  `effective_unit` int(1) DEFAULT NULL COMMENT '有效时间单位 0秒 1分 2时',
  `sign_name` varchar(255) DEFAULT NULL COMMENT '短信签名(阿里)',
  `sms_up_extend_code` varchar(255) DEFAULT NULL COMMENT '上行短信扩展码,无特殊需要此字段的用户请忽略此字段(阿里)',
  `out_id` varchar(255) DEFAULT NULL COMMENT '外部流水扩展字段',
  `nation_code` varchar(255) DEFAULT NULL COMMENT '区域码(腾讯)',
  `end_point` varchar(255) DEFAULT NULL COMMENT 'SMS服务域名(百度)',
  `invoke_id` varchar(255) DEFAULT NULL COMMENT '发送使用签名的调用ID(百度)',
  `sms_source` tinyint(2) DEFAULT NULL COMMENT 'SMS服务平台1阿里 2腾讯 3百度',
  `is_code` tinyint(1) DEFAULT NULL COMMENT '是否为验证码模板',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `random_num` int(11) DEFAULT NULL COMMENT '验证码位数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SMS短信服务配置';

-- ----------------------------
-- Records of jc_sms
-- ----------------------------

-- ----------------------------
-- Table structure for jc_sms_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_sms_record`;
CREATE TABLE `jc_sms_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_content` varchar(255) DEFAULT NULL COMMENT '发送内容',
  `sms_id` int(11) DEFAULT NULL COMMENT '短信服务id',
  `site_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '1',
  `validate_type` int(2) DEFAULT '0' COMMENT '验证类型  0：未知 1 : 注册验证 2 : 找回密码验证 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SMS短信服务记录';

-- ----------------------------
-- Records of jc_sms_record
-- ----------------------------

-- ----------------------------
-- Table structure for jc_task
-- ----------------------------
DROP TABLE IF EXISTS `jc_task`;
CREATE TABLE `jc_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(255) DEFAULT NULL COMMENT '任务执行代码',
  `task_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务类型(1首页静态化、2栏目页静态化、3内容页静态化、4采集、5分发)',
  `task_name` varchar(255) NOT NULL COMMENT '任务名称',
  `job_class` varchar(255) NOT NULL COMMENT '任务类',
  `execycle` tinyint(1) NOT NULL DEFAULT '1' COMMENT '执行周期分类(1非表达式 2 cron表达式)',
  `day_of_month` int(11) DEFAULT NULL COMMENT '每月的哪天',
  `day_of_week` tinyint(1) DEFAULT NULL COMMENT '周几',
  `hour` int(11) DEFAULT NULL COMMENT '小时',
  `minute` int(11) DEFAULT NULL COMMENT '分钟',
  `interval_hour` int(11) DEFAULT NULL COMMENT '间隔小时',
  `interval_minute` int(11) DEFAULT NULL COMMENT '间隔分钟',
  `task_interval_unit` tinyint(1) DEFAULT NULL COMMENT '1分钟、2小时、3日、4周、5月',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT '规则表达式',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `task_remark` varchar(255) DEFAULT NULL COMMENT '任务说明',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`task_id`),
  KEY `fk_jc_task_site` (`site_id`),
  CONSTRAINT `fk_jc_task_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

-- ----------------------------
-- Records of jc_task
-- ----------------------------

-- ----------------------------
-- Table structure for jc_task_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_task_attr`;
CREATE TABLE `jc_task_attr` (
  `task_id` int(11) NOT NULL,
  `param_name` varchar(30) NOT NULL COMMENT '参数名称',
  `param_value` varchar(255) DEFAULT NULL COMMENT '参数值',
  KEY `fk_jc_attr_task` (`task_id`),
  CONSTRAINT `fk_jc_attr_task` FOREIGN KEY (`task_id`) REFERENCES `jc_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务参数表';

-- ----------------------------
-- Records of jc_task_attr
-- ----------------------------

-- ----------------------------
-- Table structure for jc_third_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_third_account`;
CREATE TABLE `jc_third_account` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_key` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方账号key',
  `username` varchar(100) NOT NULL DEFAULT '0' COMMENT '关联用户名',
  `source` varchar(10) NOT NULL DEFAULT '' COMMENT '第三方账号平台(QQ、新浪微博等)',
  `user_id` int(11) DEFAULT NULL COMMENT '用户iD',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方登录平台账号';

-- ----------------------------
-- Records of jc_third_account
-- ----------------------------

-- ----------------------------
-- Table structure for jc_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_topic`;
CREATE TABLE `jc_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `topic_name` varchar(150) NOT NULL COMMENT '名称',
  `short_name` varchar(150) DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推??',
  `initials` varchar(150) DEFAULT NULL COMMENT '首字母拼音简写',
  PRIMARY KEY (`topic_id`),
  KEY `fk_jc_topic_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS专题表';

-- ----------------------------
-- Records of jc_topic
-- ----------------------------
INSERT INTO `jc_topic` VALUES ('1', null, ' 2016饲料英才网络招聘会', '饲料英才网络招聘会', '', '', '/u/cms/www/201610/10100951y2xy.jpg', '/u/cms/www/201610/11092540p27t.jpg', '', '11', '1', null);
INSERT INTO `jc_topic` VALUES ('2', null, '互联网+与传统产业升级之道', '互联网+', '', '', '/u/cms/www/201610/10100842hqdk.jpg', '/u/cms/www/201610/110911592mxa.jpg', '', '10', '1', null);
INSERT INTO `jc_topic` VALUES ('3', null, '2015全国两会', '2015全国两会', '', '', '/u/cms/www/201610/101010021q7v.jpg', '/u/cms/www/201610/11092148co74.jpg', '', '10', '1', null);

-- ----------------------------
-- Table structure for jc_topic_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_topic_channel`;
CREATE TABLE `jc_topic_channel` (
  `topic_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`channel_id`),
  KEY `fk_jc_topic_channel_channel` (`channel_id`),
  KEY `fk_jc_topic_channel_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_channel_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_topic_channel
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_user`;
CREATE TABLE `jc_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `depart_id` int(11) DEFAULT NULL COMMENT '部门',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT '0' COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `is_viewonly_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只读管理员',
  `is_self_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只管理自己的数据',
  `statu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0审核通过  1禁用  2待审核',
  `file_total` int(11) NOT NULL DEFAULT '0' COMMENT '上传文库文档个数',
  `grain` int(11) NOT NULL DEFAULT '0' COMMENT '文库财富值',
  `session_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `fk_jc_user_group` (`group_id`),
  KEY `fk_jc_user_depart` (`depart_id`),
  CONSTRAINT `fk_jc_user_depart` FOREIGN KEY (`depart_id`) REFERENCES `jc_department` (`depart_id`),
  CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户表';

-- ----------------------------
-- Records of jc_user
-- ----------------------------
INSERT INTO `jc_user` VALUES ('1', '1', '1', 'admin', 'aa@qq.com', '2011-01-03 00:00:00', '127.0.0.1', '2018-06-12 23:18:05', '127.0.0.1', '2864', '9', '458655', '190', '2017-12-19', '1', '0', '0', '0', '4', '103', '7DDF52532660235E37EBDB0AFCF54A82');
INSERT INTO `jc_user` VALUES ('2', '1', null, 'jlzt', '', '2018-03-24 22:18:19', '127.0.0.1', '2018-04-24 18:57:50', '127.0.0.1', '31', '1', '9', '9', '2018-04-19', '1', '0', '0', '0', '0', '0', '562EC1A008DCB3D2C73DA74CC90B3386');
INSERT INTO `jc_user` VALUES ('7', '3', null, 'zckj', '', '2018-04-14 12:02:45', '127.0.0.1', '2018-06-09 16:36:42', '127.0.0.1', '3', '1', '0', '0', '2018-04-14', '1', '0', '0', '0', '0', '0', '428C1606B0801067551671B69605DCCD');
INSERT INTO `jc_user` VALUES ('9', '3', null, 'gczx', '', '2018-04-14 12:04:59', '127.0.0.1', '2018-04-21 11:38:04', '127.0.0.1', '13', '1', '39', '39', '2018-04-21', '1', '0', '0', '0', '0', '0', '4130D278FE35E885004A4882E69B37B3');
INSERT INTO `jc_user` VALUES ('10', '1', null, 'kjzx', '', '2018-04-14 12:05:37', '127.0.0.1', '2018-04-14 12:05:37', '127.0.0.1', '0', '1', '0', '0', '2018-04-14', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_user` VALUES ('11', '3', null, 'jwzk', '', '2018-04-14 12:06:11', '127.0.0.1', '2018-04-24 22:04:43', '127.0.0.1', '10', '1', '0', '0', '2018-04-14', '1', '0', '0', '0', '0', '0', 'B1701BE369F17662B71D367D7E4DF5A7');
INSERT INTO `jc_user` VALUES ('12', '3', null, 'sjzx', '', '2018-05-15 22:01:00', '127.0.0.1', '2018-05-15 22:01:00', '127.0.0.1', '0', '1', '0', '0', '2018-05-15', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_user` VALUES ('13', '3', null, 'pgpj', '', '2018-05-15 22:16:46', '127.0.0.1', '2018-05-15 22:16:46', '127.0.0.1', '0', '1', '0', '0', '2018-05-15', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_user` VALUES ('14', '3', null, 'kjgh', '', '2018-05-15 22:26:27', '127.0.0.1', '2018-05-15 22:26:27', '127.0.0.1', '0', '1', '0', '0', '2018-05-15', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_user` VALUES ('15', '1', null, 'zcpj', '', '2018-05-15 22:41:43', '127.0.0.1', '2018-05-15 22:41:43', '127.0.0.1', '0', '1', '0', '0', '2018-05-15', '1', '0', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for jc_user_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_account`;
CREATE TABLE `jc_user_account` (
  `user_id` int(11) NOT NULL,
  `account_weixin` varchar(255) DEFAULT NULL COMMENT '微信账号名',
  `account_weixin_openId` varchar(255) DEFAULT NULL COMMENT '微信账号openid',
  `account_alipy` varchar(255) DEFAULT NULL COMMENT '支付宝账号',
  `draw_account` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提现账户(0微信 1支付宝)',
  `content_total_amount` double(15,4) DEFAULT '0.0000' COMMENT '稿费总金额',
  `content_no_pay_amount` double(15,4) DEFAULT '0.0000' COMMENT '待提现稿费金额',
  `content_year_amount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '稿费年金额',
  `content_month_amount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '稿费本月金额',
  `content_day_amount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '稿费本日金额',
  `content_buy_count` int(11) DEFAULT NULL COMMENT '被用户购买次数',
  `draw_count` int(11) DEFAULT '0' COMMENT '累计提现次数',
  `last_draw_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次提现时间',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '上次用户购买时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户稿费收费配置';

-- ----------------------------
-- Records of jc_user_account
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_attr`;
CREATE TABLE `jc_user_attr` (
  `user_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `attr_value` varchar(255) DEFAULT NULL,
  KEY `fk_jc_attr_user` (`user_id`),
  CONSTRAINT `fk_jc_attr_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';

-- ----------------------------
-- Records of jc_user_attr
-- ----------------------------
INSERT INTO `jc_user_attr` VALUES ('1', 'abc', 'abc1');
INSERT INTO `jc_user_attr` VALUES ('1', 'ef', 'ef1');

-- ----------------------------
-- Table structure for jc_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_collection`;
CREATE TABLE `jc_user_collection` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `content_id` int(11) NOT NULL DEFAULT '0' COMMENT '内容id',
  PRIMARY KEY (`user_id`,`content_id`),
  KEY `fk_jc_user_collection_con` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_con` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏关联表';

-- ----------------------------
-- Records of jc_user_collection
-- ----------------------------
INSERT INTO `jc_user_collection` VALUES ('1', '130');

-- ----------------------------
-- Table structure for jc_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_ext`;
CREATE TABLE `jc_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(100) DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `user_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_signature` varchar(255) DEFAULT NULL COMMENT '用户个性签名',
  `today_guestbook_total` int(11) NOT NULL DEFAULT '0' COMMENT '今日留言数',
  `today_comment_total` int(11) NOT NULL DEFAULT '0' COMMENT '今日评论数',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户扩展信息表';

-- ----------------------------
-- Records of jc_user_ext
-- ----------------------------
INSERT INTO `jc_user_ext` VALUES ('1', 'JEECMS', '1', '2015-04-09 00:00:00', null, '南昌', null, null, '1110999', '121212', 'http://p0zoghccu.bkt.clouddn.com/u/cms/www/201712/15182216c5mu.jpg', '', '10', '1');
INSERT INTO `jc_user_ext` VALUES ('2', null, '1', null, null, null, null, null, null, null, '', '', '0', '0');
INSERT INTO `jc_user_ext` VALUES ('7', 'zckj', '1', null, null, null, null, null, null, null, '', '', '1', '0');
INSERT INTO `jc_user_ext` VALUES ('9', 'gczx', '1', null, null, null, null, null, null, null, '', '', '0', '0');
INSERT INTO `jc_user_ext` VALUES ('10', null, '1', null, null, null, null, null, null, null, '', '', '0', '0');
INSERT INTO `jc_user_ext` VALUES ('11', 'jwzk', '1', null, null, null, null, null, null, null, '', '', '0', '0');
INSERT INTO `jc_user_ext` VALUES ('12', 'sjzx', '1', null, null, null, null, null, null, null, '', '', '0', '0');
INSERT INTO `jc_user_ext` VALUES ('13', null, '1', null, null, null, null, null, null, null, '', '', '0', '0');
INSERT INTO `jc_user_ext` VALUES ('14', null, '1', null, null, null, null, null, null, null, '', '', '0', '0');
INSERT INTO `jc_user_ext` VALUES ('15', null, '1', null, null, null, null, null, null, null, '', '', '0', '0');

-- ----------------------------
-- Table structure for jc_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_menu`;
CREATE TABLE `jc_user_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) NOT NULL COMMENT '菜单地址',
  `priority` int(11) NOT NULL DEFAULT '10',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `fk_jc_menu_user` (`user_id`),
  CONSTRAINT `fk_jc_menu_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户常用菜单';

-- ----------------------------
-- Records of jc_user_menu
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user_resume
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_resume`;
CREATE TABLE `jc_user_resume` (
  `user_id` int(11) NOT NULL,
  `resume_name` varchar(255) NOT NULL COMMENT '简历名称',
  `target_worknature` varchar(255) DEFAULT NULL COMMENT '期望工作性质',
  `target_workplace` varchar(255) DEFAULT NULL COMMENT '期望工作地点',
  `target_category` varchar(255) DEFAULT NULL COMMENT '期望职位类别',
  `target_salary` varchar(255) DEFAULT NULL COMMENT '期望月薪',
  `edu_school` varchar(255) DEFAULT NULL COMMENT '毕业学校',
  `edu_graduation` datetime DEFAULT NULL COMMENT '毕业时间',
  `edu_back` varchar(255) DEFAULT NULL COMMENT '学历',
  `edu_discipline` varchar(255) DEFAULT NULL COMMENT '专业',
  `recent_company` varchar(500) DEFAULT NULL COMMENT '最近工作公司名称',
  `company_industry` varchar(255) DEFAULT NULL COMMENT '最近公司所属行业',
  `company_scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `job_name` varchar(255) DEFAULT NULL COMMENT '职位名称',
  `job_category` varchar(255) DEFAULT NULL COMMENT '职位类别',
  `job_start` datetime DEFAULT NULL COMMENT '工作起始时间',
  `subordinates` varchar(255) DEFAULT NULL COMMENT '下属人数',
  `job_description` text COMMENT '工作描述',
  `self_evaluation` varchar(2000) DEFAULT NULL COMMENT '自我评价',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_resume_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户简历';

-- ----------------------------
-- Records of jc_user_resume
-- ----------------------------
INSERT INTO `jc_user_resume` VALUES ('1', '程序员', '', '', '', '', '家里蹲大学', null, '', '吃饭', '<img src=/jeeadmin/jeecms/admin_global/o_update.do?password=111&groupId=1&rank=9&roleIds=1&siteIds=1&steps=2&allChannels=true&id=1＞', null, null, '11', null, null, null, '111\r\n222222222222222222222222222\r\n3333333333333333333333333333333333\r\n44444444444444444444444444444444444444444\r\n55555555555555555555555555555555555', '我很强大的哦');

-- ----------------------------
-- Table structure for jc_user_role
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_role`;
CREATE TABLE `jc_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_jc_role_user` (`user_id`),
  CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户角色关联表';

-- ----------------------------
-- Records of jc_user_role
-- ----------------------------
INSERT INTO `jc_user_role` VALUES ('1', '1');
INSERT INTO `jc_user_role` VALUES ('1', '2');
INSERT INTO `jc_user_role` VALUES ('1', '7');
INSERT INTO `jc_user_role` VALUES ('1', '9');
INSERT INTO `jc_user_role` VALUES ('1', '10');
INSERT INTO `jc_user_role` VALUES ('1', '11');
INSERT INTO `jc_user_role` VALUES ('1', '12');
INSERT INTO `jc_user_role` VALUES ('1', '13');
INSERT INTO `jc_user_role` VALUES ('1', '14');
INSERT INTO `jc_user_role` VALUES ('1', '15');

-- ----------------------------
-- Table structure for jc_user_site
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_site`;
CREATE TABLE `jc_user_site` (
  `usersite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核级别',
  `is_all_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否拥有所有栏目的权限',
  `is_all_channel_control` tinyint(1) NOT NULL DEFAULT '1' COMMENT '所有栏目控制权限',
  PRIMARY KEY (`usersite_id`),
  KEY `fk_jc_site_user` (`user_id`),
  KEY `fk_jc_user_site` (`site_id`),
  CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='CMS管理员站点表';

-- ----------------------------
-- Records of jc_user_site
-- ----------------------------
INSERT INTO `jc_user_site` VALUES ('2', '1', '1', '3', '1', '1');
INSERT INTO `jc_user_site` VALUES ('10', '1', '4', '2', '1', '1');
INSERT INTO `jc_user_site` VALUES ('11', '2', '4', '4', '1', '1');
INSERT INTO `jc_user_site` VALUES ('17', '1', '9', '2', '1', '1');
INSERT INTO `jc_user_site` VALUES ('23', '1', '14', '2', '1', '1');
INSERT INTO `jc_user_site` VALUES ('24', '1', '15', '2', '1', '1');
INSERT INTO `jc_user_site` VALUES ('25', '1', '16', '2', '1', '1');
INSERT INTO `jc_user_site` VALUES ('29', '9', '14', '1', '1', '1');
INSERT INTO `jc_user_site` VALUES ('30', '10', '15', '1', '1', '1');
INSERT INTO `jc_user_site` VALUES ('31', '11', '16', '1', '1', '1');
INSERT INTO `jc_user_site` VALUES ('32', '1', '17', '2', '1', '1');
INSERT INTO `jc_user_site` VALUES ('33', '1', '18', '2', '1', '1');
INSERT INTO `jc_user_site` VALUES ('34', '1', '19', '2', '1', '1');
INSERT INTO `jc_user_site` VALUES ('35', '1', '20', '2', '1', '1');
INSERT INTO `jc_user_site` VALUES ('36', '12', '17', '1', '1', '1');
INSERT INTO `jc_user_site` VALUES ('37', '13', '18', '1', '1', '1');
INSERT INTO `jc_user_site` VALUES ('38', '14', '19', '1', '1', '1');
INSERT INTO `jc_user_site` VALUES ('39', '15', '20', '1', '1', '1');

-- ----------------------------
-- Table structure for jc_vote_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_item`;
CREATE TABLE `jc_vote_item` (
  `voteitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '投票数量',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `subtopic_id` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`voteitem_id`),
  KEY `fk_jc_vote_item_topic` (`votetopic_id`),
  KEY `FK_jc_vote_item_subtopic` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_item_subtopic` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`),
  CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8 COMMENT='CMS投票项';

-- ----------------------------
-- Records of jc_vote_item
-- ----------------------------
INSERT INTO `jc_vote_item` VALUES ('12', '2', '很喜欢', '101', '1', '13', '');
INSERT INTO `jc_vote_item` VALUES ('13', '2', '不喜欢', '27', '3', '13', '');
INSERT INTO `jc_vote_item` VALUES ('14', '2', '喜欢', '30', '2', '13', '');
INSERT INTO `jc_vote_item` VALUES ('15', '2', '差不多', '27', '6', '15', '');
INSERT INTO `jc_vote_item` VALUES ('16', '2', '没有改进', '0', '7', '15', '');
INSERT INTO `jc_vote_item` VALUES ('17', '2', '改进很大', '108', '4', '15', '');
INSERT INTO `jc_vote_item` VALUES ('18', '2', '有改进', '30', '5', '15', '');
INSERT INTO `jc_vote_item` VALUES ('19', '2', '图库', '76', '9', '16', '');
INSERT INTO `jc_vote_item` VALUES ('20', '2', '新闻', '80', '8', '16', '');
INSERT INTO `jc_vote_item` VALUES ('21', '2', '下载', '72', '11', '16', '');
INSERT INTO `jc_vote_item` VALUES ('22', '2', '视频', '72', '10', '16', '');
INSERT INTO `jc_vote_item` VALUES ('26', '3', '5000', '0', '2', '18', '');
INSERT INTO `jc_vote_item` VALUES ('27', '3', '10000', '1', '3', '18', '');
INSERT INTO `jc_vote_item` VALUES ('28', '3', '3000', '0', '1', '18', '');
INSERT INTO `jc_vote_item` VALUES ('33', '4', '4号', '0', '4', '20', '');
INSERT INTO `jc_vote_item` VALUES ('34', '4', '2号', '0', '2', '20', '');
INSERT INTO `jc_vote_item` VALUES ('35', '4', '1号', '0', '1', '20', '');
INSERT INTO `jc_vote_item` VALUES ('36', '4', '3号', '0', '3', '20', '');
INSERT INTO `jc_vote_item` VALUES ('37', '5', '1号', '0', '1', '21', '');
INSERT INTO `jc_vote_item` VALUES ('38', '5', '2号', '0', '2', '21', '');
INSERT INTO `jc_vote_item` VALUES ('39', '5', '3号', '0', '3', '21', '');
INSERT INTO `jc_vote_item` VALUES ('40', '5', '4号', '0', '4', '21', '');
INSERT INTO `jc_vote_item` VALUES ('41', '6', '张', '0', '1', '22', '');
INSERT INTO `jc_vote_item` VALUES ('42', '6', '李', '0', '2', '22', '');
INSERT INTO `jc_vote_item` VALUES ('43', '6', '陈', '0', '3', '22', '');
INSERT INTO `jc_vote_item` VALUES ('44', '6', '王', '0', '4', '22', '');
INSERT INTO `jc_vote_item` VALUES ('45', '7', '赵', '0', '1', '23', '');
INSERT INTO `jc_vote_item` VALUES ('46', '7', '孙', '0', '2', '23', '');
INSERT INTO `jc_vote_item` VALUES ('47', '7', '姚', '0', '3', '23', '');
INSERT INTO `jc_vote_item` VALUES ('48', '7', '黄', '0', '4', '23', '');
INSERT INTO `jc_vote_item` VALUES ('49', '8', '钱', '0', '1', '24', '');
INSERT INTO `jc_vote_item` VALUES ('50', '8', '周', '0', '2', '24', '');
INSERT INTO `jc_vote_item` VALUES ('51', '8', '郑', '0', '3', '24', '');
INSERT INTO `jc_vote_item` VALUES ('52', '8', '胡', '0', '4', '24', '');
INSERT INTO `jc_vote_item` VALUES ('53', '9', '南大', '4', '1', '25', '');
INSERT INTO `jc_vote_item` VALUES ('54', '9', '财大', '5', '2', '25', '');
INSERT INTO `jc_vote_item` VALUES ('55', '9', '师大', '6', '3', '25', '');
INSERT INTO `jc_vote_item` VALUES ('56', '9', '农大', '0', '4', '25', '');
INSERT INTO `jc_vote_item` VALUES ('57', '10', '很尽兴', '40', '1', '26', '');
INSERT INTO `jc_vote_item` VALUES ('58', '10', '还行', '3', '2', '26', '');
INSERT INTO `jc_vote_item` VALUES ('59', '10', '没玩够', '5', '3', '26', '');
INSERT INTO `jc_vote_item` VALUES ('60', '10', '家里蹲', '0', '4', '26', '');
INSERT INTO `jc_vote_item` VALUES ('390', '11', '赞成', '18', '1', '169', null);
INSERT INTO `jc_vote_item` VALUES ('391', '11', '反对', '1', '2', '169', '/jeecmsv8/u/cms/www/201705/09145614flbh.jpg');
INSERT INTO `jc_vote_item` VALUES ('392', '11', '对我不影响', '1', '3', '169', null);

-- ----------------------------
-- Table structure for jc_vote_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_record`;
CREATE TABLE `jc_vote_record` (
  `voterecored_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT '投票时间',
  `vote_ip` varchar(50) NOT NULL COMMENT '投票IP',
  `vote_cookie` varchar(32) NOT NULL COMMENT '投票COOKIE',
  `wx_open_id` varchar(50) DEFAULT NULL COMMENT '微信投票者openId',
  PRIMARY KEY (`voterecored_id`),
  KEY `fk_jc_vote_record_topic` (`votetopic_id`),
  KEY `fk_jc_voterecord_user` (`user_id`),
  CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS投票记录';

-- ----------------------------
-- Records of jc_vote_record
-- ----------------------------

-- ----------------------------
-- Table structure for jc_vote_reply
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_reply`;
CREATE TABLE `jc_vote_reply` (
  `votereply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` text COMMENT '回复内容',
  `subtopic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`votereply_id`),
  KEY `FK_jc_vote_reply_sub` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_reply_sub` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票文本题目回复表';

-- ----------------------------
-- Records of jc_vote_reply
-- ----------------------------

-- ----------------------------
-- Table structure for jc_vote_subtopic
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_subtopic`;
CREATE TABLE `jc_vote_subtopic` (
  `subtopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `votetopic_id` int(11) NOT NULL DEFAULT '0' COMMENT '投票（调查）',
  `subtopic_type` int(2) NOT NULL DEFAULT '1' COMMENT '类型（1单选，2多选，3文本）',
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`subtopic_id`),
  KEY `FK_jc_vote_subtopic_vote` (`votetopic_id`),
  CONSTRAINT `FK_jc_vote_subtopic_vote` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COMMENT='投票子题目';

-- ----------------------------
-- Records of jc_vote_subtopic
-- ----------------------------
INSERT INTO `jc_vote_subtopic` VALUES ('13', 'V8版本演示站网页的设计风格您喜欢吗？', '2', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('14', '我觉得这里完善一下：', '2', '3', '3');
INSERT INTO `jc_vote_subtopic` VALUES ('15', 'V8版本比V7版的设计风格有改进吗？', '2', '1', '2');
INSERT INTO `jc_vote_subtopic` VALUES ('16', '您觉得V8演示站哪些模块做的比较好', '2', '2', '4');
INSERT INTO `jc_vote_subtopic` VALUES ('18', '上海工资收入', '3', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('20', '你喜欢哪个', '4', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('21', '你支持哪个选手？', '5', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('22', '你支持哪个选手？', '6', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('23', '你支持哪个选手？', '7', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('24', '你支持哪个选手？', '8', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('25', '你支持哪个学校？', '9', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('26', '国庆长假结束,您尽兴了吗?', '10', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('169', '你对取消住房公积金怎么看？', '11', '1', '1');

-- ----------------------------
-- Table structure for jc_vote_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_topic`;
CREATE TABLE `jc_vote_topic` (
  `votetopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `repeate_hour` int(11) DEFAULT NULL COMMENT '重复投票限制时间，单位小时，为空不允许重复投票',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总投票数',
  `multi_select` int(11) NOT NULL DEFAULT '1' COMMENT '最多可以选择几项',
  `is_restrict_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制会员',
  `is_restrict_ip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制IP',
  `is_restrict_cookie` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制COOKIE',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认主题',
  `limit_weixin` tinyint(1) DEFAULT '0' COMMENT '是否限制微信',
  `vote_day` int(11) DEFAULT '0' COMMENT '限定微信投票每个用户每日投票次数,为0时则投票期内限定投票一次',
  PRIMARY KEY (`votetopic_id`),
  KEY `fk_jc_votetopic_site` (`site_id`),
  CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='CMS投票主题';

-- ----------------------------
-- Records of jc_vote_topic
-- ----------------------------
INSERT INTO `jc_vote_topic` VALUES ('2', '1', 'JEECMS演示站改版用户问卷调查', 'JEECMSv8版正式发布了，伴随着系统的完善，jeecms演示站的模板也一直在不断的改版，针对此次改版，jeecms美工团队特邀您参与“JEECMS演示站改版用户问卷调查”，希望大家能提出宝贵的意见，我们一定认真改进，谢谢大家的支持！', null, null, null, '4982', '1', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('3', '1', '工资收入问卷调查', '工资收入问卷调查', '2016-09-30 14:51:49', '2016-09-30 15:00:49', null, '1', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('4', '1', '男神女神主持选拔大赛', '男神女神主持选拔大赛开始了，美女帅哥云集，大家快来投票吧！', null, '2020-10-09 10:30:13', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('5', '1', '最美志愿者评选', '', null, '2019-01-09 10:33:59', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('6', '1', '2015年度好声音评选', '', null, '2016-12-31 10:35:16', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('7', '1', '“樱花女神”评选大赛 第一季', '', null, '2017-10-18 10:36:42', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('8', '1', '微信拍照大奖赛优秀作品 投票 开始啦', '', null, '2016-10-27 10:37:50', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('9', '1', '南昌“我的校园我的家 温馨校园”评选活动', '', null, '2017-12-01 10:38:52', null, '12', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('10', '1', '国庆长假结束,您尽兴了吗?', '', null, '2017-10-10 10:40:41', null, '47', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('11', '1', '专家建议取消住房公积金，这事儿你咋看？', '', null, null, '0', '42', '1', '1', '0', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for jc_webservice
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice`;
CREATE TABLE `jc_webservice` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_address` varchar(255) NOT NULL DEFAULT '' COMMENT '接口地址',
  `target_namespace` varchar(255) DEFAULT NULL,
  `success_result` varchar(255) DEFAULT '' COMMENT '正确返回值',
  `service_type` varchar(50) DEFAULT NULL COMMENT '接口类型',
  `service_operate` varchar(50) DEFAULT NULL COMMENT '接口操作',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口表';

-- ----------------------------
-- Records of jc_webservice
-- ----------------------------

-- ----------------------------
-- Table structure for jc_webservice_auth
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_auth`;
CREATE TABLE `jc_webservice_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `system` varchar(100) NOT NULL COMMENT '系统',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='webservices认证表';

-- ----------------------------
-- Records of jc_webservice_auth
-- ----------------------------

-- ----------------------------
-- Table structure for jc_webservice_call_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_call_record`;
CREATE TABLE `jc_webservice_call_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(50) NOT NULL COMMENT '接口识别码',
  `auth_id` int(11) NOT NULL COMMENT '调用的认证',
  `record_time` datetime NOT NULL COMMENT '调用时间',
  PRIMARY KEY (`record_id`),
  KEY `fk_webservice_record_auth` (`auth_id`),
  CONSTRAINT `fk_webservice_record_auth` FOREIGN KEY (`auth_id`) REFERENCES `jc_webservice_auth` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口调用记录';

-- ----------------------------
-- Records of jc_webservice_call_record
-- ----------------------------

-- ----------------------------
-- Table structure for jc_webservice_param
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_param`;
CREATE TABLE `jc_webservice_param` (
  `service_id` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '排列顺序',
  `param_name` varchar(100) NOT NULL DEFAULT '' COMMENT '参数名',
  `default_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  KEY `fk_param_webservice` (`service_id`),
  CONSTRAINT `fk_param_webservice` FOREIGN KEY (`service_id`) REFERENCES `jc_webservice` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口参数表';

-- ----------------------------
-- Records of jc_webservice_param
-- ----------------------------

-- ----------------------------
-- Table structure for jc_workflow
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow`;
CREATE TABLE `jc_workflow` (
  `workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL COMMENT '站点',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_cross` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许跨级审核',
  PRIMARY KEY (`workflow_id`),
  KEY `fk_jc_workflow_site` (`site_id`),
  CONSTRAINT `fk_jc_workflow_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流';

-- ----------------------------
-- Records of jc_workflow
-- ----------------------------

-- ----------------------------
-- Table structure for jc_workflow_event
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_event`;
CREATE TABLE `jc_workflow_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL COMMENT '工作流',
  `date_id` int(11) NOT NULL COMMENT '数据标识',
  `user_id` int(11) NOT NULL COMMENT '发起人',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `next_step` int(11) NOT NULL DEFAULT '0' COMMENT '下个步骤',
  `date_type` int(11) NOT NULL DEFAULT '0' COMMENT '数据类型(0默认内容)',
  `is_finish` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否结束',
  `pass_num` int(11) DEFAULT NULL COMMENT '会签本节点通过人数',
  PRIMARY KEY (`event_id`),
  KEY `fk_event_workflow` (`workflow_id`),
  KEY `fk_workflow_event_user` (`user_id`),
  CONSTRAINT `fk_event_flow` FOREIGN KEY (`workflow_id`) REFERENCES `jc_workflow` (`workflow_id`),
  CONSTRAINT `fk_workflow_event_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流轨迹';

-- ----------------------------
-- Records of jc_workflow_event
-- ----------------------------

-- ----------------------------
-- Table structure for jc_workflow_event_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_event_user`;
CREATE TABLE `jc_workflow_event_user` (
  `event_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL COMMENT '工作流转id',
  `user_id` int(11) NOT NULL COMMENT '流转用户',
  PRIMARY KEY (`event_user_id`),
  KEY `fk_jc_we_user` (`user_id`),
  KEY `fk_jc_we_event` (`event_id`),
  CONSTRAINT `fk_jc_we_event` FOREIGN KEY (`event_id`) REFERENCES `jc_workflow_event` (`event_id`),
  CONSTRAINT `fk_jc_we_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流轨迹用户表';

-- ----------------------------
-- Records of jc_workflow_event_user
-- ----------------------------

-- ----------------------------
-- Table structure for jc_workflow_node
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_node`;
CREATE TABLE `jc_workflow_node` (
  `workflow_id` int(11) NOT NULL COMMENT '工作流',
  `role_id` int(11) NOT NULL COMMENT '角色',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `is_countersign` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 会签 0普通流转',
  PRIMARY KEY (`workflow_id`,`priority`),
  KEY `fk_jc_node_workflow` (`workflow_id`),
  KEY `fk_jc_workflow_node_role` (`role_id`),
  CONSTRAINT `fk_jc_node_workflow` FOREIGN KEY (`workflow_id`) REFERENCES `jc_workflow` (`workflow_id`),
  CONSTRAINT `fk_jc_workflow_node_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流节点';

-- ----------------------------
-- Records of jc_workflow_node
-- ----------------------------

-- ----------------------------
-- Table structure for jc_workflow_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_record`;
CREATE TABLE `jc_workflow_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作人',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `event_id` int(11) NOT NULL DEFAULT '0' COMMENT '轨迹',
  `record_time` datetime NOT NULL COMMENT '创建时间',
  `opinion` varchar(255) DEFAULT NULL COMMENT '意见',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型(1:通过  2退回 3保持)',
  PRIMARY KEY (`record_id`),
  KEY `fk_jc_workflowrecord_user` (`user_id`),
  KEY `fk_jc_workflowrecord_site` (`site_id`),
  KEY `fk_jc_workflowrecord_event` (`event_id`),
  CONSTRAINT `fk_jc_workflowrecord_event` FOREIGN KEY (`event_id`) REFERENCES `jc_workflow_event` (`event_id`),
  CONSTRAINT `fk_jc_workflowrecord_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_workflowrecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流日志记录';

-- ----------------------------
-- Records of jc_workflow_record
-- ----------------------------

-- ----------------------------
-- Table structure for jg_weixin
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixin`;
CREATE TABLE `jg_weixin` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `wx_pic` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `wx_welcome` varchar(255) NOT NULL DEFAULT '' COMMENT '关注欢迎语'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jg_weixin
-- ----------------------------
INSERT INTO `jg_weixin` VALUES ('1', '/u/cms/www/201510/08105041f9xd.jpg', 'asfasdfwe');

-- ----------------------------
-- Table structure for jg_weixinmenu
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixinmenu`;
CREATE TABLE `jg_weixinmenu` (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `wm_name` varchar(255) DEFAULT NULL COMMENT '微信菜单名称',
  `wm_type` varchar(255) DEFAULT NULL COMMENT '微信菜单类别',
  `wm_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `wm_key` varchar(255) DEFAULT NULL COMMENT '点击key',
  `wm_parent_id` int(11) DEFAULT NULL COMMENT '父节点',
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jg_weixinmenu
-- ----------------------------
INSERT INTO `jg_weixinmenu` VALUES ('1', '1', '找官方', 'view', 'http://demo.jeecms.com/html/news/', '1', null);
INSERT INTO `jg_weixinmenu` VALUES ('2', '1', '演示站', 'view', 'http://demo.jeecms.com/html/picture/', '2', null);
INSERT INTO `jg_weixinmenu` VALUES ('3', '1', '新闻资讯', 'view', 'http://demo.jeecms.com/html/veido/', '3', null);
INSERT INTO `jg_weixinmenu` VALUES ('4', '1', '论坛', 'view', 'http://bbs.jeecms.com', '4', '1');
INSERT INTO `jg_weixinmenu` VALUES ('5', '1', '官网', 'view', 'http://www.jeecms.com/', '5', '1');
INSERT INTO `jg_weixinmenu` VALUES ('6', '1', 'JSPGOU', 'view', 'http://demo3.jeecms.com', '6', '2');
INSERT INTO `jg_weixinmenu` VALUES ('7', '1', 'JEEBBS', 'view', 'http://bbs.jeecms.com', '7', '2');
INSERT INTO `jg_weixinmenu` VALUES ('8', '1', '图库', 'view', 'http://demo.jeecms.com/news/index.jhtml/pic/index.jhtml', '8', '3');
INSERT INTO `jg_weixinmenu` VALUES ('9', '1', '新闻', 'click', '', 'news', '3');
INSERT INTO `jg_weixinmenu` VALUES ('10', '1', 'JEECMS', 'view', 'http://demo.jeecms.com/', '', '2');
INSERT INTO `jg_weixinmenu` VALUES ('11', '1', '视频', 'view', 'http://demo.jeecms.com/veido/index.jhtml', '', '3');
INSERT INTO `jg_weixinmenu` VALUES ('12', '1', '下载', 'view', 'http://demo.jeecms.com/download/index.jhtml', 'http://demo19.jeecms.com/download/index.jhtml', '3');
INSERT INTO `jg_weixinmenu` VALUES ('13', '1', '调查', 'view', 'http://demo.jeecms.com/survey.jhtml', 'http://demo19.jeecms.com/wldc/index.jhtml', '3');
INSERT INTO `jg_weixinmenu` VALUES ('14', '1', 'JSPGOU店中店', 'view', 'http://dzd.jeecms.com/', 'http://dzd.jeecms.com/', '2');

-- ----------------------------
-- Table structure for jg_weixinmessage
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixinmessage`;
CREATE TABLE `jg_weixinmessage` (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `wm_number` varchar(255) DEFAULT NULL COMMENT '序号',
  `wm_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `wm_path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `wm_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `wm_content` varchar(255) DEFAULT NULL COMMENT '内容',
  `is_welcome` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否欢迎页',
  `wm_msg_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息类型(0带图文链接 1内容加关键字提示 2仅有内容)',
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jg_weixinmessage
-- ----------------------------
INSERT INTO `jg_weixinmessage` VALUES ('1', '1', null, '留言', '/u/cms/www/201510/08172019lz4w.png', 'http://demo.jeecms.com/guestbook.jspx', '金磊科技欢迎您!', '1', '0');
INSERT INTO `jg_weixinmessage` VALUES ('2', '1', 'news', '新闻', '/u/cms/www/201510/27142936gt6k.jpg', 'http://demo19.jeecms.com/news/index.jhtml', '新闻', '0', '0');

-- ----------------------------
-- Table structure for jo_authentication
-- ----------------------------
DROP TABLE IF EXISTS `jo_authentication`;
CREATE TABLE `jo_authentication` (
  `authentication_id` char(32) NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证信息表';

-- ----------------------------
-- Records of jo_authentication
-- ----------------------------

-- ----------------------------
-- Table structure for jo_config
-- ----------------------------
DROP TABLE IF EXISTS `jo_config`;
CREATE TABLE `jo_config` (
  `cfg_key` varchar(50) NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '配置VALUE',
  PRIMARY KEY (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of jo_config
-- ----------------------------
INSERT INTO `jo_config` VALUES ('email_encoding', '');
INSERT INTO `jo_config` VALUES ('email_host', 'smtp.qq.com');
INSERT INTO `jo_config` VALUES ('email_password', 'xxx');
INSERT INTO `jo_config` VALUES ('email_personal', '');
INSERT INTO `jo_config` VALUES ('email_port', '465');
INSERT INTO `jo_config` VALUES ('email_username', '228375211@qq.com');
INSERT INTO `jo_config` VALUES ('login_error_interval', '30');
INSERT INTO `jo_config` VALUES ('login_error_times', '3');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_subject', '找回JEECMS密码');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_text', '感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost:8080/jeecmsv7/member/password_reset.jspx?uid=${uid}&key=${resetKey}');
INSERT INTO `jo_config` VALUES ('message_register_subject', '欢迎您注册JEECMS用户');
INSERT INTO `jo_config` VALUES ('message_register_text', '${username}您好：\r\n欢迎您注册JEECMS系统会员\r\n请点击以下链接进行激活\r\nhttp://localhost:8080/jeecmsv7/active.jspx?username=${username}&key=${activationCode}');
INSERT INTO `jo_config` VALUES ('message_subject', 'JEECMS会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_text', '感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');

-- ----------------------------
-- Table structure for jo_ftp
-- ----------------------------
DROP TABLE IF EXISTS `jo_ftp`;
CREATE TABLE `jo_ftp` (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) NOT NULL COMMENT '名称',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT '21' COMMENT '端口号',
  `username` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `url` varchar(255) NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FTP表';

-- ----------------------------
-- Records of jo_ftp
-- ----------------------------

-- ----------------------------
-- Table structure for jo_template
-- ----------------------------
DROP TABLE IF EXISTS `jo_template`;
CREATE TABLE `jo_template` (
  `tpl_name` varchar(150) NOT NULL COMMENT '模板名称',
  `tpl_source` longtext COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否目录',
  PRIMARY KEY (`tpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of jo_template
-- ----------------------------

-- ----------------------------
-- Table structure for jo_upload
-- ----------------------------
DROP TABLE IF EXISTS `jo_upload`;
CREATE TABLE `jo_upload` (
  `filename` varchar(150) NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传附件表';

-- ----------------------------
-- Records of jo_upload
-- ----------------------------

-- ----------------------------
-- Table structure for jo_user
-- ----------------------------
DROP TABLE IF EXISTS `jo_user`;
CREATE TABLE `jo_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `password` char(32) NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reset_key` char(32) DEFAULT NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) DEFAULT NULL COMMENT '重置密码VALUE',
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `error_ip` varchar(50) DEFAULT NULL COMMENT '登录错误IP',
  `activation` tinyint(1) NOT NULL DEFAULT '1' COMMENT '激活状态',
  `activation_code` char(32) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jo_user
-- ----------------------------
INSERT INTO `jo_user` VALUES ('1', 'admin', 'aa@qq.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2011-01-03 00:00:00', '127.0.0.1', '2018-06-12 23:18:05', '127.0.0.1', '1735', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('2', 'jlzt', null, '202cb962ac59075b964b07152d234b70', '2018-03-24 22:18:19', '127.0.0.1', '2018-04-24 18:57:50', '127.0.0.1', '31', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('7', 'zckj', null, '202cb962ac59075b964b07152d234b70', '2018-04-14 12:02:45', '127.0.0.1', '2018-06-09 16:36:42', '127.0.0.1', '3', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('9', 'gczx', null, '202cb962ac59075b964b07152d234b70', '2018-04-14 12:04:59', '127.0.0.1', '2018-04-21 11:38:04', '127.0.0.1', '13', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('10', 'kjzx', '', '202cb962ac59075b964b07152d234b70', '2018-04-14 12:05:37', '127.0.0.1', '2018-04-14 12:05:37', '127.0.0.1', '0', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('11', 'jwzk', null, '202cb962ac59075b964b07152d234b70', '2018-04-14 12:06:11', '127.0.0.1', '2018-04-24 22:04:43', '127.0.0.1', '10', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('12', 'sjzx', '', '202cb962ac59075b964b07152d234b70', '2018-05-15 22:01:00', '127.0.0.1', '2018-05-15 22:01:00', '127.0.0.1', '0', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('13', 'pgpj', '', '202cb962ac59075b964b07152d234b70', '2018-05-15 22:16:46', '127.0.0.1', '2018-05-15 22:16:46', '127.0.0.1', '0', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('14', 'kjgh', '', '202cb962ac59075b964b07152d234b70', '2018-05-15 22:26:27', '127.0.0.1', '2018-05-15 22:26:27', '127.0.0.1', '0', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('15', 'zcpj', '', '202cb962ac59075b964b07152d234b70', '2018-05-15 22:41:43', '127.0.0.1', '2018-05-15 22:41:43', '127.0.0.1', '0', null, null, null, '0', null, '1', null);
DROP TRIGGER IF EXISTS `triggerCommentInsert`;
DELIMITER ;;
CREATE TRIGGER `triggerCommentInsert` AFTER INSERT ON `jc_comment` FOR EACH ROW update jc_site_attr set attr_value=attr_value+1 where attr_name="commentTotal" and site_id=new.site_id
;;
DELIMITER ;
