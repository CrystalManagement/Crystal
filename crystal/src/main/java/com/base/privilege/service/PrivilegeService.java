package com.base.privilege.service;

import java.util.List;
import java.util.Set;

import com.base.privilege.domain.PrivilegeVOExt;

public interface PrivilegeService {
	List<PrivilegeVOExt> getEntireTree();
	List<PrivilegeVOExt> getMenuedTree();
	Set<Integer> getAuthorized(Integer roleId);
	void authorize(Integer roleId,Set<Integer> privilegeId);
	Set<String> of(Integer staffId);
}
