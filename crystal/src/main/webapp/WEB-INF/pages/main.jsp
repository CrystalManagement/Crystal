<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>码神软件后台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/WEB-INF/pages/common/rs_css.jsp"%>
</head>
<body style="overflow: hidden;">
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-desktop"></i> 码神官网后台管理
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">

					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="${path }/resources/assets/avatars/user.jpg"
							alt="${s_user.name }的头像" /> <span class="user-info"> <small>欢迎,</small>
								${s_user.name }
						</span> <i class="icon-caret-down"></i>
					</a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<%-- <li><a href="${path}/user/updatePassword.action"> <i class="icon-user"></i> 修改密码
							</a></li>
							<li class="divider"></li> --%>

							<li><a href="${path}/staff/updatePassword.action"><i
									class="icon-keyboard"></i> 修改密码</a></li>
							<li><a href="${path }/loginout.action"> <i
									class="icon-off"></i> 注销
							</a></li>
						</ul></li>
				</ul>
				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>

						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- #sidebar-shortcuts -->
				<ul class="nav nav-list">
					<!-- 此处添加菜单 -->
					<%-- <li>
						<a href="#" class="dropdown-toggle"> <i class="icon-wrench"></i> <span class="menu-text">系统管理</span><b class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li>
								<a href="${path }/staff/list.action"target="contentframe"><i class="icon-double-angle-right"></i>管理员列表</a>
							</li>
							<li>
								<a href="${path }/menu/show.action"target="contentframe"><i class="icon-double-angle-right"></i>菜单管理</a>
							</li>
							<li>
								<a href="${path }/role/list.action"target="contentframe"><i class="icon-double-angle-right"></i>角色管理</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#" class="dropdown-toggle"> <i class="icon-comments-alt"></i> <span class="menu-text">测试菜单</span><b class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li>
								<a href="${path }/test/list.action?"target="contentframe"><i class="icon-double-angle-right"></i>测试列表</a>
							</li>
						</ul>
					</li> --%>
					<c:forEach items="${ menu}" var="m">
					<li>
						<a target="contentframe"<c:if test="${m.link ne null}"> href="${path }${m.link}"</c:if><c:if test="${m.link eq null}"> class="dropdown-toggle"</c:if>> <i class="${m.icon }"></i> <span class="menu-text">${m.name }</span><b class="arrow icon-angle-<c:choose><c:when test="${m.link eq null }">down</c:when><c:otherwise>right</c:otherwise></c:choose>"></b></a>
						<c:if test="${m.submenu.size() gt 0}">
						<ul class="submenu">
						<c:forEach items="${m.submenu }" var="s">
						<li>
							<a href="${path }${s.link}" target="contentframe"><i class="icon-double-angle-right"></i>${s.name}</a>
						</li>
						</c:forEach>
						</ul>
						</c:if>
					</li>
					</c:forEach>
				</ul>
				<!-- /.nav-list -->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>

				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs"></div>

				<div style="height:calc(100vh - 86px);overflow-y: hidden;">
					<iframe width="100%" id="contentframe" name="contentframe" style='min-height:calc(100vh - 86px)'
								onload="this.contentWindow.document.body.style.padding='15px';" frameborder="0" scrolling="yes"
								src="${path}/staff/list.action"> </iframe>
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->


			<!-- /#ace-settings-container -->
		</div>
		<!-- /.main-container-inner -->

	</div>
	<!-- /.main-container -->
	<%@ include file="/WEB-INF/pages/common/rs_js.jsp"%>
	<script type="text/javascript">
		$(function() {
			$(".nav-list li:first").addClass("active").addClass('open');
			$(".submenu li:first").addClass("active");
			$(".nav-list>li").unbind('click').click(function() {
				//$(".nav-list>li[class='active']").removeAttr("class");
			});
			$(".submenu li").unbind('click').click(function() {
				var parent=$(this).parent();
				$(".submenu li.active").removeClass("active");
				$(".nav-list>li.active").removeClass("active");
				$(this).addClass("active").parents('li').addClass("active").addClass('open');
				$(".nav-list>li.open>.submenu").each(function(){if(parent[0]!=this)$(this).slideUp(200).parent().removeClass('open');})
			});
		});
	</script>
</body>
</html>