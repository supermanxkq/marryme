# marryme
# 婚恋交友网站

**项目来源**
某大学毕业设计


**功能**
1. 登录
2. 注册
3. 关注
4. 粉丝
5. 个人信息




**环境**
1. JDK1.8
2. Tomcat8.0
3. MySQL5.x
4. Eclipse
5. Web Project Settings  /
6. servlet+jsp


**项目部署**
1. 创建数据库marry,执行SQL文件夹下的SQL语句创建表。
2. 数据库连接默认的用户名和密码为root
3. 将代码倒入到eclipse，java build path 配置JDK并添加Tomcat的server runtime的包
4. 使用eclipse将项目部署到tomcat下面
5. 启动项目，访问http://localhost:8080
6. 用户名：xukaiqiang 密码：888888


**备注**
 如果部署到windows环境：UploadServlet中的 File file = new File(path + "\\" + fileName);为两个反斜
 杠，如果是Linux系统，则为File file = new File(path + "/" + fileName);
如果直接将war包部署到tomcat上面，还需要在tomcat/conf/server.xml中配置

<Context path="bbs" docBase="bbs" debug="0" reloadable="true"/>  

　<Context>代表了运行在<Host>上的单个Web应用，一个<Host>可以有多个<Context>元素，每个Web应用必须有唯一的URL路径，这个URL路径在<Context>中的属性path中设定。 <Context path="bbs" docBase="bbs" debug="0" reloadable="true"/>  

<Context>元素的属性: 
　一：　path:指定访问该Web应用的URL入口。 
　二：　docBase:指定Web应用的文件路径，可以给定绝对路径，也可以给定相对于<Host>的appBase属性的相对路径，如果Web应用采用开放目录结构，则指定Web应用的根目录，如果Web应用是个war文件，则指定war文件的路径。 
　三：　reloadable:如果这个属性设为true，tomcat服务器在运行状态下会监视在WEB-INF/classes和WEB-INF/lib目录下class文件的改动，如果监测到有class文件被更新的，服务器会自动重新加载Web应用。 

　　　在开发阶段将reloadable属性设为true，有助于调试servlet和其它的class文件，但这样用加重服务器运行负荷，建议在Web应用的发存阶段将reloadable设为false。

