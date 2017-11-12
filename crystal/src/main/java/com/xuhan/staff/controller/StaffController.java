package com.xuhan.staff.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.base.common.domain.JsonResult;
import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.base.privilege.annotation.Privilege;
import com.base.role.service.RoleService;
/*import com.xuhan.organization.service.OrganizationService;*/
import com.xuhan.staff.domain.StaffVO;
import com.xuhan.staff.service.StaffService;


@Controller
@RequestMapping("/staff")
@Privilege("管理员")
public class StaffController {
	@Autowired
	private StaffService service;
	@Autowired
	private RoleService serviceR;
	/*@Autowired
	private OrganizationService serviceO;*/
	
	@RequestMapping("/edit")
	@Privilege("编辑页")
	public String edit(Integer id,ModelMap map){
		map.addAttribute("allroles", serviceR.all());
		/*map.addAttribute("allOrganizations", serviceO.allName());*/
		if(id!=null){
			map.addAttribute("entity",service.get(id));
			map.addAttribute("roles", serviceR.of(id));
		}
		return "staff/edit";//跳转到编辑页面
	}
	
	@RequestMapping("/doEdit")
	@Privilege("编辑")
	@Transactional
	public String doEdit(StaffVO entity, Integer[] roleId) throws Throwable{
		if(entity.getId()!=null){//修改
			entity.setPassword(null);
			entity.setSalt(null);
			service.update(entity,roleId);
		}else{//新增
			service.add(entity,roleId);
		}
		return "redirect:/staff/list.action";//跳转到列表页面
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
	@Privilege(value="列表页",link="/staff/list.action",children={"管理员-数据","管理员-编辑页","管理员-编辑","管理员-删除"})
	public String list(ModelMap map){
		/*map.addAttribute("allOrganize", serviceO.allName());*/
		return "staff/list";//跳转到分页查询页面
	}
	/**
	 * datatable分页查询接口
	 * @param request
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping("/rest/doSearch")
	@Privilege("数据")
	public @ResponseBody DataTablesResponse<StaffVO> pageSearch(
			@RequestBody DataTablesRequest request) throws Throwable{
		return service.listByPage(request);
	}
	
	/**
	 * 跳转到修改密码页面
	 * 
	 * @return
	 */
	@RequestMapping("/updatePassword")
	public String updatePassword() {
		return "staff/password";
	}

	/**
	 * 执行修改密码
	 * 
	 * @return
	 */
	@RequestMapping("/doUpdatePassword")
	public String doUpdatePassword(String oldpassword, String newpassword, HttpServletRequest request,HttpSession session)
			throws Throwable {
		Integer userid = ((StaffVO)session.getAttribute("s_user")).getId();
		// 1代表成功 0代表失败
		int result = service.updatePassword(userid, oldpassword, newpassword);
		if (result == 1)
			return "redirect:/main.action";
		else
			request.setAttribute("error", "原密码错误，请重新输入");
		return "user/password";
	}
}
