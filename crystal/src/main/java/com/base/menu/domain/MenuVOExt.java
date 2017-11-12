package com.base.menu.domain;

import java.util.List;

import com.base.privilege.domain.PrivilegeVO;

public class MenuVOExt extends MenuVO {
	private List<MenuVO> submenu;


	public List<MenuVO> getSubmenu() {
		return submenu;
	}

	public void setSubmenu(List<MenuVO> submenu) {
		this.submenu = submenu;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(getId());
		sb.append(", name=").append(getName());
		sb.append(", link=").append(getLink());
		sb.append(", parentId=").append(getParentId());
		sb.append(", submenu=").append(submenu);
		sb.append("]");
		return sb.toString();
	}

}
