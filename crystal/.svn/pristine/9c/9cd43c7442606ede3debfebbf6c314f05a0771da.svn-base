package com.base.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.menu.domain.MenuVO;
import com.base.menu.service.MenuService;
import com.base.privilege.annotation.Privilege;
import com.base.privilege.service.PrivilegeService;

@Controller
@RequestMapping("/menu")
@Privilege("菜单")
public class MenuController {
	@Autowired
	MenuService service;
	@Autowired
	PrivilegeService serviceP;

	@RequestMapping("/show")
	@Privilege(value = "树状图", link = "/menu/show.action",children={"菜单-新增","菜单-修改","菜单-删除"})
	public String showMenu(ModelMap map) {
		map.addAttribute("menuTree", service.getEntireTree());
		map.addAttribute("privilegeList", serviceP.getEntireTree());
		return "menu/tree";
	}

	@RequestMapping("/add")
	@Privilege("新增")
	public @ResponseBody int addMenu(String name, Integer link, Integer parentId, String icon) {
		MenuVO menu = new MenuVO();
		if (icon == null) {
			icon = "icon-leaf";
		}
		if (parentId == null) {
			parentId = 0;
		}
		menu.setName(name);
		menu.setPrivilegeId(link);
		menu.setParentId(parentId);
		if (parentId == 0) {
			menu.setIcon(icon);
		}
		if (1 == service.add(menu)) {
			return menu.getId();
		} else
			return 0;
	}

	@RequestMapping("/update")
	@Privilege("修改")
	public @ResponseBody int updateMenu(Integer id, String name, Integer link, String icon) {
		MenuVO menu = service.get(id);
		if (menu == null)
			return 0;
		menu.setName(name);
		menu.setPrivilegeId(link);
		if (menu.getParentId() == 0 || menu.getId() == menu.getParentId())
			menu.setIcon(icon);
		return service.update(menu);
	}

	@RequestMapping("/del")
	@Privilege("删除")
	public @ResponseBody int delMenu(Integer id) {
		if (1 == service.delete(id))
			return 1;
		else
			return 0;
	}
}
