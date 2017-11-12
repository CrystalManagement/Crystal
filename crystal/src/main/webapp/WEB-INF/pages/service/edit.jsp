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
	<form class="form-horizontal" role="form" action="${path }/service/doEdit.action" method="post">
	<input type="hidden" name="id" value="${entity.id}">
	<div class="form-group">
		<label for="id" class="col-sm-2 control-label">id</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="id" name="id" value="${entity.id}"
				   placeholder="请输入id">
		</div>
	</div>
	<div class="form-group">
		<label for="orderId" class="col-sm-2 control-label">orderId</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="orderId" name="orderId" value="${entity.orderId}"
				   placeholder="请输入orderId">
		</div>
	</div>
	<div class="form-group">
		<label for="consultantId" class="col-sm-2 control-label">consultantId</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="consultantId" name="consultantId" value="${entity.consultantId}"
				   placeholder="请输入consultantId">
		</div>
	</div>
	<div class="form-group">
		<label for="date" class="col-sm-2 control-label">date</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="date" name="date" value="${entity.date}"
				   placeholder="请输入date">
		</div>
	</div>
	<div class="form-group">
		<label for="period" class="col-sm-2 control-label">period</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="period" name="period" value="${entity.period}"
				   placeholder="请输入period">
		</div>
	</div>
	<div class="form-group">
		<label for="consultType" class="col-sm-2 control-label">consultType</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="consultType" name="consultType" value="${entity.consultType}"
				   placeholder="请输入consultType">
		</div>
	</div>
	<div class="form-group">
		<label for="price" class="col-sm-2 control-label">price</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="price" name="price" value="${entity.price}"
				   placeholder="请输入price">
		</div>
	</div>
	<div class="form-group">
		<label for="customerTel" class="col-sm-2 control-label">customerTel</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="customerTel" name="customerTel" value="${entity.customerTel}"
				   placeholder="请输入customerTel">
		</div>
	</div>
	<div class="form-group">
		<label for="customerName" class="col-sm-2 control-label">customerName</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="customerName" name="customerName" value="${entity.customerName}"
				   placeholder="请输入customerName">
		</div>
	</div>
	<div class="form-group">
		<label for="problem" class="col-sm-2 control-label">problem</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="problem" name="problem" value="${entity.problem}"
				   placeholder="请输入problem">
		</div>
	</div>
	<div class="form-group">
		<label for="customerGender" class="col-sm-2 control-label">customerGender</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="customerGender" name="customerGender" value="${entity.customerGender}"
				   placeholder="请输入customerGender">
		</div>
	</div>
	<div class="form-group">
		<label for="consultantName" class="col-sm-2 control-label">consultantName</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="consultantName" name="consultantName" value="${entity.consultantName}"
				   placeholder="请输入consultantName">
		</div>
	</div>
	<div class="form-group">
		<label for="place" class="col-sm-2 control-label">place</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="place" name="place" value="${entity.place}"
				   placeholder="请输入place">
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
			<a href="${path }/service/list.action" class="btn btn-default">返回</a>
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