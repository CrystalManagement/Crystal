package com.base.privilege.domain;

import java.util.List;

public class PrivilegeVOExt extends PrivilegeVO {
	private List<PrivilegeVO> children;

	public List<PrivilegeVO> getChildren() {
		return children;
	}

	public void setChildren(List<PrivilegeVO> children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "PrivilegeVOExt [ id" + getId() + ", name()=" + getName() + ", classPath()="
				+ getClassPath() + ", link=" + getLink() + "children=" + children + "]";
	}

}
