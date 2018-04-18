package com.controller;

import com.entity.Category;
import com.mapper.CategoryMapper;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import org.slf4j.Logger;

@RestController
@RequestMapping("/category")
public class CategoryController {
    private static Logger logger = LoggerFactory.getLogger(CategoryController.class);

    @Autowired
    private CategoryMapper categoryMapper;

    @RequestMapping(value = "/test")
    public Category test(String name){
        Category category = categoryMapper.selectByPrimaryKey(1);
        return category;
    }
}
