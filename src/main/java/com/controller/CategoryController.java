package com.controller;

import com.entity.Category;
import com.mapper.CategoryMapper;
import com.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/find")
    @ResponseBody
    public Category findById(Integer categoryid){
        Category category = categoryService.findById(categoryid);
        return category;
    }

    @RequestMapping("list")
    @ResponseBody
    public List<Category> list(){
        List<Category> categorys = categoryService.list();
        return categorys;
    }

    @RequestMapping("saveOrUpdate")
    public String saveOrUpdate(Category category){
        Category parentC = categoryService.findById(category.getParentid());
        if (parentC == null){
            category.setLevel(1);
        }else {
            category.setLevel(parentC.getLevel()+1);
        }
        if (category.getId()==null){
            categoryService.addCategory(category);
        }else {
            categoryService.updateCategory(category);
        }
        return "redirect:/admin/category_tab.jsp";
    }

    @RequestMapping("deleteByid")
    @ResponseBody
    public String delete(Integer categoryid){
        categoryService.deleteByid(categoryid);
        return "success";
    }
}
