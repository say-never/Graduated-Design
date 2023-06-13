/*
Navicat MySQL Data Transfer

Source Server         : localhost_3307
Source Server Version : 50562
Source Host           : localhost:3307
Source Database       : vueitmsjyyztfxpthsg6765v1a1

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2023-05-09 22:39:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shangpinxinxiID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('23', '9', '2');
INSERT INTO `collect` VALUES ('24', '9', '3');
INSERT INTO `collect` VALUES ('25', '9', '6');

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `originName` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('40', 'putongyonghu1.jpg', 'putongyonghu1.jpg');
INSERT INTO `file` VALUES ('41', 'putongyonghu2.jpg', 'putongyonghu2.jpg');
INSERT INTO `file` VALUES ('42', 'putongyonghu3.jpg', 'putongyonghu3.jpg');
INSERT INTO `file` VALUES ('43', 'putongyonghu4.jpg', 'putongyonghu4.jpg');
INSERT INTO `file` VALUES ('44', 'putongyonghu5.jpg', 'putongyonghu5.jpg');
INSERT INTO `file` VALUES ('45', 'putongyonghu6.jpg', 'putongyonghu6.jpg');
INSERT INTO `file` VALUES ('46', 'putongyonghu7.jpg', 'putongyonghu7.jpg');
INSERT INTO `file` VALUES ('47', 'putongyonghu8.jpg', 'putongyonghu8.jpg');
INSERT INTO `file` VALUES ('48', 'aa.zip', 'aa1683389492396.zip');
INSERT INTO `file` VALUES ('49', '新建 DOC 文档.zip', '新建 DOC 文档1683393167522.zip');
INSERT INTO `file` VALUES ('50', '新建 DOC 文档.zip', '新建 DOC 文档1683393185422.zip');
INSERT INTO `file` VALUES ('51', '新建 DOC 文档.zip', '新建 DOC 文档1683393200272.zip');
INSERT INTO `file` VALUES ('52', '新建 DOC 文档.zip', '新建 DOC 文档1683393216745.zip');
INSERT INTO `file` VALUES ('53', '新建 DOC 文档.zip', '新建 DOC 文档1683393479792.zip');

-- ----------------------------
-- Table structure for `guanliyuan`
-- ----------------------------
DROP TABLE IF EXISTS `guanliyuan`;
CREATE TABLE `guanliyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) DEFAULT NULL,
  `mima` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT '0',
  `level` varchar(10) DEFAULT '管理员',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of guanliyuan
-- ----------------------------
INSERT INTO `guanliyuan` VALUES ('1', 'hsg', '94b40c6db280230b4211b06fa04c7be1', '0', '管理员', '2023-02-10 13:37:44');

-- ----------------------------
-- Table structure for `liuyanban`
-- ----------------------------
DROP TABLE IF EXISTS `liuyanban`;
CREATE TABLE `liuyanban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) DEFAULT NULL,
  `cheng` varchar(50) DEFAULT NULL,
  `touxiang` varchar(50) DEFAULT NULL,
  `biaoti` varchar(50) DEFAULT NULL,
  `neirong` varchar(500) DEFAULT NULL,
  `huifu` varchar(500) DEFAULT NULL,
  `status` varchar(10) DEFAULT '0',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parent` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of liuyanban
-- ----------------------------
INSERT INTO `liuyanban` VALUES ('25', null, null, null, 'asdfasdf', null, null, '0', '2023-05-07 01:17:00', '0');
INSERT INTO `liuyanban` VALUES ('26', null, null, null, 'asdfasdfasdf', null, null, '0', '2023-05-07 01:17:03', '25');

-- ----------------------------
-- Table structure for `pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pinglunneirong` varchar(500) DEFAULT NULL,
  `pingfen` varchar(50) DEFAULT NULL,
  `biao` varchar(50) DEFAULT NULL,
  `pinglunren` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shujuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('29', 'fff', '4', 'timuxinxi', '001', '2023-05-07 00:48:38', '2');
INSERT INTO `pinglun` VALUES ('30', 'asdfasdfasdf', '3', 'timuxinxi', '001', '2023-05-07 01:16:50', '3');

-- ----------------------------
-- Table structure for `putongyonghu`
-- ----------------------------
DROP TABLE IF EXISTS `putongyonghu`;
CREATE TABLE `putongyonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(50) DEFAULT NULL,
  `mima` varchar(50) DEFAULT NULL,
  `gerenmingcheng` varchar(50) DEFAULT NULL,
  `xingbie` varchar(50) DEFAULT NULL,
  `zhuangtai` varchar(50) DEFAULT NULL,
  `youxiang` varchar(50) DEFAULT NULL,
  `xingqu` varchar(50) DEFAULT NULL,
  `jianjie` varchar(500) DEFAULT NULL,
  `gerentouxiang` varchar(50) DEFAULT NULL,
  `level` varchar(10) DEFAULT '普通用户',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of putongyonghu
-- ----------------------------
INSERT INTO `putongyonghu` VALUES ('2', '027', 'dc5c7986daef50c1e02ab09b442ee34f', 'C个人', '0', '待就业', 'grorti@qq.com', '', 'ok', '/files/download/40', '普通用户', '2023-05-06 23:42:04');
INSERT INTO `putongyonghu` VALUES ('3', '009', 'dc5c7986daef50c1e02ab09b442ee34f', 'A个人', '0', '在职', 'grhtrhk@163.com', '', 'abc', '/files/download/41', '普通用户', '2023-05-06 23:42:04');
INSERT INTO `putongyonghu` VALUES ('6', '010', 'dc5c7986daef50c1e02ab09b442ee34f', 'F个人', '0', '在职', '43643933@qq.com', '', 'ok', '/files/download/44', '普通用户', '2023-05-06 23:42:04');
INSERT INTO `putongyonghu` VALUES ('7', '011', 'dc5c7986daef50c1e02ab09b442ee34f', 'B个人', '1', '在职', '	fegge@163.com', '', 'ok', '/files/download/45', '普通用户', '2023-05-06 23:42:04');
INSERT INTO `putongyonghu` VALUES ('8', '006', 'dc5c7986daef50c1e02ab09b442ee34f', 'Y个人', '1', '待就业', '56547474@qq.com', '', '无', '/files/download/46', '普通用户', '2023-05-06 23:42:04');
INSERT INTO `putongyonghu` VALUES ('9', '001', 'dc5c7986daef50c1e02ab09b442ee34f', 'L个人', '1', '待就业', 'regrodd@qq.com', '', 'ok', '/files/download/47', '普通用户', '2023-05-06 23:42:04');

-- ----------------------------
-- Table structure for `timuxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `timuxinxi`;
CREATE TABLE `timuxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timumingcheng` varchar(50) DEFAULT NULL,
  `timubiaoqian` varchar(50) DEFAULT NULL,
  `timuleixing` varchar(50) DEFAULT NULL,
  `timunandu` varchar(50) DEFAULT NULL,
  `timumiaoshu` longtext(0) DEFAULT NULL,
  `timuwendang` varchar(50) DEFAULT NULL,
  `shangchuanren` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dianzanshu` int(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of timuxinxi
-- ----------------------------
INSERT INTO `timuxinxi` VALUES ('2', '题目a', 'c++', '单选', '中等', 'aaaaaaaaaaaaaaaaaaaaaaaaaa', 'bbbbbbbbbbbbbbbbbbbbbbbbbbb', '/files/download/48', '001', '2023-05-07 00:09:04', '0');
INSERT INTO `timuxinxi` VALUES ('3', '题目b', 'rust', '不定项', '困难', 'asdfasdfasdfasdf', 'asdfasdfasdffasdf', '/files/download/49', '003', '2023-05-07 01:12:48', '0');
INSERT INTO `timuxinxi` VALUES ('4', '题目c', 'c#', '填空', '简单', 'asdfasd', 'asdfasdfasdf', '/files/download/50', '005', '2023-05-07 01:13:06', '0');
INSERT INTO `timuxinxi` VALUES ('5', '题目d', 'java', '简答', '简单', 'asdfasdf', 'asdfasdfasdf', '/files/download/51', '003', '2023-05-07 01:13:20', '0');
INSERT INTO `timuxinxi` VALUES ('6', '题目e', 'rust', '填空', '中等', 'asdfasdf', 'asdfasdfasdf', '/files/download/52', '005', '2023-05-07 01:13:37', '1');
INSERT INTO `timuxinxi` VALUES ('7', 'aaa', '图像处理', '填空', '中等', 'asdfasdfasdf', 'asdfasdfasdf', '/files/download/53', '001', '2023-05-07 01:18:00', '0');

-- ----------------------------
-- Table structure for `xinwentongzhi`
-- ----------------------------
DROP TABLE IF EXISTS `xinwentongzhi`;
CREATE TABLE `xinwentongzhi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(50) DEFAULT NULL,
  `leibie` varchar(50) DEFAULT NULL,
  `neirong` longtext,
  `dianjilv` varchar(50) DEFAULT NULL,
  `dianzan_d` int(11) DEFAULT '0',
  `dianzan_c` int(11) DEFAULT '0',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xinwentongzhi
-- ----------------------------
INSERT INTO `xinwentongzhi` VALUES ('10', '特朗普的这个如意算盘让日本韩国都傻眼了', '站内新闻', '<p style=\"text-indent:2em;font-size:18px;color:#333333;font-family:微软雅黑, &quot;background-color:#FFFFFF;\">\r\n	哪怕已经是世界老大，还公开跟加拿大、德国、法国、墨西哥等小兄弟翻脸。原因也简单，还是钱！\r\n</p>\r\n<p style=\"text-indent:2em;font-size:18px;color:#333333;font-family:微软雅黑, &quot;background-color:#FFFFFF;\">\r\n	白宫大门朝南开，有理无钱莫进来。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:18px;color:#333333;font-family:微软雅黑, &quot;background-color:#FFFFFF;\">\r\n	而且，特朗普又打起了一个如意大算盘，应该是让日本韩国都傻眼了。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:18px;color:#333333;font-family:微软雅黑, &quot;background-color:#FFFFFF;\">\r\n	按照美国方面提供的问答实录，前几天在白宫，特朗普有一则问答是这样的：\r\n</p>\r\n<p style=\"text-indent:2em;font-size:18px;color:#333333;font-family:微软雅黑, &quot;background-color:#FFFFFF;\">\r\n	记者：你打算在6月12日首脑会晤时，向他们提出给予经济援助的问题吗？\r\n</p>\r\n<p style=\"text-indent:2em;font-size:18px;color:#333333;font-family:微软雅黑, &quot;background-color:#FFFFFF;\">\r\n	特朗普：那将会由韩国提供。不，我不认为美国必须花费。我认为韩国会做。我认为中国――我认为，坦率说，中国会给予帮助。\r\n</p>', '84', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('11', '全民吃辣身体遭殃 刺激肠胃诱发三高', '站内新闻', '<SPAN id=content>&nbsp;\r\n<P align=center><IMG id={E76639CD-9B6C-4988-9A5A-A3EDADA0D83F} alt=\"\" src=\"http://news.xinhuanet.com/health/2013-01/22/124262829_11n.jpg\"></P>\r\n<P class=pictext align=center>　　四<SPAN style=\"CURSOR: hand; COLOR: #0084d8; BORDER-BOTTOM: 0px dotted; TEXT-DECORATION: underline\" name=\"HL_TAG\">川菜</SPAN>馆“四川屋”开张，餐厅工作人员介绍各种川菜配料。</P>\r\n<P>　　中国人正在进入“无辣不欢”的时代。2012年底的一项调查显示，在酸甜苦辣咸五味中，老百姓最喜欢“辣”；菜系中，以辣为特色的川菜和湘菜位居前两名；国外饮食上，也是偏重辣味的韩国料理排在首位。当吃辣成为全民风潮，健康隐忧便慢慢逼近。</P>\r\n<P>　　川湘餐馆开遍全国</P>\r\n<P>　　“来盘儿麻辣小龙虾，再上两瓶啤酒。”下班后，李先生跟同事来到位于北京市东城区东直门附近的簋街。这里是食客们口中的“京城美食聚集地”，大概1公里长的街上，100多家中餐馆林立两侧，一年四季都红火热闹。簋街最著名的美食就是麻辣小龙虾，“每次吃都辣得浑身是汗，但也很爽。”作为资深吃客，李先生告诉记者，簋街的餐馆风格过去并不是以辣为主，而是主打卤煮火烧、爆肚等北京特色小吃，只是受到近些年来“饮食辣潮”的影响，麻辣小龙虾、馋嘴蛙、重庆烤鱼渐渐成了这里的招牌。</P>\r\n<P>　　2012年年底，《小康》杂志联合清华大学媒介调查实验室，在全国范围内展开的“中国饮食小康指数”调查显示，饮食中，国人最重视“<SPAN style=\"CURSOR: hand; COLOR: #0084d8; BORDER-BOTTOM: 0px dotted; TEXT-DECORATION: underline\" name=\"HL_TAG\">口味</SPAN>”，占36.2%；其次才是“安全”，占18.5%；后面依次是“营养”、“价格”、“健康”等。在偏好的口味中，“辣”连续3年居首，然后是甜、咸、酸、苦。菜系选择上，川菜蝉联三连冠，“湘菜”则在今年上升至第二位，此前曾列第三和第四位；“国人最偏爱的外国菜系”排行榜中，韩国料理三度居首，而“辣”同样是韩国料理的主要口味之一。</P>\r\n<P>　　中国人爱吃辣，从川、湘菜和韩国餐馆开遍全国也可见一斑。记者在一家知名生活消费网站上查询后发现，仅在北京，主打川菜、湘菜、韩国料理的饭馆分别有4341家、1425家、1370家，而鲁菜、东北菜、粤菜饭馆加起来仅有2000多家。即使在鲁菜、东北菜、粤菜的故乡济南、沈阳和广州，川菜、湘菜、韩国料理同样占有不可忽视的市场份额。</P>\r\n<P>　　全球快餐连锁肯德基和麦当劳自然也不落人后，一改美国少辣的饮食习惯，在中国餐饮市场竞相比辣。肯德基推出主打川味的口水鸡汉堡后，麦当劳紧跟着推出了“看看你能吃多辣”的三款辣汉堡，而后肯德基再次出招，推出“川辣嫩牛五方”。</P>\r\n<P>　　为了满足人们对“辣”的追逐，一些以“辣”为生的饭馆应运而生。北京市西城区西单附近有一家知名烤翅店，店家打出的招牌之一，是将烤翅按辛辣程度分为了原味、微辣、单面辣、双面辣和变态辣5种。许多慕名而来的食客，都想挑战一下那裹着厚厚辣椒粉的变态辣翅。</P></SPAN>', '85', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('12', '钱库镇开展文明单位复评工作', '站内新闻', '<P class=MsoNormal style=\"TEXT-INDENT: 21pt; mso-char-indent-count: 2.0\"><SPAN style=\"FONT-FAMILY: 宋体; mso-bidi-font-size: 10.5pt\">为充分展示钱库镇精神文明创建成果，进一步提高文明单位建设水平，按照《苍南县文明单位创建管理办法》的规定，</SPAN><SPAN style=\"FONT-FAMILY: 宋体; COLOR: black; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体; mso-bidi-font-size: 10.5pt\">钱库镇文明办</SPAN><SPAN style=\"FONT-FAMILY: 宋体; mso-bidi-font-size: 10.5pt\">受县文明办委托，</SPAN><SPAN style=\"FONT-FAMILY: 宋体; COLOR: black; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体; mso-bidi-font-size: 10.5pt\">从<SPAN lang=EN-US>11</SPAN>月<SPAN lang=EN-US>2</SPAN>日开始对全镇范围内<SPAN lang=EN-US>18</SPAN>个原县级文明单位进行复评。<SPAN lang=EN-US><?xml:namespace prefix = \"o\" ns = \"urn:schemas-microsoft-com:office:office\" /><o:p></o:p></SPAN></SPAN></P>\r\n<P class=MsoNormal style=\"TEXT-INDENT: 21pt; mso-char-indent-count: 2.0\"><SPAN style=\"FONT-FAMILY: 宋体; COLOR: black; mso-font-kerning: 0pt; mso-bidi-font-family: 宋体; mso-bidi-font-size: 10.5pt\">据悉，复评工作主要以文明单位负责人汇报、台账检查、实地查看等形式进行，</SPAN><SPAN style=\"FONT-FAMILY: 宋体; mso-bidi-font-size: 10.5pt\">结合“双百结对、共建文明”活动，并把这项活动开展情况作为重要考核内容。对县级文明单位进行考核评分后，酌情提出继续保留荣誉称号、警告、限期整改或取消荣誉称号等复评建议。对存在重大问题、造成恶劣社会影响的单位要予以撤销荣誉称号处分，创建意识明显淡化、工作明显滑坡、已经丧失先进性、考核评分靠后的单位，也要予以撤销荣誉称号的处分。<SPAN lang=EN-US><o:p></o:p></SPAN></SPAN></P>\r\n<P class=MsoNormal style=\"TEXT-INDENT: 21pt; mso-char-indent-count: 2.0\"><SPAN style=\"FONT-FAMILY: 宋体; mso-bidi-font-size: 10.5pt\">通过此次县级文明单位复评工作，广泛宣传创建文明单位的重要意义，使文明单位的创评活动成为加强我镇精神文明建设的重要载体，推进群众性精神文明创建活动持续、协调、科学发展，为迎接十八大召开营造浓厚的精神文明氛围。(文明办)<SPAN lang=EN-US><o:p></o:p></SPAN></SPAN></P>', '80', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('13', '县红十字会人体器官捐赠联系电话公布', '站内新闻', '&nbsp;&nbsp;&nbsp; 红十字会近日公布人体器官捐赠联系电话64783005，群众可携带本人身份证前往县红会，填写《中国人体器官捐献登记表》，经过公证等程序后，成为一名光荣的人体器官捐献志愿者。据了解，红十字会的人体器官捐赠秉承着无偿、自愿的原则，不涉及活体捐献。（少芬）', '24', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('14', '服务员捅死厨师 警方速破一起故意伤害致死案', '站内新闻', '&nbsp;&nbsp;&nbsp; 2月15日消息：餐饮店内的服务员与厨师本应情同手足，可2月14日下午，我县一豆浆店的服务员贺某与厨师周某却因话不投机举刀相向，最终被牛排刀刺中的厨师周某因抢救无效死亡。犯罪嫌疑人贺某已被我县警方刑事拘留。\r\n<P>&nbsp;&nbsp;&nbsp; 2月14日是西方的传统节日情人节。当天下午，灵溪镇一豆浆店内的员工正为招待众多的青年情侣而忙碌。3时25分许，跑菜的服务员贺某因未能及时将刚做好的菜从传菜窗口端走，而遭到厨师周某的指责。两人话不投机，发生争吵。周某随手抓起一只小碟子扔向贺某，向旁躲避开周某扔来的小碟子后，贺某从旁随手抓起一把牛排刀。见东西没砸到贺某，周某紧接着挥拳打到贺某头部。而贺某将手上的牛排刀刺向周某的左颈项部，被刺后，大量的血液从周某的颈项喷涌而出。本是在场劝架的店内其它员工见势不妙，便拨打110。&nbsp; </P><!--advertisement code begin--><!--advertisement code end-->\r\n<P>&nbsp;&nbsp;&nbsp; 3时27分，灵溪中心派出所处警人员赶赴现场处置。民警当场将犯罪嫌疑人贺某控制，同时将伤势严重、有生命危险的周某送往医院救治。后周某因伤势过重，经抢救无效死亡。</P>\r\n<P>&nbsp;&nbsp;&nbsp; 接报后，县公安局立即启动命案侦破机制，县委常委、公安局长蒋荣国等领导带领侦技人员赶赴开展案件侦破工作。经审讯，犯罪嫌疑人贺某对犯罪事实供认不讳。（通讯员 罗成坚 李辉）</P><!--function: content() parse end  0ms cost! -->\r\n<DIV class=\"clear_div padd8\"></DIV>\r\n<P></P>\r\n<P></P>\r\n<P><SPAN style=\"PADDING-RIGHT: 2px; FLOAT: right; PADDING-BOTTOM: 10px; COLOR: #5f5f5f; TEXT-ALIGN: right\">【编辑：李甫仓】</SPAN></P>', '66', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('15', '国乒最强竟到这地步每局比分都控制得一样刘国正坦言教不了他', '站内新闻', '<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">今天国际乒联中国公开赛展开男双首轮较量，在樊振东/林高远组合3比2击败香港组合涉险过关后，国乒最强双打马龙和许昕登场。面对中国台北选手陈建安和庄智渊，马龙和许昕三局比分都是11比9，显示出了对比赛极强的控制能力。强大的马龙连他的主管教练刘国正都不得不服气，坦言自己根本教不了他。</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\"><span style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">马龙和许昕是国乒当之无愧的第一金牌组合，两人多次在世界大赛合作夺冠。在去年全运会上，北京队的马龙和上海队的许昕还跨省配对，马龙表示就是为了帮助好兄弟许昕夺冠。尽管最后因为许昕的腰伤，他和马龙在决赛输给了樊振东和周雨的组合，但许昕问马龙借了护腰坚持比赛的一幕还是让很多球迷为之感动。</span><br />\r\n</span>\r\n</p>', '13', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('16', '世界上真的有神奇的果冻吗', '站内新闻', '<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E6%9E%9C%E5%86%BB&ch=w.search.jhlink\" target=\"_blank\"><span>果冻</span></a>，这种平日里超市十多元一斤的食物，居然将会承载人类未来记忆，甚至还将有望帮助记忆不佳者，瞬间完成牢固记忆。说不定，在不久的将来，我们孩子在面对老师布置下来的背书作业时，依靠一块果冻就能顺利过关！\r\n<p>\r\n	<br />\r\n<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%8E%A9%E5%91%BD%E8%AE%B0%E5%BF%86&ch=w.search.jhlink\" target=\"_blank\"><span>玩命记忆</span></a>，不如装块果冻\r\n</p>\r\n<p>\r\n	<br />\r\n近日，<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E5%8C%97%E5%8D%A1%E7%BD%97%E6%9D%A5%E7%BA%B3%E5%B7%9E&ch=w.search.jhlink\" target=\"_blank\"><span>北卡罗来纳州</span></a>大学的科学家研制出了一种新型的存储设备，该设备具有柔软、稳定等特性，即使在潮湿的环境下也能够工作良好。更有趣的是，该设备竟然跟平常我们所吃的果冻十分相似。看样子，曾经只是传说的“记忆果冻”即将成为现实了！\r\n</p>\r\n<p>\r\n	<br />\r\n这种忆阻器能够记忆历史电流、<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%94%B5%E5%8E%8B&ch=w.search.jhlink\" target=\"_blank\"><span>电压</span></a>数据，使得我们在面对<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E6%9E%AF%E7%87%A5&ch=w.search.jhlink\" target=\"_blank\"><span>枯燥</span></a>的文字之时，仅仅需要装备这种具有耗能低、存储量大、速度快等优势设备，既可完成记忆。因此，它也是当今存储设备研究领域中的“当红<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E5%B0%8F%E7%94%9F&ch=w.search.jhlink\" target=\"_blank\"><span>小生</span></a>”。而“记忆果冻”正是该技术下产生的新产物。\r\n</p>\r\n<p>\r\n	<br />\r\n常规存储设备的制造材料一般都是脆金属与<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E5%A1%91%E6%96%99&ch=w.search.jhlink\" target=\"_blank\"><span>塑料</span></a>，但是“记忆果冻”却是利用液态镓铟合金制造而成。这便意味着，该设备在潮湿的环境下依然能够保持正常工作的状态，甚至还可能被植入人体体内，与<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%BB%86%E8%83%9E&ch=w.search.jhlink\" target=\"_blank\"><span>细胞</span></a>、酶等一起构架成特殊的记忆装置。“该设备未来的应用面将相当广泛，尤其在<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%94%9F%E7%89%A9%E4%BC%A0%E6%84%9F%E5%99%A8&ch=w.search.jhlink\" target=\"_blank\"><span>生物传感器</span></a>及医疗监控领域，更是有如鱼得水之得天独厚的优势。”来自北卡罗来纳州大学生化<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E5%BC%95%E6%93%8E&ch=w.search.jhlink\" target=\"_blank\"><span>引擎</span></a>研究所的<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E5%8A%A9%E7%90%86&ch=w.search.jhlink\" target=\"_blank\"><span>助理</span></a>教授<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E8%BF%88%E5%85%8B%E5%B0%94&ch=w.search.jhlink\" target=\"_blank\"><span>迈克尔</span></a>・迪基说。<br />\r\n<br />\r\n未来，拯救每个人记忆？\r\n</p>\r\n<p>\r\n	<br />\r\n这种神奇的材料，在与人体“混合”之后，将可能颠覆人类长达数亿年的传统记忆<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E6%9C%AC%E8%83%BD&ch=w.search.jhlink\" target=\"_blank\"><span>本能</span></a>。通过购买、安放这块神奇的果冻，我们将改变自己的记忆。届时很有可能，市场<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E4%B8%8A%E5%B0%86&ch=w.search.jhlink\" target=\"_blank\"><span>上将</span></a>会出现各种品牌的果冻，而它们将不再是标记什么“口味”，而是标记这存储了什么记忆，或者可以用来储存记忆。\r\n</p>\r\n<p>\r\n	<br />\r\n人类将会通过购买不同品牌、不同品质、不同内容的记忆果冻，来获取自己需要的记忆。这种过程以往只会出现在<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%A7%91%E5%B9%BB%E7%89%87&ch=w.search.jhlink\" target=\"_blank\"><span>科幻片</span></a>之中，而未来它将会出现在你的身边。你可以在医院、专卖店，甚至超市中获取它。\r\n</p>\r\n<p>\r\n	<br />\r\n“记忆果冻”能够在两种形态之间自由转换，一种能够导电，而另外一种则绝缘。在每个电子回路里，金属合金扮演着该回路中<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%94%B5%E6%9E%81&ch=w.search.jhlink\" target=\"_blank\"><span>电极</span></a>的角色。当合金暴露在正<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%94%B5%E8%8D%B7&ch=w.search.jhlink\" target=\"_blank\"><span>电荷</span></a>下时，“记忆果冻”的表面将会生成一层<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E6%B0%A7%E5%8C%96%E8%86%9C&ch=w.search.jhlink\" target=\"_blank\"><span>氧化膜</span></a>达到绝缘的效果，而当合金暴露在<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E8%B4%9F%E7%94%B5%E8%8D%B7&ch=w.search.jhlink\" target=\"_blank\"><span>负电荷</span></a>下时，表层的氧化膜立马消失，此时的“记忆果冻”又成为<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E5%AF%BC%E7%94%B5%E4%BD%93&ch=w.search.jhlink\" target=\"_blank\"><span>导电体</span></a>了。科学家们正是利用“记忆果冻”的这一特性来代表<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E4%BA%8C%E8%BF%9B%E5%88%B6&ch=w.search.jhlink\" target=\"_blank\"><span>二进制</span></a>中的0和1，这与传统<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%94%B5%E5%AD%90%E8%AE%BE%E5%A4%87&ch=w.search.jhlink\" target=\"_blank\"><span>电子设备</span></a>表示0和1的方式是截然不同的。\r\n</p>\r\n<p>\r\n	<br />\r\n虽然，现阶段的“记忆果冻”还并不能存储大量的数据，但是它与众不同的特质预示着，有朝一日，它必定会在未来的存储科技领域大显身手。那时，我们遇到难记忆的书籍、知识，或者遇到自己<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E8%AE%B0%E5%BF%86%E8%A1%B0%E9%80%80&ch=w.search.jhlink\" target=\"_blank\"><span>记忆衰退</span></a>之时，只需将这种神奇的果冻装入自己身体，即可达到<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%9E%AC%E9%97%B4%E8%AE%B0%E5%BF%86&ch=w.search.jhlink\" target=\"_blank\"><span>瞬间记忆</span></a>的效果。届时，人人头脑里“背上”一全套<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E7%99%BE%E7%A7%91%E5%85%A8%E4%B9%A6&ch=w.search.jhlink\" target=\"_blank\"><span>百科全书</span></a>、<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E8%BE%9E%E6%B5%B7&ch=w.search.jhlink\" target=\"_blank\"><span>辞海</span></a>上街<a href=\"http://wenwen.soso.com/z/Search.e?sp=S%E9%97%B2%E9%80%9B&ch=w.search.jhlink\" target=\"_blank\"><span>闲逛</span></a>，显摆知识，将不会再是问题！\r\n</p>', '98', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('17', '十二生肖中谁最色', '站内新闻', '　十二生肖有四正星：子、午、卯、酉，也就是鼠、马、鸡、兔。这四个属相也是桃花星，根据十二生肖的秉性，这四个生肖是比较“色”的，因为凡属于桃花星的人，比较爱美丽，爱表现自己，讲究面子，待人亲热，普遍的异性缘较好，所以，他（她）在日常生活当中就显得比较亮丽显眼，这就是咱们说的“色”。这里说的色，并不是好色的“色”，请不要误会。“色”就是比较亮丽，比较容易发光，比较容易显示出自己。<br />\r\n<strong>1、生肖鼠<br />\r\n</strong>生肖鼠是四正星之一，也是最爱表现自己的生肖之一。属鼠的生性好动，最爱表现自己，特别是在异性多的环境下，他的情绪和爱表现的欲望，都非常的强烈，用来吸引更多人的眼球。但是生肖鼠是个怕打击、怕惊吓的人，一旦遇见打击就会信心受挫，一旦遇见危险和惊吓，也会让生肖鼠为之不爽。\r\n<p>\r\n	<br />\r\n<strong>2、生肖马<br />\r\n</strong>生肖马也是桃花星之一。生性高傲，爱表现自己是生肖马的特性。不过，生肖马也的确有表现的资本，他（她）有敏锐的观察力和敬业精神，加上自己品质高尚，非常敬业，人缘关系非常好，可以赚取异性朋友的眼球，特别是在自己得到认可的情况下，让自己光环表现的光彩夺目。所以它是十二生肖中最“色“的生肖之一。\r\n</p>\r\n<p>\r\n	<br />\r\n<strong>3、生肖鸡<br />\r\n</strong>生肖鸡是个爱打扮爱显示自己的人，处处显示出美丽的光环在外，加上生肖鸡非常聪明灵巧，为人厚道，得到周围朋友的信任，从而吸引一帮朋友对你的崇拜和刮目相看。但是生肖鸡今年冲动太岁，容易招惹一些烂桃花，会因为感情而困惑，奉劝生肖鸡要谨慎、低调，不要老显示自己，以免招惹是非。\r\n</p>\r\n<p>\r\n	<br />\r\n<strong>4、生肖兔<br />\r\n</strong>生肖兔比较温和善良，彬彬有礼，潇洒机敏，精细耐心，富有责任感，也是一个非常爱表现自己的人，平常华丽的外表已经吸引了很多人对你的青睐。但是生肖兔今年临太岁，会面临方方面面的压力，尽量待人诚信温和，不要过于夸张，小心因为过于显示自己而给你带来不必要的麻烦。\r\n</p>', '90', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('18', '吴国联：今年信贷向转型升级产业倾斜', '站内新闻', '<P>&nbsp;&nbsp;&nbsp;&nbsp; 十二五开局之年，温州的信贷供应能满足经济发展的需求吗？“十一五”期间，温州金融业取得了哪些突破？如何看待温州活跃的民间借贷？3月12日，中国人民银行温州市中心支行行长吴国联就以上问题接受了温州日报记者的专访。 </P>\r\n<P>　<STRONG>　助力“十二五”：</STRONG></P>\r\n<P><STRONG>　　优化信贷结构促转型</STRONG></P>\r\n<P>　<FONT face=楷体_GB2312>　记者：“十二五”期间，强化投资驱动形成共识。温州中小企业的转型升级、新兴行业的培育都需要金融的支持。人行温州市中心支行在助推温州地方经济转型升级上采取了哪些措施？</FONT></P>\r\n<P>　　吴国联：转型升级是国家的政策导向。对温州来说，要重点支持技术含量高、附加值高的行业，加快发展服务业，也包括金融业。首先，我想澄清社会上的一个误解，即目前货币政策从适度宽松到稳健，会制约地方经济的发展。其实，货币政策作为国家宏观调控重要手段，根据经济形势的变化，有宽松、稳健、从紧三个提法。稳健只是个中性的提法，这就像人走路不快也不慢。今年广义货币供应量Ｍ2增长16%，信贷资金能保障经济发展的需求。另一方面，货币供应总量是够的，但这些钱要投到哪些经济领域去呢？我们要优化信贷资金的结构，投到符合转型升级政策导向的产业上去。在信贷供应上做到有扶有保有压，通过信贷资金的结构优化促进产业升级。具体来说，我们督促各金融机构加大对“三农”、中小企业、政府改善民生工程、战略性新兴产业、节能减排等重点领域和薄弱环节的支持。</P>\r\n<P>　　<FONT face=楷体_GB2312>记者：“十二五”期间，你们在推动温州金融发展方面采取了哪些具体措施？</FONT></P>\r\n<P>　　吴国联：“十二五”期间，我们提出了以下举措：一是加强经济金融监测，根据形势变化切实贯彻落实货币政策；二是发展现代支付结算体系，推动城乡统筹协调，深入实施农村支付结算便利化；三是健全信用管理体系，采集非银信息，加快信用体系建设；四是加强外汇市场管理，健全“走出去”服务体系，支持跨境贸易、投资人民币结算发展；五是加强管理和服务，推动金融改革创新，大力推进金融集聚区建设；六是加强发行基金管理，提高货币供应能力，健全城乡反假币体系；七是推动国库集中支付改革，健全国库综合管理服务体系；八是健全反洗钱工作机制，加强金融稳定合作监管，建设外汇资金流动监测体系。</P>\r\n<P><STRONG>　　回眸“十一五”：</STRONG></P>\r\n<P><STRONG>　　存贷款余额突破万亿</STRONG></P>\r\n<P>　<FONT face=楷体_GB2312>　记者：我们刚刚告别了“十一五”，在过去的五年时间里，温州金融有一些什么样的发展与突破？</FONT></P>\r\n<P>　　吴国联：截至2010年末，温州金融机构本外币存款余额6497.59亿元，五年增长1.7倍；本外币贷款余额5516.68亿元，五年增长2.18倍；全市保费收入100.92亿元，五年增长1.69倍；证券交易额12456.06亿元，五年增长38.24倍。</P>\r\n<P>　　2010年，温州金融业增加值为256.59亿元，占全市生产总值的8.8%，比2005年增加了179.96亿元，占比提高4个百分点。</P>', '66', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('19', '市港航局扎实推进审批制度改革', '站内新闻', '<P>　　截至<SPAN>5</SPAN>月底，市港航局圆满完成审批制度改革和审批流程优化再造工作，共下放审批事项<SPAN>20</SPAN>项，减少审批环节<SPAN>11</SPAN>个，压缩审批时限<SPAN>30%</SPAN>。目前，该局行政许可事项<SPAN>16</SPAN>项（即办项<SPAN>1</SPAN>项），非行政许可事项<SPAN>7</SPAN>项<SPAN>,</SPAN>备案<SPAN>9</SPAN>项（即办<SPAN>7</SPAN>项）；下放各县（市）港航局许可事项<SPAN>10</SPAN>项，非行政许可事项<SPAN>2</SPAN>项，备案事项<SPAN>8</SPAN>项。（市港航局）</P>', '98', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('20', '菜价低迷菜农叹息 卖个菜怎就这么难', '站内新闻', '&nbsp;&nbsp;&nbsp; 12月28日消息：随着国家一系列政策的出台和冬季蔬菜上市高峰的到来，让龙港镇居民心有余悸的菜价疯涨已然渐渐远去。然而，在居民长舒一口气的同时，持续低迷的菜价却让劳作了大半年的菜农头疼不已：卖个菜怎就这么难？\r\n<p>\r\n	龙港镇露天蔬菜大都分布在白沙、涂厂等地，以花菜种植为主。销售渠道主要有以下几种：一是蔬菜收购商前来收购，销往外地；二是运到蔬菜批发市场贩卖；三是菜农自己拿到菜场去卖。连日来，笔者走访了全镇各地，对这些销售渠道一一作了了解。\r\n</p>\r\n<!--advertisement code begin--><!--advertisement code end-->\r\n<p>\r\n	近日，在白沙蔬菜种植基地，两三辆货车正在收购花菜。这些货车每天早上在这里收购，下午运往省内外，再连夜赶回来，第二天继续收购。据一位蔬菜收购商介绍，蔬菜绿色通道开通后，虽然运输成本降低了，但各地批发市场上的蔬菜也明显增多，根本卖不出好价钱。本地特色的花菜能卖1元左右，其它蔬菜如大白菜、菜头的批发价还不到5毛钱，还基本上没人收购。\r\n</p>\r\n<p>\r\n	两天后笔者再次来到这里时，又遇到了这位采购商。他抱怨说，这两天花菜价格又降了，连成本都捞不回来，两趟亏了2000多元。\r\n</p>\r\n<p>\r\n	看到蔬菜收购价这么低，一些菜农纷纷把蔬菜运到批发市场上自己卖。那么龙港镇蔬菜批发市场上又是怎样的情形呢？\r\n</p>\r\n<p>\r\n	据了解，以第一菜场为依托，站前路长期以来形成了午夜蔬菜批发市场。由于蔬菜品种齐全，该镇各个菜场的菜贩子基本上是来这里进货。一些菜农介绍，自己卖能稍微多赚点钱，但通宵在这里卖菜，很可能会影响第二天下田劳作，往往得不偿失。\r\n</p>\r\n<p>\r\n	此外，近段时间一些菜场上的蔬菜销售不景气，也对批发市场造成了不小的影响。在第一菜场，虽然已经快到中午收摊时间，但这个菜摊子还堆满了蔬菜。眼下是盘菜销售的旺季，三大筐的盘菜仍有两筐没卖出去。一些菜贩子表示，近期蔬菜不好卖、卖不出好价格，和超市的特价菜也不无关系。\r\n</p>\r\n<p>\r\n	那么相对于这些中、小、散的农户，龙港镇种植大户们的蔬菜销售情况又如何呢？为此笔者专门走访湖前办事处的蔬菜种植大户。\r\n</p>\r\n<p>\r\n	这些种植大户采取了大棚种植等方式，错开了蔬菜大批上市的高峰，往往都供不应求，有些蔬菜甚至在上市前几个月就已经预定一空。随后，从该镇农业部门了解到，目前的农业政策重点扶植新型农业和规模农业，种植面积50亩以上的大棚蔬菜，可以得到每亩100元的补助。而那些规模较小的农户，基本上只能自力更生。\r\n</p>\r\n<p>\r\n	为了方便菜农卖菜，前段时间，该镇一些部门牵头在新兰村兴建了一个蔬菜批发市场。但由于客源稀少，蔬菜销售情况不好，未能得到菜农的认可。菜农希望有关部门做好硬件设施的同时，也能帮助他们联络客源，拓宽蔬菜的销路。（通讯员 王木记）\r\n</p>', '27', '0', '0', '2023-05-06 23:41:56');
INSERT INTO `xinwentongzhi` VALUES ('21', 'adfasdfasd', 'aaa', '<p style=\"text-align: center;\"><span style=\"font-size: 36pt;\">资讯内容</span></p>', '5', '0', '0', '2023-05-07 01:18:44');
