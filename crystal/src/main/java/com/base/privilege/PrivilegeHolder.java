package com.base.privilege;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.base.privilege.domain.PrivilegeVOExt;

@Component
@Scope("session")
public class PrivilegeHolder {
	@Autowired
	private HttpSession session;
	
	public Set<PrivilegeVOExt> getPrivilege(){
		return (Set<PrivilegeVOExt>) session.getAttribute("privileges");
	}
}
