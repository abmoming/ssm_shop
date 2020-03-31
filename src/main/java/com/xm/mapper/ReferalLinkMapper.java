package com.xm.mapper;

import com.xm.pojo.ReferalLink;
import com.xm.pojo.ReferalLinkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReferalLinkMapper {
    long countByExample(ReferalLinkExample example);

    int deleteByExample(ReferalLinkExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ReferalLink record);

    int insertSelective(ReferalLink record);

    List<ReferalLink> selectByExample(ReferalLinkExample example);

    ReferalLink selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ReferalLink record, @Param("example") ReferalLinkExample example);

    int updateByExample(@Param("record") ReferalLink record, @Param("example") ReferalLinkExample example);

    int updateByPrimaryKeySelective(ReferalLink record);

    int updateByPrimaryKey(ReferalLink record);
}