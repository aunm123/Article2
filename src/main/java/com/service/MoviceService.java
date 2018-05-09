package com.service;

import com.entity.Movice;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.MoviceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MoviceService {

    @Autowired
    private MoviceMapper moviceMapper;

    public Movice findById(Integer id) {
        return moviceMapper.selectByPrimaryKey(id);
    }

    public PageInfo<Movice> list(Integer page, Integer pageSize) {

        PageHelper.startPage(page,pageSize);
        List<Movice> articles = moviceMapper.selectAll();

        PageInfo<Movice> pageInfo = new PageInfo<Movice>(articles);

        return pageInfo;
    }

    public PageInfo<Movice> listWithCategory(Integer page, Integer pageSize, Integer mcategoryid) {

        PageHelper.startPage(page,pageSize);
        List<Movice> articles = moviceMapper.selectWithCategoryid(mcategoryid);

        PageInfo<Movice> pageInfo = new PageInfo<Movice>(articles);

        return pageInfo;
    }

    public void deleteByid(Integer id) {
        moviceMapper.deleteByPrimaryKey(id);
        return;
    }

    public void updateCategory(Movice movice){
        moviceMapper.updateByPrimaryKeySelective(movice);
        return;
    }

    public void addCategory(Movice movice){
        moviceMapper.insertSelective(movice);
        return ;
    }


    public List<Movice> listWithAdvance(Integer count){
        List<Movice> moviceList = moviceMapper.selectAdvanceMovice(count);
        return moviceList;
    }

    public List<Movice> listWithComplain(Integer count){
        List<Movice> moviceList = moviceMapper.selectAllComplain(count);
        return moviceList;
    }

    public void hasRead(Integer id){
        moviceMapper.hasRead(id);
    }

    public void complainMovice(Integer id){
        moviceMapper.complainMovice(id);
    }
}
