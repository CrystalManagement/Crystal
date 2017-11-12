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
	<form class="form-horizontal" role="form" action="${path }/member/doEdit.action" method="post">
	<input type="hidden" name="memberid" value="${entity.memberid}">
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">姓名</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="name" name="name" value="${entity.name}"
				   placeholder="请输入姓名">
		</div>
	</div>
	<div class="form-group">
		<label for="studentid" class="col-sm-2 control-label">学号</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="studentid" name="studentid" value="${entity.studentid}"
				   placeholder="请输入学号">
		</div>
	</div>
	<div class="form-group">
		<label for="hometown" class="col-sm-2 control-label">家庭住址</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="hometown" name="hometown" value="${entity.hometown}"
				   placeholder="请输入家庭住址">
		</div>
	</div>
	<div class="form-group">
		<label for="major" class="col-sm-2 control-label">专业</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="major" name="major" value="${entity.major}"
				   placeholder="请输入专业">
		</div>
	</div>
	<div class="form-group">
		<label for="grade" class="col-sm-2 control-label">年级</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="grade" name="grade" value="${entity.grade}"
				   placeholder="请输入年级">
		</div>
	</div>
	<div class="form-group">
		<label for="telephone" class="col-sm-2 control-label">电话</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="telephone" name="telephone" value="${entity.telephone}"
				   placeholder="请输入电话">
		</div>
	</div>
	<div class="form-group">
		<label for="position" class="col-sm-2 control-label">现居</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="position" name="position" value="${entity.position}"
				   placeholder="请输入现居">
		</div>
	</div>
	<%-- <div class="form-group">
		<label for="birthday" class="col-sm-2 control-label">生日</label>
		<div class="col-sm-10">
			<input type="date" class="form-control" id="birthday" name="birthday" value="${entity.birthday}"
				   placeholder="请输入生日">
		</div>
	</div> --%>
	<div class="form-group">
		<label for="department" class="col-sm-2 control-label">部门</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="department" name="department" value="${entity.department}"
				   placeholder="请输入部门">
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary">提交</button>
			<a href="${path }/member/list.action" class="btn btn-default">返回</a>
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