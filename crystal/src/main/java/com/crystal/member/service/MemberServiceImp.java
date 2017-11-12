package com.crystal.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.base.common.util.SearchConditionUtils;
import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.crystal.member.dao.MemberVOMapper;
import com.crystal.member.domain.MemberVO;
import com.crystal.member.domain.MemberVOExample;


@Service
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberVOMapper mapper;
	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	@Override
	public int add(MemberVO entity) {
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
	public int update(MemberVO entity) {
		return mapper.updateByPrimaryKeySelective(entity);
	}
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	@Override
	public MemberVO get(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public DataTablesResponse<MemberVO> listByPage(DataTablesRequest request)
			throws Throwable {
		MemberVOExample example = new MemberVOExample();
		DataTablesResponse<MemberVO> response = new DataTablesResponse<MemberVO>();
		SearchConditionUtils.wrapperAndCondition(example, request);// 封装查询条件
		response.setDraw(request.getDraw());
		response.setRecordsTotal(mapper.countByExample(example));
		response.setData(mapper.selectByExample(example));
		return response;
		
	}

}
