package com.crystal.member.service;

import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.crystal.member.domain.MemberVO;

public interface MemberService {
    /**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int add(MemberVO entity);
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
	public int update(MemberVO entity);
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	public MemberVO get(Integer id);
	
	/**
	 * 使用datatables的分页查询
	 * @param request
	 * @return
	 */
	public DataTablesResponse<MemberVO> listByPage(DataTablesRequest request) throws Throwable;
	
	
}
