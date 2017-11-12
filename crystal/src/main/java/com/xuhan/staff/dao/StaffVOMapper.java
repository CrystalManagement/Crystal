package com.xuhan.staff.dao;

import com.xuhan.staff.domain.StaffVO;
import com.xuhan.staff.domain.StaffVOExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StaffVOMapper {
    int countByExample(StaffVOExample example);

    int deleteByExample(StaffVOExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(StaffVO record);

    int insertSelective(StaffVO record);

    List<StaffVO> selectByExample(StaffVOExample example);

    StaffVO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") StaffVO record, @Param("example") StaffVOExample example);

    int updateByExample(@Param("record") StaffVO record, @Param("example") StaffVOExample example);

    int updateByPrimaryKeySelective(StaffVO record);

    int updateByPrimaryKey(StaffVO record);
}