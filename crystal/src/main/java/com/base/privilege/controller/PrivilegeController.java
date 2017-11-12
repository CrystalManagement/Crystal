package com.base.privilege.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.privilege.annotation.Privilege;
import com.base.privilege.service.PrivilegeService;

@Controller
@RequestMapping("privilege")
@Privilege("权限")
public class PrivilegeController {
	@Autowired
	private PrivilegeService service;
	
	@RequestMapping("/authorization")
	@Privilege("授权页")
	public String privilegeList(ModelMap map,Integer roleId){
		if(roleId==null)
			return "";
		map.addAttribute("roleId", roleId);
		map.addAttribute("tree", service.getMenuedTree());
		map.addAttribute("set", service.getAuthorized(roleId));
		return "privilege/authorization";
	}
	
	@RequestMapping("/authorize")
	@Privilege("授权")
	public @ResponseBody String grant(Integer roleId,Integer[] privilegeId){
		System.out.println(roleId);
		if(roleId==null)
			return "fail";
		Set<Integer> privilegeSet=new HashSet<>();
		if(privilegeId!=null)
			for(Integer i:privilegeId)
				privilegeSet.add(i);
		
		service.authorize(roleId, privilegeSet);
		return "success";
	}
}
