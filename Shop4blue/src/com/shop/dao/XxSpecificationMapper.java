package com.shop.dao;

import com.shop.entity.XxSpecification;
import com.shop.entity.XxSpecificationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XxSpecificationMapper {
    int countByExample(XxSpecificationExample example);

    int deleteByExample(XxSpecificationExample example);

    int deleteByPrimaryKey(Long id);

    int insert(XxSpecification record);

    int insertSelective(XxSpecification record);

    List<XxSpecification> selectByExample(XxSpecificationExample example);

    XxSpecification selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") XxSpecification record, @Param("example") XxSpecificationExample example);

    int updateByExample(@Param("record") XxSpecification record, @Param("example") XxSpecificationExample example);

    int updateByPrimaryKeySelective(XxSpecification record);

    int updateByPrimaryKey(XxSpecification record);
    
    List<XxSpecification> selectAll();
    
    int getCount();
    
    int addSpecification(XxSpecification record);
    
    XxSpecification editGg(Long id);

	List<XxSpecification> selectXxSpecification();
}