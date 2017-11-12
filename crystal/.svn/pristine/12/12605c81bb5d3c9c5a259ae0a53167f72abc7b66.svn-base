package com.base.role.service;

import java.util.List;

import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.base.role.domain.RoleVO;

public interface RoleService {
    /**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int add(RoleVO entity);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	/**
	 * 修改
	 * @param entity
	 * @return
	 */
	public int update(RoleVO entity);
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	public RoleVO get(Integer id);
	
	public List<RoleVO> all();
	
	public List<RoleVO> of(Integer userId);
	
	void setRole(Integer userId,Integer[] roles);
	
	/**
	 * 使用datatables的分页查询
	 * @param request
	 * @return
	 */
	public DataTablesResponse<RoleVO> listByPage(DataTablesRequest request) throws Throwable;
	
	
}
