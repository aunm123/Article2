package com.service;

import com.entity.Category;
import com.entity.MCategory;
import com.mapper.CategoryMapper;
import com.mapper.MCategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MCategoryService {

    @Autowired
    private MCategoryMapper mCategoryMapper;

    public MCategory findById(Integer id) {
        return mCategoryMapper.selectByPrimaryKey(id);
    }

    public List<MCategory> list() {
        List<MCategory> mCategories = mCategoryMapper.selectAll();
        List<MCategory> newmCategoryList = new ArrayList<MCategory>();

        while (true){
            if (mCategories.size()<=0){
                break;
            }
            MCategory tempCat = mCategories.get(0);
            newmCategoryList.addAll(this.addCategoryList(mCategories,tempCat));
            mCategories.removeAll(this.addCategoryList(mCategories,tempCat));
        }

        return newmCategoryList;
    }

    public void deleteByid(Integer id) {
        mCategoryMapper.deleteByPrimaryKey(id);
        return;
    }

    public void updateCategory(MCategory category){
        mCategoryMapper.updateByPrimaryKeySelective(category);
        return;
    }

    public void addCategory(MCategory category){
        mCategoryMapper.insertSelective(category);
        return ;
    }

    /**
     * 递归添加 mcategory
     * @param mCategories
     * @param addCategory
     * @return
     */
    private List<MCategory> addCategoryList(List<MCategory> mCategories,MCategory addCategory){
        List<MCategory> newCategoryList = new ArrayList<MCategory>();
        newCategoryList.add(addCategory);
        for (int j = 0; j < mCategories.size(); j++) {
            MCategory temp2 = mCategories.get(j);
            if(temp2.getParentid().intValue() == addCategory.getId().intValue()){
                newCategoryList.addAll(this.addCategoryList(mCategories,temp2));
            }
        }
        return newCategoryList;
    }
}
