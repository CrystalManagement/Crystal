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
	<form class="form-horizontal" role="form" action="${path }/scroe/doEdit.action" method="post">
	<input type="hidden" name="id" value="${entity.id}">
	<div class="form-group">
		<label for="scoreid" class="col-sm-2 control-label">scoreid</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="scoreid" name="scoreid" value="${entity.scoreid}"
				   placeholder="请输入scoreid">
		</div>
	</div>
	<div class="form-group">
		<label for="scorename" class="col-sm-2 control-label">scorename</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="scorename" name="scorename" value="${entity.scorename}"
				   placeholder="请输入scorename">
		</div>
	</div>
	<div class="form-group">
		<label for="pages" class="col-sm-2 control-label">pages</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="pages" name="pages" value="${entity.pages}"
				   placeholder="请输入pages">
		</div>
	</div>
	<div class="form-group">
		<label for="purchasedate" class="col-sm-2 control-label">purchasedate</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="purchasedate" name="purchasedate" value="${entity.purchasedate}"
				   placeholder="请输入purchasedate">
		</div>
	</div>
	<div class="form-group">
		<label for="state" class="col-sm-2 control-label">state</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="state" name="state" value="${entity.state}"
				   placeholder="请输入state">
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary">提交</button>
			<a href="${path }/scroe/list.action" class="btn btn-default">返回</a>
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