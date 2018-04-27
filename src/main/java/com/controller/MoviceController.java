package com.controller;

import com.entity.Movice;
import com.github.pagehelper.PageInfo;
import com.service.MoviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/movice")
public class MoviceController {

    @Autowired
    private MoviceService moviceService;

    @RequestMapping(value = "/find")
    @ResponseBody
    public Movice findById(Integer moviceid){
        Movice movice = moviceService.findById(moviceid);
        return movice;
    }

    @RequestMapping("listWithPage")
    @ResponseBody
    public Map<String,Object> listWithPage(
            Integer page,
            @RequestParam(defaultValue = "5") Integer pageSize,
            @RequestParam(defaultValue = "0") Integer mcategoryid
    ){
        PageInfo<Movice> pageInfo = null;
        if (mcategoryid==0){
            pageInfo = moviceService.list(page,pageSize);
        }else {
            pageInfo = moviceService.listWithCategory(page,pageSize,mcategoryid);
        }

        Map<String,Object> resutlMap = new HashMap<>();
        resutlMap.put("list",pageInfo.getList());
        resutlMap.put("counts",pageInfo.getTotal());

        return resutlMap;
    }

    @RequestMapping("saveOrUpdate")
    public String saveOrUpdate(Movice movice,@RequestParam(defaultValue = "0") Integer cid){
        if (movice.getId()==null){
            moviceService.addCategory(movice);
        }else {
            moviceService.updateCategory(movice);
        }
        System.out.println(movice);
        return "redirect:/admin/movice_tab.jsp?category="+cid;
    }

    @RequestMapping("deleteByid")
    @ResponseBody
    public String delete(Integer moviceid){
        moviceService.deleteByid(moviceid);
        return "success";
    }
}
