-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: yii2_blog
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) DEFAULT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cat_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cats`
--

LOCK TABLES `cats` WRITE;
/*!40000 ALTER TABLE `cats` DISABLE KEYS */;
INSERT INTO `cats` VALUES (1,'技术'),(2,'其他'),(3,'日常');
/*!40000 ALTER TABLE `cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_extends`
--

DROP TABLE IF EXISTS `post_extends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_extends` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `post_id` int(11) DEFAULT NULL COMMENT '文章id',
  `browser` int(11) DEFAULT '0' COMMENT '浏览量',
  `collect` int(11) DEFAULT '0' COMMENT '收藏量',
  `praise` int(11) DEFAULT '0' COMMENT '点赞',
  `comment` int(11) DEFAULT '0' COMMENT '评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='文章扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_extends`
--

LOCK TABLES `post_extends` WRITE;
/*!40000 ALTER TABLE `post_extends` DISABLE KEYS */;
INSERT INTO `post_extends` VALUES (41,15,60,0,0,0),(42,16,28,0,0,0),(43,17,21,0,0,0),(44,18,34,0,0,0),(45,19,11,0,0,0),(46,20,17,0,0,0),(47,21,15,0,0,0),(48,22,3,0,0,0);
/*!40000 ALTER TABLE `post_extends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `label_img` varchar(255) DEFAULT NULL COMMENT '标签图',
  `cat_id` int(11) DEFAULT NULL COMMENT '分类id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `is_valid` tinyint(1) DEFAULT '0' COMMENT '是否有效：0-未发布 1-已发布',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_cat_valid` (`cat_id`,`is_valid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='文章主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (15,'记录博客上线的坎坷历程','2018年3月4日，一个值得今年的日子，我终于也有自己的个人博客了！！那么废话不多说，直接总结下这次','<p>2018年3月4日，一个值得今年的日子，我终于也有自己的个人博客了！！</p><p><br/></p><p>那么废话不多说，直接总结下这次本地环境向服务器环境进行迁移时发生的问题和我的解决方案...</p><p><br/></p><p>先介绍一下本地环境和服务器环境，本地用的使phpstudy（apache+php5.6+mysql），博客开发所用的框架是yii2-advanced。服务器用的环境是ubuntu+Apache2+php5.6+mysql。</p><p><br/></p><p>首先是apache2的根目录的默认地址的更改，在&nbsp;<span style=\"font-family: &quot;times new roman&quot;;\">/etc/apache2/sites-available/000-default.conf&nbsp;<span style=\"font-family: arial, helvetica, sans-serif;\">中将根目录改为项目的根目录（例如我的<span style=\"font-family: &quot;times new roman&quot;;\">../yii2/frontend/web</span>）。但是神奇的是，如果在 &quot;用户界面(<span style=\"font-family: &quot;times new roman&quot;;\">/home/ubuntu</span>)&quot;则设置不会生效，于是我最后将项目放在<span style=\"font-family: &quot;times new roman&quot;;\">/var/www/html</span>下面 设置方才生效。最后我的DocumentRoot的设置是<span style=\"font-family: &quot;times new roman&quot;;\">/var/www/html/yii/frontend/web<span style=\"font-family: arial, helvetica, sans-serif;\">。至于原因猜测与apache2的配置有关（只有放在/var才生效或使用权限的问题等等纯属猜测）。</span></span></span></span></p><p><span style=\"font-family: &quot;times new roman&quot;;\"><span style=\"font-family: arial, helvetica, sans-serif;\"><span style=\"font-family: &quot;times new roman&quot;;\"><span style=\"font-family: arial, helvetica, sans-serif;\"><br/></span></span></span></span></p><p><font face=\"arial, helvetica, sans-serif\">成功设置了根目录后yii报了PDO could not find driver。PDO没有安装驱动，但是在网上搜索很多的解决方案也不能解决问题（总是蜜汁错误，期间重装了好几遍apache和php）。然而最后的解决方案竟然是......</font></p><pre class=\"brush:bash;toolbar:false;\">sudo&nbsp;apt-get&nbsp;install&nbsp;php5.6-mysql</pre><p><font face=\"arial, helvetica, sans-serif\"></font>然后yii2又报了pdo和pdo_mysql overload的warning，原来我在之前尝试时将php.ini中的extension=pdo.so和extension=pdo_mysql.so打开了，在装了上面的扩展后当然会overload，故注释上面在php.ini中引入扩展的两句。问题解决。</p><p><br/></p><p>安装了PDO驱动后，接下来是解决mysql的用户名和密码问题。ubuntu上的mysql的root的密码是登陆Linux系统的密码，简单的尝试后我发现了这个问题。下面是yii2框架上对mysql的配置（<span style=\"font-family: &quot;times new roman&quot;;\">..yii2/common/config/main-local.php</span>）</p><pre class=\"brush:php;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;db&#39;&nbsp;=&gt;&nbsp;[\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;class&#39;&nbsp;=&gt;&nbsp;&#39;yii\\db\\Connection&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;dsn&#39;&nbsp;=&gt;&nbsp;&#39;mysql:host=localhost;dbname=yii2使用的数据库名&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;username&#39;&nbsp;=&gt;&nbsp;&#39;root&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;password&#39;&nbsp;=&gt;&nbsp;&#39;Linux系统密码&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;charset&#39;&nbsp;=&gt;&nbsp;&#39;utf8&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],</pre><p><span style=\"font-family: &quot;times new roman&quot;;\"><span style=\"font-family: arial, helvetica, sans-serif;\"><span style=\"font-family: &quot;times new roman&quot;;\"><span style=\"font-family: arial, helvetica, sans-serif;\"><br/></span></span></span></span></p><p>解决了用户名和密码问题，终于能进入主页，激动够呛......结果点击文章和其他链接都会报404。这个问题的解决是最折磨我的，尝试了无数次，几乎翻遍了网上所有的方法......先说一下我的yii2的一些配置，我的yii2设置了PrettyUrl，整理url的.htaccess放在了<span style=\"font-family: &quot;times new roman&quot;;\">yii2/frontend/web里，下面是.htaccess的配置:</span></p><pre class=\"brush:bash;toolbar:false;\">RewriteEngine&nbsp;on\r\n&nbsp;\r\nRewriteCond&nbsp;%{REQUEST_FILENAME}&nbsp;!-d\r\nRewriteCond&nbsp;%{REQUEST_FILENAME}&nbsp;!-f\r\n\r\nRewriteRule&nbsp;.&nbsp;index.php</pre><p>接下来的配置特别关键，也是折磨我特别长时间的罪魁祸首，需要打开apache2对.htaccess的支持！！！</p><pre class=\"brush:as3;toolbar:false\">sudo&nbsp;a2enmod</pre><p><span style=\"font-family: &quot;times new roman&quot;;\">提示输入模块的名字</span></p><pre class=\"brush:bash;toolbar:false\">rewrite</pre><p>之后在apache2的配置文件/etc/apache2/apache2.conf中将项目的根目录下的AllowOverride打开然后重启apache2</p><pre class=\"brush:xml;toolbar:false\">&lt;Directory&nbsp;/var/www/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;Options&nbsp;Indexes&nbsp;FollowSymlinks\r\n&nbsp;&nbsp;&nbsp;&nbsp;AllowOverride&nbsp;None\r\n&nbsp;&nbsp;&nbsp;&nbsp;Require&nbsp;all&nbsp;granted\r\n&lt;/Directory&gt;</pre><p>至此我才理解apache2.conf中的&lt;Directory path&gt;&lt;/Directory&gt;指的是会用到web的目录，不然的话不设置系统怎么会知道域名后面的/path/file到底指的是哪！问题解决，附上apache2.conf的具体配置:<br/></p><pre class=\"brush:xml;toolbar:false\">&lt;Directory&nbsp;/var/www/html/yii2/frontend/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options&nbsp;Indexes&nbsp;FollowSymlinks\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AllowOverride&nbsp;All\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Allow&nbsp;from&nbsp;All\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Require&nbsp;All&nbsp;granted\r\n&lt;/Directory&gt;\r\n\r\n&lt;Directory&nbsp;/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options&nbsp;FollowSymlinks\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AllowOverride&nbsp;All\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Allow&nbsp;from&nbsp;All\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Require&nbsp;All&nbsp;granted\r\n&lt;/Directory&gt;</pre><p><br/></p><p>之后的问题都不大了，比如注册页面的验证码yii2使用的php_gd，有了pdo驱动的经验直接</p><pre class=\"brush:bash;toolbar:false\">sudo&nbsp;apt-get&nbsp;install&nbsp;php5.6-gd</pre><p><br/></p><p>不过页面还是有一些问题，比如标签图无法上传，不过至此博客的系统迁移已经基本完成。调试过程虽然恶心让我对linux更加了解，也会用了传说中很难用的Vim......趁着思路清晰赶紧写下这篇博客，也是第一篇，以后我也会多总结一些技术上问题和项目的闪光点与新技术。</p><p><br/></p><p>明天是新学期的第一天，这学期会很忙碌呢，课的数量是大一上的两倍，身上还有一个九月结题的大项目至今还一点头绪没有......<br/></p><p><br/></p><p>想起一句话：无关天赋，只在乎是否一往无前。（新学期开始总要中二一点2333...）</p>','',1,563,'Vaskka',1,1520174777,1520174777),(16,'Git笔记（一）','先介绍一下本地环境：Windows10，Git版本2.15.1.windows.2安装Git后先设置','<p>先介绍一下本地环境：Windows10，Git版本2.15.1.windows.2</p><p><br/></p><p>安装Git后先设置一下用户的username和Email<br/></p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;config&nbsp;--global&nbsp;user.name&nbsp;&quot;用户名&quot;\r\n$&nbsp;git&nbsp;config&nbsp;--global&nbsp;user.email&nbsp;&quot;邮箱&quot;</pre><p>由于使用 --global参数，以后所有GIT仓库都会使用这些设置<br/></p><p><br/></p><p>初始化Git（工作目录）</p><p>进入Git</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;mkdir&nbsp;workspace\r\n$&nbsp;cd&nbsp;workspace\r\n$&nbsp;git&nbsp;init</pre><p>确保所有代码都在workspace的目录中</p><p><br/></p><p>添加文件到暂存区</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;add&nbsp;test1.php</pre><p>提交暂存区的文件</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;commit&nbsp;-m&nbsp;&#39;提交备注&#39;</pre><p><br/></p><p>查看当前工作区的状态</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;status</pre><p><br/></p><p>查看工作区文件与版本库文件的异同（查看做的修改）</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;diff</pre><p><br/></p><p>查看git日志<br/></p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;log或者$&nbsp;git&nbsp;log&nbsp;--pretty=oneline</pre><p><br/></p><p>退回工作区版本到版本库最新版本<br/></p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;reset&nbsp;--hard&nbsp;HEAD^</pre><p>一个尖号代表退一个版本，退多个版本可以</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;reset&nbsp;--hard&nbsp;HEAD~2333</pre><p>退回到指定版本号</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;reset&nbsp;--hard&nbsp;想要退到的版本号（前几位即可要唯一）</pre><p><br/></p><p>提取前几次的操作（误关git）</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;reflog</pre><p><br/></p><p>撤销上次修改</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;checkout&nbsp;--&nbsp;test1.php</pre><p></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>如果test1.php没有add到暂存区就将这个文件与版本库最新版进行同步<br/></p></li><li><p>这个文件已经add到了暂存区，就用暂存区的文件代替它</p></li></ol><p><br/></p><p>撤销暂存区文件</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;reset&nbsp;HEAD&nbsp;test1.php</pre><p><br/></p><p>删除文件</p><pre class=\"brush:bash;toolbar:false\">$&nbsp;rm&nbsp;test1.php\r\n$&nbsp;git&nbsp;commit&nbsp;-m&nbsp;&#39;MESSAGE&#39;</pre><p>如果删错可以用版本库文件替换<br/></p><pre class=\"brush:bash;toolbar:false\">$&nbsp;git&nbsp;checkout&nbsp;--&nbsp;test1.php</pre><p><br/></p><p>未完待续.....</p>','',1,563,'Vaskka',1,1520246343,1520246343),(17,'Java笔记（一）','第一堂Java课竟然从swing讲起，够奇葩的.....那么今天整理一下swing中的今天学的控件和','<p>第一堂Java课竟然从swing讲起，够奇葩的.....</p><p><br/></p><p>那么今天整理一下swing中的今天学的控件和部分布局方式。<br/></p><p><br/></p><p>swing中想要创建一个窗口要先new一个JFrame对象，但是这个对象不是放各种组件的地方，而是Container对象承担这个角色。</p><p>不要忘了调用JFrame的setDefaultCloseOperation和setVisible来设置窗口的退出方式和可见性。</p><p><br/></p><p>组件没什么好说的，来说说布局方式。</p><p>先总结FlowLayout，BorderLayout，GridLayout，Box布局</p><p><br/></p><p>FlowLayout</p><pre class=\"brush:java;toolbar:false\">myContainer.setLayout(new&nbsp;FlowLayout());</pre><p>&nbsp;使得内部控件在一行显示且水平居中，一行显示不下跳到下一行。<br/></p><p><br/></p><p>BorderLayout<br/></p><pre class=\"brush:java;toolbar:false\">myContainer.add(btn_1,&nbsp;BorderLayout.EAST);</pre><p>使用东南西北来定位控件<br/></p><p><br/></p><p>GridLayout</p><pre class=\"brush:java;toolbar:false\">GridLayout&nbsp;myGrid&nbsp;=&nbsp;new&nbsp;GridLayout(MainFrame.gridX,&nbsp;MainFrame.gridY);\r\nmyContainer.setLayout(myGrid);\r\n\r\nJLabel&nbsp;contentLabel[][]&nbsp;=&nbsp;new&nbsp;JLabel[MainFrame.gridX][MainFrame.gridY];\r\n\r\nfor&nbsp;(int&nbsp;i&nbsp;=&nbsp;0;&nbsp;i&nbsp;&lt;&nbsp;MainFrame.gridX;&nbsp;i++)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(int&nbsp;j&nbsp;=&nbsp;0;&nbsp;j&nbsp;&lt;&nbsp;MainFrame.gridY;&nbsp;j++)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;contentLabel[i][j]&nbsp;=&nbsp;new&nbsp;JLabel(String.valueOf(i)&nbsp;+&nbsp;String.valueOf(j));\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;myContainer.add(contentLabel[i][j]);\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n}</pre><p>内部的格子会被自适应的调节大小以填充全部父控件。<br/></p><p><br/></p><p>Box布局<br/></p><pre class=\"brush:java;toolbar:false\">//内容水平居中\r\nmyContainer.setLayout(new&nbsp;FlowLayout());\r\n//用来盛装组件的Box（类似div）\r\nBox&nbsp;boxBase,&nbsp;boxLeft,&nbsp;boxRight;\r\n\r\n//大盒子\r\nboxBase&nbsp;=&nbsp;Box.createHorizontalBox();\r\nboxLeft&nbsp;=&nbsp;Box.createVerticalBox();\r\nboxRight&nbsp;&nbsp;=&nbsp;Box.createVerticalBox();\r\n\r\nlabel_1.setText(&quot;Name:&quot;);\r\nlabel_2.setText(&quot;Password:&quot;);\r\n\r\nboxLeft.add(label_1);\r\n//充当间距padding\r\nboxLeft.add(Box.createVerticalStrut(8));\r\nboxLeft.add(label_2);\r\n\r\nboxRight.add(name);\r\n//充当间距padding\r\nboxRight.add(Box.createVerticalStrut(8));\r\nboxRight.add(psw);\r\n\r\nboxBase.add(boxLeft);\r\nboxBase.add(boxRight);\r\nmyContainer.add(boxBase);</pre><p>个人认为比较友好的布局方式，至少和熟悉的div+css布局很相似（swing不支持布局业务逻辑分离......不能用css真的难受......）<br/></p><p>使用Box的静态方法创建水平或垂直居中的Box，使用createVerticalStrut(int height)创建空白填充高度，使用createHorizontaStrut(int height)创建空白填充宽度实现类似margin的模式。</p><p><br/></p>','',1,563,'Vaskka',1,1520351766,1520351766),(18,'Git笔记（二）','远程仓库与分支管理想要让分布式的版本管理系统起作用我们需要与一台Git服务器协作。首先是创建属于自己','<p>远程仓库与分支管理</p><p><br/></p><p>想要让分布式的版本管理系统起作用我们需要与一台Git服务器协作。首先是创建属于自己的idkey。<br/></p><p>到<span style=\"font-family: &quot;times new roman&quot;;\">~/.ssh</span>看是否有公钥和密钥文件。如果没有创建一个</p><pre class=\"brush:bash;toolbar:false\">ssh-keygen&nbsp;-t&nbsp;rsa&nbsp;&quot;15145051056@163.com&quot;</pre><p>登陆github填写ssh公钥，在本地将本地与github远程仓库进行关联。</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;remote&nbsp;add&nbsp;origin&nbsp;git@github.com:Vaskka/RepName.git</pre><p>origin是默认的</p><p>远程仓库名。需要注意的是，生成的公钥与私钥要放在 <span style=\"font-family: &quot;times new roman&quot;;\">~/.ssh</span> 下面，不然不会生效（git找不到）。<br/></p><p>向远程仓库推代码<br/></p><pre class=\"brush:bash;toolbar:false\">git&nbsp;push&nbsp;origin&nbsp;BranchName</pre><p>origin与上面指定的仓库名一致。（可以不叫origin但要一致）<br/></p><p><br/></p><p>从远程仓库克隆</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;clone&nbsp;git@github.com:Vaskka/RepName.git</pre><p>（git也可以使用https协议）<br/></p><p><br/></p><p>创建分支<br/></p><pre class=\"brush:bash;toolbar:false\">git&nbsp;checkout&nbsp;-b&nbsp;dev</pre><p>创建dev分支并切换到dev分支上</p><p>等同于<br/></p><pre class=\"brush:bash;toolbar:false\">git&nbsp;branch&nbsp;dev\r\ngit&nbsp;checkout</pre><p><br/></p><p>查看分支<br/></p><pre class=\"brush:bash;toolbar:false\">git&nbsp;branch</pre><p>当前分支会在前面出现”*“</p><p><br/></p><p>将当前分支（dev）合并到master上</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;merge&nbsp;dev</pre><p><br/></p><p>合并后删除dev分支</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;branch&nbsp;-d&nbsp;dev</pre><p>遇到冲突</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;status</pre><p>查看冲突情况，解决冲突后再提交</p><p>查看分支合并图</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;log&nbsp;--graph</pre><p><br/></p><p>想要合并删除的时候不删除分支的信息（Fast forward）</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;merge&nbsp;--no-ff&nbsp;-m&nbsp;&quot;no-fash-forward-merge&quot;&nbsp;dev</pre><p><br/></p><p>使用git的分支的时候一般master用来推出新版本，dev分支用来合并新功能后向master推送新版本，项目组成员在dev分支下再开分支去做各自的工作。</p><p><br/></p><p>加入正在开发新功能时，被临时调去修补bug，可以将现有分支的内容保存起来</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;stash</pre><p>结束临时工作继续回到开发中时可以恢复储存但不删除stash</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;stash&nbsp;apply</pre><p>恢复并删除stash</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;stash&nbsp;pop</pre><p><br/></p><p>指定本地的dev与远程的origin仓库的dev分支建立链接以能够pull到dev分支的文件</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;branch&nbsp;--set-upstream&nbsp;dev&nbsp;origin/dev</pre><p><br/></p><p>为commit创建tag（简化commit版本号）</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;tag&nbsp;TagName</pre><p>为指定的commit号创建标签</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;tag&nbsp;TagName&nbsp;3ac84g2</pre><p>删除tag<br/></p><pre class=\"brush:bash;toolbar:false\">git&nbsp;tag&nbsp;-d&nbsp;TagName</pre><p><br/></p><p>推送tag到远程</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;push&nbsp;origin&nbsp;TagName</pre><p>一次性推送剩余所有tag</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;push&nbsp;origin&nbsp;--tags</pre><p><br/></p><p>想要删除远程标签，先在本地删除</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;tag&nbsp;-d&nbsp;TagName</pre><p>在推送到远程<br/></p><pre class=\"brush:bash;toolbar:false\">git&nbsp;push&nbsp;origin&nbsp;:refs/tags/TagName</pre><p><br/></p>','',1,563,'Vaskka',1,1520430236,1520430236),(19,'Git笔记（三）','本以为这个系列完结了，结果今天就遇到个难处理的git问题，顺便吐槽一句，一切操作一旦移动到Linux','<p>本以为这个系列完结了，结果今天就遇到个难处理的git问题，顺便吐槽一句，一切操作一旦移动到Linux平台就会比其他平台上的相同操作复杂100倍......</p><p><br/></p><p>由于这个博客部署在远程的服务器上，所以更新版本就会很麻烦。恰巧最近学习Git，于是很自然就想到用github当作本地远程的媒介实现实现方便的版本更替。</p><p><br/></p><p>Linux安装Git</p><pre class=\"brush:bash;toolbar:false\">sudo&nbsp;apt-get&nbsp;install&nbsp;git</pre><p><br/></p><p>进入博客目录初始化，写上Name&amp;Email，拿到RSA公钥私钥，与远程仓库关联，一切都按这两天学到的进行。然而就在push到远程的时候报了Permission deny(publickey)。相同的操作在Windows是没问题的。</p><p><br/></p><p>上网一顿查解决方案，说是要将生成的密钥添加到系统的ssh-agent中。然而直接添加又会报无法连接到代理的错误。</p><p>最后的解决办法是在bash中完成操作。</p><p><br/></p><p>首先进入bash</p><pre class=\"brush:bash;toolbar:false\">sudo&nbsp;ssh-agent&nbsp;bash</pre><p>添加私钥到ssh-agent</p><pre class=\"brush:bash;toolbar:false\">ssh-add&nbsp;~/.ssh/id_rsa</pre><p>再次尝试链接，没有问题了。</p><pre class=\"brush:bash;toolbar:false\">ssh&nbsp;-T&nbsp;git@github.com</pre><p><br/></p><p>之后的git操作都要在agent的bash进行，如果退出也要再次添加一遍私钥。具体原因猜测和一些你懂得的原因有关，不然怎么要用到agent呢......</p><p><br/></p><p>补充一个将本地git版本与远程版本库同步的方法</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;fetch&nbsp;--all</pre><p>将远程版本库全部抓取到本地，不做任何合并操作</p><pre class=\"brush:bash;toolbar:false\">git&nbsp;reset&nbsp;--hard&nbsp;origin/master</pre><p>于是HEAD指针就指向了抓取到远程的master分支了。</p>','',1,563,'Vaskka',1,1520509136,1520509136),(20,'爬虫笔记（一）','又开了个新坑......今天不知道更新点什么，就把寒假学到的东西整理一下吧。先介绍一下环境，选择sc','<p>又开了个新坑......今天不知道更新点什么，就把寒假学到的东西整理一下吧。</p><p><br/></p><p>先介绍一下环境，选择scrapy框架，虚拟环境python3.5，Windows平台。</p><p><br/></p><p>先从一些爬虫的基础知识开始，先说说正则表达式吧。</p><p>整理一些比较常用简单的规则，它们是 . + * [] {} ? \\d ^ $</p><p><br/></p><p>. 代表任意字符</p><p>+ 代表匹配前一个字符一次或多次（贪婪模式）</p><p>*&nbsp; 代表匹配前一个字符0次或多次（贪婪模式）</p><p>?&nbsp; 代表取消前一个表达式的贪婪模式</p><p>[] 代表一些字符的集合</p><p>{} 代表匹配前一个字符的次数</p><p>\\d 代表全部数字 == [0-9]</p><p>\\D代表\\d的补集</p><p>\\w 代表全部字母数字以及下划线 == [A-Za-z0-9_]</p><p>\\W代表\\w的补集</p><p>^ 代表以什么开始 或者在字符集合中取反</p><p>$ 代表以什么结束</p><p>| 代表匹配什么或什么</p><p><br/></p><p>上一些例子</p><p>我想匹配<span style=\"font-family: &quot;times new roman&quot;;\">asdwrfgghnVaskkaadgfrgtbs</span>中的<span style=\"font-family: &quot;times new roman&quot;;\">Vaskka</span></p><p>可以用<span style=\"font-family: &quot;times new roman&quot;;\">^.*(Vaskka).*$</span></p><pre class=\"brush:python;toolbar:false\">import&nbsp;re\r\n\r\ns&nbsp;=&nbsp;&quot;asdwrfgghnVaskkaadgfrgtbs&quot;\r\n\r\nreg&nbsp;=&nbsp;&quot;^.*(Vaskka).*$&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg),&nbsp;s);\r\n\r\nif&nbsp;result:\r\n&nbsp;&nbsp;&nbsp;&nbsp;print&nbsp;(result)</pre><p>&nbsp; 输出：</p><pre class=\"brush:python;toolbar:false\">[&#39;Vaskka&#39;]</pre><p><br/></p><p>贪婪与非贪婪</p><p>我想匹配<span style=\"font-family: &quot;times new roman&quot;;\">asdwrfgghnVas7342aadg3frgtbs中的7342</span></p><pre class=\"brush:python;toolbar:false\">import&nbsp;re\r\n\r\ns&nbsp;=&nbsp;&quot;asdwrfgghnVas7342aadg3frgtbs&quot;\r\n\r\nreg_without_greey&nbsp;=&nbsp;&quot;^.*?(\\d+).*$&quot;\r\nreg_with_greey&nbsp;=&nbsp;&quot;^.*(\\d+).*$&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_without_greey),&nbsp;s);\r\n\r\nprint&nbsp;(s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;without&nbsp;greey&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_with_greey),&nbsp;s);\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;with&nbsp;greey&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)</pre><p><span style=\"font-family:times new roman\"></span>输出：</p><pre class=\"brush:bash;toolbar:false\">asdwrfgghnVas7342aadg3frgtbs\r\n&gt;&gt;&gt;&gt;without&nbsp;greey&lt;&lt;&lt;&lt;\r\n[&#39;7342&#39;]\r\n&gt;&gt;&gt;&gt;with&nbsp;greey&lt;&lt;&lt;&lt;\r\n[&#39;3&#39;]</pre><p>可以看出贪婪模式在匹配时采用能多的原则，于是在.*的模式中匹配到了后面的3之前全部字符。</p><p>非贪婪模式则是在找到下一个符合匹配就停下了，于是在检测到7342的第一个7就结束了.*?的模式。</p><p><br/></p><p>小试牛刀<br/></p><p>想要在下面的字符串中匹配到有用的信息（姓名，学号，学院, 性别，手机号码，邮箱）</p><p>待匹配字符串</p><p><span style=\"font-family: &quot;times new roman&quot;;\">[{&#39;name&#39; : &#39;王小明&#39;, &#39;studentNum&#39; : &#39;300020009999&#39;, &#39;collage&#39; : &#39;伯克利音乐学院&#39;, &#39;sex&#39; : &#39;male&#39;, &#39;phone&#39; : &#39;123456789&#39;, &#39;email&#39; : &#39;example@reg.learn&#39;}]</span></p><p>正则</p><p><span style=\"font-family: &quot;times new roman&quot;;\">^.*?name&#39;.*?&#39;(.*?)&#39;.*?&#39;studentNum&#39;.*?&#39;(\\d+)&#39;.*?&#39;collage&#39;.*?&#39;(.*?)&#39;.*?&#39;sex&#39;.*?&#39;(male|female)&#39;.*?&#39;phone&#39;.*?&#39;(\\d+)&#39;.*?&#39;email&#39;.*?&#39;(.*?@.*?\\\\..*)&#39;.*$</span></p><p>测试代码</p><pre class=\"brush:python;toolbar:false\">import&nbsp;re\r\n\r\ns&nbsp;=&nbsp;&quot;[{&#39;name&#39;&nbsp;:&nbsp;&#39;王小明&#39;,&nbsp;&#39;studentNum&#39;&nbsp;:&nbsp;&#39;300020009999&#39;,&nbsp;&#39;collage&#39;&nbsp;:&nbsp;&#39;伯克利音乐学院&#39;,&nbsp;&#39;sex&#39;&nbsp;:&nbsp;&#39;male&#39;,&nbsp;&#39;phone&#39;&nbsp;:&nbsp;&#39;123456789&#39;,&nbsp;&#39;email&#39;&nbsp;:&nbsp;&#39;example@reg.learn&#39;}]&quot;\r\n\r\nreg&nbsp;=&nbsp;&quot;^.*?name&#39;.*?&#39;(.*?)&#39;.*?&#39;studentNum&#39;.*?&#39;(\\d+)&#39;.*?&#39;collage&#39;.*?&#39;(.*?)&#39;.*?&#39;sex&#39;.*?&#39;(male|female)&#39;.*?&#39;phone&#39;.*?&#39;(\\d+)&#39;.*?&#39;email&#39;.*?&#39;(.*?@.*?\\\\..*)&#39;.*$&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg),&nbsp;s)\r\n\r\nprint&nbsp;(s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;result&lt;&lt;&lt;&lt;&quot;)\r\n	for&nbsp;rst&nbsp;in&nbsp;result:\r\n		print&nbsp;(rst)</pre><p>输出：<br/></p><pre class=\"brush:bash;toolbar:false\">[{&#39;name&#39;&nbsp;:&nbsp;&#39;王小明&#39;,&nbsp;&#39;studentNum&#39;&nbsp;:&nbsp;&#39;300020009999&#39;,&nbsp;&#39;collage&#39;&nbsp;:&nbsp;&#39;伯克利音乐学院&#39;,&nbsp;&#39;sex&#39;&nbsp;:&nbsp;&#39;male&#39;,&nbsp;&#39;phone&#39;&nbsp;:&nbsp;&#39;123456789&#39;,&nbsp;&#39;email&#39;&nbsp;:&nbsp;&#39;example@reg.learn&#39;}]\r\n&gt;&gt;&gt;&gt;result&lt;&lt;&lt;&lt;\r\n(&#39;王小明&#39;,&nbsp;&#39;300020009999&#39;,&nbsp;&#39;伯克利音乐学院&#39;,&nbsp;&#39;male&#39;,&nbsp;&#39;123456789&#39;,&nbsp;&#39;example@reg.learn&#39;)</pre><p><br/></p><p>下面介绍一下非捕获元的匹配模式，也称非捕获匹配</p><p><br/></p><p>介绍这部分之前先介绍一下re.findall(pattern, string, flag=0)的用法</p><p>如果pattern能够匹配到多个字符串，那么如果只含一个分组item就是这个分组，如果含有多个分组item是这些分组组成的元组，如果没有分组item是匹配到的字符串，然后再将这些item组成列表返回。</p><p>如果pattern不能匹配string，那么返回空列表</p><p><br/></p><p>?: pattern 清除分组</p><p>比如想匹配</p><p><em><span style=\"font-family: &quot;times new roman&quot;;\">Hello! Java核心技术上与Java核心技术下是我们这学期要学的Java教材</span></em></p><p>里面的</p><p><em>Java核心技术上 Java核心技术下</em> <em>Java教材</em></p><p><br/></p><p>第一种方案是</p><pre class=\"brush:python;toolbar:false\">import&nbsp;re\r\n\r\ns&nbsp;=&nbsp;&quot;Hello!&nbsp;Java核心技术上与Java核心技术下是我们这学期要学的Java教材&quot;\r\n\r\nreg&nbsp;=&nbsp;&quot;^.*?(Java核心技术上).*?(Java核心技术下).*?(Java教材).*$&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg),&nbsp;s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;result&lt;&lt;&lt;&lt;&quot;)\r\n	for&nbsp;rst&nbsp;in&nbsp;result:\r\n		print&nbsp;(rst)</pre><p>结果：</p><pre class=\"brush:bash;toolbar:false\">&gt;&gt;&gt;&gt;result&lt;&lt;&lt;&lt;\r\n(&#39;Java核心技术上&#39;,&nbsp;&#39;Java核心技术下&#39;,&nbsp;&#39;Java教材&#39;)</pre><p><br/></p><p>第二种方案是利用findall的特点与取消分组抓取的模式实现的</p><pre class=\"brush:python;toolbar:false\">import&nbsp;re\r\n\r\ns&nbsp;=&nbsp;&quot;Hello!&nbsp;Java核心技术上与Java核心技术下是我们这学期要学的Java教材&quot;\r\n\r\n#&nbsp;获取匹配\r\nreg_capture&nbsp;=&nbsp;&quot;Java(核心技术上|核心技术下|教材)&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_capture),&nbsp;s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;获取匹配结果&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)\r\n\r\n#&nbsp;非获取匹配\r\nreg_without_capture&nbsp;=&nbsp;&quot;Java(?:核心技术上|核心技术下|教材)&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_without_capture),&nbsp;s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;非获取匹配结果&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)</pre><p>输出：</p><pre class=\"brush:bash;toolbar:false\">&gt;&gt;&gt;&gt;获取匹配结果&lt;&lt;&lt;&lt;\r\n[&#39;核心技术上&#39;,&nbsp;&#39;核心技术下&#39;,&nbsp;&#39;教材&#39;]\r\n&gt;&gt;&gt;&gt;非获取匹配结果&lt;&lt;&lt;&lt;\r\n[&#39;Java核心技术上&#39;,&nbsp;&#39;Java核心技术下&#39;,&nbsp;&#39;Java教材&#39;]</pre><p>可以看出 ?: 取消了 ( ) 的分组模式使得输出了匹配到的整个字符串</p><p><br/></p><p>?= pattern非抓取+正向肯定预查模式</p><pre class=\"brush:python;toolbar:false\">import&nbsp;re\r\n\r\ns&nbsp;=&nbsp;&quot;Hello!&nbsp;Java核心技术上与Java核心技术下是我们这学期要学的Java教材&quot;\r\n\r\n#&nbsp;获取匹配\r\nreg_capture&nbsp;=&nbsp;&quot;Java(核心技术上|核心技术下|教材)&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_capture),&nbsp;s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;获取匹配结果&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)\r\n\r\n#&nbsp;非获取匹配\r\nreg_without_capture&nbsp;=&nbsp;&quot;Java(?=核心技术上|核心技术下|教材)&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_without_capture),&nbsp;s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;非获取匹配结果&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)</pre><p>输出：</p><pre class=\"brush:bash;toolbar:false\">&gt;&gt;&gt;&gt;获取匹配结果&lt;&lt;&lt;&lt;\r\n[&#39;核心技术上&#39;,&nbsp;&#39;核心技术下&#39;,&nbsp;&#39;教材&#39;]\r\n&gt;&gt;&gt;&gt;非获取匹配结果&lt;&lt;&lt;&lt;\r\n[&#39;Java&#39;,&nbsp;&#39;Java&#39;,&nbsp;&#39;Java&#39;]</pre><p>可以看出?= pattern的模式只是查询了括号中的表达式是否匹配，并没有计入到返回的字符串中。</p><p><br/></p><p>?! pattern 非抓取匹配+正向否定预查</p><pre class=\"brush:python;toolbar:false\">import&nbsp;re\r\n\r\ns&nbsp;=&nbsp;&quot;Hello!&nbsp;Java核心技术上与Java核心技术下是我们这学期要学的Java教材&quot;\r\n\r\n#&nbsp;获取匹配\r\nreg_capture&nbsp;=&nbsp;&quot;Java(核心技术上|核心技术下|教材)&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_capture),&nbsp;s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;获取匹配结果&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)\r\n\r\n#&nbsp;非获取匹配\r\nreg_without_capture&nbsp;=&nbsp;&quot;Java(?!核心技术上|核心技术下)&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_without_capture),&nbsp;s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;非获取匹配结果&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)</pre><p>输出：</p><pre class=\"brush:bash;toolbar:false\">&gt;&gt;&gt;&gt;获取匹配结果&lt;&lt;&lt;&lt;\r\n[&#39;核心技术上&#39;,&nbsp;&#39;核心技术下&#39;,&nbsp;&#39;教材&#39;]\r\n&gt;&gt;&gt;&gt;非获取匹配结果&lt;&lt;&lt;&lt;\r\n[&#39;Java&#39;]</pre><p>可以看出?! pattern 模式检查了括号中的模式取反且没有获取。应用例如控制用户输入的字符不能以什么什么开头或结尾。</p><p><br/></p><p>?&lt;= pattern 非获取匹配+反向肯定预查</p><pre class=\"brush:python;toolbar:false\">import&nbsp;re\r\n\r\ns&nbsp;=&nbsp;&quot;Hello!&nbsp;Java核心技术上与Java核心技术下是我们这学期要学的Java教材&quot;\r\n\r\n#&nbsp;获取匹配\r\nreg_capture&nbsp;=&nbsp;&quot;Java(核心技术上|核心技术下|教材)&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_capture),&nbsp;s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;获取匹配结果&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)\r\n\r\n#&nbsp;非获取匹配\r\nreg_without_capture&nbsp;=&nbsp;&quot;(?&lt;=Java)(核心技术上|核心技术下|这学期)&quot;\r\n\r\nresult&nbsp;=&nbsp;re.findall(re.compile(reg_without_capture),&nbsp;s)\r\n\r\nif&nbsp;result:\r\n	print&nbsp;(&quot;&gt;&gt;&gt;&gt;非获取匹配结果&lt;&lt;&lt;&lt;&quot;)\r\n	print&nbsp;(result)</pre><p>?&lt;= pattern 的非获取匹配+反向预查的模式在pattern匹配到之后会去前面检查子模式是否匹配，且不抓取。</p><p><br/></p><p>文章参考：</p><p><a href=\"http://www.xiaomaidong.com/?p=426\" _src=\"http://www.xiaomaidong.com/?p=426\">http://www.xiaomaidong.com/?p=426</a> </p><p><a href=\"http://blog.csdn.net/u013908207/article/details/20472827\" _src=\"http://blog.csdn.net/u013908207/article/details/20472827\">http://blog.csdn.net/u013908207/article/details/20472827</a> </p><p><a href=\"https://www.cnblogs.com/MrFiona/p/5954084.html\" _src=\"https://www.cnblogs.com/MrFiona/p/5954084.html\">https://www.cnblogs.com/MrFiona/p/5954084.html</a> </p><p><br/></p>','',1,563,'Vaskka',1,1520594241,1520594241),(21,'建议关掉谁都可以写的这个功能','碰到机器人，，，，可不是凉了？','<p>碰到机器人，，，，可不是凉了？</p>','',0,564,'zaeyi',1,1520683345,1520683345),(22,'博客安全问题的小更新','应曾叔的建议，修复了博客的一些安全问题。的确，如果一旦有人要搞事，这小服务器的抵抗力怕是分秒都撑不住','<p>应曾叔的建议，修复了博客的一些安全问题。</p><p><br/></p><p>的确，如果一旦有人要搞事，这小服务器的抵抗力怕是分秒都撑不住......毕竟服务器的开销对经济尚未独立的我来说还是蛮大的（惭愧）</p><p><br/></p><p>简单介绍一下过程，在配置中添加管理员权限，利用yii2框架提供的接口验证用户是否有管理员权限，以此来实现文章创建的权限限制。</p><p><br/></p><p>尽管如此，这个博客仍然存在许多bug。比如到现在还是不能上传标签图，博客该有的后台系统还是没有，想在网站上做一些实用的小工具到目前还是一个没有......有些力不从心，毕竟时间如此紧迫，要学的东西如此多，自己会的又如此的少。”计划赶不上变化“这句话果然在任何时候都是对的。</p><p><br/></p><p><br/></p><p>不过生活总要继续不是么23333...既然赶不上变化就随机应变嘛，毕竟光着急也没有用，事情总要一件一件的做，突然想起了高考时一直激励我的一句话“尽人事而听天命”，没想到一年不到又用上了2333......////&gt;\\\\\\</p><p><br/></p><p>扯的有点远，关于网站安全这块说起实在惭愧，我还是学院ISDC的一员，结果自己的服务器目前跟纸糊的没啥太大差别。除了一些防范措施以外，平时也要做好容灾，不管质量咋样毕竟手打的文章不容易//////</p><p><br/></p><p>等手头要紧的项目结束后我一定好好建设一下这里，至少做到不辱ISDC的名声。</p><p><br/></p><p><br/></p>','',3,563,'Vaskka',1,1520696319,1520696319);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_post_tags`
--

DROP TABLE IF EXISTS `relation_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `post_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `tag_id` int(11) DEFAULT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='文章和标签关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_post_tags`
--

LOCK TABLES `relation_post_tags` WRITE;
/*!40000 ALTER TABLE `relation_post_tags` DISABLE KEYS */;
INSERT INTO `relation_post_tags` VALUES (16,15,14),(17,15,15),(18,15,16),(19,15,17),(20,16,18),(21,17,19),(22,17,20),(23,18,18),(25,19,14),(24,19,18),(26,20,21),(27,20,22),(28,22,23);
/*!40000 ALTER TABLE `relation_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tag_name` varchar(255) DEFAULT NULL COMMENT '标签名称',
  `post_num` int(11) DEFAULT '0' COMMENT '关联文章数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_name` (`tag_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (14,'Linux',2),(15,'Apache2环境配置',1),(16,'php环境配置',1),(17,'web',1),(18,'Git',3),(19,'Java',1),(20,'swing',1),(21,'Python',1),(22,'正则表达式',1),(23,'日常',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) DEFAULT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `vip_lv` int(11) DEFAULT '0' COMMENT 'vip等级',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=566 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (563,'Vaskka','pE0wOIdYg68jS49mcLxaODQATJfoqRj9','$2y$13$V6yjERkvN5tJITuoC3pu3Oneb0GVi3nqieC/7XDJB5ZPQhAiyV97S',NULL,NULL,'15145051056@163.com',10,10,NULL,0,1520168027,1520168027),(564,'zaeyi','1nJOhVnzOdccV0PC4aNT3u6noLWhehRo','$2y$13$TPN6lmq78Gi4N66Noc8oieqelYIgzLSSpdtxYkZDcgURfS5P7aaqy',NULL,NULL,'2392796474@qq.com',10,10,NULL,0,1520683281,1520683281),(565,'apedge','APuUkkSf0JVlx-3wYwp_SbMXbiQyVzPv','$2y$13$6IgLbyclwaDUNe1/9ZHCluA3f2/9uhQTfyykg2Z8c4dhyUFpEVfha',NULL,NULL,'1139851358@qq.com',10,10,NULL,0,1520694388,1520694388);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-10 23:50:02
