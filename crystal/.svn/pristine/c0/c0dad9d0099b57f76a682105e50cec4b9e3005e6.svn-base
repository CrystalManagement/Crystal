package com.xuhan.staff.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.common.util.IDUtil;
import com.base.common.util.MD5Util;
import com.base.common.util.SearchConditionUtils;
import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.base.role.dao.RoleVOMapperExt;
import com.xuhan.staff.dao.StaffVOMapper;
import com.xuhan.staff.domain.StaffVO;
import com.xuhan.staff.domain.StaffVOExample;


@Service
public class StaffServiceImp implements StaffService {
	@Autowired
	private StaffVOMapper mapper;
	@Autowired
	private RoleVOMapperExt roleMapperExt;
	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	@Override
	@Transactional
	public int add(StaffVO entity,Integer[] roleId) throws Throwable{
		String salt = IDUtil.uuid();
		entity.setSalt(salt);
		entity.setPassword(MD5Util.md5(entity.getPassword() + salt));
		mapper.insertSelective(entity);
		roleMapperExt.clear(entity.getId());
		roleMapperExt.setRole(entity.getId(), roleId);
		return 1;
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
	@Transactional
	public int update(StaffVO entity,Integer[] roleId) {
		roleMapperExt.clear(entity.getId());
		roleMapperExt.setRole(entity.getId(), roleId);
		return mapper.updateByPrimaryKeySelective(entity);
	}
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	@Override
	public StaffVO get(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public DataTablesResponse<StaffVO> listByPage(DataTablesRequest request)
			throws Throwable {
		StaffVOExample example = new StaffVOExample();
		DataTablesResponse<StaffVO> response = new DataTablesResponse<StaffVO>();
		SearchConditionUtils.wrapperAndCondition(example, request);// 封装查询条件
		response.setDraw(request.getDraw());
		response.setRecordsTotal(mapper.countByExample(example));
		response.setData(mapper.selectByExample(example));
		return response;
		
	}
	@Override
	public StaffVO checkLogin(String account, String pwd) throws Throwable{
		StaffVO user = this.getUserByAccount(account);
		System.out.println(user);
		if (user != null) {
			String inputPwd = MD5Util.md5(pwd + user.getSalt());
			System.out.println(inputPwd);
			if (user.getPassword().equals(inputPwd)) {// 验证通过
				return user;
			}
		}
		return null;
	}
	@Override
	public StaffVO getUserByAccount(String account) {
		StaffVOExample example = new StaffVOExample();
		example.createCriteria().andAccountEqualTo(account);
		List<StaffVO> list = mapper.selectByExample(example);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	@Override
	public int updatePassword(Integer id, String oldPassword, String newPassword) throws Throwable{
		StaffVO user = get(id);
		String pwd = MD5Util.md5(oldPassword + user.getSalt());
		if (pwd.equals(user.getPassword())) {
			user.setPassword(MD5Util.md5(newPassword + user.getSalt()));
			mapper.updateByPrimaryKeySelective(user);
			return 1;
		} else {
			return 0;
		}
	}

}
