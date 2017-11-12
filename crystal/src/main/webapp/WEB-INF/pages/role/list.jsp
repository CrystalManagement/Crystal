<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>角色列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/WEB-INF/pages/common/rs_css.jsp"%>
<style type="text/css">
</style>
</head>
<body style="width:98%">
	<div class="row">
		<div class="col-xs-12">
			<div>
				
				<a  href="${path }/role/edit.action" class="btn btn-primary" id="add">新增</a>
				
			</div>
			<div class="table-responsive">
				<table id="mydatatables"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>名称</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/pages/common/rs_js.jsp"%>

	<script type="text/javascript">
	
		jQuery(function($) {
		
			mydatatables = $('#mydatatables').DataTable(
							{
								"lengthMenu" : [[5,10,20],
										[5,10,20]],
								"pageLength" :10,
								"searching" : true,
								"ordering" : true,
								"processing" : true,
								"serverSide" : true,
								"autoWidth" : false,
								"dom": 'tiprl',//自定义显示项
								//跟数组下标一样，第一列从0开始，这里表格初始化时，
								//第四列默认降序
								"order" : [ [ 0, "desc" ] ],
								"ajax" : {
									"url" : "${path }/role/rest/doSearch.action",
									"type" : "POST",
									"data" : function(pdata) {
										
										var data = JSON.stringify(pdata);
										//JSON.parse();
										return data;
									},
									dataType : "json",
									processData : false,
									contentType : 'application/json;charset=UTF-8',
									error:function(data,e){
										alert(data.responseText);
									}
								},
								"columns" : [ 
								{
									"data" : "name"
								},
								{
									"data" : "id",
									"orderable":false
								}],
								"columnDefs" : [
									
										{
											"render" : function(data, type, row) {
												return '<p:permission privilege="com.base.role.controller.RoleController:doEdit"><a href="${path }/role/edit.action?id='+data+'" class="tooltip-success" data-rel="tooltip" title="修改"><span class="green"><i class="icon-edit bigger-120"></i></a></p:permission>&nbsp;&nbsp;'
												+'<p:permission privilege="com.base.role.controller.RoleController:doDelete"><a href="javascript:void(0)" onclick="del(\''+data+'\')" class="tooltip-error" data-rel="tooltip" title="删除"><span class="red"><i class="icon-trash bigger-120"></i></a></p:permission>&nbsp;&nbsp;'
												+'<p:permission privilege="com.base.role.controller.RoleController:doDelete"><a href="${path }/privilege/authorization.action?roleId='+data+'" class="tooltip-error" data-rel="tooltip" title="授权"><span class="orange"><i class="icon-sitemap bigger-120"></i></a></p:permission>';
											},
											"targets" : 1
										} ],

								"language" : {
									"url" : "${path }/resources/assets/language/zh_CN.txt"
								}

							});

		});
		
		function del(id){
			if(window.confirm("你确定要删除？")){
				$.getJSON("${path }/role/rest/doDelete.action?roleid="+id,
							function(data){
						alert(data.msg);
						if(data.status==1){
							mydatatables.ajax.reload();
						}
					});
			}
		}
	</script>
</body>
</html>
