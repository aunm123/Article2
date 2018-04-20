package com.service;

import com.entity.Article;
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

    public List<Article> list() {
        List<Article> articles = articleMapper.selectAll();
        return articles;
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
