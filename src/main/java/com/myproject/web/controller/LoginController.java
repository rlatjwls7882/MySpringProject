package com.myproject.web.controller;

import com.myproject.web.domain.User;
import com.myproject.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String loginForm() {
        return "loginForm";
    }

    @PostMapping("/login")
    public String login(User user, RedirectAttributes rattr) {
        try {
            if(!userService.checkUser(user)) {
                rattr.addFlashAttribute("msg", "login_failed");
                return "redirect:/login";
            }
            rattr.addFlashAttribute("msg", "login_success");
            return "redirect:/";
        } catch (Exception e) {
            rattr.addFlashAttribute("msg", "login_failed_idk");
            return "redirect:/login";
        }
    }
}