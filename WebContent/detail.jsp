<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default navbar-inverse" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="IndexServlet">婚恋交友</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="IndexServlet">首页</a></li>
						<li><a href="FocusServlet?id=${user.id}">关注</a></li>
						<li><a href="FansServlet?id=${user.id }">粉丝</a></li>
					</ul>
					<form class="navbar-form navbar-left" method="post"
						action="SearchServlet" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="userName"
								placeholder="输入名字..." />
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${!empty user.userName}">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">${user.userName} <strong
										class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href="FindInfoServlet?id=${user.id}">个人信息</a></li>
										<li class="divider"></li>
										<li><a href="LogoutServlet">退出</a></li>
									</ul></li>
							</c:when>
							<c:otherwise>
								<li><a href="login.jsp">登录</a>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				</nav>
				<div class="row clearfix">
					<div class="col-md-12 column" >
						<div class="page-header">
							<h1>详细信息</h1>
						</div>
						<img alt="140x140" width="240px" height="240px"
							src="${pageContext.request.contextPath }/upload/${u.headPic}"
							class="img-thumbnail" />
						<h2>${u.name }</h2>
						<table class="table table-hover" style="text-align: left;">
							<tbody>
								<tr>
									<td><span class="label label-warning">年龄</span></td>
									<td>${u.age}</td>
								</tr>
								<tr class="success">
									<td><span class="label label-info">性别</span></td>
									<td>${u.sex}</td>
								</tr>
								<tr class="error">
									<td><span class="label label-default">爱好</span></td>
									<td>${u.hobby}</td>
								</tr>
								<tr class="warning">
									<td><span class="label label-warning">工作</span></td>
									<td>${u.job}</td>
								</tr>
								<tr class="info">
									<td><span class="label label-success">手机</span></td>
									<td>${u.phone}</td>
								</tr>
								<tr class="error">
									<td><span class="label label-info">微信</span></td>
									<td>${u.weChat}</td>
								</tr>
								<tr class="error">
									<td><span class="label label-default">教育</span></td>
									<td>${u.edu}</td>
								</tr>
							</tbody>
						</table>
						
						<blockquote style="text-align: left;">
							<p>${u.desc}</p>
							<small>${u.name }</small>
						</blockquote>
					</div>
				</div>
			<hr />
				<div class="row clearfix">
					<div class="col-md-12 column">
						<p>在天愿做比翼鸟，在地愿为连理枝。</p>
						<p>&copy;版权所有</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>