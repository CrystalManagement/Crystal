package com.crystal.scroe.dao;

import com.crystal.scroe.domain.ScroeVO;
import com.crystal.scroe.domain.ScroeVOExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ScroeVOMapper {
    int countByExample(ScroeVOExample example);

    int deleteByExample(ScroeVOExample example);

    int deleteByPrimaryKey(Integer scoreid);

    int insert(ScroeVO record);

    int insertSelective(ScroeVO record);

    List<ScroeVO> selectByExample(ScroeVOExample example);

    ScroeVO selectByPrimaryKey(Integer scoreid);

    int updateByExampleSelective(@Param("record") ScroeVO record, @Param("example") ScroeVOExample example);

    int updateByExample(@Param("record") ScroeVO record, @Param("example") ScroeVOExample example);

    int updateByPrimaryKeySelective(ScroeVO record);

    int updateByPrimaryKey(ScroeVO record);
}