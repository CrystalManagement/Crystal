package com.base.privilege.aop;

import java.lang.reflect.Method;
import java.util.Set;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.base.privilege.PrivilegeHolder;
import com.base.privilege.annotation.Privilege;
import com.base.privilege.domain.PrivilegeVOExt;
import com.base.privilege.exception.FunctionAccessDeniedException;
import com.base.common.util.SpringUtil;
/**
 * 功能权限切面，拦截controller
 * @author liushd
 *
 */
public class FunctionPrivilegeAspect {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public Object validate(ProceedingJoinPoint  point) throws Throwable{
		logger.debug("FunctionPrivilegeAspect validate invoke");
		Object target=point.getTarget();
        Signature signature=point.getSignature();
        MethodSignature  msig = (MethodSignature) signature;
        Method currentMethod = target.getClass().getMethod(msig.getName(), msig.getParameterTypes());
		if(target.getClass().isAnnotationPresent(Privilege.class)||currentMethod!=null && currentMethod.isAnnotationPresent(Privilege.class)){
			 String fullclasspath=target.getClass().getName()+":"+currentMethod.getName();
			 logger.debug("FunctionPrivilegeAspect class:"+fullclasspath);
			 PrivilegeHolder currentUser=SpringUtil.getBean(PrivilegeHolder.class);
			//判断是否有权限
			Set<PrivilegeVOExt> privileges=currentUser.getPrivilege();
			if(isCanAccess(privileges,fullclasspath)){
				 logger.debug("有菜单访问权限:"+fullclasspath);
				return point.proceed();
			}else{
				 logger.warn("对不起，你无权限访问该资源:"+fullclasspath);
				throw new FunctionAccessDeniedException("对不起，你无权限访问该资源！");
			}
		
		}
		return point.proceed();
		
	}
	private boolean isCanAccess(Set<PrivilegeVOExt> allpms,String fullclasspath){
		if(allpms!=null){
			logger.warn("full:"+fullclasspath);
//			for (PrivilegeVOExt pms : allpms) {
//				logger.warn("pms:" + pms.getClassPath());
//				if(fullclasspath.equals(pms.getClassPath())){
//					return true;
//				}
//			}
			return allpms.contains(fullclasspath);
		}
		return false;
	}
}
