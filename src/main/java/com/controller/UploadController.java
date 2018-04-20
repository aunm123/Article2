package com.controller;

import com.util.StringUtil;
import com.util.UploadResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/file")
public class UploadController {

    @RequestMapping("/upload")
    @ResponseBody
    public UploadResult uploadFile(
                                    HttpServletRequest request,
                                    @RequestParam("file") MultipartFile file) throws IOException {

        UploadResult uploadResult = new UploadResult();
        uploadResult.setError(1);

        //如果文件不为空，写入上传路径
        if (!file.isEmpty()){
            //上传文件路径
            String fileName = saveImage(request, file);

            uploadResult.setError(0);
            uploadResult.getData().add("/images/"+fileName);
            return uploadResult;
        }else {
            return uploadResult;
        }
    }

    @RequestMapping("/iconUpload")
    @ResponseBody
    public Map<String, Object> uploadIconFile(
            HttpServletRequest request,
            @RequestParam("file") MultipartFile file) throws IOException {

        //如果文件不为空，写入上传路径
        if (!file.isEmpty()){
            String fileName = saveImage(request, file);

            Map<String, Object> map = new HashMap<String, Object>();
            map.put("code", 1);
            map.put("msg", "/images/"+fileName);
            return map;

        }else {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("error", "图片不合法");
            return map;
        }
    }

    private String saveImage(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException {
        //上传文件路径
        String path = request.getServletContext().getRealPath("/images/");
        //上传文件名
        String fileName = file.getOriginalFilename();
        fileName = StringUtil.Random(32)+StringUtil.subSuffix(fileName);

        File filePath = new File(path,fileName);
        //判断路径是否存在，如果不存在就创建一个
        if (!filePath.getParentFile().exists()){
            filePath.getParentFile().mkdirs();
        }
        //将上传文件保存到一个目标文件当中
        file.transferTo(new File(path + File.separator + fileName));
        return fileName;
    }


}
