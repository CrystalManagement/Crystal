package com.xuhan.staff.service;

import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.xuhan.staff.domain.StaffVO;

public interface StaffService {
	/**
	 * 新增
	 * 
	 * @param entity
	 * @return
	 */
	public int add(StaffVO entity,Integer[] roleId) throws Throwable;

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	public int delete(Integer id);

	/**
	 * 修改
	 * 
	 * @param entity
	 * @return
	 */
	public int update(StaffVO entity,Integer[] roleId);

	/**
	 * 查询
	 * 
	 * @param id
	 * @return
	 */
	public StaffVO get(Integer id);

	/**
	 * 使用datatables的分页查询
	 * 
	 * @param request
	 * @return
	 */
	public DataTablesResponse<StaffVO> listByPage(DataTablesRequest request) throws Throwable;

	public StaffVO checkLogin(String account, String pwd) throws Throwable;

	public StaffVO getUserByAccount(String account);
	
	int updatePassword(Integer id,String oldPassword,String newPassword) throws Throwable;

}
