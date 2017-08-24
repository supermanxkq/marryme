<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<HTML>
<HEAD>
<TITLE>ebooks</TITLE>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/login.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
</HEAD>
<BODY  style="background-image: url('${pageContext.request.contextPath }/img/back.jpeg');">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column" style="margin-top: 200px;">
				<div class="row clearfix">
					<div class="col-md-3 column"></div>
					<div class="col-md-6 column">
					<h1>婚恋交友网</h1>
						<hr />
						<form class="form-horizontal" role="form" action="LoginServlet"
							method="post" onsubmit="return validate();">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="text"
										name="userName" id="userName" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" 
									class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="password" required="required" class="form-control" name="passWord"
										id="passWord" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default">登录</button>
									<a class="btn btn-default" href="regedit.jsp">注册</a>
									<font color="red">${error}</font>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-3 column"></div>
				</div>
			</div>
		</div>
	</div>
</BODY>
</HTML>
