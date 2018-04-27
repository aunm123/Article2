package com.service;

import com.entity.Article;
import com.entity.Category;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    public Article findById(Integer id) {
        return articleMapper.selectByPrimaryKey(id);
    }


    public PageInfo<Article> list(Integer page,Integer pageSize) {

        PageHelper.startPage(page,pageSize);
        List<Article> articles = articleMapper.selectAll();

        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);

        return pageInfo;
    }

    public PageInfo<Article> listWithCategory(Integer page, Integer pageSize, Integer categoryid) {

        PageHelper.startPage(page,pageSize);
        List<Article> articles = articleMapper.selectWithCategoryid(categoryid);

        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);

        return pageInfo;
    }

    public void deleteByid(Integer id) {
        articleMapper.deleteByPrimaryKey(id);
        return;
    }

    public void updateCategory(Article category){
        articleMapper.updateByPrimaryKeySelective(category);
        return;
    }

    public void addCategory(Article category){
        articleMapper.insertSelective(category);
        return ;
    }
}
