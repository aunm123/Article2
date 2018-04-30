package com.mapper;

import com.entity.Movice;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MoviceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Movice record);

    int insertSelective(Movice record);

    Movice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Movice record);

    int updateByPrimaryKey(Movice record);

    List<Movice> selectAll();

    List<Movice> selectWithCategoryid(Integer mcategoryid);
}