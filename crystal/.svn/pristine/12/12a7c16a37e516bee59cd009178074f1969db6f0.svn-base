<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>授权</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${path}/resources/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<style type="text/css">
	input[type=radio].radio{
		display: none;
	}
	input[type=radio].radio+span{
		position: relative;
	}
	input[type=radio].radio+span:before{
	    content: '';
	    display: inline-block;
	    border: 3px solid white;
	    border-radius: 50%;
	    vertical-align: middle;
	    width: 15px;
	    height: 15px;
	    box-shadow: 0 0 0px 1px #999;
	    background: white;
	    margin-right: 5px;
	}
	input[type=radio].radio+span:hover:before{
		box-shadow: 0 0 1px 1px #999;
	}
	input[type=radio].radio:CHECKED+span:before{
		background: #888;
	}
</style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加权限</title>
</head>
<body>

	<div class="container">
	<div class="row clearfix">
		
		<div class="container-fluid">
    <div class="row-fluid">
        <div class="table-responsive">
        	<form id="form" action="authorize.action" method="post">
        	<input type="hidden" value="${roleId }" name="roleId"/>
            <table class="table table-hover table-bordered" id="table">
                <thead>
                    <tr>
                        <th>页面</th>
                        <th>子权限</th>
                    </tr>
                </thead>
                
	                <c:forEach var="page" items="${tree }">
	                <tbody>
		                <tr>
		                    <td>${page.name }<input type="checkbox" value="${page.id }"name="privilegeId" class="root" onclick="root(this)"<c:if test="${set.contains(page.id) }"> checked="checked"</c:if>/></td>
			                <td ><c:forEach var="privilege" items="${page.children }">
				                	
			                    ${privilege.name }<input type="checkbox"  value="${privilege.id }"name="privilegeId" class="son" onclick="son(this)"<c:if test="${set.contains(privilege.id) }"> checked="checked"</c:if>>
				                
	                		</c:forEach></td>
		                </tr>
               		</tbody>
					</c:forEach>
                
                

            </table>
            <button type="submit" class="btn btn-block btn-lg btn-success">保存</button>
            </form>
            <br />
            <a href="${path }/role/list.action" class="btn btn-warning btn-block btn-large">返回</a>
        </div>
    </div>
</div> 
			
	</div>
</div>


<script src="${path}/resources/assets/js/jquery-3.1.1.min.js"></script>
<script src="${path}/resources/assets/js/bootstrap.min.js"></script>
<script>

function select(rule,object){
	var text =  $(object).html()
    $(object).next('input').val(rule)
    var a = $(object).parent().parent().parent().parent().find('input').val(rule)
   	// $("#rule").val(rule);
    $(object).parent().parent().parent().children("button[class='btn btn-default']").html(text)
    console.info(a)
    console.info(text)
}
function root(own){
	own=$(own);
    var row = $(own).parent().parent();
    if(!own.attr("checked")){
    	$("input:checkbox[value="+own.val()+"]").prop("checked", true).attr("checked", true);
        //row.find("input[type='checkbox']").prop('checked', true);
        //row.find("input[type='checkbox']").attr("checked", true);
        //console.info(!$(own).attr("checked"))
    }else {
        row.find("input.son[type='checkbox']").prop('checked', false)
        .attr("checked", false);
        //console.info(!$(own).attr("checked"))
        $("input:checkbox[value="+own.val()+"]").prop("checked", false).attr("checked", false);
    }
}
function son(own){
	own=$(own);
    var row = $(own).parent().parent();
	var parent=row.find('input.root');
    //console.info(!$(own).attr("checked",true))
    //html.find("input[class='root']").attr("checked", !$(own).attr("checked"));
    if(own.is(':checked')){
        $("input:checkbox[value="+own.val()+"]").prop("checked", true).attr("checked", true);
        parent.prop("checked", true).attr("checked", true);
    }else {
        $("input:checkbox[value="+own.val()+"]").prop("checked", false).attr("checked", false);
    }
}

$('form#form').submit(function(){
	$.ajax({
		url:"authorize.action",
		type:'post',
		dataType:'json',
		traditional:true,
		data:{roleId:${roleId},privilegeId:$(":checkbox[name=privilegeId]:checked").map((i,e)=>e.value).get()},
		success:function(data){
			if(data=='success'){
				alert("修改成功");
				location='${path }/role/list.action';
			}
			else{
				alert("授权失败");
			}
		},
		error:function(){
			alert("授权失败");
		}
	});
	console.log('---------');
	return false;
});
</script>
</body>
</html>