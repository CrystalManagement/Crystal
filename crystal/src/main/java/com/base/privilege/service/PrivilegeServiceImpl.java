package com.base.privilege.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.privilege.dao.PrivilegeVOExtMapper;
import com.base.privilege.domain.PrivilegeVOExt;

@Service
public class PrivilegeServiceImpl implements PrivilegeService {
	@Autowired
	private PrivilegeVOExtMapper mapperExt;
	@Override
	public List<PrivilegeVOExt> getEntireTree() {
		return mapperExt.getEntireTree();
	}
	@Override
	public List<PrivilegeVOExt> getMenuedTree() {
		return mapperExt.getMenuedTree();
	}
	@Override
	public Set<Integer> getAuthorized(Integer roleId) {
		return mapperExt.getAuthorized(roleId);
	}
	@Override
	@Transactional
	public void authorize(Integer roleId, Set<Integer> privilegeId) {
		mapperExt.clear(roleId);
		if (privilegeId.size()>0)
			mapperExt.authorize(roleId, privilegeId);
	}
	@Override
	public Set<String> of(Integer userId) {
		return mapperExt.of(userId);
	}
	

}
