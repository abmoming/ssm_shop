package com.xm.mapper;

import com.xm.pojo.OrdersItem;
import com.xm.pojo.OrdersItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrdersItemMapper {
    long countByExample(OrdersItemExample example);

    int deleteByExample(OrdersItemExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OrdersItem record);

    int insertSelective(OrdersItem record);

    List<OrdersItem> selectByExample(OrdersItemExample example);

    OrdersItem selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OrdersItem record, @Param("example") OrdersItemExample example);

    int updateByExample(@Param("record") OrdersItem record, @Param("example") OrdersItemExample example);

    int updateByPrimaryKeySelective(OrdersItem record);

    int updateByPrimaryKey(OrdersItem record);
}