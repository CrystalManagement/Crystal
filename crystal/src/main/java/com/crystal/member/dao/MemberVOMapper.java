package com.crystal.member.dao;

import com.crystal.member.domain.MemberVO;
import com.crystal.member.domain.MemberVOExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MemberVOMapper {
    int countByExample(MemberVOExample example);

    int deleteByExample(MemberVOExample example);

    int deleteByPrimaryKey(Integer memberid);

    int insert(MemberVO record);

    int insertSelective(MemberVO record);

    List<MemberVO> selectByExample(MemberVOExample example);

    MemberVO selectByPrimaryKey(Integer memberid);

    int updateByExampleSelective(@Param("record") MemberVO record, @Param("example") MemberVOExample example);

    int updateByExample(@Param("record") MemberVO record, @Param("example") MemberVOExample example);

    int updateByPrimaryKeySelective(MemberVO record);

    int updateByPrimaryKey(MemberVO record);
}