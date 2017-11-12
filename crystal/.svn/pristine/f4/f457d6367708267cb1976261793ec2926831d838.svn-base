package com.base.role.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.base.common.domain.CurrentUser;
import com.base.common.domain.JsonResult;
import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.base.privilege.annotation.Privilege;
import com.base.role.domain.RoleVO;
import com.base.role.service.RoleService;


@Controller
@RequestMapping("/role")
@Privilege("角色")
public class RoleController {
	@Autowired
	private RoleService service;
	
	@RequestMapping("/edit")
	@Privilege("编辑页")
	public String edit(Integer id,ModelMap map){
		if(id!=null){
			map.addAttribute("entity",service.get(id));
		}
		return "role/edit";//跳转到编辑页面
	}
	
	@RequestMapping("/doEdit")
	@Privilege("编辑")
	public String doEdit(RoleVO entity){
		//CurrentUser user = CurrentUser.getInstance();
		//entity.setCreatorUserId(user.getUserId());//创建者id
		if(entity.getId()!=null){//修改
			service.update(entity);
		}else{//新增
			service.add(entity);
		}
		return "redirect:/role/list.action";//跳转到列表页面
	}
	
	@RequestMapping("/rest/doDelete")
	@Privilege("删除")
	public @ResponseBody JsonResult doDelete(Integer id){
		JsonResult rs=new JsonResult();
		service.delete(id);
		rs.setStatus(1);
		rs.setMsg("删除成功！");
		return rs;
	}
	
	@RequestMapping("/list")
	@Privilege(value="列表页",link="/role/list.action",children={"角色-数据","角色-编辑页","角色-编辑","角色-删除","权限-授权页","权限-授权"})
	public String list(){
		return "role/list";//跳转到分页查询页面
	}
	/**
	 * datatable分页查询接口
	 * @param request
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping("/rest/doSearch")
	@Privilege("数据")
	public @ResponseBody DataTablesResponse<RoleVO> pageSearch(
			@RequestBody DataTablesRequest request) throws Throwable{
		return service.listByPage(request);
	}
}
