package com.crystal.scroe.service;

import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.crystal.scroe.domain.ScroeVO;

public interface ScroeService {
    /**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int add(ScroeVO entity);
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
	public int update(ScroeVO entity);
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	public ScroeVO get(Integer id);
	
	/**
	 * 使用datatables的分页查询
	 * @param request
	 * @return
	 */
	public DataTablesResponse<ScroeVO> listByPage(DataTablesRequest request) throws Throwable;
	
	
}
