package com.xm.mapper;

import com.xm.pojo.UsersRoleExample;
import com.xm.pojo.UsersRoleKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsersRoleMapper {
    long countByExample(UsersRoleExample example);

    int deleteByExample(UsersRoleExample example);

    int deleteByPrimaryKey(UsersRoleKey key);

    int insert(UsersRoleKey record);

    int insertSelective(UsersRoleKey record);

    List<UsersRoleKey> selectByExample(UsersRoleExample example);

    int updateByExampleSelective(@Param("record") UsersRoleKey record, @Param("example") UsersRoleExample example);

    int updateByExample(@Param("record") UsersRoleKey record, @Param("example") UsersRoleExample example);
}