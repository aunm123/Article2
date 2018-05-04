package com.controller;

import com.entity.User;
import com.mapper.UserMapper;
import com.service.ArticleService;
import com.service.MoviceService;
import com.service.UserService;
import com.util.EmptyUtil;
import com.util.MapResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;



@Controller
@RequestMapping()
public class LoginController {

    private static final String USER_SESSION_KEY = "user_session";

    @Autowired
    private UserService userService;

    @Resource
    HttpServletRequest request;


    @RequestMapping("/logout")
    public String logout(){
        request.getSession().removeAttribute(USER_SESSION_KEY);
        return "redirect:/login.jsp";
    }

    @RequestMapping("/loginac")
    public String login(String username, String userpassword){
        try {
            User user = userService.login(username, userpassword);
            if (EmptyUtil.isNotEmpty(user)){
                request.getSession().setAttribute(USER_SESSION_KEY, user);
                return "redirect:/admin/index.jsp";
            }else {
                return "redirect:/login.jsp";
            }
        } catch (Exception e) {
            return "redirect:/login.jsp";
        }

    }

}
