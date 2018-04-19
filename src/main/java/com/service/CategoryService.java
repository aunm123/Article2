package com.service;

import com.entity.Category;
import com.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    public Category findById(Integer id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    public List<Category> list() {
        List<Category> categorys = categoryMapper.selectAll();
        List<Category> newCategoryList = new ArrayList<Category>();

        while (true){
            if (categorys.size()<=0){
                break;
            }
            Category tempCat = categorys.get(0);
            newCategoryList.addAll(this.addCategoryList(categorys,tempCat));
            categorys.removeAll(this.addCategoryList(categorys,tempCat));
        }

        return newCategoryList;
    }

    public void deleteByid(Integer id) {
        categoryMapper.deleteByPrimaryKey(id);
        return;
    }

    public void updateCategory(Category category){
        categoryMapper.updateByPrimaryKeySelective(category);
        return;
    }

    public void addCategory(Category category){
        categoryMapper.insertSelective(category);
        return ;
    }

    /**
     * 递归添加category
     * @param categorys
     * @param addCategory
     * @return
     */
    private List<Category> addCategoryList(List<Category> categorys,Category addCategory){
        List<Category> newCategoryList = new ArrayList<Category>();
        newCategoryList.add(addCategory);
        for (int j = 0; j < categorys.size(); j++) {
            Category temp2 = categorys.get(j);
            if(temp2.getParentid().intValue() == addCategory.getId().intValue()){
                newCategoryList.addAll(this.addCategoryList(categorys,temp2));
            }
        }
        return newCategoryList;
    }
}
