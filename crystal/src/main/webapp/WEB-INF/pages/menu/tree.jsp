<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>菜单管理</title>
	<link href="${path }/resources/treeCss/tree.css" rel="stylesheet" />
	<link href="${path}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${path}/resources/assets/css/font-awesome.min.css">
	<style type="text/css">
	.tree li>button{
		position: relative;
		margin-left: 20px;
	}
	.tree li>button:focus{
		outline:none;
	}
	.tree li>button:before{
		content:'';
		position: absolute;
		left: -21px;
		top:50%;
		width:20px;
		height:1px;
		background:#999;
	}
	
	.modal-header .close{
		font-size:30px;
	}
	label.select-icon{
		height:20px;
	}
	label input[type=radio]:checked+span i.icon{
		font-size:20px;
		color:#4CAF50;
	}
	</style>
</head>

<body>
<div class="tree">
 <ul>
 <c:forEach var="menu" items="${menuTree }">
  <li>
   <span class="btn btn-large btn-lg"><%-- <i class="${cenu.icon }"></i> --%> ${menu.name }</span><button type='button' class='add btn btn-xs btn-info' onclick="addFirstLayer()">添加同级菜单</button><button type='button' class='btn btn-xs btn-info' onclick="addSecondLayer(this,${menu.id})">添加下级菜单</button><button type='button' class='btn btn-xs btn-warning' onclick="showDetail(this,${menu.id})">更新菜单</button><button type='button' class='btn btn-xs btn-danger' onclick="delMenu(this,'${menu.id}')">删除</button>
   <ul>
   <c:forEach var="child" items="${menu.submenu }">
    <li>
      <span class='btn btn-large'><%-- <i class="${child.icon }"></i> --%> ${child.name }</span><button type='button' class='add btn btn-xs btn-info' onclick="addSecondLayer(this,${menu.id})">添加同级菜单</button><button type='button' class='btn btn-xs btn-warning' onclick="showDetail(this,${child.id})">更新菜单</button><button type='button' class='btn btn-xs btn-danger' onclick="delMenu(this,'${child.id}')">删除</button>
    	
    </li>
    </c:forEach>
   </ul>
  </li>
  </c:forEach>
 </ul>
</div>
<div class="modal fade" id="modal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close bigger-120" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
				<div class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-md-2">名称</label>
						<div class="col-md-9">
							<input id='name' class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">链接到</label>
						<div class="col-md-9">
							<select id="link" class="form-control">
								<option value="0" style="display: none;">无</option>
								<c:forEach var="p" items="${privilegeList }">
							    <option value="${p.id }">${p.name }</option>
							    </c:forEach>
							</select>
						</div>
					</div>
					<div id="icons" class="clearfix" style="margin:5px;max-height:90px;overflow-y:auto; ">
					<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-glass"><span><i class="icon icon-glass"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-music"><span><i class="icon icon-music"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-search"><span><i class="icon icon-search"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-envelope-alt"><span><i class="icon icon-envelope-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-heart"><span><i class="icon icon-heart"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-star"><span><i class="icon icon-star"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-star-empty"><span><i class="icon icon-star-empty"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-user"><span><i class="icon icon-user"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-film"><span><i class="icon icon-film"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-th-large"><span><i class="icon icon-th-large"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-th"><span><i class="icon icon-th"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-th-list"><span><i class="icon icon-th-list"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-ok"><span><i class="icon icon-ok"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-remove"><span><i class="icon icon-remove"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-zoom-in"><span><i class="icon icon-zoom-in"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-zoom-out"><span><i class="icon icon-zoom-out"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-power-off"><span><i class="icon icon-power-off"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-signal"><span><i class="icon icon-signal"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-gear"><span><i class="icon icon-gear"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-trash"><span><i class="icon icon-trash"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-home"><span><i class="icon icon-home"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-file-alt"><span><i class="icon icon-file-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-time"><span><i class="icon icon-time"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-road"><span><i class="icon icon-road"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-download-alt"><span><i class="icon icon-download-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-download"><span><i class="icon icon-download"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-upload"><span><i class="icon icon-upload"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-inbox"><span><i class="icon icon-inbox"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-play-circle"><span><i class="icon icon-play-circle"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-rotate-right"><span><i class="icon icon-rotate-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-refresh"><span><i class="icon icon-refresh"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-list-alt"><span><i class="icon icon-list-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-lock"><span><i class="icon icon-lock"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-flag"><span><i class="icon icon-flag"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-headphones"><span><i class="icon icon-headphones"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-volume-off"><span><i class="icon icon-volume-off"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-volume-down"><span><i class="icon icon-volume-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-volume-up"><span><i class="icon icon-volume-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-qrcode"><span><i class="icon icon-qrcode"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-barcode"><span><i class="icon icon-barcode"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-tag"><span><i class="icon icon-tag"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-tags"><span><i class="icon icon-tags"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-book"><span><i class="icon icon-book"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bookmark"><span><i class="icon icon-bookmark"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-print"><span><i class="icon icon-print"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-camera"><span><i class="icon icon-camera"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-font"><span><i class="icon icon-font"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bold"><span><i class="icon icon-bold"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-italic"><span><i class="icon icon-italic"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-text-height"><span><i class="icon icon-text-height"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-text-width"><span><i class="icon icon-text-width"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-align-left"><span><i class="icon icon-align-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-align-center"><span><i class="icon icon-align-center"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-align-right"><span><i class="icon icon-align-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-align-justify"><span><i class="icon icon-align-justify"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-list"><span><i class="icon icon-list"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-indent-left"><span><i class="icon icon-indent-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-indent-right"><span><i class="icon icon-indent-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-facetime-video"><span><i class="icon icon-facetime-video"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-picture"><span><i class="icon icon-picture"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-pencil"><span><i class="icon icon-pencil"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-map-marker"><span><i class="icon icon-map-marker"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-adjust"><span><i class="icon icon-adjust"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-tint"><span><i class="icon icon-tint"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-edit"><span><i class="icon icon-edit"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-share"><span><i class="icon icon-share"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-check"><span><i class="icon icon-check"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-move"><span><i class="icon icon-move"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-step-backward"><span><i class="icon icon-step-backward"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-fast-backward"><span><i class="icon icon-fast-backward"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-backward"><span><i class="icon icon-backward"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-play"><span><i class="icon icon-play"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-pause"><span><i class="icon icon-pause"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-stop"><span><i class="icon icon-stop"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-forward"><span><i class="icon icon-forward"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-fast-forward"><span><i class="icon icon-fast-forward"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-step-forward"><span><i class="icon icon-step-forward"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-eject"><span><i class="icon icon-eject"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-chevron-left"><span><i class="icon icon-chevron-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-chevron-right"><span><i class="icon icon-chevron-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-plus-sign"><span><i class="icon icon-plus-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-minus-sign"><span><i class="icon icon-minus-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-remove-sign"><span><i class="icon icon-remove-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-ok-sign"><span><i class="icon icon-ok-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-question-sign"><span><i class="icon icon-question-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-info-sign"><span><i class="icon icon-info-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-screenshot"><span><i class="icon icon-screenshot"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-remove-circle"><span><i class="icon icon-remove-circle"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-ok-circle"><span><i class="icon icon-ok-circle"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-ban-circle"><span><i class="icon icon-ban-circle"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-arrow-left"><span><i class="icon icon-arrow-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-arrow-right"><span><i class="icon icon-arrow-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-arrow-up"><span><i class="icon icon-arrow-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-arrow-down"><span><i class="icon icon-arrow-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-mail-forward"><span><i class="icon icon-mail-forward"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-resize-full"><span><i class="icon icon-resize-full"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-resize-small"><span><i class="icon icon-resize-small"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-plus"><span><i class="icon icon-plus"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-minus"><span><i class="icon icon-minus"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-asterisk"><span><i class="icon icon-asterisk"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-exclamation-sign"><span><i class="icon icon-exclamation-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-gift"><span><i class="icon icon-gift"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-leaf"><span><i class="icon icon-leaf"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-fire"><span><i class="icon icon-fire"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-eye-open"><span><i class="icon icon-eye-open"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-eye-close"><span><i class="icon icon-eye-close"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-warning-sign"><span><i class="icon icon-warning-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-plane"><span><i class="icon icon-plane"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-calendar"><span><i class="icon icon-calendar"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-random"><span><i class="icon icon-random"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-comment"><span><i class="icon icon-comment"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-magnet"><span><i class="icon icon-magnet"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-chevron-up"><span><i class="icon icon-chevron-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-chevron-down"><span><i class="icon icon-chevron-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-retweet"><span><i class="icon icon-retweet"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-shopping-cart"><span><i class="icon icon-shopping-cart"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-folder-close"><span><i class="icon icon-folder-close"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-folder-open"><span><i class="icon icon-folder-open"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-resize-vertical"><span><i class="icon icon-resize-vertical"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-resize-horizontal"><span><i class="icon icon-resize-horizontal"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bar-chart"><span><i class="icon icon-bar-chart"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-twitter-sign"><span><i class="icon icon-twitter-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-facebook-sign"><span><i class="icon icon-facebook-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-camera-retro"><span><i class="icon icon-camera-retro"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-key"><span><i class="icon icon-key"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-gears"><span><i class="icon icon-gears"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-comments"><span><i class="icon icon-comments"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-thumbs-up-alt"><span><i class="icon icon-thumbs-up-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-thumbs-down-alt"><span><i class="icon icon-thumbs-down-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-star-half"><span><i class="icon icon-star-half"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-heart-empty"><span><i class="icon icon-heart-empty"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-signout"><span><i class="icon icon-signout"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-linkedin-sign"><span><i class="icon icon-linkedin-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-pushpin"><span><i class="icon icon-pushpin"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-external-link"><span><i class="icon icon-external-link"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-signin"><span><i class="icon icon-signin"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-trophy"><span><i class="icon icon-trophy"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-github-sign"><span><i class="icon icon-github-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-upload-alt"><span><i class="icon icon-upload-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-lemon"><span><i class="icon icon-lemon"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-phone"><span><i class="icon icon-phone"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-unchecked"><span><i class="icon icon-unchecked"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bookmark-empty"><span><i class="icon icon-bookmark-empty"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-phone-sign"><span><i class="icon icon-phone-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-twitter"><span><i class="icon icon-twitter"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-facebook"><span><i class="icon icon-facebook"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-github"><span><i class="icon icon-github"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-unlock"><span><i class="icon icon-unlock"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-credit-card"><span><i class="icon icon-credit-card"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-rss"><span><i class="icon icon-rss"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-hdd"><span><i class="icon icon-hdd"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bullhorn"><span><i class="icon icon-bullhorn"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bell"><span><i class="icon icon-bell"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-certificate"><span><i class="icon icon-certificate"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-hand-right"><span><i class="icon icon-hand-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-hand-left"><span><i class="icon icon-hand-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-hand-up"><span><i class="icon icon-hand-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-hand-down"><span><i class="icon icon-hand-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-circle-arrow-left"><span><i class="icon icon-circle-arrow-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-circle-arrow-right"><span><i class="icon icon-circle-arrow-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-circle-arrow-up"><span><i class="icon icon-circle-arrow-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-circle-arrow-down"><span><i class="icon icon-circle-arrow-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-globe"><span><i class="icon icon-globe"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-wrench"><span><i class="icon icon-wrench"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-tasks"><span><i class="icon icon-tasks"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-filter"><span><i class="icon icon-filter"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-briefcase"><span><i class="icon icon-briefcase"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-fullscreen"><span><i class="icon icon-fullscreen"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-group"><span><i class="icon icon-group"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-link"><span><i class="icon icon-link"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-cloud"><span><i class="icon icon-cloud"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-beaker"><span><i class="icon icon-beaker"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-cut"><span><i class="icon icon-cut"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-copy"><span><i class="icon icon-copy"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-paperclip"><span><i class="icon icon-paperclip"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-save"><span><i class="icon icon-save"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sign-blank"><span><i class="icon icon-sign-blank"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-reorder"><span><i class="icon icon-reorder"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-list-ul"><span><i class="icon icon-list-ul"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-list-ol"><span><i class="icon icon-list-ol"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-strikethrough"><span><i class="icon icon-strikethrough"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-underline"><span><i class="icon icon-underline"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-table"><span><i class="icon icon-table"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-magic"><span><i class="icon icon-magic"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-truck"><span><i class="icon icon-truck"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-pinterest"><span><i class="icon icon-pinterest"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-pinterest-sign"><span><i class="icon icon-pinterest-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-google-plus-sign"><span><i class="icon icon-google-plus-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-google-plus"><span><i class="icon icon-google-plus"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-money"><span><i class="icon icon-money"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-caret-down"><span><i class="icon icon-caret-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-caret-up"><span><i class="icon icon-caret-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-caret-left"><span><i class="icon icon-caret-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-caret-right"><span><i class="icon icon-caret-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-columns"><span><i class="icon icon-columns"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sort"><span><i class="icon icon-sort"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sort-down"><span><i class="icon icon-sort-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sort-up"><span><i class="icon icon-sort-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-envelope"><span><i class="icon icon-envelope"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-linkedin"><span><i class="icon icon-linkedin"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-rotate-left"><span><i class="icon icon-rotate-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-legal"><span><i class="icon icon-legal"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-dashboard"><span><i class="icon icon-dashboard"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-comment-alt"><span><i class="icon icon-comment-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-comments-alt"><span><i class="icon icon-comments-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bolt"><span><i class="icon icon-bolt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sitemap"><span><i class="icon icon-sitemap"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-umbrella"><span><i class="icon icon-umbrella"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-paste"><span><i class="icon icon-paste"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-lightbulb"><span><i class="icon icon-lightbulb"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-exchange"><span><i class="icon icon-exchange"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-cloud-download"><span><i class="icon icon-cloud-download"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-cloud-upload"><span><i class="icon icon-cloud-upload"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-user-md"><span><i class="icon icon-user-md"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-stethoscope"><span><i class="icon icon-stethoscope"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-suitcase"><span><i class="icon icon-suitcase"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bell-alt"><span><i class="icon icon-bell-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-coffee"><span><i class="icon icon-coffee"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-food"><span><i class="icon icon-food"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-file-text-alt"><span><i class="icon icon-file-text-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-building"><span><i class="icon icon-building"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-hospital"><span><i class="icon icon-hospital"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-ambulance"><span><i class="icon icon-ambulance"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-medkit"><span><i class="icon icon-medkit"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-fighter-jet"><span><i class="icon icon-fighter-jet"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-beer"><span><i class="icon icon-beer"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-h-sign"><span><i class="icon icon-h-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-plus-sign-alt"><span><i class="icon icon-plus-sign-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-double-angle-left"><span><i class="icon icon-double-angle-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-double-angle-right"><span><i class="icon icon-double-angle-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-double-angle-up"><span><i class="icon icon-double-angle-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-double-angle-down"><span><i class="icon icon-double-angle-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-angle-left"><span><i class="icon icon-angle-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-angle-right"><span><i class="icon icon-angle-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-angle-up"><span><i class="icon icon-angle-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-angle-down"><span><i class="icon icon-angle-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-desktop"><span><i class="icon icon-desktop"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-laptop"><span><i class="icon icon-laptop"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-tablet"><span><i class="icon icon-tablet"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-mobile-phone"><span><i class="icon icon-mobile-phone"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-circle-blank"><span><i class="icon icon-circle-blank"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-quote-left"><span><i class="icon icon-quote-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-quote-right"><span><i class="icon icon-quote-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-spinner"><span><i class="icon icon-spinner"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-circle"><span><i class="icon icon-circle"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-mail-reply"><span><i class="icon icon-mail-reply"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-github-alt"><span><i class="icon icon-github-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-folder-close-alt"><span><i class="icon icon-folder-close-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-folder-open-alt"><span><i class="icon icon-folder-open-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-expand-alt"><span><i class="icon icon-expand-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-collapse-alt"><span><i class="icon icon-collapse-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-smile"><span><i class="icon icon-smile"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-frown"><span><i class="icon icon-frown"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-meh"><span><i class="icon icon-meh"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-gamepad"><span><i class="icon icon-gamepad"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-keyboard"><span><i class="icon icon-keyboard"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-flag-alt"><span><i class="icon icon-flag-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-flag-checkered"><span><i class="icon icon-flag-checkered"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-terminal"><span><i class="icon icon-terminal"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-code"><span><i class="icon icon-code"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-reply-all"><span><i class="icon icon-reply-all"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-mail-reply-all"><span><i class="icon icon-mail-reply-all"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-star-half-full"><span><i class="icon icon-star-half-full"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-location-arrow"><span><i class="icon icon-location-arrow"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-crop"><span><i class="icon icon-crop"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-code-fork"><span><i class="icon icon-code-fork"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-unlink"><span><i class="icon icon-unlink"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-question"><span><i class="icon icon-question"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-info"><span><i class="icon icon-info"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-exclamation"><span><i class="icon icon-exclamation"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-superscript"><span><i class="icon icon-superscript"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-subscript"><span><i class="icon icon-subscript"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-eraser"><span><i class="icon icon-eraser"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-puzzle-piece"><span><i class="icon icon-puzzle-piece"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-microphone"><span><i class="icon icon-microphone"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-microphone-off"><span><i class="icon icon-microphone-off"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-shield"><span><i class="icon icon-shield"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-calendar-empty"><span><i class="icon icon-calendar-empty"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-fire-extinguisher"><span><i class="icon icon-fire-extinguisher"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-rocket"><span><i class="icon icon-rocket"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-maxcdn"><span><i class="icon icon-maxcdn"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-chevron-sign-left"><span><i class="icon icon-chevron-sign-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-chevron-sign-right"><span><i class="icon icon-chevron-sign-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-chevron-sign-up"><span><i class="icon icon-chevron-sign-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-chevron-sign-down"><span><i class="icon icon-chevron-sign-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-html5"><span><i class="icon icon-html5"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-css3"><span><i class="icon icon-css3"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-anchor"><span><i class="icon icon-anchor"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-unlock-alt"><span><i class="icon icon-unlock-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bullseye"><span><i class="icon icon-bullseye"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-ellipsis-horizontal"><span><i class="icon icon-ellipsis-horizontal"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-ellipsis-vertical"><span><i class="icon icon-ellipsis-vertical"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-rss-sign"><span><i class="icon icon-rss-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-play-sign"><span><i class="icon icon-play-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-ticket"><span><i class="icon icon-ticket"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-minus-sign-alt"><span><i class="icon icon-minus-sign-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-check-minus"><span><i class="icon icon-check-minus"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-level-up"><span><i class="icon icon-level-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-level-down"><span><i class="icon icon-level-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-check-sign"><span><i class="icon icon-check-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-edit-sign"><span><i class="icon icon-edit-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-external-link-sign"><span><i class="icon icon-external-link-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-share-sign"><span><i class="icon icon-share-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-compass"><span><i class="icon icon-compass"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-collapse"><span><i class="icon icon-collapse"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-collapse-top"><span><i class="icon icon-collapse-top"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-expand"><span><i class="icon icon-expand"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-euro"><span><i class="icon icon-euro"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-gbp"><span><i class="icon icon-gbp"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-dollar"><span><i class="icon icon-dollar"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-rupee"><span><i class="icon icon-rupee"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-yen"><span><i class="icon icon-yen"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-renminbi"><span><i class="icon icon-renminbi"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-won"><span><i class="icon icon-won"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bitcoin"><span><i class="icon icon-bitcoin"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-file"><span><i class="icon icon-file"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-file-text"><span><i class="icon icon-file-text"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sort-by-alphabet"><span><i class="icon icon-sort-by-alphabet"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sort-by-alphabet-alt"><span><i class="icon icon-sort-by-alphabet-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sort-by-attributes"><span><i class="icon icon-sort-by-attributes"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sort-by-attributes-alt"><span><i class="icon icon-sort-by-attributes-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sort-by-order"><span><i class="icon icon-sort-by-order"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sort-by-order-alt"><span><i class="icon icon-sort-by-order-alt"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-thumbs-up"><span><i class="icon icon-thumbs-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-thumbs-down"><span><i class="icon icon-thumbs-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-youtube-sign"><span><i class="icon icon-youtube-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-youtube"><span><i class="icon icon-youtube"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-xing"><span><i class="icon icon-xing"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-xing-sign"><span><i class="icon icon-xing-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-youtube-play"><span><i class="icon icon-youtube-play"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-dropbox"><span><i class="icon icon-dropbox"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-stackexchange"><span><i class="icon icon-stackexchange"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-instagram"><span><i class="icon icon-instagram"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-flickr"><span><i class="icon icon-flickr"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-adn"><span><i class="icon icon-adn"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bitbucket"><span><i class="icon icon-bitbucket"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bitbucket-sign"><span><i class="icon icon-bitbucket-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-tumblr"><span><i class="icon icon-tumblr"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-tumblr-sign"><span><i class="icon icon-tumblr-sign"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-long-arrow-down"><span><i class="icon icon-long-arrow-down"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-long-arrow-up"><span><i class="icon icon-long-arrow-up"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-long-arrow-left"><span><i class="icon icon-long-arrow-left"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-long-arrow-right"><span><i class="icon icon-long-arrow-right"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-apple"><span><i class="icon icon-apple"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-windows"><span><i class="icon icon-windows"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-android"><span><i class="icon icon-android"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-linux"><span><i class="icon icon-linux"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-dribbble"><span><i class="icon icon-dribbble"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-skype"><span><i class="icon icon-skype"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-foursquare"><span><i class="icon icon-foursquare"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-trello"><span><i class="icon icon-trello"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-female"><span><i class="icon icon-female"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-male"><span><i class="icon icon-male"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-gittip"><span><i class="icon icon-gittip"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-sun"><span><i class="icon icon-sun"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-moon"><span><i class="icon icon-moon"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-archive"><span><i class="icon icon-archive"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-bug"><span><i class="icon icon-bug"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-vk"><span><i class="icon icon-vk"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-weibo"><span><i class="icon icon-weibo"></i></span></label>
<label class="col-xs-2 select-icon"><input type="radio" name="icon" value="icon-renren"><span><i class="icon icon-renren"></i></span></label>
					</div>
				</div>
				<div class="text-center">
					<button id="confirm" class='btn btn-success'></button>
				</div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<%@ include file="/WEB-INF/pages/common/rs_js.jsp"%>
<script src="${path }/resources/treeJs/tress.js"></script>
<script type="text/javascript">
$(function(){
	menuTree=[<c:forEach var="menu" items="${menuTree }" varStatus="sta">
			{id:${menu.id},name:"${menu.name}",privilegeId:${menu.privilegeId},icon:"${menu.icon}",submenu:[
		   <c:forEach var="child" items="${menu.submenu }" varStatus="status">
		   		{id:${child.id},name:"${child.name}",privilegeId:${child.privilegeId}}
		   		<c:if test="${status.last eq false}">,</c:if>
		    </c:forEach>]
			}
			<c:if test="${sta.last eq false}">,</c:if>
	  	</c:forEach>];
	var tree=$('.tree');
	var modal=$('#modal'),confirm=modal.find('#confirm'),confirmListener;
	var link=modal.find("#link");
	var name=modal.find("#name");
	var icons=modal.find('#icons');
	var opt=link.children();
	var btn;
	var title=modal.find('#myModalLabel');
	modal.on('hidden.bs.modal', function () {
		name.val('');
	});
	icons.children(':first-child').children('input').prop('checked','checked');
	function addFirstLayer(){
		if(link.find('[value=0]').length==0){
			link.prepend('<option value="0">无</option>').val('0');
		}
		//opt.removeAttr('selected').eq(0).show().attr('selected',true);
		confirm.data('id',null).text('添加');
		if(confirmListener!=addMenu){
			confirm.unbind('click',confirmListener).click(addMenu);
			confirmListener=addMenu;
		}
		icons.show();
		title.text('添加同级菜单');
		modal.modal("show");
	}
	function addMenu(){
		var parentId=confirm.data('id');
		$.ajax({
			url:"add.action",
			type:'post',
			data:{name:name.val(),link:link.val(),parentId:parentId,icon:$('[name=icon]:radio:checked').val()},
			dataType:"json",
			success:function(data){
				if(data){
					var ul;
					if(parentId){
						for(var i=0;i<menuTree.length;i++){
							if(menuTree[i].id==+parentId){
								menuTree[i].privilegeId=0;
								ul=tree.children('ul').children().eq(i).children('ul');
								menuTree[i].submenu.push({id:data,name:name.val(),privilegeId:+link.val()});
								break;
							}
						}
					}
					else{
						ul=tree.children("ul");
						menuTree.push({id:data,name:name.val(),privilegeId:+link.val(),submenu:[]});
					}
					ul.append('<li><span class="btn btn-large'+(parentId?'':' btn-lg')+'">'+name.val()+'</span><button type=\'button\' class=\'add btn btn-xs btn-info\' onclick="'+(parentId?'addFirstLayer()':('addSecondLayer(this,'+data+')'))+'">添加同级菜单</button>'+
							(parentId?'':'<button type=\'button\' class=\'addNext btn btn-xs btn-info\' onclick="addSecondLayer('+data+')">添加下级菜单</button>')+
							'<button type=\'button\' class=\'update btn btn-xs btn-warning\' onclick="showDetail(this,'+data+')">更新菜单</button><button id=\'delete\' type=\'button\' class=\'btn btn-xs btn-danger\' onclick="delMenu(this,\''+(+data)+'\')">删除</button></li>');
					
					modal.modal('hide');
				}
				else{
					alert('添加失败');
				}
			},
			error:function(){
				alert('添加失败');
			}
		});
	}
	function delMenu(button,id){
		var cover=$('<div class="modal-backdrop fade in"></div>');
		$(document.body).append(cover);
		if(window.confirm("确定删除菜单: "+$(btn).siblings().eq(0).text()+' ?')){
			$.ajax({
				url:"del.action",
				type:'post',
				data:{id:id},
				dataType:"json",
				success:function(data){
					btn=$(button);
					if(data==1){
						if(btn.parent().parent().parent()[0]==tree[0]){
							parent=menuTree;
						}
						else{
							parent=menuTree[btn.parent().parent().parent().index()].submenu;
						}
						parent.splice(btn.parent().index(),1);
						btn.parent().remove();
					}
					cover.remove();
				},
				error:function(){
					cover.remove();
				}
			});
		}
		else{
			cover.remove();
		}
	}
	function addSecondLayer(button,id){
		btn=$(button);
		if(btn.parent().parent().parent()[0]==tree[0]&&menuTree[btn.parent().index()].privilegeId){
			if(!window.confirm("此操作将删除此菜单的链接，是否继续？"))
				return;
		}
		link.find('[value=0]').remove();
		link.val(link.children()[0].value);
		//opt.removeAttr('selected').eq(1).attr('selected',true);
		confirm.data('id',id).text('添加');
		if(confirmListener!=addMenu){
			confirm.unbind('click',confirmListener).click(addMenu);
			confirmListener=addMenu;
		}
		title.text('添加子菜单');
		icons.hide();
		modal.modal("show");
	}
	function showDetail(button,id){
		btn=$(button);
		var parent,data;
		if(btn.parent().parent().parent()[0]==tree[0]){
			parent=menuTree;
			if(link.find('[value=0]').length==0){
				link.prepend('<option value="0">无</option>');
			}
			icons.show();
		}
		else{
			parent=menuTree[btn.parent().parent().parent().index()].submenu;
			link.find('[value=0]').remove();
			icons.hide();
		}
		data=parent[btn.parent().index()];
		if(data.icon){
			var i=icons.find('input[value='+data.icon+']');
			i.prop('checked','checked');
			modal.on('shown.bs.modal',function(){
				var top=i.parent().prop('offsetTop')-icons.prop('offsetTop');
				icons.prop('scrollTop',top);
				modal.unbind('shown.bs.modal');
			});
		}
		name.val(data.name);
		link.val(data.privilegeId);
		confirm.data('id',id).text('修改');
		if(confirmListener!=updateMenu){
			confirm.unbind('click',confirmListener).click(updateMenu);
			confirmListener=updateMenu;
		}
		title.text('修改菜单');
		modal.modal("show");
	}
	function updateMenu(){
		var updateData={id:+confirm.data('id'),name:name.val(),link:+link.val(),icon:$('[name=icon]:radio:checked').val()};
		if(updateData.link>0&&btn.parent().parent().parent()[0]==tree[0]&&menuTree[btn.parent().index()].submenu.length>0){
			if(!window.confirm("此操作将删除此菜单下的子菜单，是否继续？"))
				return;
		}
		$.ajax({
			url:"update.action",
			type:'post',
			data:updateData,
			dataType:"json",
			success:function(data){
				if(data){
					var ul;
					if(btn.parent().parent().parent()[0]==tree[0]){
						parent=menuTree;
					}
					else{
						parent=menuTree[btn.parent().parent().parent().index()].submenu;
					}
					data=parent[btn.parent().index()];
					data.name=updateData.name;
					data.privilegeId=updateData.link;
					link.val(updateData.link);
					btn.parent().children('span').text(updateData.name);
					if(updateData.link!==0){
						data.submenu.length=0;
						btn.parent().children('ul').html('');
						console.log(btn.parent().children('ul'));
					}
					modal.modal('hide');
				}
				else{
					alert('修改失败');
				}
			},
			error:function(){
				alert('修改失败');
			}
		});
	}
	window.addFirstLayer=addFirstLayer;
	window.addSecondLayer=addSecondLayer;
	window.delMenu=delMenu;
	window.showDetail=showDetail;
});
</script>
</body>
</html>