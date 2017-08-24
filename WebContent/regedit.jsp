<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<HTML>
<HEAD>
<TITLE>ebooks</TITLE>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link
	href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/regedit.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/doreg.js" charset="UTF-8"></script>
<script>
	function reloadImage() {
		document.getElementById("imgservlet").src = "RandomServlet?ts="
				+ new Date().getTime();
	}
</script>
</HEAD>
<BODY  style="background-image: url('${pageContext.request.contextPath }/img/re.jpeg');">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column" style="margin-top: 200px;">
				<div class="row clearfix">
					<div class="col-md-2 column"></div>
					<div class="col-md-8 column">
						<h1>用户注册</h1>
						<hr />
						<%
							long regeditToken = System.currentTimeMillis();
							session.setAttribute("sessionRegeditToken", regeditToken);
						%>
						<form class="form-horizontal" role="form" action="RegitServlet"
							method="post" onsubmit="return validateRegeditInfo()">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">昵称</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="text"
										required="required" name="name" id="name" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="text"
										required="required" name="userName" id="userName"
										onblur="checkUser(this)" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="password" required="required" class="form-control"
										name="passWord" id="passWord" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
								<div class="col-sm-10">
									<input type="password" name="confirmPwd" id="confirmPwd"
										class="form-control" required="required"
										onblur="validatePwd()" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="text"
										required="required" name="sex" id="sex" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">年龄</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="number"
										required="required" name="age" id="age" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">手机</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="mobile"
										required="required" name="phone" id="phone" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">微信</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="text"
										required="required" name="weChat" id="weChat" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">地址</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="text"
										required="required" name="address" id="address" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">爱好</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="text"
										required="required" name="hobby" id="hobby" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">教育</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="text"
										required="required" name="edu" id="edu" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">工作</label>
								<div class="col-sm-10">
									<input class="form-control" required="required" type="text"
										required="required" name="job" id="job" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">个人简介</label>
								<div class="col-sm-10">
									<textarea class="form-control" required="required"
										required="required" name="desc" id="desc"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
								<div class="col-sm-10">
									<input type="text" required="required" name="validateCode"
										id="validateCode" class="form-control"
										style="width: 100px; float: left; margin-right: 10px;" /> <img
										src="RandomServlet" id="imgservlet" onclick="reloadImage()"
										title="点击图片刷新验证码" />
								</div>
							</div>
							<input type="hidden" name="regeditToken"
								value="<%=regeditToken%>" />
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success ">注册</button>
									<font class="tip" color="red">${error }</font>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-2 column"></div>
				</div>
			</div>
		</div>
	</div>
</BODY>
</HTML>
