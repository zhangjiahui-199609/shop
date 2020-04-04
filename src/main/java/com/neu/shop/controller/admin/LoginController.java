package com.neu.shop.controller.admin;

import com.neu.shop.pojo.Admin;
import com.neu.shop.service.AdminService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String adminLogin() {
        return "forward:/adminLogin.jsp";
    }

    @RequestMapping("/confirmLogin")
    public String confirmLogin(String email,String password, Model model, HttpServletRequest request) {
        try {
//            调用Shrio的API获取对象
            Subject subject = SecurityUtils.getSubject();
//           创建令牌
            UsernamePasswordToken uptoken = new UsernamePasswordToken(email, password);
//            使用令牌进行登录-》realm
            subject.login(uptoken);
//            从安全数据中获取用户信息
            Admin admin = (Admin) subject.getPrincipal();
            request.getSession().setAttribute("admin",admin);
            return "redirect:/shop/admin/user/show";
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("errorMsg","用户名或密码错误");
            return "forward:/adminLogin.jsp";
        }
    /*    Admin selectAdmin = adminService.selectByName(admin);
        if (selectAdmin == null) {
            model.addAttribute("errorMsg", "用户名或密码错误");
            return "adminLogin";
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("admin", selectAdmin);
            return "redirect:/shop/admin/user/show";
        }*/
    }

    @RequestMapping("/logout")
    public String adminLogout(HttpServletRequest request) {

        /*HttpSession session = request.getSession();
        session.removeAttribute("admin");*/
        Subject subject = SecurityUtils.getSubject();
        subject.logout();//登出
        return "forward:/adminLogin.jsp";
    }

    /*@RequestMapping("/index")
    public String showAdminIndex() {
        return "user";
    }*/
}
