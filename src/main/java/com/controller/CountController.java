package com.controller;

import com.service.ArticleService;
import com.service.MoviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/count")
public class CountController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private MoviceService moviceService;

    @RequestMapping("hasReadArticle")
    @ResponseBody
    public String hasReadArticle(Integer articleid){
        articleService.hasRead(articleid);
        return "success";
    }

    @RequestMapping("hasReadMovice")
    @ResponseBody
    public String hasReadMovice(Integer moviceid){
        moviceService.hasRead(moviceid);
        return "success";
    }

}
