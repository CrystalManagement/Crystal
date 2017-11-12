<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>管理员编辑页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/WEB-INF/pages/common/rs_css.jsp"%>
<body>
<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
	<form class="form-horizontal" role="form" action="${path }/staff/doEdit.action" method="post">
	<input type="hidden" name="id" value="${entity.id}">
	<div class="form-group">
		<label for="account" class="col-sm-2 control-label">账号</label>
		<div class="col-sm-8">
			<input type="text" class="form-control" id="account" name="account" value="${entity.account}"
				   placeholder="请输入账号">
		</div>
	</div>
	<c:if test="${entity eq null}">
	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">密码</label>
		<div class="col-sm-8">
			<input type="text" class="form-control" id="password" name="password"
				   placeholder="请输入密码">
		</div>
	</div>
	</c:if>
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">姓名</label>
		<div class="col-sm-8">
			<input type="text" class="form-control" id="name" name="name" value="${entity.name}"
				   placeholder="请输入姓名">
		</div>
	</div>
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">所属机构</label>
		<div class="col-sm-8">
			<select type="text" class="form-control" id="organization" name="organizationId" value="${entity.organizationId}">
				<option value='0'>无</option>
			<c:forEach items="${ allOrganizations}" var="o">
				<option value="${o.id }"<c:if test="${o.id eq entity.organizationId }"> selected="selected"</c:if>>${o.name }</option>
			</c:forEach>
			</select>
		</div>
	</div>
	<div class="row">
		<label for="name" class="col-sm-2 control-label">角色</label>
		<div class="clearfix col-xs-8" style="padding-top: 7px;">
		<c:forEach items="${ allroles}" var="r">
		<label class="col-md-3">
			<input type="checkbox" name="roleId" value="${r.id }"<c:if test="${roles.contains(r) }"> checked="checked"</c:if>>
			<span>${r.name }</span>
		</label>
		</c:forEach>
		</div>
	</div>
		<div class="text-center">
			<button type="submit" class="btn btn-primary">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${path }/staff/list.action" class="btn btn-default">返回</a>
		</div>
	</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/pages/common/rs_js.jsp"%>
	<script type="text/javascript">
		jQuery(function($) {
			
		});
	</script>
</body>
</html>