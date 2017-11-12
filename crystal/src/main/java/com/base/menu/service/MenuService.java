package com.base.menu.service;

import java.util.List;

import com.base.menu.domain.MenuVO;
import com.base.menu.domain.MenuVOExt;

public interface MenuService {
	MenuVO get(Integer id);
	int add(MenuVO menu);
	int update(MenuVO menu);
	int delete(Integer id);
	List<MenuVOExt> getEntireTree();
	List<MenuVOExt> getTreeOf(Integer id);
}
