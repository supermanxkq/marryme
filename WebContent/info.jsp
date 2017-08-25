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
</HEAD>
<BODY style="background-color: #f1ecec;">
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
						<form class="navbar-form navbar-left">
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
					<div class="col-md-12 column">
						<div class="page-header">
							<h1>个人信息修改</h1>
						</div>
						<div class="row clearfix">
							<div class="col-md-5 column">
								<form id="uploadForm" action="UploadServlet" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="id" value="${u.id}" />
									<div class="form-group">
										<label for="exampleInputEmail1">姓名</label><input type="text"
											name="name" class="form-control" required="required"
											id="exampleInputEmail1" value="${u.name}" />
									</div>
									<div class="form-group">
										<label for="exampleInputtext1">年龄</label><input type="text"
											name="age" class="form-control" required="required"
											id="exampleInputtext1" value="${u.age}" />
									</div>
									<div class="form-group">
										<label for="exampleInputtext1">地址</label><input type="text"
											name="address" class="form-control" required="required"
											id="exampleInputtext1" value="${u.address}" />
									</div>
									<div class="form-group">
										<label for="exampleInputtext1">爱好</label><input type="text"
											name="hobby" class="form-control" required="required"
											id="exampleInputtext1" value="${u.hobby}" />
									</div>
									<div class="form-group">
										<label for="exampleInputtext1">工作</label><input type="text"
											name="job" class="form-control" required="required"
											id="exampleInputtext1" value="${u.job}" />
									</div>
									<div class="form-group">
										<label for="exampleInputtext1">微信</label><input type="text"
											name="weChat" class="form-control" required="required"
											id="exampleInputtext1" value="${u.weChat}" />
									</div>
									<div class="form-group">
										<label for="exampleInputtext1">性别</label><input type="text"
											name="sex" class="form-control" required="required"
											id="exampleInputtext1" value="${u.sex}" />
									</div>
									<div class="form-group">
										<label for="exampleInputtext1">个人简介</label>
										<textarea name="desc" class="form-control" required="required"
											id="exampleInputtext1">${u.desc}</textarea>
									</div>
									<div class="form-group">
										<label for="exampleInputFile">头像</label> <input type="file"
											name="fileName" id="exampleInputFile" required="required" />
										<p class="help-block">
											<img alt="140x140" width="240px" height="240px"
												src="${pageContext.request.contextPath }/upload/${u.headPic}"
												class="img-thumbnail" />
										</p>
									</div>
									<div class="checkbox"></div>
									<button type="submit" class="btn btn-primary">修改</button>
								</form>
							</div>
						</div>
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
	<script type="text/javascript">
		function fun() {
			var formData = new FormData($("#uploadForm"));
			$.ajax({
				url : 'UploadServlet',
				type : 'post',
				data : formData,
				contentType : false,
				processData : false,
				async : false,
				cache : false,
				success : function(res) {
					alert('ok')
				}
			});

		}
	</script>
</BODY>
</HTML>
