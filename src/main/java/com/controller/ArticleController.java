package com.controller;

import com.entity.Article;
import com.github.pagehelper.PageInfo;
import com.service.ArticleService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("listWithPage")
    @ResponseBody
    public Map<String,Object> listWithPage(
            Integer page,
            @RequestParam(defaultValue = "25") Integer pageSize,
            @RequestParam(defaultValue = "0") Integer categoryid
    ){
        PageInfo<Article> pageInfo = null;
        if (categoryid==0){
            pageInfo = articleService.list(page,pageSize);
        }else {
            pageInfo = articleService.listWithCategory(page,pageSize,categoryid);
        }

        Map<String,Object> resutlMap = new HashMap<>();
        resutlMap.put("list",pageInfo.getList());
        resutlMap.put("counts",pageInfo.getTotal());

        return resutlMap;
    }

    @RequestMapping("listAdvancePhoto")
    @ResponseBody
    public List listAdvancePhoto(Integer count){
        List<Article> articles = articleService.listWithAdvancePhoto(count);
        return articles;
    }

    @RequestMapping("listAdvanceText")
    @ResponseBody
    public List listAdvanceText(Integer count){
        List<Article> articles = articleService.listWithAdvanceText(count);
        return articles;
    }

    @RequestMapping("listComplain")
    @ResponseBody
    public List listComplain(Integer count){
        List<Article> articles = articleService.listWithComplain(count);
        return articles;
    }

    @RequestMapping("saveOrUpdate")
    public String saveOrUpdate(Article article,@RequestParam(defaultValue = "0") Integer cid){
        if (article.getId()==null){
            articleService.addCategory(article);
        }else {
            articleService.updateCategory(article);
        }
        System.out.println(article);
        return "redirect:/admin/article_tab.jsp?category="+cid;
    }

    @RequestMapping("deleteByid")
    @ResponseBody
    public String delete(Integer articleid){
        articleService.deleteByid(articleid);
        return "success";
    }

}
