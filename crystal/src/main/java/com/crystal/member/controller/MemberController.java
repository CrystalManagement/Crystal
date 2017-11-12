package com.crystal.member.controller;

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
import com.crystal.member.domain.MemberVO;
import com.crystal.member.service.MemberService;


@Controller
@RequestMapping("/member")
@Privilege("乐团成员")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("/edit")
	@Privilege("编辑页")
	public String edit(Integer id,ModelMap map){
		if(id!=null){
			map.addAttribute("entity",service.get(id));
		}
		return "member/edit";//跳转到编辑页面
	}
	
	@RequestMapping("/doEdit")
	@Privilege("编辑")
	public String doEdit(MemberVO entity){
		//CurrentUser user = CurrentUser.getInstance();
		//entity.setCreatorUserId(user.getUserId());//创建者id
		if(entity.getMemberid()!=null){//修改
			service.update(entity);
		}else{//新增
			service.add(entity);
		}
		return "redirect:/member/list.action";//跳转到列表页面
	}
	
	@RequestMapping("/rest/doDelete")
	@Privilege(value="删除成员")
	public @ResponseBody JsonResult doDelete(Integer memberid){
		JsonResult rs=new JsonResult();
		service.delete(memberid);
		rs.setStatus(1);
		rs.setMsg("删除成功！");
		return rs;
	}
	
	@RequestMapping("/list")
	@Privilege(value="列表页",link="/member/list.action",children={"乐团成员-编辑页","乐团成员-编辑","乐团成员-删除成员","乐团成员-列出数据"})
	public String list(){
		return "member/list";//跳转到分页查询页面
	}
	/**
	 * datatable分页查询接口
	 * @param request
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping("/rest/doSearch")
	@Privilege("列出数据")
	public @ResponseBody DataTablesResponse<MemberVO> pageSearch(
			@RequestBody DataTablesRequest request) throws Throwable{
		return service.listByPage(request);
	}
}
