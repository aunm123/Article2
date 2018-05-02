package com.mapper;

import com.entity.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    List<Article> selectWithCategoryid(Integer categoryid);

    List<Article> selectAll();

    @Select("select * from t_article where `icon` is not null order by `readed` desc limit #{count} ")
    List<Article> selectAdvancePhoto(Integer count);

    @Select("select * from `t_article` where `icon` is null order by `readed` desc limit #{count} ")
    List<Article> selectAdvanceText(Integer count);

    @Select("select * from `t_article` order by `complain` desc limit #{count} ")
    List<Article> selectAllComplain(Integer count);

    int hasRead(Integer id);

}