package com.base.privilege.dao;

import java.util.List;
import java.util.Set;

import com.base.privilege.domain.PrivilegeVOExt;

public interface PrivilegeVOExtMapper {
	int testRelated(int parentId,int childId);
	int attach(int parentId,int childId);
	List<PrivilegeVOExt> getEntireTree();
	List<PrivilegeVOExt> getMenuedTree();
	Set<Integer> getAuthorized(Integer roleId);
	void clear(Integer roleId);
	void authorize(Integer roleId,Set<Integer> privilegeId);
	Set<String> of(Integer userId);
}
