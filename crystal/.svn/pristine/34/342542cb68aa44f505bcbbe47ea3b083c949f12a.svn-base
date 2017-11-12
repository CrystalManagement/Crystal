package com.base.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.menu.dao.MenuVOExtMapper;
import com.base.menu.dao.MenuVOMapper;
import com.base.menu.domain.MenuVO;
import com.base.menu.domain.MenuVOExample;
import com.base.menu.domain.MenuVOExt;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	MenuVOMapper mapper;
	@Autowired
	MenuVOExtMapper mapperExt;

	@Override
	public MenuVO get(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public List<MenuVOExt> getTreeOf(Integer id) {
		List<MenuVOExt> list = mapperExt.getMenuTreeOf(id);
		// List<MenuVOExt> result=new ArrayList<>();
		// List<String> name=new ArrayList<>();
		for (MenuVOExt menu : list) {
			if (menu.getParentId() != 0) {
				menu.setLink(menu.getSubmenu().get(0).getLink());
				menu.getSubmenu().clear();
			}
			// if(menu.getSubmenu()!=null&&menu.getSubmenu().size()>0){
			// String n=menu.getSubmenu().get(0).getName();
			// if(name.contains(n)){
			// result.get(name.indexOf(n)).getSubmenu().add(menu);
			// menu.setSubmenu(null);
			// }
			// else{
			// MenuVOExt m=new MenuVOExt();
			// name.add(n);
			// m.setName(n);
			// List<MenuVO> sub=new ArrayList<>();
			// sub.add(menu);
			// m.setSubmenu(sub);
			// result.add(m);
			// menu.setSubmenu(null);
			// }
			// }
			// else{
			// result.add(menu);
			// }
		}
		return list;
	}

	@Override
	@Transactional
	public int add(MenuVO menu) {
		if (menu.getParentId() != null && menu.getParentId() > 0) {
			MenuVOExample example = new MenuVOExample();
			example.createCriteria().andIdEqualTo(menu.getParentId());
			MenuVO record = new MenuVO();
			record.setPrivilegeId(0);
			record.setParentId(0);
			mapper.updateByExampleSelective(record, example);
		}
		mapper.insertSelective(menu);
		if (menu.getPrivilegeId() > 0 && menu.getParentId() == 0) {
			menu.setParentId(menu.getId());
			mapper.updateByPrimaryKeySelective(menu);
		}
		return 1;
	}

	@Override
	@Transactional
	public int delete(Integer id) {
		MenuVOExample example = new MenuVOExample();
		example.createCriteria().andParentIdEqualTo(id).andIdNotEqualTo(id);
		mapper.deleteByExample(example);
		return mapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<MenuVOExt> getEntireTree() {
		List<MenuVOExt> menuList = mapperExt.getEntireTree();
		for (MenuVOExt menu : menuList) {
			if (menu.getPrivilegeId() != 0) {
				menu.getSubmenu().clear();
			}
		}
		return menuList;
	}

	@Override
	@Transactional
	public int update(MenuVO menu) {
		System.out.println("=============service" + menu.getPrivilegeId());
		if (menu.getPrivilegeId() > 0) {
			if (menu.getParentId() > 0) {
				System.out.println("=============service");
				MenuVOExample example = new MenuVOExample();
				example.createCriteria().andParentIdEqualTo(menu.getId());
				mapper.deleteByExample(example);
			} else if (menu.getParentId() == 0) {
				menu.setParentId(menu.getId());
			}
		}
		return mapper.updateByPrimaryKeySelective(menu);
	}

}
