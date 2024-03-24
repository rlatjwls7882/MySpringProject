package com.myproject.web.controller;

import com.myproject.web.domain.User;
import com.myproject.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String loginForm() {
        return "loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes rattr) {
        session.invalidate();
        rattr.addFlashAttribute("msg", "logout_success");
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(User user, boolean rememberId, RedirectAttributes rattr, HttpServletRequest request, HttpServletResponse response) {
        try {
            if(!userService.checkUser(user)) {
                rattr.addFlashAttribute("msg", "login_failed");
                return "redirect:/login";
            }

            rattr.addFlashAttribute("msg", "login_success");
            HttpSession session = request.getSession();
            session.setAttribute("id", user.getId());
            session.setAttribute("isLogin", true);

            if(rememberId) {
                Cookie cookie = new Cookie("id", user.getId());
                response.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("id", user.getId());
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }

            return "redirect:/";
        } catch (Exception e) {
            rattr.addFlashAttribute("msg", "login_failed_idk");
            return "redirect:/login";
        }
    }
}