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
	src="${pageContext.request.contextPath }/js/focus.js"></script>
	<script
	src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
</HEAD>
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
					<div class="col-md-12 column">
						<div class="page-header">
							<h1>
								我的关注
							</h1>
						</div>
						<div class="row masonry">
							<c:forEach var="u" items="${users}" varStatus="status">
								<div class="col-md-4 item">
									<div class="thumbnail">
										<img alt="300x200"
											src="${pageContext.request.contextPath }/upload/${u.headPic}" />
										<div class="caption">
											<h3>${u.name}</h3>
											<p>${u.desc }</p>
											<p>
												<a class="btn btn-primary cancelfocus" href="javascript:;" id="cancelfocus" data-id="${u.id }" data-uid="${user.id }">取消关注</a> <a
													class="btn btn-primary" href="DetailServlet?id=${u.id}">详细信息</a>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
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
	$('.masonry').imagesLoaded(function() {
		$('.masonry').masonry({
		itemSelector: '.item'
		});
		});
	</script>
</body>
</HTML>
