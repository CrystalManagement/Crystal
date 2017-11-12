<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>xx编辑页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/WEB-INF/pages/common/rs_css.jsp"%>
<body>
<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
	<form class="form-horizontal" role="form" action="${path }/organization/doEdit.action" method="post">
	<input type="hidden" name="id" value="${entity.id}">
	<div class="form-group">
		<label for="id" class="col-sm-2 control-label">id</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="id" name="id" value="${entity.id}"
				   placeholder="请输入id">
		</div>
	</div>
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">name</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="name" name="name" value="${entity.name}"
				   placeholder="请输入name">
		</div>
	</div>
	<div class="form-group">
		<label for="address" class="col-sm-2 control-label">address</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="address" name="address" value="${entity.address}"
				   placeholder="请输入address">
		</div>
	</div>
	<div class="form-group">
		<label for="createTime" class="col-sm-2 control-label">createTime</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="createTime" name="createTime" value="${entity.createTime}"
				   placeholder="请输入createTime">
		</div>
	</div>
	<div class="form-group">
		<label for="updateTime" class="col-sm-2 control-label">updateTime</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="updateTime" name="updateTime" value="${entity.updateTime}"
				   placeholder="请输入updateTime">
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary">提交</button>
			<a href="${path }/organization/list.action" class="btn btn-default">返回</a>
		</div>
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