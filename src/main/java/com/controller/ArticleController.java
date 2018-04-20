package com.controller;

import com.entity.Article;
import com.service.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/article")
public class ArticleController {
    private static Logger logger = LoggerFactory.getLogger(ArticleController.class);

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/find")
    @ResponseBody
    public Article findById(Integer articleid){
        Article article = articleService.findById(articleid);
        return article;
    }

    @RequestMapping("list")
    @ResponseBody
    public List<Article> list(){
        List<Article> article = articleService.list();
        return article;
    }

    @RequestMapping("saveOrUpdate")
    public String saveOrUpdate(Article article){
        if (article.getId()==null){
            articleService.addCategory(article);
        }else {
            articleService.updateCategory(article);
        }
        System.out.println(article);
        return "redirect:/admin/article_tab.jsp";
    }

    @RequestMapping("deleteByid")
    @ResponseBody
    public String delete(Integer articleid){
        articleService.deleteByid(articleid);
        return "success";
    }
}
