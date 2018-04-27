package com.mapper;

import com.entity.Category;
import com.entity.MCategory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MCategory record);

    int insertSelective(MCategory record);

    MCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MCategory record);

    int updateByPrimaryKey(MCategory record);

    @Select("select * from t_mcategory")
    List<MCategory> selectAll();
}