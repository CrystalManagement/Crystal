package com.base.role.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.common.util.SearchConditionUtils;
import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.base.role.dao.RoleVOMapper;
import com.base.role.dao.RoleVOMapperExt;
import com.base.role.domain.RoleVO;
import com.base.role.domain.RoleVOExample;


@Service
public class RoleServiceImp implements RoleService {
	@Autowired
	private RoleVOMapper mapper;
	@Autowired
	private RoleVOMapperExt mapperExt;
	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	@Override
	public int add(RoleVO entity) {
		return mapper.insertSelective(entity);
	}
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@Override
	public int delete(Integer id) {
		return mapper.deleteByPrimaryKey(id);
	}
	/**
	 * 修改
	 * @param entity
	 * @return
	 */
	@Override
	public int update(RoleVO entity) {
		return mapper.updateByPrimaryKeySelective(entity);
	}
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	@Override
	public RoleVO get(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public DataTablesResponse<RoleVO> listByPage(DataTablesRequest request)
			throws Throwable {
		RoleVOExample example = new RoleVOExample();
		DataTablesResponse<RoleVO> response = new DataTablesResponse<RoleVO>();
		SearchConditionUtils.wrapperAndCondition(example, request);// 封装查询条件
		response.setDraw(request.getDraw());
		response.setRecordsTotal(mapper.countByExample(example));
		response.setData(mapper.selectByExample(example));
		return response;
		
	}
	@Override
	public List<RoleVO> all() {
		RoleVOExample example = new RoleVOExample();
		example.createCriteria();
		return mapper.selectByExample(example);
	}
	@Override
	public List<RoleVO> of(Integer userId) {
		return mapperExt.ofUser(userId);
	}
	@Override
	@Transactional
	public void setRole(Integer userId, Integer[] roles) {
		mapperExt.clear(userId);
		mapperExt.setRole(userId, roles);
	}

}
