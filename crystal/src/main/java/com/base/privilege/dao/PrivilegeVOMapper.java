package com.base.privilege.dao;

import com.base.privilege.domain.PrivilegeVO;
import com.base.privilege.domain.PrivilegeVOExample;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

public interface PrivilegeVOMapper {
    int countByExample(PrivilegeVOExample example);

    int deleteByExample(PrivilegeVOExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PrivilegeVO record);

    int insertSelective(PrivilegeVO record);

    List<PrivilegeVO> selectByExample(PrivilegeVOExample example);

    PrivilegeVO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PrivilegeVO record, @Param("example") PrivilegeVOExample example);

    int updateByExample(@Param("record") PrivilegeVO record, @Param("example") PrivilegeVOExample example);

    int updateByPrimaryKeySelective(PrivilegeVO record);

    int updateByPrimaryKey(PrivilegeVO record);
}