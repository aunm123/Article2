package com.controller;

import com.entity.Category;
import com.entity.MCategory;
import com.service.CategoryService;
import com.service.MCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/mcategory")
public class MCategoryController {

    @Autowired
    private MCategoryService mCategoryService;

    @RequestMapping(value = "/find")
    @ResponseBody
    public MCategory findById(Integer mcategoryid){
        MCategory mCategory = mCategoryService.findById(mcategoryid);
        return mCategory;
    }

    @RequestMapping("list")
    @ResponseBody
    public List<MCategory> list(){
        List<MCategory> mCategories = mCategoryService.list();
        return mCategories;
    }

    @RequestMapping("saveOrUpdate")
    public String saveOrUpdate(MCategory mCategory){
        //只能设置到 一级分类
        mCategory.setLevel(1);
        mCategory.setParentid(0);
        if (mCategory.getId()==null){
            mCategoryService.addCategory(mCategory);
        }else {
            mCategoryService.updateCategory(mCategory);
        }
        return "redirect:/admin/mcategory_tab.jsp";
    }

    @RequestMapping("deleteByid")
    @ResponseBody
    public String delete(Integer mcategoryid){
        mCategoryService.deleteByid(mcategoryid);
        return "success";
    }
}
