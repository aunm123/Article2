package com.mapper;

import com.entity.Article;
import com.entity.Movice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MoviceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Movice record);

    int insertSelective(Movice record);

    Movice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Movice record);

    int updateByPrimaryKey(Movice record);

    List<Movice> selectWithCategoryid(Integer categoryid);

    List<Movice> selectAll();

    @Select("select * from `t_video` order by `readed` desc limit #{count} ")
    List<Movice> selectAdvanceMovice(Integer count);

    @Select("select * from `t_video` order by `complain` desc limit #{count} ")
    List<Movice> selectAllComplain(Integer count);

    int hasRead(Integer id);
}